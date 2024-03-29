package com.taim.conduire.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
import com.taim.conduire.service.AccountDataService;
import com.taim.conduire.service.CategoryDataService;
import com.taim.conduire.service.DistributorDataService;
import com.taim.conduire.service.SubCategoryDataService;
import com.taim.datatable.CategoryDataDtRepository;
import com.taim.datatable.CategorySubCategoryViewDataDtRepository;
import com.taim.datatable.DistributorDataDtRepository;

@Controller
@RequestMapping("/admin/inventory/category")
@Validated
public class CategoryController {
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
    	AccountData accountData = CommonHelper.getAccount();
    	model.addAttribute("accountData", accountData);
        return "admin/category";
    }

    @RequestMapping(value = "/check-unique-category-name", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> checkUniqueCategoryName(@RequestParam("name") String name,@RequestParam("id") String id) {
        String resultStr = "true";
        
        CategoryData categoryData = categoryDataService.findByName(name);
        if(categoryData != null && !categoryData.getId().toString().equalsIgnoreCase(id)) {
        	resultStr = "false";
        }
        return ResponseEntity.ok(resultStr);
    }

    @RequestMapping(value = "/load-category", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<List<CategoryData>> loadCategory() {
    	HashMap<String, String> category = new HashMap<String,String>();
    	List<CategoryData> listCategoryData = categoryDataService.findAll();
    	logger.debug(listCategoryData);
    	/*for(CategoryData categoryData : listCategoryData) {
    		logger.debug(categoryData);
    		category.put(""+categoryData.getId(), categoryData.getName());
    	}
    	logger.debug(category);*/
        return ResponseEntity.ok(listCategoryData);
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
    public ResponseEntity<?> categoryCreate(@RequestParam(value = "categoryid",required = false) String categoryId,
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
}