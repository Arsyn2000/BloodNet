package com.taim.conduire.controller;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.domain.TestData;
import com.taim.conduire.service.TestDataService;

@Controller
@RequestMapping("/test")
@Validated
public class TestController {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private TestDataService testDataService;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ResponseEntity<String> view(Model model) {
    	//AccountData accountData = CommonHelper.getAccount();
    	//model.addAttribute("accountData", accountData);
    	logger.debug("This is a test log");
        return ResponseEntity.ok("Hello World. This is a reply from /test endpoint");
    }

    @RequestMapping(value = "/create-user", method=RequestMethod.POST)
    public ResponseEntity<?> createUser(@RequestParam(value = "testid",required = false) String testId,
										@RequestParam("full_name") String sFullName,
										@RequestParam("age") Integer iAge,
										@RequestParam("email_address") String sEmailAddress){
    	
    	logger.debug("Inside createUser");
    	
    	logger.debug("sFullName " + sFullName);
    	logger.debug("iAge " + iAge);
    	logger.debug("sEmailAddress " + sEmailAddress);
    	
    	TestData testData = new TestData();
    	testData.setFullName(sFullName);
    	testData.setEmailAddress(sEmailAddress);
    	testData.setAge(iAge);
    	testData.setCreatedAt(new Date());
    	
    	testData = testDataService.create(testData);
    	
    	logger.debug("testData : " + testData);
    	logger.debug("Leaving createUser");
    	return ResponseEntity.ok("New user created. User Id : " + testData.getId());
    }
    
    @RequestMapping(value = "/find-user", method=RequestMethod.GET)
    public ResponseEntity<?> findUser(@RequestParam("email") String sEmail){
    	
    	logger.debug("Inside findUser");
    	
    	logger.debug("sEmail " + sEmail);
    	
    	List<TestData> listTestData = testDataService.findByEmailAddress(sEmail);
    	
    	TestData testData = null;
    	if(!listTestData.isEmpty()) {
    		testData = listTestData.get(0);
    	}
    	logger.debug("Leaving findUser");
    	return ResponseEntity.ok(testData);
    }
    
    @RequestMapping(value = "/find-all-user", method=RequestMethod.GET)
    public ResponseEntity<?> findAllUser(){
    	logger.debug("Inside findAllUser");
    	
    	List<TestData> listTestData = testDataService.findAll();
    	logger.debug("listTestData " + listTestData.size());
    	logger.debug("Leaving findAllUser");
    	return ResponseEntity.ok(listTestData);
    }
    
    
    
}