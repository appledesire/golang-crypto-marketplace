package marketplace

import (
	"fmt"
	"github.com/lib/pq"
	"math/rand"
)

/*
	Database Queries
*/

func FindItemsNewArrivals() SerpItems {
	items := []SerpItem{}

	database.
		Table("vm_frontpage_items_new_arrivals").
		Find(&items)
	
	PriceInCurrencies(items)
	return items
}


func FindItemsTopDrugs() SerpItems {
	items := []SerpItem{}

	database.
		Table("vm_frontpage_items_top_drugs").
		Find(&items)
	PriceInCurrencies(items)
	return items
}

func FindItemsTopOther() SerpItems {
	items := []SerpItem{}

	database.
		Table("vm_frontpage_items_top_other").
		Find(&items)
	PriceInCurrencies(items)
	return items
}

func removeDuplicates(elements pq.StringArray) pq.StringArray {
    // Use map to record duplicates as we find them.
    encountered := map[string]bool{}
    result := pq.StringArray{}

    for v := range elements {
        if encountered[elements[v]] == true {
            // Do not add duplicate.
        } else {
            // Record this element as an encountered element.
            encountered[elements[v]] = true
            // Append to result slice.
            result = append(result, elements[v])
        }
    }
    // Return the new slice.
    return result
}

/* Randomly select categories to show, if vendor 
 items in more than 6 categories
*/
func setRandomCategories(slice pq.StringArray) pq.StringArray {
	lengthArray := len(slice)
	var categories pq.StringArray
	
	if lengthArray <= 6 {
		categories = slice
	} else {
		var generated map[int]bool
		generated = make(map[int]bool)
		for i := 0; i < 6; i++ {
			foundUniqueInt := false

			for !foundUniqueInt {

				randomInt := rand.Intn(lengthArray)
				if generated[randomInt] == true {
					// do nothing
				} else {
					foundUniqueInt = true
					generated[randomInt] = true
					categories = append(categories, slice[i])
				}
				
			}

		}
	}
	return categories
}


func (ais SerpStores) SetAdditionalData() {
	for i, _ := range ais {
		categoriesNameEnUnique := removeDuplicates(ais[i].CategoriesNameEn)
		categoriesLimited := setRandomCategories(categoriesNameEnUnique)
		ais[i].CategoriesNameEn = categoriesLimited
		ais[i].ScoreString = fmt.Sprintf("%.2f", ais[i].Score)
	}
}

func FindVendorsTop() SerpStores {
	vendors := []SerpItem{}
	database.Table("vm_frontpage_top_vendors").
	Find(&vendors)

	serpItems := SerpItems(vendors)
	serpStoresUniqued := serpItems.SerpStores()
	serpStoresUniqued.SetAdditionalData()
	return serpStoresUniqued
}

func FindVendorsNew() SerpStores {
	vendors := []SerpItem{}
	database.Table("vm_frontpage_new_vendors").
	Find(&vendors)

	serpItems := SerpItems(vendors)
	serpStoresUniqued := serpItems.SerpStores()
	serpStoresUniqued.SetAdditionalData()
	return serpStoresUniqued
}


func CountAvailableItems() int{
	//
	var count int
	database.
		Table("vm_available_items").
		Count(&count)
	return count
}

func GetCountItems() int {
	key := "stats-" + "total-available-items"
	cCountItems, _ := cache1h.Get(key)
	countItems, ok := cCountItems.(int)
	if ok == false {
		countItems = CountAvailableItems()
		cache1h.Set(key, countItems)
		return countItems
	}
	return countItems
}

func CountAvailableVendors() int {
	var count int
	database.
		Table("stores").Where("is_gold_account = ?", "True").
		Or("is_silver_account = ?", "True").
		Or("is_bronze_account = ?", "True").
		Or("is_free_account = ?", "True").
		Count(&count)
	return count
}


func GetCountVendors() int {
	key := "stats-" + "total-available-vendors"
	cCountVendors, _ := cache1h.Get(key)
	countVendors, ok := cCountVendors.(int)
	if ok == false {
		countVendors := CountAvailableVendors()
		cache1h.Set(key, countVendors)
		return countVendors
	}
	return countVendors
}

func CacheShippingToList() []string {
	key := "shipping-to-list"
	cShippingToList, _ := cache1h.Get(key)
	shippingToList, ok := cShippingToList.([]string)
	if ok == false {
		ais := FindSerpItems()
		shippingToList = ais.ShippingToList()
		cache1h.Set(key, shippingToList)
		return shippingToList
	}
	return shippingToList
}



