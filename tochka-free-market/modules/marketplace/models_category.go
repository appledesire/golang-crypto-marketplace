package marketplace

import (
	"errors"
	"fmt"
	"sort"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/settings"
)

/*
	Models
*/

type ItemCategory struct {
	ID            int            `json:"id" gorm:"primary_key"`
	ParentID      int            `json:"parent_id"`
	Icon          string         `json:"icon"`
	NameEn        string         `json:"price_en"`
	NameRu        string         `json:"name_ru"`
	NameDe        string         `json:"name_de"`
	NameEs        string         `json:"name_es"`
	NameFr        string         `json:"name_fr"`
	NameRs        string         `json:"name_rs"`
	NameTr        string         `json:"name_tr"`
	ItemCount     int            `gorm:"-" sql:"-" json:"item_count"`
	UserCount     int            `gorm:"-" sql:"-" json:"user_count"`
	Hidden        bool           `json:"hidden"`
	Subcategories ItemCategories `json:"-"`
}

type ItemCategories []ItemCategory

func (ic ItemCategory) String() string {
	return fmt.Sprintf("/staff/item_categories/%d/", ic.ID)
}

/*
	Sort
*/

type ItemCaterogiesByCount ItemCategories

func (s ItemCaterogiesByCount) Len() int {
	return len(s)
}

func (s ItemCaterogiesByCount) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func (s ItemCaterogiesByCount) Less(i, j int) bool {
	return s[i].ItemCount > s[j].ItemCount
}

/*
	Model Methods
*/

func (ic ItemCategory) ParentCategory() *ItemCategory {
	if ic.ParentID == 0 {
		return nil
	}

	pc, _ := FindCategoryByID(ic.ParentID)
	return pc
}

func (ic ItemCategory) FindSubcategories() ItemCategories {
	var cat ItemCategories
	database.
		Where("parent_id = ?", ic.ID).
		Find(&cat)

	return cat
}

/*
	Model Interface Implementation
*/

func (cat ItemCategory) Validate() error {
	numberOfLevels := 0
	var cc *ItemCategory
	cc = &cat

	for {
		cc = cc.ParentCategory()
		if cc == nil {
			break
		}
		numberOfLevels += 1
	}

	if numberOfLevels >= 3 {
		return errors.New("Too many levels")
	}

	return nil
}

func (cat ItemCategory) Remove() error {
	return database.Delete(&cat).Error
}

func (cat ItemCategory) Save() error {
	err := cat.Validate()
	if err != nil {
		return err
	}
	return cat.SaveToDatabase()
}

func (cat *ItemCategory) SaveToDatabase() error {
	if existing, _ := FindCategoryByID(cat.ID); existing == nil {
		return database.Create(cat).Error
	}
	return database.Save(cat).Error
}

/*
	Queries
*/

func GetAllCategories() []Category {
	var categories []Category
	database.Unscoped().Table("item_categories").Find(&categories)
	return categories
}

func FindCategoryByID(id int) (*ItemCategory, error) {
	var cat ItemCategory
	err := database.
		First(&cat, "id = ?", id).
		Error
	if err != nil {
		return nil, err
	}
	return &cat, err
}

func FindCategoryByNameEn(name string) (*ItemCategory, error) {
	var cat ItemCategory
	err := database.
		First(&cat, "name_en = ?", name).
		Error
	if err != nil {
		return nil, err
	}
	return &cat, err
}

func FindCategoriesByParentID(id int) (ItemCategories, error) {
	var cat ItemCategories
	err := database.
		Where("parent_id = ?", id).
		Where("hidden = ?", false).
		Find(&cat).
		Error
	if err != nil {
		return nil, err
	}
	return cat, err
}

func FindAllCategories() ItemCategories {
	cats, err := FindCategoriesByParentID(0)
	if err != nil {
		return cats
	}

	for i := range cats {
		subcats, _ := FindCategoriesByParentID(cats[i].ID)
		cats[i].Subcategories = subcats

		for j := range cats[i].Subcategories {
			subcats, _ := FindCategoriesByParentID(cats[i].Subcategories[j].ID)
			cats[i].Subcategories[j].Subcategories = subcats
		}
	}

	return cats
}

/*
	View Models
*/

type ViewItemCategory struct {
	*ItemCategory
	Name                  string             `json:"name"`
	SubViewItemCategories []ViewItemCategory `json:"subcategories"`
}

func (c ItemCategory) ViewItemCategory(lang string) ViewItemCategory {
	vc := ViewItemCategory{
		ItemCategory: &c,
	}

	switch lang {
	case "ru":
		vc.Name = c.NameRu
	case "en":
		vc.Name = c.NameEn
	default:
		vc.Name = c.NameEn
	}

	return vc
}

