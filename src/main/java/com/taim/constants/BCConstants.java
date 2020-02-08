package com.taim.constants;

import com.taim.constants.BaseConstantCodes;

public interface BCConstants extends BaseConstantCodes {
	public static final String API_BASE = "https://api.bigcommerce.com";
	public static final String STORE_URL = "STORE_URL";
	public static final String DEFAULT_API_VERSION = "v2";
	public static final String API_VERSION = "API_VERSION";
	public static final String FORWARD_SLASH = "/";
	public static final String APPLICATION_CLIENT_ID = "APPLICATION_CLIENT_ID";
	public static final String APPLICATION_TOKEN = "APPLICATION_TOKEN";
	public static final String API_FILTER_PARAMETER_PAGE = "page";
	public static final String API_FILTER_PARAMETER_LIMIT = "limit";
	public static final String DEFAULT_FILTER_PAGE_VALUE = "1";
	public static final String DEFAULT_FILTER_PER_PAGE_LIMIT_VALUE = "250";
	public static final String RESOURCE_ORDERS = "/orders";
	public static final String RESOURCE_SHIPPING_ADDRESSES = "shipping_addresses";
	public static final String RESOURCE_SHIPMENTS = "shipments";
	public static final String RESOURCE_IMAGES = "/images";
	public static final String RESOURCE_STORE = "/store";
	public static final String RESOURCE_BRANDS = "/brands";
	public static final String RESOURCE_PRODUCTS = "/products";
	public static final String RESOURCE_CATEGORIES = "/categories";
	public static final String RESOURCE_OPTION_SETS = "/option_sets";
	public static final String RESOURCE_OPTIONS = "/options";
	public static final String RESOURCE_OPTION_COUNT = "/option_sets/count";
	public static final String RESOURCE_HOOKS = "/hooks";
	public static final String RESOURCE_ORDERS_COUNT = "/orders/count";
	public static final String RESOURCE_PRODUCTS_COUNT = "/products/count";
	public static final String RESOURCE_CATEGORIES_COUNT = "/categories/count";
	public static final String RESOURCE_OPTIONS_COUNT = "/options/count";
	public static final String RESOURCE_BRANDS_COUNT = "/brands/count";
	public static final String BIGCOMMERCE_TOKEN_SERVICE_URL = "https://login.bigcommerce.com/oauth2/token";
}
