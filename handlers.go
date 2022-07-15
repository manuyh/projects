package main

import (
	"context"
	"embed"
	"fmt"
	"io/fs"
	"net/http"

	"github.com/gin-gonic/gin"
)

var (
	//go:embed frontend/dist
	frontend embed.FS
)

type ICD struct {
	INO              int64  `json:"iNo"`
	URI              string `json:"uri"`
	LinearizationUri string `json:"linearizationUri"`
	FoundationUri    string `json:"foundationUri"`
	Code             string `json:"code"`
	Title            string `json:"title"`
	BestMatchText    string `json:"bestMatchText"`
	SelectedText     string `json:"selectedText"`
	SearchQuery      string `json:"searchQuery"`
}

type Catalog struct {
	ID         int64  `json:"id"`
	Identifier int64  `json:"identifier"`
	Label      string `json:"label"`
	Name       string `json:"name"`
}

type Data struct {
	Identifier                   int64   `json:"identifier"`
	Gender                       Catalog `json:"gender"`
	Age                          int64   `json:"age"`
	AgeUnit                      Catalog `json:"ageUnit"`
	Birthdate                    string  `json:"birthdate"`
	Deathdate                    string  `json:"deathdate"`
	Variable1                    string  `json:"variable1"`
	Variable2                    string  `json:"variable2"`
	A                            ICD     `json:"a"`
	TimeA                        int64   `json:"timeA"`
	TimeUnitA                    Catalog `json:"timeUnitA"`
	B                            ICD     `json:"b"`
	TimeB                        int64   `json:"timeB"`
	TimeUnitB                    Catalog `json:"timeUnitB"`
	C                            ICD     `json:"c"`
	TimeC                        int64   `json:"timeC"`
	TimeUnitC                    Catalog `json:"timeUnitC"`
	D                            ICD     `json:"d"`
	TimeD                        int64   `json:"timeD"`
	TimeUnitD                    Catalog `json:"timeUnitD"`
	Part2                        ICD     `json:"part2"`
	TimePart2                    int64   `json:"timePart2"`
	TimeUnitPart2                Catalog `json:"timeUnitPart2"`
	Surgery                      Catalog `json:"surgery"`
	SurgeryDate                  string  `json:"surgeryDate"`
	Autopsy                      Catalog `json:"autopsy"`
	UsedFoundings                Catalog `json:"usedFoundings"`
	MannerOfDeath                Catalog `json:"mannerOfDeath"`
	PlaceOfDeath                 Catalog `json:"placeOfDeath"`
	MultiplePregnancy            Catalog `json:"multiplePregnancy"`
	HoursAlive                   int64   `json:"hoursAlive"`
	WeightInGrams                int64   `json:"weightInGrams"`
	FullWeeksOfPregnancy         int64   `json:"fullWeeksOfPregnancy"`
	MotherAgeInYears             int64   `json:"motherAgeInYears"`
	WomanPregnantCondition       Catalog `json:"womanPregnantCondition"`
	PregnancyContributionToDeath Catalog `json:"pregnancyContributionToDeath"`
}

func static() http.FileSystem {
	fsys := fs.FS(frontend)
	html, _ := fs.Sub(fsys, "frontend/dist")

	return http.FS(html)
}

func store(c *gin.Context) {
	var data Data
	if err := c.BindJSON(&data); err != nil {
		fmt.Println(err)
		return
	}

	d := transform(data)
	_, err := queries.StoreResponse(context.Background(), d)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
	}

	c.JSON(http.StatusCreated, nil)
}

func getCatalogs(c *gin.Context) {
	catalogs, err := queries.GetAllCatalogs(context.Background())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err,
		})
		return
	}

	c.JSON(http.StatusOK, catalogs)
}