func (cc ItemCategories) ViewCategories(lang string) []ViewItemCategory {
	vcc := []ViewItemCategory{}

	for i := range cc {
		vc := cc[i].ViewItemCategory(lang)
		for j := range cc[i].Subcategories {
			vvc := cc[i].Subcategories[j].ViewItemCategory(lang)
			for k := range vvc.Subcategories {
				vvvc := vvc.Subcategories[k].ViewItemCategory(lang)
				vvc.SubViewItemCategories = append(vvc.SubViewItemCategories, vvvc)
			}

			vc.SubViewItemCategories = append(vc.SubViewItemCategories, vvc)

		}
		vcc = append(vcc, vc)
	}

	return vcc
}

/*
	Cache
*/

func CacheFillCategories(packageType, countryNameEnTo, countryNameEnFrom string, cityId int) ItemCategories {
	activeCategories := FindNonEmptyCategories(packageType, countryNameEnTo, countryNameEnFrom, cityId)
	key := fmt.Sprintf(
		"active-categories-%s-%s-%s-%d",
		packageType, countryNameEnTo, countryNameEnFrom, cityId,
	)
	cache15m.Set(key, activeCategories)
	return activeCategories
}

func CacheGetCategories(packageType, countryNameEnTo, countryNameEnFrom string, cityId int) ItemCategories {
	key := fmt.Sprintf(
		"active-categories-%s-%s-%s-%d",
		packageType, countryNameEnTo, countryNameEnFrom, cityId,
	)
	cCats, _ := cache15m.Get(key)
	if cCats == nil {
		return CacheFillCategories(packageType, countryNameEnTo, countryNameEnFrom, cityId)
	}
	categories := cCats.(ItemCategories)
	return categories
}

/*
	Database Views
*/

func findNonEmptyCategories() ItemCategories {
	var cats ItemCategories
	database.
		Table("v_categories").
		Model(&ItemCategory{}).
		Find(&cats)
	return cats
}

func findNonEmptyCategoriesByPackageType(packageType string) ItemCategories {
	query := `SELECT * from (
			SELECT 
				*,
				(
					select 
						count(distinct(items.uuid))
					from items 
					join stores on items.store_uuid=stores.uuid 
					join packages on packages.item_uuid = items.uuid
					where
						items.item_category_id=ic.id and
						stores.last_login_date >= (now() - interval '7 days') and
						stores.is_suspended = false and
						stores.is_allowed_to_sell = true and
						packages.type = ?
				) as item_count ,
				(
					select 
						count(distinct(items.store_uuid)) 
					from items 
					join stores on items.store_uuid=stores.uuid 
					join packages on packages.item_uuid = items.uuid
					where
						items.item_category_id=ic.id and
						stores.last_login_date >= (now() - interval '7 days') and
						stores.is_suspended = false and
						stores.is_allowed_to_sell = true and
						packages.type = ?
				) as user_count
			FROM 
				item_categories ic 
			) ic
			WHERE 
				ic.item_count > 0 and
				ic.hidden = false`

	var cats ItemCategories
	database.Raw(query, packageType, packageType).
		Model(&ItemCategory{}).
		Find(&cats)
	return cats
}

func findNonEmptyCategoriesByPackageTypeAndCountry(packageType, countryNameEn string) ItemCategories {

	query := `SELECT * from (
			SELECT 
				*,
				(
					select 
						count(distinct(items.uuid))
					from items 
					join stores on items.store_uuid=stores.uuid 
					join packages on packages.item_uuid = items.uuid
					where
						items.item_category_id=ic.id and
						stores.last_login_date >= (now() - interval '7 days') and
						stores.is_suspended = false and
						stores.is_allowed_to_sell = true and
						packages.type = ? and
						packages.country_name_en_shipping_to = ?
				) as item_count ,
				(
					select 
						count(distinct(items.store_uuid)) 
					from items 
					join stores on items.store_uuid=stores.uuid 
					join packages on packages.item_uuid = items.uuid
					where
						items.item_category_id=ic.id and
						stores.last_login_date >= (now() - interval '7 days') and
						stores.is_suspended = false and
						stores.is_allowed_to_sell = true and
						packages.type = ? and
						packages.country_name_en_shipping_to = ?
				) as user_count
			FROM 
				item_categories ic 
			) ic
			WHERE 
				ic.item_count > 0 and
				ic.hidden = false`

	var cats ItemCategories
	database.Raw(query, packageType, countryNameEn, packageType, countryNameEn).
		Model(&ItemCategory{}).
		Find(&cats)
	return cats
}

