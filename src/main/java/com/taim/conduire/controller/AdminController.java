package com.taim.conduire.controller;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.constants.ConstantCodes;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.domain.CategoryData;
import com.taim.conduire.dto.AccountDataDTO;
import com.taim.conduire.dto.aaData;
import com.taim.conduire.service.AccountDataService;
import com.taim.conduire.service.CategoryDataService;
import com.taim.datatable.CategoryDataDtRepository;

@Controller
@RequestMapping("/admin")
@Validated
public class AdminController {
	private static final Logger logger = LogManager.getLogger();
    
    @Autowired
    private AccountDataService accountDataService;
    
    @Autowired
    private CategoryDataService categoryDataService;
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private CategoryDataDtRepository categoryDataDtRepository;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String view(Model model) {

        return "admin/shopifyorder";
    }

    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public String category(Model model) {

        return "admin/category";
    }

    @RequestMapping(value = "/check-unique-name", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> checkUniqueCategoryName(@RequestParam("name") String name,@RequestParam("id") String id) {
        String resultStr = "true";
        
        CategoryData categoryData = categoryDataService.findByName(name);
        if(categoryData != null && !categoryData.getId().toString().equalsIgnoreCase(id)) {
        	resultStr = "false";
        }
        return ResponseEntity.ok(resultStr);
    }

    @RequestMapping(value = "/get-category/{query}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> getCategory(@PathVariable("query") String categoryId) {
    	logger.debug("categoryId : " + categoryId);
    	CategoryData categoryData = categoryDataService.findOne(new Integer(categoryId));
        return ResponseEntity.ok(categoryData);
    }
    
    @RequestMapping(value = "/get-category-for-datatable", method=RequestMethod.POST)
    @ResponseBody
    public DataTablesOutput<CategoryData> getCategory(@RequestBody DataTablesInput input) {
    	logger.debug("getCategory " + input);
    	  return categoryDataDtRepository.findAll(input);
    	  //return categoryDataDtRepository.findAll(input,getCategorySpecification());
    } 
    
    private Specification<CategoryData> getCategorySpecification() {
        return new Specification<CategoryData>() {
            @Override
            public javax.persistence.criteria.Predicate toPredicate(Root<CategoryData> root,
                                         CriteriaQuery<?> query,
                                         CriteriaBuilder criteriaBuilder) {
            	javax.persistence.criteria.Predicate categoryStatusPredicate = criteriaBuilder.equal(root.get("status"), ConstantCodes.ON);
                return criteriaBuilder.and(categoryStatusPredicate);
            }
        };
    }
    
    @RequestMapping(value = "/delete-category/{query}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> deleteCategory(@PathVariable("query") String categoryId) {
    	logger.debug("categoryId: " + categoryId);
    	
    	CategoryData categoryData = categoryDataService.findOne(new Integer(categoryId));
    	logger.debug("categoryData : " + categoryData);
    	
    	categoryDataService.deleteById(new Integer(categoryId));
    	
        return ResponseEntity.ok("Category deleted !!");
    }
    
    
    @RequestMapping(value = "/category-create", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> adminIndex(@RequestParam(value = "categoryid",required = false) String categoryId,
    									@RequestParam("name") String sName,
    									@RequestParam("alias") String sAlias,
    									@RequestParam("description") String sDescription,
    									@RequestParam(value = "categorystatus",required = false,defaultValue = "off") String sCategoryStatus) {
    	
    	CategoryData categoryData = null;
    	if(categoryId != null && !categoryId.isEmpty()) {
    		categoryData = categoryDataService.findOne(new Integer(categoryId));
    	}else {
    		categoryData = new CategoryData();
    	}
    	
    	categoryData.setName(sName);
    	categoryData.setAlias(sAlias);
    	categoryData.setDescription(sDescription);
    	categoryData.setStatus(sCategoryStatus);
    	categoryData.setCreateDate(new Date());
    	categoryData.setModifiedTimestamp(new Date());
    	
    	AccountData accountData = CommonHelper.getAccount();
    	accountData = accountDataService.findOne(accountData.getId());
    	
    	categoryData.setLastModifiedBy(accountData.getId());
    	categoryData = categoryDataService.create(categoryData);
    	
    	String message = "";
    	if(categoryData != null) {
    		message = "Yes";
    	}else {
    		message = "No";
    	}
    	logger.debug(message);
    	return ResponseEntity.ok(message);
    }
    
    
    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String customerPage(Model model) {

        return "admin/customer";
    }

}