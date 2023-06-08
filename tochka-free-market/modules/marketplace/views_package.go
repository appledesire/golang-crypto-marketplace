package marketplace

import (
	"errors"
	"fmt"
	"io"
	"net/http"
	"os"
	"strconv"
	"strings"

	"github.com/gocraft/web"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/util"
)

func (c *Context) ListPackages(w web.ResponseWriter, r *web.Request) {
	avs := FindPaidPackagesForBuyer(c.ViewUser.Uuid)
	c.ViewPackages = avs.ViewPackages()
	util.RenderTemplate(w, "package/list", c)
}

// Edit Package Wizard

func (c *Context) EditPackageStep1(w web.ResponseWriter, r *web.Request) {
	if c.ViewPackage.Package == nil {
		c.ViewPackage = Package{}.ViewPackage()
	}
	util.RenderTemplate(w, "package/edit-step-1", c)
}

func (c *Context) EditPackageStep2(w web.ResponseWriter, r *web.Request, pkg Package) {
	c.Countries = GetAllCountries()

	var template string
	switch pkg.Type {
	case "drop", "drop preorder":
		template = "package/edit-step-2-drop"
		break

	case "mail":
		template = "package/edit-step-2-mail"
		break

	case "digital":
		template = "package/edit-step-2-digital"
		break

	default:
		http.NotFound(w, r.Request)
		return
	}

	// c.ViewPackage = pkg.ViewPackage()
	util.RenderTemplate(w, template, c)
}

func (c *Context) EditPackagesStep2DropAndDropPreorder(w web.ResponseWriter, r *web.Request, pkg Package) {
	c.GeoCities = FindCitiesByCountryNameEn(pkg.CountryNameEnShippingTo)

	var template string
	switch pkg.Type {
	case "drop":
		template = "package/edit-step-3-drop"
		break
	case "drop preorder":
		template = "package/edit-step-3-drop-preorder"
		break
	}

	c.ViewPackage = pkg.ViewPackage()
	util.RenderTemplate(w, template, c)
}

func (c *Context) EditPackageStep3(w web.ResponseWriter, r *web.Request, pkg Package) {
	var template string

	switch pkg.Type {
	case "drop":
		template = "package/edit-step-3-drop"
		break

	case "drop preorder":
		template = "package/edit-step-3-drop-preorder"
		break

	default:
		http.NotFound(w, r.Request)
		return
	}

	c.ViewPackage = pkg.ViewPackage()
	util.RenderTemplate(w, template, c)
}

func (c *Context) EditPackageStep4(w web.ResponseWriter, r *web.Request, pkg Package) {
	var template string

	switch pkg.Type {
	case "drop", "drop preorder":
		template = "package/edit-step-4-metro"
		break

	default:
		http.NotFound(w, r.Request)
		return
	}

	c.ViewPackage = pkg.ViewPackage()
	util.RenderTemplate(w, template, c)
}

// Save Package Wizard
func (c *Context) SavePackage(w web.ResponseWriter, r *web.Request) {
	pkg := c.ViewPackage.DBModel()
	switch r.FormValue("step") {
	case "1":
		c.SavePackageStep1(w, r, pkg)
		break
	case "2":
		c.SavePackageStep2(w, r, pkg)
		break
	case "3":
		c.SavePackageStep3(w, r, pkg)
		break
	case "4":
		c.SavePackageStep4(w, r, pkg)
		break
	default:
		http.NotFound(w, r.Request)
		return
	}
}

func (c *Context) SavePackageStep1(w web.ResponseWriter, r *web.Request, pkg Package) {
	pkg, err := c.parsePackageFormStep1(w, r, pkg)
	if err != nil {
		c.Error = err.Error()
		c.ViewPackage = pkg.ViewPackage()
		c.EditPackageStep1(w, r)
		return
	}

	switch pkg.Type {
	case "drop", "digital", "mail", "drop preorder":
		c.EditPackageStep2(w, r, pkg)
		break
	default:
		http.NotFound(w, r.Request)
	}
}

