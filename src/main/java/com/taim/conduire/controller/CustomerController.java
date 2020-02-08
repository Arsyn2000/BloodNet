
package com.taim.conduire.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.constants.ConstantCodes;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.dto.aaData;

@Controller
@RequestMapping("/customer")
@Validated
public class CustomerController {
	
	 @RequestMapping(value = "", method = RequestMethod.GET)
	    public String view(Model model) {

	        return "customer/index";
	    }
/*
	private static final Logger logger = LogManager.getLogger();

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private ShopifyOrderItemsDataService shopifyOrderItemsDataService;
    
    @Autowired
    WarehouseDataService warehouseDataService;
    
    @Autowired
    ShopifyProductVariantDataService shopifyProductVariantDataService;
    
    @Autowired
    ShopifyProductDataService shopifyProductDataService;
    
    @Autowired
    CarrierCredentialsDataService carrierCredentialsDataService;
    
    @Autowired
    SystemParameterDataService systemParameterDataService;
    
    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String customerIndex(Model model) {
    	model.addAttribute("menu", "Product");
    	
    	return "customer/products";
    }
    
    @RequestMapping(value = "/customer/register-carrier", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<String> registerCarrier(Model model) {
    	AccountData accountData = CommonHelper.getAccount();
    	
		logger.debug("Inside registerCarrier for  " + accountData.getShopifyStoreUrl());
		try {
			ShopifyStore shopifyStore = new ShopifyStore(accountData.getShopifyStoreUrl(), accountData.getAccessToken());
			CarrierServiceWrapper carrierServiceWrapper = new CarrierServiceWrapper();
			CarrierService carrierService = new CarrierService();
			carrierServiceWrapper.setCarrier_service(carrierService);
			
			carrierService.setCallback_url(ConstantCodes.SHOPIFY_RATE_URL);
			carrierService.setName("S&T Shipping");
			carrierService.setService_discovery("true");
			carrierServiceWrapper.setCarrier_service(carrierService);
			shopifyStore.createCarrierService(carrierServiceWrapper);
		} catch(Throwable t) {
			logger.error("Exception while registerCarrier for store : " + accountData.getShopifyStoreUrl(), t);
		}
		logger.debug("Leaving registerCarrier for  " + accountData.getShopifyStoreUrl());
		return ResponseEntity.ok("");
	}
    
    @RequestMapping(value = "/customer/products", method = RequestMethod.GET)
    public String productPage(Model model) {
    	model.addAttribute("menu", "Product");
    	return "customer/products";
    }

    @RequestMapping(value = "/customer/getAllOrdersForDataTable", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<aaData<ShopifyOrderData>> getAllOrdersForDataTable(@RequestParam(value = "sEcho") int sEcho,
                                                                                 @RequestParam(value = "sSearch", defaultValue = "") String sSearch,
                                                                                 @RequestParam(value = "iDisplayStart") int iDisplayStart,
                                                                                 @RequestParam(value = "iDisplayLength") int iDisplayLength,
                                                                                 @RequestParam(value = "iSortCol_0", defaultValue = "0") int iSortCol_0,
                                                                                 @RequestParam(value = "sSortDir_0", defaultValue = "ASC") String sSortDir_0) {
    	AccountData accountData = CommonHelper.getAccount();
    	final aaData<ShopifyOrderData> aData = new aaData<ShopifyOrderData>();
        String strQuery = "SELECT c FROM ShopifyOrderData c WHERE c.accountId = " + accountData.getId();
        if(sSearch != null && !sSearch.isEmpty()) {
        	strQuery += " and LOWER(orderNumber) like '%" + sSearch.toLowerCase() + "%'";
        }
        
        int Size = entityManager.createQuery(strQuery).getResultList().size();
        
        TypedQuery<ShopifyOrderData> typedQuery = entityManager.createQuery(strQuery, ShopifyOrderData.class).setFirstResult(iDisplayStart).setMaxResults(iDisplayLength);
        List<ShopifyOrderData> listShopifyOrderData = typedQuery.getResultList();
        
        for(ShopifyOrderData order : listShopifyOrderData) {
        	List<ShopifyOrderItemsData> listItems = shopifyOrderItemsDataService.findByOrderId(order.getId());
        	order.setItems(listItems);
        }
        aData.setAaData(listShopifyOrderData);
        aData.setiTotalDisplayRecords(Size);
        aData.setiTotalRecords(Size);
        aData.setsEcho(sEcho);
        aData.setiDisplayStart(iDisplayStart);
        aData.setiDisplayLength(iDisplayLength);

        return ResponseEntity.ok(aData);
    }

    @RequestMapping(value = "/customer/product-state-warehouse-mapping", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<aaData<VariantStateDefaultWarehouseData>> productStateWarehouseMapping(@RequestParam(value = "sEcho") int sEcho,
                                                                                 @RequestParam(value = "sSearch", defaultValue = "") String sSearch,
                                                                                 @RequestParam(value = "iDisplayStart") int iDisplayStart,
                                                                                 @RequestParam(value = "iDisplayLength") int iDisplayLength,
                                                                                 @RequestParam(value = "iSortCol_0", defaultValue = "0") int iSortCol_0,
                                                                                 @RequestParam(value = "sSortDir_0", defaultValue = "ASC") String sSortDir_0) {
    	final aaData<VariantStateDefaultWarehouseData> aData = new aaData<VariantStateDefaultWarehouseData>();
        String strQuery = "SELECT c FROM VariantStateDefaultWarehouseData c  ";
        if(sSearch != null && !sSearch.isEmpty()) {
        	strQuery += " WHERE LOWER(c.sku) like '%" + sSearch.toLowerCase() + "%'";
        }
        
        int Size = entityManager.createQuery(strQuery).getResultList().size();
        
        TypedQuery<VariantStateDefaultWarehouseData> typedQuery = entityManager.createQuery(strQuery, VariantStateDefaultWarehouseData.class).setFirstResult(iDisplayStart).setMaxResults(iDisplayLength);
        List<VariantStateDefaultWarehouseData> listShopifyOrderData = typedQuery.getResultList();
        
        aData.setAaData(listShopifyOrderData);
        aData.setiTotalDisplayRecords(Size);
        aData.setiTotalRecords(Size);
        aData.setsEcho(sEcho);
        aData.setiDisplayStart(iDisplayStart);
        aData.setiDisplayLength(iDisplayLength);

        return ResponseEntity.ok(aData);
    }
    
    
    @RequestMapping(value = "/customer/update-product-variant", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> updateProductVariation(HttpServletResponse response, HttpServletRequest request) {
    	
    	String productId = request.getParameter("productid");
    	logger.debug("productId: " + productId);
    	
    	List<ShopifyProductVariantData> listShopifyProductVariantData = shopifyProductVariantDataService.findByProductId(productId);
    	logger.debug("listShopifyProductVariantData : " + listShopifyProductVariantData.size());
    	
    	for(ShopifyProductVariantData shopifyProductVariantData : listShopifyProductVariantData) {
    		String strVariantId = shopifyProductVariantData.getId().toString();
    		
    		String height = request.getParameter(strVariantId + "_height");
    		String length = request.getParameter(strVariantId + "_length");
    		String width = request.getParameter(strVariantId + "_width");
    		String weight = request.getParameter(strVariantId + "_weight");
    		String freightClass = request.getParameter(strVariantId + "_freight_class");
    		String hazmat = request.getParameter(strVariantId + "_hazmat");
    		
    		logger.debug("strVariantId: " + strVariantId + " height: " + height + " length: " + length + " width: " + width + " weight: " + weight + " freightClass: " + freightClass + " hazmat: " + hazmat);
    		shopifyProductVariantData.setHeight(Float.parseFloat(height));
    		shopifyProductVariantData.setLength(Float.parseFloat(length));
    		shopifyProductVariantData.setWidth(Float.parseFloat(width));
    		shopifyProductVariantData.setWeight(Float.parseFloat(weight));
    		shopifyProductVariantData.setFreightClass(freightClass);
    		shopifyProductVariantData.setHazmat(hazmat);
    		shopifyProductVariantDataService.update(shopifyProductVariantData);
    		
    	}
        return ResponseEntity.ok("Product variations updated !!");
    }
    
    
    @RequestMapping(value = "/customer/get-mapped-warehousecodes-by-variantid/{variantid}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> getMappedWarehouseCodesByVariantId(@PathVariable(value = "variantid") String variantid) {
    	logger.debug("Inside getMappedWarehouseCodesByVariantId");
    	
    	
    	List<VariantWarehouseMappingView> listByCAS = entityManager.createNamedQuery("VariantWarehouseMappingViewByVariantId",VariantWarehouseMappingView.class)
    			.setParameter(1, variantid)
				.getResultList();
		
        return ResponseEntity.ok(listByCAS.get(0).getWarehouse());
    }
    
    @RequestMapping(value = "/customer/download-products", method = RequestMethod.GET)
    public String downloadShopifyProducts(Model model) {
	
		AccountData accountData = CommonHelper.getAccount();
		logger.debug("Inside downloadShopifyProducts for accountid : " + accountData);
		try {
			ShopifyStore shopifyStore = new ShopifyStore(accountData.getShopifyStoreUrl(), accountData.getAccessToken());
			ProductAPI productAPI = shopifyStore.getProductApi();
			logger.debug("productAPI: " + productAPI);
			
			List<Product> products = productAPI.getAllProducts();
			logger.debug("number of products : " + products.size());	
				
			if(!products.isEmpty()) {
				int iCount = products.size();
				for(com.taim.api.shopify.resource.product.Product product : products) {
					shopifyProductDataService.createOrUpdate(product,accountData.getId());
					logger.debug("Remaining : " + iCount--);
				}
			}
		} catch(Throwable t) {
			logger.error("Exception while downloading shopify products. ", t);
		}
		
		logger.debug("Leaving downloadShopifyProducts for accountid : " + accountData);
		return "customer/products";
	}
 */   
}