func findNonEmptyCategoriesByPackageTypeAndCityId(packageType string, cityId int) ItemCategories {

	query := `SELECT * from (
			SELECT 
				*,
				(
					select 
						count(distinct(items.uuid))
					from items 
					join stores on items.store_uuid=stores.uuid 
					join packages on packages.item_uuid = items.uuid
					where
						items.item_category_id=ic.id and
						stores.last_login_date >= (now() - interval '7 days') and
						stores.is_suspended = false and
						stores.is_allowed_to_sell = true and
						packages.type = ? and
						packages.drop_city_id = ?
				) as item_count ,
				(
					select 
						count(distinct(items.store_uuid)) 
					from items 
					join stores on items.store_uuid=stores.uuid 
					join packages on packages.item_uuid = items.uuid
					where
						items.item_category_id=ic.id and
						stores.last_login_date >= (now() - interval '7 days') and
						stores.is_suspended = false and
						stores.is_allowed_to_sell = true and
						packages.type=? and
						packages.drop_city_id = ?
				) as user_count
			FROM 
				item_categories ic 
			) ic
			WHERE 
				ic.item_count > 0 and
				ic.hidden = false`

	var cats ItemCategories
	database.Raw(query, packageType, cityId, packageType, cityId).
		Model(&ItemCategory{}).
		Find(&cats)
	return cats
}

func FindNonEmptyCategories(packageType, countryNameEnTo, countryNameEnFrom string, cityId int) ItemCategories {
	var categories ItemCategories

	if packageType == "all" {
		categories = findNonEmptyCategories()
	} else if countryNameEnTo == "" && cityId == 0 {
		categories = findNonEmptyCategoriesByPackageType(packageType)
	} else if countryNameEnTo != "" && cityId == 0 {
		categories = findNonEmptyCategoriesByPackageTypeAndCountry(packageType, countryNameEnTo)
	} else if cityId != 0 {
		categories = findNonEmptyCategoriesByPackageTypeAndCityId(packageType, cityId)
	}

	clearCategories := FindAllCategories()

	for i1 := range clearCategories {

		for _, nec := range categories {
			if clearCategories[i1].ID == nec.ID {
				clearCategories[i1].ItemCount += nec.ItemCount
				clearCategories[i1].UserCount += nec.UserCount
			}
		}

		for i2 := range clearCategories[i1].Subcategories {

			for _, nec := range categories {
				if clearCategories[i1].Subcategories[i2].ID == nec.ID {
					clearCategories[i1].Subcategories[i2].ItemCount += nec.ItemCount
					clearCategories[i1].Subcategories[i2].UserCount += nec.UserCount

					clearCategories[i1].ItemCount += nec.ItemCount
					clearCategories[i1].UserCount += nec.UserCount
				}
			}
			for i3 := range clearCategories[i1].Subcategories[i2].Subcategories {
				for _, nec := range categories {
					if clearCategories[i1].Subcategories[i2].Subcategories[i3].ID == nec.ID {
						clearCategories[i1].Subcategories[i2].Subcategories[i3].ItemCount += nec.ItemCount
						clearCategories[i1].Subcategories[i2].Subcategories[i3].UserCount += nec.UserCount

						clearCategories[i1].Subcategories[i2].ItemCount += nec.ItemCount
						clearCategories[i1].Subcategories[i2].UserCount += nec.UserCount

						clearCategories[i1].ItemCount += nec.ItemCount
						clearCategories[i1].UserCount += nec.UserCount
					}
				}
			}

			sort.Sort(ItemCaterogiesByCount(clearCategories[i1].Subcategories[i2].Subcategories))
		}
		sort.Sort(ItemCaterogiesByCount(clearCategories[i1].Subcategories))
	}
	sort.Sort(ItemCaterogiesByCount(clearCategories))

	return clearCategories
}

// Create views and other representatives
func setupCategoriesViews() {
	var (
		coolofPeriod = settings.GetSettings().CooloffPeriod
	)
	database.Exec("DROP VIEW IF EXISTS v_categories")
	query := fmt.Sprintf(`
		CREATE VIEW v_categories AS
			SELECT * from (
				SELECT 
					*,
					(
						select count(*) 
						from items 
						join stores on items.store_uuid=stores.uuid 
						where
							items.item_category_id=ic.id and
							stores.last_login_date >= (now() - interval '%d days') and
							stores.is_suspended = false and
							stores.is_allowed_to_sell = true
					) as item_count ,
					(
						select 
							count(distinct(items.store_uuid)) 
						from items 
						join stores on items.store_uuid=stores.uuid 
						where
							items.item_category_id=ic.id and
							stores.last_login_date >= (now() - interval '%d days') and
							stores.is_suspended = false and
							stores.is_allowed_to_sell = true
					) as user_count
				FROM 
					item_categories ic 
				) ic
				WHERE 
					ic.item_count > 0 and
					ic.hidden = false
	`, coolofPeriod, coolofPeriod)
	database.Exec(query)
}