func (c *Context) SavePackageStep2(w web.ResponseWriter, r *web.Request, pkg Package) {
	pkg, err := c.parsePackageFormStep2(w, r, pkg)
	if err != nil {
		c.Error = err.Error()
		c.ViewPackage = pkg.ViewPackage()
		c.EditPackageStep2(w, r, pkg)
		return
	}

	switch pkg.Type {

	case "drop", "drop preorder":
		c.SavePackageStep2DropAndDropPreorder(w, r, pkg)
		break

	case "mail":
		countryTo, err := FindCountryByNameEn(r.FormValue("country_name_en_to"))
		if err != nil {
			c.Error = "No such country (shipping to) in database"
			c.ViewPackage = pkg.ViewPackage()
			c.EditPackageStep2(w, r, pkg)
			return
		}
		pkg.CountryNameEnShippingTo = countryTo.NameEn

		countryFrom, err := FindCountryByNameEn(r.FormValue("country_name_en_from"))
		if err != nil {
			c.Error = "No such country (shipping from) in database"
			c.ViewPackage = pkg.ViewPackage()
			c.EditPackageStep2(w, r, pkg)
			return
		}
		pkg.CountryNameEnShippingFrom = countryFrom.NameEn
		c.SavePackageComplete(w, r, pkg)

		break

	case "digital":
		pkg.CountryNameEnShippingTo = "Interwebs"
		pkg.CountryNameEnShippingFrom = "Interwebs"
		c.SavePackageComplete(w, r, pkg)
		break

	default:
		http.NotFound(w, r.Request)
		return
	}

}

func (c *Context) SavePackageStep2DropAndDropPreorder(w web.ResponseWriter, r *web.Request, pkg Package) {
	countryTo, err := FindCountryByNameEn(r.FormValue("country_name_en_to"))
	if err != nil {
		c.Error = "No such country in database"
		c.ViewPackage = pkg.ViewPackage()
		c.EditPackagesStep2DropAndDropPreorder(w, r, pkg)
		return
	}
	pkg.CountryNameEnShippingTo = countryTo.NameEn

	c.EditPackagesStep2DropAndDropPreorder(w, r, pkg)
}

func (c *Context) SavePackageStep3(w web.ResponseWriter, r *web.Request, pkg Package) {
	pkg, err := c.parsePackageFormStep3(w, r, pkg)
	if err != nil {
		c.Error = err.Error()
		c.ViewPackage = pkg.ViewPackage()
		c.EditPackageStep3(w, r, pkg)
		return
	}

	switch pkg.Type {
	case "drop", "drop preorder":
		c.CityMetroStations = FindCityMetroStationsByCity(pkg.DropCityId)
		if len(c.CityMetroStations) == 0 {
			c.SavePackageComplete(w, r, pkg)
		} else {
			c.EditPackageStep4(w, r, pkg)
		}
		break
	default:
		http.NotFound(w, r.Request)
	}
}

func (c *Context) SavePackageStep4(w web.ResponseWriter, r *web.Request, pkg Package) {
	pkg, err := c.parsePackageFormStep4(w, r, pkg)
	if err != nil {
		c.Error = err.Error()
		c.ViewPackage = pkg.ViewPackage()
		c.EditPackageStep4(w, r, pkg)
		return
	}

	switch pkg.Type {
	case "drop", "drop preorder":
		c.SavePackageComplete(w, r, pkg)
	default:
		http.NotFound(w, r.Request)
	}
}

func (c *Context) SavePackageComplete(w web.ResponseWriter, r *web.Request, pkg Package) {
	if pkg.Uuid == "" {
		pkg.Uuid = util.GenerateUuid()
		pkg.PackagePrice.Uuid = pkg.Uuid
	}

	pkg.Item = Item{}
	pkg.CityMetroStation = CityMetroStation{}
	pkg.GeoCity = City{}
	pkg.GeoCountryFrom = Country{}
	pkg.GeoCountryTo = Country{}

	err := pkg.Save()
	if err != nil {
		c.Error = err.Error()
		c.ViewPackage = pkg.ViewPackage()
		c.EditPackageStep2(w, r, pkg)
		return
	}

	err = pkg.PackagePrice.Save()
	if err != nil {
		c.Error = err.Error()
		c.ViewPackage = pkg.ViewPackage()
		c.EditPackageStep2(w, r, pkg)
		return
	}

	url := fmt.Sprintf("/store/%s/item/%s/", c.ViewItem.Store.Storename, c.ViewItem.Uuid)
	http.Redirect(w, r.Request, url, 302)
}

func (c *Context) parsePackageFormStep1(w web.ResponseWriter, r *web.Request, pkg Package) (Package, error) {
	currency := r.FormValue("currency")
	price, err := strconv.ParseFloat(r.FormValue("price"), 64)
	if err != nil {
		return pkg, err
	}

	c.PackagePrice = r.FormValue("price")
	c.PackageCurrency = currency
	pkg.PackagePrice.Currency = currency
	pkg.PackagePrice.Price = price
	pkg.ItemUuid = c.ViewItem.DBModel().Uuid
	pkg.Item = c.ViewItem.DBModel()
	pkg.Type = r.FormValue("type")
	pkg.Name = r.FormValue("name")

	err = pkg.PreValidate(1)
	if err != nil {
		return pkg, err
	}

	if c.ViewPackage.Package == nil {
		c.ViewPackage = pkg.ViewPackage()
	}

	return pkg, nil
}

