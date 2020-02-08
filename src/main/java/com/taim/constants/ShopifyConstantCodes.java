package com.taim.constants;

public interface ShopifyConstantCodes extends BaseConstantCodes {
	public static final String HTTP_REQUEST_PROPERTY_SHOPIFY_AUTH_TOKEN = "X-Shopify-Access-Token";
	
	public static final String TOPIC_CUSTOMERS_CREATE = "customers/create";
	public static final String TOPIC_CUSTOMERS_UPDATE = "customers/update";
	public static final String TOPIC_CUSTOMERS_DELETE = "customers/delete";
	public static final String TOPIC_CUSTOMERS_DISABLE = "customers/disable";
	public static final String TOPIC_CUSTOMERS_ENABLE = "customers/enable";
	public static final String TOPIC_PRODUCT_CREATE = "products/create";
	public static final String TOPIC_PRODUCT_DELETE = "products/delete";
	public static final String TOPIC_PRODUCT_UPDATE = "products/update";
	public static final String TOPIC_APP_UNINSTALLED = "app/uninstalled";
	public static final String TOPIC_ORDER_CANCELLED = "orders/cancelled";
	public static final String TOPIC_ORDER_CREATE = "orders/create";
	public static final String TOPIC_ORDER_FULFILLED = "orders/fulfilled";
	public static final String TOPIC_ORDER_PAID = "orders/paid";
	public static final String TOPIC_ORDER_UPDATED = "orders/updated";
	public static final String TOPIC_ORDER_PARTIALLY_FULFILLED = "orders/partially_fulfilled";
	
	
	public static final String BASE_URL = "https://www.sntshipping.com/stoneandtile/";
	public static final String APP_SHOPIFY_WEBHOOK_END_POINT = BASE_URL + "shopify-product-webhook";
	
}

