package com.taim.conduire.controller.multichannel;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.http.HttpEntity;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;
import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.constants.ConstantCodes;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.service.AccountDataService;
import com.taim.constants.ShopifyConstantCodes;

import java.io.IOException;
import java.net.URLDecoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.util.Date;
import java.util.Formatter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MultiChannelController {
	/*
	private static final String TYPE_JSON = "json";    
	private static final Logger logger = LogManager.getLogger();
	private static final String HMAC_SHA1_ALGORITHM = "HmacSHA256";
	
	@Autowired
	AccountDataService accountDataService;

	@Autowired
	DaoAuthenticationProvider authenticationManager;
	
	@Autowired
	ShopifyProductVariantDataService shopifyProductVariantDataService;
	
    @RequestMapping(value = "/multichannel", method = RequestMethod.GET)
    public String multichannel(@RequestParam(name="shop") String shop, 
    		                   HttpServletRequest request) {
    	
    	logger.debug("shop : " + shop);
    	List<AccountData> listAccountData = accountDataService.findByShopifyStoreUrl(shop);
    	logger.debug("Number of account : " + listAccountData.size());
    	
    	if(listAccountData.isEmpty()) {
    		logger.debug("Looks like new account");
    		AccountData accountData = new AccountData();
    		accountData.setAccountstatus("INACTIVE");
    		accountData.setAccounttype("CUSTOMER");
    		accountData.setCreatedate(new Date());
    		accountData.setEmail("n/a");
    		accountData.setFname("n/a");
    		accountData.setLname("n/a");
    		accountData.setParent(new AccountData(1));
    		accountData.setParentId(1);
    		accountData.setPassword(shop);
    		accountData.setUsername(shop);
    		accountData.setShopifyStoreUrl(shop);
    		accountData.setUsername(shop);
    		accountData.setVisible('Y');

    		accountDataService.create(accountData);
    		logger.debug("account created into system");
    		
    		String nonce = com.taim.conduire.common.CommonUtil.getOTP(6); 
        	CommonHelper.setNonce(shop, nonce);
        	
    		logger.debug("Seems like new store installation request. Need to proceed with authentication.");
    		String redirectUrl = "https://" + shop 
    				+ "/admin/oauth/authorize?client_id=" + SHOPIFY_CLIENT_ID 
    				+ "&scope=" + SHOPIFY_CLIENT_SCOPES 
    				+ "&redirect_uri=" + SHOPIFY_REDIRECT_URL 
    				+ "&state=" + nonce  ;
    		
        	logger.debug("redirectUrl : " + redirectUrl);
        	return "redirect:" + redirectUrl;

    	} else if(!listAccountData.isEmpty() && listAccountData.get(0).getAccessToken() == null) {
    		
    		logger.debug("seems account already exists. But auth flow is missing. Let move on getting auth");
    		String nonce = com.taim.conduire.common.CommonUtil.getOTP(6); 
        	CommonHelper.setNonce(shop, nonce);
        	
    		logger.debug("Seems like new store installation request. Need to proceed with authentication.");
    		String redirectUrl = "https://" + shop 
    				+ "/admin/oauth/authorize?client_id=" + SHOPIFY_CLIENT_ID 
    				+ "&scope=" + SHOPIFY_CLIENT_SCOPES 
    				+ "&redirect_uri=" + SHOPIFY_REDIRECT_URL 
    				+ "&state=" + nonce  ;
    		
        	logger.debug("redirectUrl : " + redirectUrl);
        	return "redirect:" + redirectUrl;
    	
    	} else if(!listAccountData.isEmpty() && listAccountData.get(0).getAccessToken() != null) {
    		logger.debug("seems account already exists. Let do auto login");
    		autoLogin(shop,request);
    	
    	} else {
    		
    		logger.fatal("FATAL SOMETHING GOES WRONG");
    	}
    	
    	return "forward:/customer";
    }

    public boolean shopify(String queryString) {
    	try {
    		String data = URLDecoder.decode(queryString, "UTF-8");
    		Map<String, String> map = new TreeMap<String, String>();
    		StringTokenizer stringTokenizer = new StringTokenizer(data,"&");
    		while(stringTokenizer.hasMoreTokens()) {
    			String token = stringTokenizer.nextToken();
    			String [] kv = token.split("=");
    			map.put(kv[0],kv[1]);
    		}
    		map.remove("hmac");
    		Iterator<String> itrator = map.keySet().iterator();
    		String finalString = "";
    		while(itrator.hasNext()) {
    			String strKey = itrator.next();
    			String val = map.get(strKey);
    			finalString+=strKey+"="+val+"&";
    		}
    		finalString = finalString.substring(0, finalString.length()-1);
    		String newHmac = calculateRFC2104HMAC(finalString, ConstantCodes.SHOPIFY_CLIENT_SECRET);
    		logger.debug("newHmac: " + newHmac);
    	} catch(Exception exception) {
    		logger.error("Error while parsing request.", exception);
    	}
    	
		return false;
	}

    @SuppressWarnings("resource")
	private String toHexString(byte[] bytes) {
		Formatter formatter = new Formatter();
		for (byte b : bytes) {
			formatter.format("%02x", b);
		}
		return formatter.toString();
	}
    
	public String calculateRFC2104HMAC(String data, String key) throws SignatureException, NoSuchAlgorithmException, InvalidKeyException {
		SecretKeySpec signingKey = new SecretKeySpec(key.getBytes(), HMAC_SHA1_ALGORITHM);
		Mac mac = Mac.getInstance(HMAC_SHA1_ALGORITHM);
		mac.init(signingKey);
		return toHexString(mac.doFinal(data.getBytes()));
	}
	
	@RequestMapping(value = "/multichannel/login", method = RequestMethod.GET)
    public String login(@RequestParam(name="hmac") String hmac,
    					@RequestParam(name="locale") String locale,
    					@RequestParam(name="protocol") String protocol,
    					@RequestParam(name="shop") String shop, 
    					@RequestParam(name="timestamp") String timestamp) {
    	logger.debug("hmac : " + hmac);
    	logger.debug("locale : " + locale);
    	logger.debug("protocol : " + protocol);
    	logger.debug("timestamp : " + timestamp);
    	logger.debug("shop : " + shop);
    	
   
    	return "";
    }
    
	
    @RequestMapping(value = "/multichannel/load", method = RequestMethod.GET)
    public String load(@RequestParam(name="code") String code, 
    		           @RequestParam(name="hmac") String hmac, 
    		           @RequestParam(name="shop") String shop,
    		           @RequestParam(name="state") String state,
    		           @RequestParam(name="timestamp") String timestamp,
    		           HttpServletRequest request) {
    	
    	logger.debug("code : " + code);
    	logger.debug("hmac : " + hmac);
    	logger.debug("shop : " + shop);
    	logger.debug("state : " + state);
    	logger.debug("timestamp : " + timestamp);
    	
    	String authURL = "https://" + shop + "/admin/oauth/access_token";
    	logger.debug("authURL : " + authURL);
    	
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod(authURL);
	    postMethod.addParameter("client_id", ConstantCodes.SHOPIFY_CLIENT_ID);
	    postMethod.addParameter("client_secret", ConstantCodes.SHOPIFY_CLIENT_SECRET);
	    postMethod.addParameter("code", code);
	    try {
	        httpClient.executeMethod(postMethod);
	        if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
		        String resp;
					resp = postMethod.getResponseBodyAsString();
					AuthResponse authResponse = new Gson().fromJson(resp, AuthResponse.class);
					logger.debug("authResponse : "  + authResponse);
					
					List<AccountData> listAccountData = accountDataService.findByShopifyStoreUrl(shop);
					AccountData accountData = listAccountData.get(0);
					accountData.setAccountstatus("ACTIVE");
					accountData.setAccessToken(authResponse.getAccess_token());
					accountDataService.update(accountData);
					
					//registerHook(accountData,ShopifyConstantCodes.TOPIC_APP_UNINSTALLED);
					registerHook(accountData,ShopifyConstantCodes.TOPIC_PRODUCT_CREATE);
					registerHook(accountData,ShopifyConstantCodes.TOPIC_PRODUCT_DELETE);
					registerHook(accountData,ShopifyConstantCodes.TOPIC_PRODUCT_UPDATE);
					registerHook(accountData,ShopifyConstantCodes.TOPIC_ORDER_CREATE);
					registerHook(accountData,ShopifyConstantCodes.TOPIC_ORDER_UPDATED);
					registerCarrier(accountData,ShopifyConstantCodes.TOPIC_ORDER_UPDATED);
					
					
					
		    } else {
		    	logger.fatal("something goes wrong");
		    }
	    } catch (HttpException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    autoLogin(shop,request);	    
	    return "forward:/customer";
    }

	private void registerCarrier(AccountData accountData, String topicOrderUpdated) {
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
	}

	private void registerHook(AccountData accountData, String topic) {
		logger.debug("Inside registerProductDeleteWebhook for  " + accountData.getShopifyStoreUrl());
		try {
			ShopifyStore shopifyStore = new ShopifyStore(accountData.getShopifyStoreUrl(), accountData.getAccessToken());
			Webhook whCreate = new Webhook(ShopifyConstantCodes.APP_SHOPIFY_WEBHOOK_END_POINT,topic,TYPE_JSON);
			Webhooks webhookRet =  shopifyStore.getWebhookAPI().createWebhook(new Webhooks(whCreate));
			logger.debug("webhookRet : " + webhookRet);
		} catch(Throwable t) {
			logger.error("Exception while registering product delete webhook for store : " + accountData.getShopifyStoreUrl(), t);
		}
		logger.debug("Leaving registerProductDeleteWebhook for  " + accountData.getShopifyStoreUrl());
	}

	@RequestMapping(value = "/multichannel/uninstalled", method = RequestMethod.POST)
	@ResponseBody
    public ResponseEntity<String> appUninstalled(@RequestHeader(name="content-type") String contentType,
    		@RequestHeader(name="x-shopify-topic") String topic,
    		@RequestHeader(name="x-shopify-hmac-sha256") String hash,
    		@RequestHeader(name="x-shopify-shop-domain") String shop,
    		HttpEntity<String> httpEntity) {
		
		logger.debug("contentType : " + contentType);
		logger.debug("topic : " + topic);
		logger.debug("hash : " + hash);
		logger.debug("shop : " + shop);
		
		List<AccountData> listAccountData = accountDataService.findByShopifyStoreUrl(shop);
		if(!listAccountData.isEmpty()) {
			AccountData accountData = listAccountData.get(0);
			logger.debug("Removing account : " + accountData);
		}
		
		logger.debug("Uninstall processed");
		return ResponseEntity.ok("OK");
	} 
    
	private void autoLogin(String shop, HttpServletRequest request) {
		logger.debug("Working on auto login part");
		
		AccountData accountData = accountDataService.findByShopifyStoreUrl(shop).get(0);
	    UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = 
	    		new UsernamePasswordAuthenticationToken(accountData.getUsername(), accountData.getPassword(), accountData.getAuthorities());
	    
	    request.getSession();
        usernamePasswordAuthenticationToken.setDetails(new WebAuthenticationDetails(request));
	    Authentication authenticatedUser = authenticationManager.authenticate(usernamePasswordAuthenticationToken);

        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
        }

	    request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());// creates context for that session.

	}*/
}