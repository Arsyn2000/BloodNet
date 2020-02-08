package com.taim.conduire.constants;

import java.util.ArrayList;

public interface ConstantCodes {
	
	public static final String THREAD_POOL_DOWNLOAD_SHOPIFY_ORDERS = "THREAD_POOL_DOWNLOAD_SHOPIFY_ORDERS";
	public static final String THREAD_POOL_DOWNLOAD_AMAZON_ORDERS = "THREAD_POOL_DOWNLOAD_AMAZON_ORDERS";
	public static final String VISIBLE_YES = "Y";
	public static final String FILE_SEPRATOR_TAB = "	";
	public static final String VISIBLE_NO = "N";
	public static final String VISIBLE_DELETED = "D";
	public static final String PERSONAl_ID_TYPES_CACHE = "PERSONAl_ID_TYPES_CACHE";
	public static final String PROVIDER_CACHE = "PROVIDER_CACHE";
	public static final String COUNTRY_CACHE = "COUNTRY_CACHE";
	public static final String LEAD_SOURCE_CACHE= "LEAD_SOURCE_CACHE";
	public static final String PHONE_TPYE_CACHE= "PHONE_TPYE_CACHE";
	public static final String ADDRESS_TYPE_CACHE= "ADDRESS_TYPE_CACHE";
	public static final String PETSONALISED_TYPE_CACHE= "PETSONALISED_TYPE_CACHE";
	public static final String TASK_SUSPENDED= "SUSPENDED";
	
	public static final String AMAZON = "AMAZON";
	public static final String SHOPIFY = "SHOPIFY";
	public static final String PHONE_TYPE_HOME = "HOME";
	public static final String ADDRESS_TYPE_HOME = "HOME";
	public static final String PERSONALISED_TYPE_PASSPORT = "PASSPORT";
	public static final String STATUS_ACTIVE = "ACTIVE";
	public static final ArrayList<String> FREIGHT_CLASSED = new ArrayList<String>();
	
	//public static final String SHOPIFY_CLIENT_ID = "a78afda9df7eb05a82d09ee97c37d136";
	//public static final String SHOPIFY_CLIENT_SECRET = "ca76ca30e9195c46e1a2087bea62696d";
	
	public static final String SHOPIFY_CLIENT_ID = "b2af4c6e655292f96da00cba47b6d833";
	public static final String SHOPIFY_CLIENT_SECRET = "52aeff164536971cf035e603382e67aa";
	
	
	public static final String SHOPIFY_CLIENT_SCOPES = "read_orders,write_shipping,write_orders,read_customers,write_customers,read_fulfillments,write_fulfillments,read_products,write_products";
	public static final String SHOPIFY_REDIRECT_URL = "https://www.sntshipping.com/stoneandtile/multichannel/load";
	public static final String SHOPIFY_RATE_URL = "https://www.sntshipping.com/stoneandtile/multichannel/rate";
	public static final String ACCOUNT_TYPE_CUSTOMER = "CUSTOMER";
	public static final String ACCOUNT_TYPE_ADMIN = "ADMIN";
	public static final String AMAZON_LINKING_STATUS_NOT_LINKED = "NOT_LINKED";
	public static final String AMAZON_FEED_SUBMITTED = "SUBMITTED";