func (c *Context) parsePackageFormStep2(w web.ResponseWriter, r *web.Request, pkg Package) (Package, error) {
	pkg, err := c.parsePackageFormStep1(w, r, pkg)
	if err != nil {
		return pkg, err
	}

	if r.FormValue("country_name_en_to") != "" {
		countryTo, err := FindCountryByNameEn(r.FormValue("country_name_en_to"))
		if err != nil {
			return pkg, errors.New("No such source country in database")
		}
		pkg.CountryNameEnShippingTo = countryTo.NameEn
	} else if pkg.Type == "drop" || pkg.Type == "drop preorer" || pkg.Type == "mail" {
		return pkg, errors.New("Empty country_name_en_to")
	}

	if r.FormValue("country_name_en_from") != "" {
		countryTo, err := FindCountryByNameEn(r.FormValue("country_name_en_from"))
		if err != nil {
			return pkg, errors.New("No such destination country in database")
		}
		pkg.CountryNameEnShippingFrom = countryTo.NameEn
	} else if pkg.Type == "mail" {
		return pkg, errors.New("Empty country_name_en_from")
	}

	pkg.Description = r.FormValue("description")

	err = pkg.PreValidate(2)
	if err != nil {
		return pkg, err
	}

	return pkg, nil
}

func (c *Context) parsePackageFormStep3(w web.ResponseWriter, r *web.Request, pkg Package) (Package, error) {
	pkg, err := c.parsePackageFormStep2(w, r, pkg)
	if err != nil {
		return pkg, err
	}

	if r.FormValue("city_id") != "" {
		cityId, err := strconv.ParseInt(r.FormValue("city_id"), 10, 64)
		if err != nil {
			return pkg, err
		}

		city, err := FindCityByID(int(cityId))
		if err != nil {
			return pkg, err
		}
		pkg.DropCityId = city.ID
	} else {
		return pkg, errors.New("Empty country_name_en_to")
	}
	pkg.Description = r.FormValue("description")

	if coordinates := r.FormValue("coordinates"); coordinates != "" {
		parts := strings.Split(coordinates, ",")
		if len(parts) != 2 {
			return pkg, errors.New("Wrong coordinates format")
		}

		longitude, err := strconv.ParseFloat(strings.Trim(parts[0], " "), 64)
		if err != nil {
			return pkg, err
		}

		latitude, err := strconv.ParseFloat(strings.Trim(parts[1], " "), 64)
		if err != nil {
			return pkg, err
		}

		pkg.Longitude = longitude
		pkg.Latitude = latitude
	}

	err = pkg.PreValidate(3)
	if err != nil {
		return pkg, err
	}

	return pkg, nil
}

func (c *Context) parsePackageFormStep4(w web.ResponseWriter, r *web.Request, pkg Package) (Package, error) {
	pkg, err := c.parsePackageFormStep3(w, r, pkg)
	if err != nil {
		return pkg, err
	}

	if r.FormValue("city_metro_station_uuid") != "" {
		cityMentroStationUuid := r.FormValue("city_metro_station_uuid")
		cityMetroStation, err := FindCityMetroStationByUuid(cityMentroStationUuid)
		if err != nil {
			return pkg, err
		}
		pkg.CityMetroStationUuid = cityMetroStation.Uuid
	} else {
		return pkg, errors.New("Empty city_metro_station_uuid")
	}

	err = pkg.PreValidate(3)
	if err != nil {
		return pkg, err
	}

	return pkg, nil
}

func (c *Context) DeletePackage(w web.ResponseWriter, r *web.Request) {
	c.ViewPackage.DBModel().Remove()
	http.Redirect(w, r.Request, c.ViewItem.Url(), 302)
}

func (c *Context) PackageImage(w web.ResponseWriter, r *web.Request) {
	file, _ := os.Open("./data/images/" + c.ViewPackage.Uuid + ".jpeg")
	w.Header().Set("Content-type", "image/jpeg")
	w.Header().Set("Cache-control", "public, max-age=259200")
	io.Copy(w, file)
}

func (c *Context) DuplicatePackage(w web.ResponseWriter, r *web.Request) {
	pkg := c.ViewPackage.DBModel()
	pkg.Uuid = util.GenerateUuid()
	pkg.Save()
	pkg.PackagePrice.Uuid = pkg.Uuid
	pkg.PackagePrice.Save()
	http.Redirect(w, r.Request, c.ViewItem.Url(), 302)
}
