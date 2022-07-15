package main

import (
	"certificate-of-death/models"
	"encoding/json"
)

func transform(in Data) models.StoreResponseParams {
	a, _ := json.Marshal(in.A)
	b, _ := json.Marshal(in.B)
	c, _ := json.Marshal(in.C)
	d, _ := json.Marshal(in.D)
	part2, _ := json.Marshal(in.Part2)

	return models.StoreResponseParams{
		Identifier:                   in.Identifier,
		Gender:                       in.Gender.Identifier,
		Age:                          in.Age,
		AgeUnit:                      in.AgeUnit.Identifier,
		Birthdate:                    in.Birthdate,
		Deathdate:                    in.Deathdate,
		Variable1:                    in.Variable1,
		Variable2:                    in.Variable2,
		A:                            string(a),
		TimeA:                        in.TimeA,
		TimeUnitA:                    in.TimeUnitA.Identifier,
		B:                            string(b),
		TimeB:                        in.TimeB,
		TimeUnitB:                    in.TimeUnitB.Identifier,
		C:                            string(c),
		TimeC:                        in.TimeC,
		TimeUnitC:                    in.TimeUnitC.Identifier,
		D:                            string(d),
		TimeD:                        in.TimeB,
		TimeUnitD:                    in.TimeUnitD.Identifier,
		Part2:                        string(part2),
		TimePart2:                    in.TimePart2,
		TimeUnitPart2:                in.TimeUnitPart2.Identifier,
		Surgery:                      in.Surgery.Identifier,
		SurgeryDate:                  in.SurgeryDate,
		Autopsy:                      in.Autopsy.Identifier,
		UsedFoundings:                in.UsedFoundings.Identifier,
		MannerOfDeath:                in.MannerOfDeath.Identifier,
		PlaceOfDeath:                 in.MannerOfDeath.Identifier,
		MultiplePregnancy:            in.MultiplePregnancy.Identifier,
		HoursAlive:                   in.HoursAlive,
		WeightInGrams:                in.WeightInGrams,
		FullWeeksOfPregnancy:         in.FullWeeksOfPregnancy,
		MotherAgeInYears:             in.MotherAgeInYears,
		WomanPregnancyCondition:      in.WomanPregnantCondition.Identifier,
		PregnancyContributionToDeath: in.PregnancyContributionToDeath.Identifier,
	}
}
