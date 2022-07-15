package main

import (
	"certificate-of-death/models"
	"database/sql"
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
	"github.com/joho/godotenv"
)

var queries *models.Queries

func main() {
	setup()

	r := gin.Default()

	config := cors.Config{
		AllowMethods:  []string{"OPTIONS", "POST", "GET"},
		AllowHeaders:  []string{"Origin", "Content-Type"},
		ExposeHeaders: []string{"Content-Length"},
	}

	if origins := os.Getenv("ALLOW_ORIGINS"); origins != "" {
		config.AllowOrigins = strings.Split(origins, ",")
	}

	r.Use(cors.New(config))

	r.StaticFS("/", static())

	api := r.Group("/api")
	api.POST("/catalogs", getCatalogs)
	api.POST("/store", store)

	r.Run(fmt.Sprintf(":%s", os.Getenv("PORT")))
}

func setup() {
	err := godotenv.Load()
	if err != nil && os.Getenv("ENVIRONMENT") == "local" {
		log.Fatal(err)
	}

	envs := []string{
		"PORT",
		"MYSQL_USERNAME",
		"MYSQL_PASSWORD",
		"MYSQL_DATABASE",
		"MYSQL_HOST",
		"MYSQL_PORT",
		"ALLOW_ORIGINS",
	}

	for _, env := range envs {
		if os.Getenv(env) == "" {
			log.Fatalf("environment variable %s not set", env)
		}
	}

	mysqlUsername := os.Getenv("MYSQL_USERNAME")
	mysqlPassword := os.Getenv("MYSQL_PASSWORD")
	mysqlDatabase := os.Getenv("MYSQL_DATABASE")
	mysqlHost := os.Getenv("MYSQL_HOST")
	mysqlPort := os.Getenv("MYSQL_PORT")

	mysqlURI := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s", mysqlUsername, mysqlPassword, mysqlHost, mysqlPort, mysqlDatabase)

	db, err := sql.Open("mysql", mysqlURI)
	if err != nil {
		log.Fatal(err)
	}

	queries = models.New(db)
}