package marketplace

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"os"

	"github.com/essentialkaos/translit"
)

type City struct {
	ID           int    `json:"geonameid" gorm:"primary_key"`
	NameEn       string `json:"name" sql:"index"`
	CountryEn    string `json:"country" sql:"index"`
	SubCountryEn string `json:"subcountry" sql:"index"`

	Country Country `gorm:"AssociationForeignKey:NameEn" json:"-"`
}

type Country struct {
	NameEn string `json:"name_en" gorm:"primary_key"`
}

type CityMetroStation struct {
	Uuid   string `json:"uuid" gorm:"primary_key"`
	CityID int    `json:"city_id" sql:"index"`

	NameEn string `json:"name_en"`
	NameRu string `json:"name_ru"`

	City City `json:"-"`
}

/*
	Model Methods
*/

func (r City) Validate() error {
	if r.ID == 0 {
		return errors.New("Empty ID")
	}
	if r.NameEn == "" {
		return errors.New("NameEn must be nonempy")
	}
	if r.CountryEn == "" {
		return errors.New("CountryEn must be nonempty")
	}
	if r.SubCountryEn == "" {
		return errors.New("SubCountryEn must be nonempty")
	}
	return nil
}

func (i City) Remove() error {
	return database.Delete(&i).Error
}

func (itm City) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm City) SaveToDatabase() error {
	if existing, _ := FindCityByID(itm.ID); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

func (r CityMetroStation) Validate() error {
	if r.Uuid == "" {
		return errors.New("Empty Uuid")
	}
	if r.NameEn == "" {
		return errors.New("NameEn must be nonempy")
	}
	return nil
}

func (i CityMetroStation) Remove() error {
	return database.Delete(&i).Error
}

func (itm CityMetroStation) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm CityMetroStation) SaveToDatabase() error {
	if existing, _ := FindCityMetroStationByUuid(itm.Uuid); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

func (r Country) Validate() error {
	if r.NameEn == "" {
		return errors.New("Invalid Name EN")
	}
	return nil
}

func (i Country) Remove() error {
	return database.Delete(&i).Error
}

func (itm Country) Save() error {
	err := itm.Validate()
	if err != nil {
		return err
	}
	return itm.SaveToDatabase()
}

func (itm Country) SaveToDatabase() error {
	if existing, _ := FindCountryByNameEn(itm.NameEn); existing == nil {
		return database.Create(&itm).Error
	}
	return database.Save(&itm).Error
}

/*
	Queries
*/

func GetAllCities() []City {
	cities := []City{}
	database.Find(&cities)
	return cities
}

func FindCityByID(id int) (*City, error) {
	var item City
	err := database.
		First(&item, "id=?", id).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func FindCitiesByCountryNameEn(name string) []City {
	var items []City
	database.
		Where("country_en=?", name).
		Order("name_en").
		Find(&items)
	return items
}

func FindCityMetroStationsByCity(cityId int) []CityMetroStation {
	var items []CityMetroStation
	database.
		Where("city_id=?", cityId).
		Order("name_en").
		Find(&items)
	return items
}

func CountCityMetroStationsByCity(cityId int) int {
	var count int
	database.
		Table("city_metro_stations").
		Where("city_id=?", cityId).
		Count(&count)
	return count
}

func FindCityMetroStationByUuid(uuid string) (*CityMetroStation, error) {
	var item CityMetroStation
	err := database.
		First(&item, "uuid=?", uuid).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func FindCountryByNameEn(name string) (*Country, error) {
	var item Country
	err := database.
		First(&item, "name_en=?", name).
		Error
	if err != nil {
		return nil, err
	}
	return &item, err
}

func GetAllEnglishCountryNamesFromCities() []Country {
	var countries []Country

	database.
		Raw("SELECT DISTINCT(country_en) as name_en from cities").
		Scan(&countries)

	return countries
}

func GetAllCountries() []Country {
	countries := []Country{}
	database.Order("name_en").Find(&countries)
	return countries
}

/*
	Data importing
*/

func ImportCityMetroStations(cityID int, filename string) error {

	type Metro struct {
		ID    int    `json:"id"`
		Title string `json:"title"`
	}

	jsonFile, err := os.Open(filename)
	if err != nil {
		return err
	}
	defer jsonFile.Close()

	byteValue, _ := ioutil.ReadAll(jsonFile)

	stations := []Metro{}

	err = json.Unmarshal(byteValue, &stations)
	if err != nil {
		return err
	}

	for i := range stations {
		cityMetroStation := CityMetroStation{
			Uuid:   fmt.Sprintf("city-%d-station-%d", cityID, stations[i].ID),
			NameRu: stations[i].Title,
			NameEn: translit.EncodeToISO9B(stations[i].Title),
			CityID: cityID,
		}

		err := cityMetroStation.Save()
		if err != nil {
			return err
		}
	}

	return nil
}
