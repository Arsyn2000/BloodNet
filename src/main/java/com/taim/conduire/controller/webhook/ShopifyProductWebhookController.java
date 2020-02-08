package com.taim.conduire.controller.webhook;

import java.util.ArrayList;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.service.AccountDataService;
import com.taim.constants.ShopifyConstantCodes;

@Controller
@RequestMapping("/shopify-product-webhook")
@Validated
public class ShopifyProductWebhookController {
	/*	
	private static final Logger logger = LogManager.getLogger();

	@Autowired
	AccountDataService accountDataService;
	
	@Autowired
	ShopifyProductDataService shopifyProductDataService;
	
	@Autowired
	ShopifyOrderDataService shopifyOrderDataService;
	
	@Autowired
	ShopifyProductVariantDataService shopifyProductVariantDataService;
	
	@Autowired
	ProductWarehouseMappingDataService productWarehouseMappingDataService;
	
	@Autowired
	ShopifyProductImagesDataService shopifyProductImagesDataService;
	
	@Autowired
	ShopifyProductOptionsDataService shopifyProductOptionsDataService;
	
	@Autowired
	WarehouseDataService warehouseDataService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
    public ResponseEntity<String> create(@RequestHeader(name="content-type") String contentType,
    		@RequestHeader(name="x-shopify-topic") String topic,
    		@RequestHeader(name="x-shopify-hmac-sha256") String hash,
    		@RequestHeader(name="x-shopify-shop-domain") String shop,
    		HttpEntity<String> httpEntity) {
		logger.debug("Inside create");
		logger.debug("contentType : " + contentType);
		logger.debug("topic : " + topic);
		logger.debug("hash : " + hash);
		logger.debug("shop : " + shop);
		
		String content = httpEntity.getBody();
		logger.debug("content : " + content);
		
		if(topic.equalsIgnoreCase(ShopifyConstantCodes.TOPIC_PRODUCT_UPDATE) || topic.equalsIgnoreCase(ShopifyConstantCodes.TOPIC_PRODUCT_CREATE)) {
			GsonBuilder gsonBuilder  = new GsonBuilder();
	        gsonBuilder.setDateFormat("yyyy-MM-dd'T'HH:mm:ss");
	        Gson gson = gsonBuilder.create();
	        Product product = gson.fromJson(content, Product.class);
	        
	        List<AccountData> listAccountData = accountDataService.findByShopifyStoreUrl(shop);
	        if(!listAccountData.isEmpty()) {
	        	AccountData accountData = listAccountData.get(0);
	        	shopifyProductDataService.createOrUpdate(product,accountData.getId());
	        } else {
	        	logger.fatal("UNABLE TO RETRIVE ACCOUNT FOR STORE : " + shop);
	        }
		} else if(topic.equalsIgnoreCase(ShopifyConstantCodes.TOPIC_ORDER_CREATE) || topic.equalsIgnoreCase(ShopifyConstantCodes.TOPIC_ORDER_UPDATED)) {
			GsonBuilder gsonBuilder  = new GsonBuilder();
	        gsonBuilder.setDateFormat("yyyy-MM-dd'T'HH:mm:ss");
	        Gson gson = gsonBuilder.create();
	        Order order = gson.fromJson(content, Order.class);
	        shopifyOrderDataService.createOrUpdate(order);
	        
	        try {
	        	 addWarehouseAddress(order);
	        } catch(Exception e) {
	        	logger.error("Exception while setting up order attribute. Error message: " + e.getMessage(),e);
	        }
	        
	        
		} else if(topic.equalsIgnoreCase(ShopifyConstantCodes.TOPIC_ORDER_CREATE) || topic.equalsIgnoreCase(ShopifyConstantCodes.TOPIC_ORDER_UPDATED)) {
			GsonBuilder gsonBuilder  = new GsonBuilder();
	        gsonBuilder.setDateFormat("yyyy-MM-dd'T'HH:mm:ss");
	        Gson gson = gsonBuilder.create();
	        Order order = gson.fromJson(content, Order.class);
	        shopifyOrderDataService.createOrUpdate(order);
		} else if(topic.equalsIgnoreCase(ShopifyConstantCodes.TOPIC_PRODUCT_DELETE)) {
			GsonBuilder gsonBuilder  = new GsonBuilder();
	        Gson gson = gsonBuilder.create();
	        Product product = gson.fromJson(content, Product.class);
	        try {
	        	Long productId = product.getId();
	        	logger.debug("Product deleted ID : " + productId);
	        	ShopifyProductData shopifyProductData = shopifyProductDataService.findOne(productId);
	        	logger.debug("shopifyProductData: " + shopifyProductData);
	        	if(shopifyProductData != null) {
	        		List<ShopifyProductVariantData> listShopifyProductVariants = shopifyProductVariantDataService.findByProductId(productId.toString());
	        		logger.debug("Number of variations: " + listShopifyProductVariants);
	        		for(ShopifyProductVariantData shopifyProductVariantData : listShopifyProductVariants) {
	        			logger.debug("deleting variation: " + shopifyProductVariantData);
	        			List<ProductWarehouseMappingData> listProductWarehouseMapping = productWarehouseMappingDataService.findByVariationId(shopifyProductVariantData.getId().toString());
	        			logger.debug("Number of warehouse mapped for " + listProductWarehouseMapping.size() + " variation : " + listProductWarehouseMapping);
	        			for(ProductWarehouseMappingData productWarehouseMappingData : listProductWarehouseMapping) {
	        				logger.debug("deleting product warehouse mapping: " + productWarehouseMappingData);
	        				productWarehouseMappingDataService.delete(productWarehouseMappingData);
	        			}
	        			shopifyProductVariantDataService.deleteById(shopifyProductVariantData.getId());
	        		}

	        		List<ShopifyProductImagesData> listShopifyProductImages = shopifyProductImagesDataService.findByProductId(productId);
	        		logger.debug("Number of product images: " + listShopifyProductImages.size());
	        		for(ShopifyProductImagesData shopifyProductImagesData : listShopifyProductImages) {
	        			logger.debug("shopifyProductImagesData: " + shopifyProductImagesData);
	        			shopifyProductImagesDataService.delete(shopifyProductImagesData);
	        		}
	        		List<ShopifyProductOptionsData> listShopifyProductOption = shopifyProductOptionsDataService.findByProductId(productId);
	        		logger.debug("Number of shopify product options. "  + listShopifyProductOption.size());
	        		for(ShopifyProductOptionsData shopifyProductOptionsData : listShopifyProductOption) {
	        			logger.debug("deleting shopify product option "  + shopifyProductOptionsData);
	        			shopifyProductOptionsDataService.delete(shopifyProductOptionsData);
	        		}
	        		shopifyProductDataService.deleteById(productId);
	        	}

	        } catch(Exception exception) {
	        	logger.error("Exception while deleteing product. Error Message: " + exception.getMessage(),exception);
	        }
		}
        
        return ResponseEntity.ok("OK");
    }

	private void addWarehouseAddress(Order order) {
		logger.debug("Inside addWarehouseAddress");
		List<ShippingLine> listShippingLines = order.getShippingLines();
		if(listShippingLines != null && !listShippingLines.isEmpty()) {
			ShippingLine shippingLine = listShippingLines.get(0);
			String code = shippingLine.getCode();
			String source = shippingLine.getSource();
			
			if(source.equalsIgnoreCase("S\u0026T Shipping") && code.startsWith("SNTFREEPICKUP")) {
				code = code.replace("SNTFREEPICKUP", "").trim();
				logger.debug("Warehouse code : " + code);
				WarehouseData warehouseData = warehouseDataService.findOne(new Integer(code));
				logger.debug("warehouseData: " + warehouseData);
				
				
				ShopifyStore shopifyStore = new ShopifyStore("stoneandtile.myshopify.com", "c0fafedf3a86d17024b82d835f9a36cc");
				OrderAPI orderAPI = shopifyStore.getOrderApi();
				
				String addressLine1 = warehouseData.getAddressLine1();
				String addressLine2 = warehouseData.getAddressLine2();
				String city = warehouseData.getCity();
				String state = warehouseData.getProvince();
				String zip = warehouseData.getZip();
				String phone = warehouseData.getPhoneNumber();
				
				Order updateOrder = new Order();
				updateOrder.setId(order.getId());
				List<Attribute> listAttributes = new ArrayList<Attribute>();
				Attribute aAddressLine1 = new Attribute();
				aAddressLine1.setName("Pickup Address Line1");
				aAddressLine1.setValue(addressLine1);
				listAttributes.add(aAddressLine1);
				
				if(addressLine2 != null && !addressLine2.trim().isEmpty()) {
					Attribute aAddressLine2 = new Attribute();
					aAddressLine2.setName("Pickup Address Line2");
					aAddressLine2.setValue(addressLine2);
					listAttributes.add(aAddressLine2);
				}
				
				Attribute aName = new Attribute();
				aName.setName("Pickup Warehouse Name");
				aName.setValue(warehouseData.getName());
				listAttributes.add(aName);
				
				Attribute aCity = new Attribute();
				aCity.setName("Pickup City");
				aCity.setValue(city);
				listAttributes.add(aCity);
				
				Attribute aState = new Attribute();
				aState.setName("Pickup State");
				aState.setValue(state);
				listAttributes.add(aState);
				
				Attribute aZip = new Attribute();
				aZip.setName("Pickup Zip");
				aZip.setValue(zip);
				listAttributes.add(aZip);
				
				if(phone != null && !phone.trim().isEmpty()) {
					Attribute aphone = new Attribute();
					aphone.setName("Pickup Phone");
					aphone.setValue(phone);
					listAttributes.add(aphone);
				}
				
				updateOrder.setNoteAttributes(listAttributes);
				
				Orders orders = new Orders();
				orders.setOrder(updateOrder);
				orders.setOrders(null);
				orderAPI.updateOrder(order.getId().toString(), orders);
			 } else {
				 logger.debug("Seems no free pickup");
			 }
		} else {
			logger.debug("Shipping lines are not available.");
		}
		logger.debug("Leaving addWarehouseAddress");
	}*/
}