	//public static final String PRODUCT_CLOATHING_LITE_HEADER = "item_sku	item_name	external_product_id	external_product_id_type	brand_name	product_description	item_type	model	update_delete	standard_price	quantity	item_package_quantity	website_shipping_weight	website_shipping_weight_unit_of_measure	bullet_point1	bullet_point2	bullet_point3	bullet_point4	bullet_point5	main_image_url	parent_child	parent_sku	relationship_type	variation_theme	color_name	color_map	department_name	size_name	special_size_type";
	public static final String PRODUCT_HOME_LITE_HEADER = "item_sku	external_product_id	external_product_id_type	gtin_exemption_reason	related_product_id	related_product_id_type	item_name	product_description	feed_product_type	brand_name	manufacturer	part_number	item_type	update_delete	model	standard_price	quantity	item_package_quantity	missing_keyset_reason	website_shipping_weight	website_shipping_weight_unit_of_measure	bullet_point1	bullet_point2	bullet_point3	bullet_point4	bullet_point5	specific_uses_keywords1	thesaurus_subject_keywords1	main_image_url	parent_child	parent_sku	relationship_type	variation_theme	prop_65	cpsia_cautionary_statement1	cpsia_cautionary_statement2	cpsia_cautionary_statement3	cpsia_cautionary_statement4	cpsia_cautionary_description	country_string	country_of_origin	legal_disclaimer_description	scent_name	color_name	size_name	material_type";
	public static final String PRODUCT_OFFICE_LITE_HEADER = "item_sku	external_product_id	external_product_id_type	gtin_exemption_reason	related_product_id	related_product_id_type	feed_product_type	item_name	brand_name	manufacturer	part_number	product_description	item_type	update_delete	item_package_quantity	standard_price	quantity	website_shipping_weight	website_shipping_weight_unit_of_measure	bullet_point1	bullet_point2	bullet_point3	bullet_point4	bullet_point5	thesaurus_attribute_keywords	main_image_url	parent_child	parent_sku	relationship_type	variation_theme	cpsia_cautionary_statement1	cpsia_cautionary_statement2	cpsia_cautionary_statement3	cpsia_cautionary_statement4	cpsia_cautionary_description	prop_65	color_name	ink_color	size_name	maximum_size	line_size	paper_size";
	public static final String PRODUCT_PET_SUPPLY_LITE_HEADER = "item_sku	external_product_id	external_product_id_type	gtin_exemption_reason	related_product_id	related_product_id_type	item_name	brand_name	manufacturer	product_description	feed_product_type	item_type	part_number	update_delete	model	item_package_quantity	standard_price	quantity	condition_type	missing_keyset_reason	website_shipping_weight	website_shipping_weight_unit_of_measure	bullet_point1	bullet_point2	bullet_point3	bullet_point4	bullet_point5	target_audience_keywords1	main_image_url	parent_child	parent_sku	relationship_type	variation_theme	prop_65	cpsia_cautionary_statement1	cpsia_cautionary_statement2	cpsia_cautionary_statement3	cpsia_cautionary_statement4	cpsia_cautionary_description	safety_warning	country_string	country_of_origin	legal_disclaimer_description	color_name	color_map	size_name	size_map	flavor_name	pattern_name";
	public static final String PRODUCT_BABY_LITE_HEADER ="item_sku	item_name	external_product_id	external_product_id_type	feed_product_type	item_type	brand_name	model	manufacturer	part_number	product_description	update_delete	quantity	standard_price	item_package_quantity	missing_keyset_reason	website_shipping_weight	website_shipping_weight_unit_of_measure	bullet_point1	bullet_point2	bullet_point3	bullet_point4	bullet_point5	recommended_browse_nodes1	specific_uses_keywords1	target_audience_keywords1	thesaurus_subject_keywords1	main_image_url	parent_child	relationship_type	parent_sku	variation_theme	legal_disclaimer_description	prop_65	safety_warning	cpsia_cautionary_statement1	cpsia_cautionary_statement2	cpsia_cautionary_statement3	cpsia_cautionary_statement4	cpsia_cautionary_description	country_of_origin	color_name	color_map	size_name	mfg_minimum	mfg_minimum_unit_of_measure	mfg_maximum	mfg_maximum_unit_of_measure";
	public static final String PRODUCT_HEALTH_LITE_HEADER = "item_sku	item_name	external_product_id	external_product_id_type	feed_product_type	brand_name	manufacturer	part_number	product_description	item_type	update_delete	standard_price	currency	quantity	item_package_quantity	website_shipping_weight_unit_of_measure	website_shipping_weight	bullet_point1	bullet_point2	bullet_point3	bullet_point4	bullet_point5	specific_uses_keywords1	target_audience_keywords1	thesaurus_attribute_keywords1	main_image_url	parent_child	parent_sku	relationship_type	variation_theme	safety_warning	legal_disclaimer_description	prop_65	cpsia_cautionary_statement1	cpsia_cautionary_statement2	cpsia_cautionary_statement3	cpsia_cautionary_statement4	cpsia_cautionary_description	size_name	color_name	unit_count	unit_count_type	model_name";

	public static final String NEW_LINE = "\n";
	public static final String TAB = "\t";
	public static final String PROFILE_TYPE_PET_SUPPLIES = "petsupplies";
	public static final String PROFILE_TYPE_HOME_AND_KITCHEN = "home";
	public static final String SHOW_DELIVERY_ESTIMAT = "SHOW_DELIVERY_ESTIMATE";
	public static final String ALWAYS_QUOTE_RESIDENTIAL_PICKUP = "ALWAYS_QUOTE_RESIDENTIAL_PICKUP";
	public static final String ALWAYS_QUOTE_LIFT_GATE_DELIVERY = "ALWAYS_QUOTE_LIFT_GATE_DELIVERY";
	public static final String ALWAYS_QUOTE_RESIDENTIAL_DEIVERY = "ALWAYS_QUOTE_RESIDENTIAL_DEIVERY";
	public static final String PACKAGE_HANDLING_FEE = "PACKAGE_HANDLING_FEE";
	public static final String HANDLING_FEE = "HANDLING_FEE";
	public static final String MAX_WH_POLL = "MAX_WH_POLL";
	public static final String CARRIER_RANDL = "R&L";
	public static final String CARRIER_GTZ = "GT";
	public static final String CARRIER_SP = "SF";
		
	public static final String PROFORMA = "proforma";
	public static final String SAMPLE = "sample";
	public static final String PROFORMA_ID = "2";
	public static final String SAMPLE_ID = "1";
	public static final String SNT_SHIPPING = "S&T Shipping";
	public static final String _SAMPLE = "_sample";
	public static final String VARIANT_ID = "_variant_id";
	public static final String YES = "YES";
	public static final String SNT_FREE_PICKUP = "SNTFREEPICKUP";
	public static final String PRODUCT = "Product";
	
}