/*
	Database Views
*/
func setupFrontPageItemsViews() {
	
	database.Exec("DROP MATERIALIZED VIEW IF EXISTS vm_frontpage_top_vendors CASCADE;")
	database.Exec(`
		      CREATE MATERIALIZED VIEW vm_frontpage_top_vendors AS (
			with popular_vendors AS (SELECT max(item_uuid) as one_item_uuid,
							store_uuid,
							store_score,
							array_agg(item_category_id) as category_ids
						   FROM vm_available_items
						  GROUP BY store_uuid,
							   store_score
						  ORDER BY store_score DESC
						  LIMIT 200),
			  cat1 AS (SELECT 
				     item_categories.name_en as categories_name_en, 
				     t2.store_uuid, 
				     t2.one_item_uuid as one_item_uuid 
				     FROM (SELECT 
					     store_uuid, 
					     unnest(category_ids) category_id, 
					     one_item_uuid FROM
							       popular_vendors) t2 
					    JOIN item_categories ON 
						item_categories.id=t2.category_id),
			  cat2 AS (SELECT 
				     store_uuid, 
				     max(one_item_uuid) as one_item_uuid, 
				     array_agg(categories_name_en) as categories_name_en
				     FROM cat1 GROUP BY store_uuid)
			SELECT 			  
			  t1.*, t2.categories_name_en as categories_name_en
			  FROM 
				     vm_available_items t1 RIGHT OUTER JOIN cat2 t2 ON 
 						 t1.item_uuid=t2.one_item_uuid
				     ORDER BY random() 
			 LIMIT 3
		      )`)
	
	database.Exec("DROP MATERIALIZED VIEW IF EXISTS vm_frontpage_new_vendors CASCADE;")
	database.Exec(`
		      CREATE MATERIALIZED VIEW vm_frontpage_new_vendors AS (
			with new_vendors AS (SELECT max(item_uuid) as one_item_uuid,
							store_uuid,
							store_registration_date,
							array_agg(item_category_id) as category_ids
						   FROM vm_available_items
						  GROUP BY store_uuid,
							   store_registration_date
						  ORDER BY store_registration_date DESC
						  LIMIT 10),
			  cat1 AS (SELECT 
				     item_categories.name_en as categories_name_en, 
				     t2.store_uuid, 
				     t2.one_item_uuid as one_item_uuid 
				     FROM (SELECT 
					     store_uuid, 
					     unnest(category_ids) category_id, 
					     one_item_uuid FROM
							       new_vendors) t2 
					    JOIN item_categories ON 
						item_categories.id=t2.category_id),
			  cat2 AS (SELECT 
				     store_uuid, 
				     max(one_item_uuid) as one_item_uuid, 
				     array_agg(categories_name_en) as categories_name_en
				     FROM cat1 GROUP BY store_uuid)
			SELECT 			  
			  t1.*, t2.categories_name_en as categories_name_en
			  FROM 
				     vm_available_items t1 RIGHT OUTER JOIN cat2 t2 ON 
 						 t1.item_uuid=t2.one_item_uuid
				     ORDER BY random() 
			 LIMIT 3
		      )`)


	database.Exec("DROP MATERIALIZED VIEW IF EXISTS vm_frontpage_items_top_drugs CASCADE;")

	query := fmt.Sprintf(`
		CREATE MATERIALIZED VIEW vm_frontpage_items_top_drugs AS (

			SELECT 
			  item_uuid,
			  drop_city_id,
			  country_name_en_shipping_from,
			  country_name_en_shipping_to,
			  currency,
			  type,
			  min_price,
			  max_price,
			  store_uuid,
			  store_description,
			  store_is_free_account,
			  store_is_gold_account,
			  store_is_silver_account,
			  store_is_bronze_account,
			  store_is_suspended,
			  store_is_trusted,
			  store_is_allowed_to_sell,
			  store_last_login_date,
			  store_registration_date,
			  item_created_at,
			  item_name,
			  item_description,
			  item_category_id,
			  reviewed_by_user_uuid,
			  parent_item_category_id,
			  parent_parent_item_category_id,
			  store_score,
			  store_score_count,
			  item_score,
			  item_score_count,
			  store_bitcoin_tx_number,
			  store_bitcoin_tx_volume,
			  store_bitcoin_cash_tx_number,
			  store_bitcoin_cash_tx_volume,
			  store_ethereum_tx_number,
			  store_ethereum_tx_volume,
			  item_bitcoin_tx_number,
			  item_bitcoin_tx_volume,
			  item_bitcoin_cash_tx_number,
			  item_bitcoin_cash_tx_volume,
			  item_ethereum_tx_number,
			  item_ethereum_tx_volume,
			    (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='GREEN' and deleted_at IS NULL and is_approved=true and uw.created_at >= now() - interval '%d hours') as number_of_green_warnings,
			  (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='YELLOW' and deleted_at IS NULL and is_approved=true and uw.created_at >= now() - interval '%d hours') as number_of_yellow_warnings,
			  (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='RED' and deleted_at IS NULL and is_approved=true and uw.created_at >= (now() - interval '%d hours')) as number_of_red_warnings

			FROM 
				vm_available_items
			    JOIN stores on stores.uuid = store_uuid
                        WHERE (item_category_id = 1 OR 
			       parent_item_category_id=1 OR 
			       parent_parent_item_category_id=1) AND 
			      item_score > 4.5 AND
			      number_of_red_warnings=0 AND 
			      number_of_yellow_warnings=0 AND
			      number_of_green_warnings=0 AND
			      store_is_suspended=false AND 
			      store_is_allowed_to_sell=true

                        ORDER BY random()
                        LIMIT 5
	);`, int(GREEN_WARNING_DURATION.Hours()), int(YELLOW_WARNING_DURATION.Hours()), int(RED_WARNING_DURATION.Hours()))
	database.Exec(query)

	database.Exec("DROP MATERIALIZED VIEW IF EXISTS vm_frontpage_items_top_other CASCADE;")

	query2 := fmt.Sprintf(`
		      CREATE MATERIALIZED VIEW vm_frontpage_items_top_other AS (
			SELECT
			  item_uuid,
			  drop_city_id,
			  country_name_en_shipping_from,
			  country_name_en_shipping_to,
			  currency,
			  type,
			  min_price,
			  max_price,
			  store_uuid,
			  store_description,
			  store_is_free_account,
			  store_is_gold_account,
			  store_is_silver_account,
			  store_is_bronze_account,
			  store_is_suspended,
			  store_is_trusted,
			  store_is_allowed_to_sell,
			  store_last_login_date,
			  store_registration_date,
			  item_created_at,
			  item_name,
			  item_description,
			  item_category_id,
			  reviewed_by_user_uuid,
			  parent_item_category_id,
			  parent_parent_item_category_id,
			  store_score,
			  store_score_count,
			  item_score,
			  item_score_count,
			  store_bitcoin_tx_number,
			  store_bitcoin_tx_volume,
			  store_bitcoin_cash_tx_number,
			  store_bitcoin_cash_tx_volume,
			  store_ethereum_tx_number,
			  store_ethereum_tx_volume,
			  item_bitcoin_tx_number,
			  item_bitcoin_tx_volume,
			  item_bitcoin_cash_tx_number,
			  item_bitcoin_cash_tx_volume,
			  item_ethereum_tx_number,
			  item_ethereum_tx_volume,
			  t1.name_en AS item_category_name_en,
			  t2.name_en AS parent_item_category_name_en,
			  t3.name_en AS parent_parent_item_category_name_en,
			  t1.name_ru AS item_category_name_ru,
			  t2.name_ru AS parent_item_category_name_ru,
			  t3.name_ru AS parent_parent_item_category_name_ru,
			    (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='GREEN' and deleted_at IS NULL and is_approved=true and uw.created_at >= now() - interval '%d hours') as number_of_green_warnings,
			  (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='YELLOW' and deleted_at IS NULL and is_approved=true and uw.created_at >= now() - interval '%d hours') as number_of_yellow_warnings,
			  (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='RED' and deleted_at IS NULL and is_approved=true and uw.created_at >= (now() - interval '%d hours')) as number_of_red_warnings

			  FROM
			      vm_available_items
			      LEFT JOIN item_categories t1 ON
				  vm_available_items.item_category_id = t1.id
			      LEFT JOIN item_categories t2 ON
				  vm_available_items.parent_item_category_id = t2.id
			      LEFT JOIN item_categories t3 ON
				  vm_available_items.parent_parent_item_category_id = t3.id
			      JOIN stores on stores.uuid = store_uuid
                        WHERE (item_category_id != 1 AND 
			       parent_item_category_id !=1 AND
			       parent_parent_item_category_id != 1 AND
			       item_category_id != 8 AND
			       parent_item_category_id !=8 AND
			       parent_parent_item_category_id != 8) AND
			      item_score > 4.5 AND
			      number_of_red_warnings=0 AND 
			      number_of_yellow_warnings=0 AND
			      number_of_green_warnings=0 AND
			      store_is_suspended=false AND 
			      store_is_allowed_to_sell=true

			 ORDER BY random()

			 LIMIT 4
		      )`, int(GREEN_WARNING_DURATION.Hours()), int(YELLOW_WARNING_DURATION.Hours()), int(RED_WARNING_DURATION.Hours()))
	database.Exec(query2)


	

	database.Exec("DROP MATERIALIZED VIEW IF EXISTS vm_frontpage_items_new_arrivals CASCADE;")
	query3 := fmt.Sprintf(`
		      CREATE MATERIALIZED VIEW vm_frontpage_items_new_arrivals AS (
			SELECT
			  item_uuid,
			  drop_city_id,
			  country_name_en_shipping_from,
			  country_name_en_shipping_to,
			  currency,
			  type,
			  min_price,
			  max_price,
			  store_uuid,
			  store_description,
			  store_is_free_account,
			  store_is_gold_account,
			  store_is_silver_account,
			  store_is_bronze_account,
			  store_is_suspended,
			  store_is_trusted,
			  store_is_allowed_to_sell,
			  store_last_login_date,
			  store_registration_date,
			  item_created_at,
			  item_name,
			  item_description,
			  item_category_id,
			  reviewed_by_user_uuid,
			  parent_item_category_id,
			  parent_parent_item_category_id,
			  store_score,
			  store_score_count,
			  item_score,
			  item_score_count,
			  store_bitcoin_tx_number,
			  store_bitcoin_tx_volume,
			  store_bitcoin_cash_tx_number,
			  store_bitcoin_cash_tx_volume,
			  store_ethereum_tx_number,
			  store_ethereum_tx_volume,
			  item_bitcoin_tx_number,
			  item_bitcoin_tx_volume,
			  item_bitcoin_cash_tx_number,
			  item_bitcoin_cash_tx_volume,
			  item_ethereum_tx_number,
			  item_ethereum_tx_volume,
			  t1.name_en AS item_category_name_en,
			  t2.name_en AS parent_item_category_name_en,
			  t3.name_en AS parent_parent_item_category_name_en,
			  t1.name_ru AS item_category_name_ru,
			  t2.name_ru AS parent_item_category_name_ru,
			  t3.name_ru AS parent_parent_item_category_name_ru,
			    (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='GREEN' and deleted_at IS NULL and is_approved=true and uw.created_at >= now() - interval '%d hours') as number_of_green_warnings,
			  (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='YELLOW' and deleted_at IS NULL and is_approved=true and uw.created_at >= now() - interval '%d hours') as number_of_yellow_warnings,
			  (select count(*) from store_warnings uw where uw.store_uuid=stores.uuid and severety='RED' and deleted_at IS NULL and is_approved=true and uw.created_at >= (now() - interval '%d hours')) as number_of_red_warnings

			  FROM
			      vm_available_items
			      LEFT JOIN item_categories t1 ON
				  vm_available_items.item_category_id = t1.id
			      LEFT JOIN item_categories t2 ON
        			  vm_available_items.parent_item_category_id = t2.id
			      LEFT JOIN item_categories t3 ON
				  vm_available_items.parent_parent_item_category_id = t3.id
			      JOIN stores on stores.uuid = store_uuid
			 WHERE number_of_red_warnings=0 AND 
			      number_of_yellow_warnings=0 AND
			      number_of_green_warnings=0 AND
			      store_is_suspended=false AND 
			      store_is_allowed_to_sell=true


			 ORDER BY random()
			 LIMIT 4
		      );`, int(GREEN_WARNING_DURATION.Hours()), int(YELLOW_WARNING_DURATION.Hours()), int(RED_WARNING_DURATION.Hours()))
	database.Exec(query3)

}

func RefreshFrontPageItemsMaterializedViews() {
	database.Exec("REFRESH MATERIALIZED VIEW vm_frontpage_items_new_arrivals;")
	database.Exec("REFRESH MATERIALIZED VIEW vm_frontpage_items_top_drugs;")
	database.Exec("REFRESH MATERIALIZED VIEW vm_frontpage_items_top_other;")
	database.Exec("REFRESH MATERIALIZED VIEW vm_frontpage_top_vendors;")
	database.Exec("REFRESH MATERIALIZED VIEW vm_frontpage_new_vendors;")
}
