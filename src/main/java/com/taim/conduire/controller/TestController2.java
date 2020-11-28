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

import com.taim.conduire.domain.TestData2;
import com.taim.conduire.service.TestDataService2;

@Controller
@RequestMapping("/test2")
@Validated
public class TestController2 {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private TestDataService2 testDataService2;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ResponseEntity<String> view(Model model) {
    	//String because string is returned
    	logger.debug("This is a test log");
        return ResponseEntity.ok("Hello World. This is a reply from /test2 endpoint");
    }
    

    //create is post
    //select * is get
    @RequestMapping(value = "/create-user", method = RequestMethod.POST)
    public ResponseEntity<?> createUser(@RequestParam(value = "testid",required = false) String testId,
    									@RequestParam(value = "full_name") String sFullName,
    									@RequestParam(value = "age") Integer iAge,
    									@RequestParam(value = "email_address") String sEmailAddress){
    	
    	logger.debug("Inside createUser");
    	logger.debug("sFullName " + sFullName);
    	logger.debug("iAge " + iAge);
    	logger.debug("sEmailAddress " + sEmailAddress);
    	
    	TestData2 testData2 = new TestData2();
    	testData2.setFullName(sFullName);
    	testData2.setEmailAddress(sEmailAddress);
    	testData2.setAge(iAge);
    	testData2.setCreatedAt(new Date());
    	
    	String msg;
    	List<TestData2> listTestData2 = testDataService2.findByEmailAddress(sEmailAddress);
    	if(listTestData2.size()==0) {
    		testData2 = testDataService2.create(testData2);//?
    		msg="New user created. User Id : " + testData2.getId();
    	}else {
    		msg="User already exists";
    	}
    		
    	
    	logger.debug(msg);
    	logger.debug("Leaving createUser");
    	return ResponseEntity.ok(msg);
    }
    
    @RequestMapping(value = "/find-user", method = RequestMethod.GET)
    public ResponseEntity<?> findUser(@RequestParam("email") String sEmail){
    	logger.debug("Inside findUser");
    	logger.debug("sEmail " + sEmail);
    	
    	List<TestData2> listTestData2 = testDataService2.findByEmailAddress(sEmail);//why not impl?
    	TestData2 testData2 = null;
    	if(!listTestData2.isEmpty()) {
    		testData2 = listTestData2.get(0);
    	}
    	logger.debug("Leaving findUser");
    	return ResponseEntity.ok(testData2);
    }
    
    @RequestMapping(value = "/find-all-user", method=RequestMethod.GET)
    public ResponseEntity<?> findAllUser(){
    	logger.debug("Inside findAllUser");
    	
    	List<TestData2> listTestData2 = testDataService2.findAll();
    	logger.debug("listTestData2 " + listTestData2.size());
    	logger.debug("Leaving findAllUser");
    	return ResponseEntity.ok(listTestData2);
    }
}