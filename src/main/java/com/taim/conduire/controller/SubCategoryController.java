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
import com.taim.conduire.domain.CategorySubCategoryViewData;
import com.taim.conduire.domain.SubCategoryData;
import com.taim.conduire.service.AccountDataService;
import com.taim.conduire.service.CategoryDataService;
import com.taim.conduire.service.DistributorDataService;
import com.taim.conduire.service.SubCategoryDataService;
import com.taim.datatable.CategoryDataDtRepository;
import com.taim.datatable.CategorySubCategoryViewDataDtRepository;
import com.taim.datatable.DistributorDataDtRepository;

@Controller
@RequestMapping("/admin/inventory/subcategory")
@Validated
public class SubCategoryController {
	private static final Logger logger = LogManager.getLogger();
	@Autowired
    private AccountDataService accountDataService;
    
    @Autowired
    private SubCategoryDataService subCategoryDataService;
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private CategorySubCategoryViewDataDtRepository categorySubCategoryViewDataDtRepository;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String view(Model model) {
    	AccountData accountData = CommonHelper.getAccount();
    	model.addAttribute("accountData", accountData);
        return "admin/subcategory";
    }

    @RequestMapping(value = "/check-unique-subcategory-name", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> checkUniqueSubCategoryName(@RequestParam("name") String name,@RequestParam("id") String id) {
        String resultStr = "true";
        
        SubCategoryData subCategoryData = subCategoryDataService.findByName(name);
        if(subCategoryData != null && !subCategoryData.getId().toString().equalsIgnoreCase(id)) {
        	resultStr = "false";
        }
        return ResponseEntity.ok(resultStr);
    }

    @RequestMapping(value = "/get-subcategory/{query}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> getSubCategory(@PathVariable("query") String subCategoryId) {
    	logger.debug("subCategoryId : " + subCategoryId);
    	SubCategoryData subCategoryData = subCategoryDataService.findOne(new Integer(subCategoryId));
        return ResponseEntity.ok(subCategoryData);
    }
    
    @RequestMapping(value = "/get-subcategory-for-datatable", method=RequestMethod.POST)
    @ResponseBody
    public DataTablesOutput<CategorySubCategoryViewData> getSubCategory(@RequestBody DataTablesInput input) {
    	logger.debug("getSubCategory " + input);
    	  return categorySubCategoryViewDataDtRepository.findAll(input);
    	  //return subCategoryDataDtRepository.findAll(input,getSubCategorySpecification());
    } 
    
    private Specification<CategorySubCategoryViewData> getSubCategorySpecification() {
        return new Specification<CategorySubCategoryViewData>() {
            @Override
            public javax.persistence.criteria.Predicate toPredicate(Root<CategorySubCategoryViewData> root,
                                         CriteriaQuery<?> query,
                                         CriteriaBuilder criteriaBuilder) {
            	javax.persistence.criteria.Predicate categoryStatusPredicate = criteriaBuilder.equal(root.get("status"), ConstantCodes.ON);
                return criteriaBuilder.and(categoryStatusPredicate);
            }
        };
    }
    
    @RequestMapping(value = "/delete-subcategory/{query}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> deleteSubCategory(@PathVariable("query") String subCategoryId) {
    	logger.debug("subCategoryId: " + subCategoryId);
    	
    	SubCategoryData subCategoryData = subCategoryDataService.findOne(new Integer(subCategoryId));
    	logger.debug("subCategoryData : " + subCategoryData);
    	
    	subCategoryDataService.deleteById(new Integer(subCategoryId));
    	
        return ResponseEntity.ok("SubCategory deleted !!");
    }
    
    
    @RequestMapping(value = "/subcategory-create", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> subCategoryCreate(@RequestParam(value = "subcategoryid",required = false) String subCategoryId,
    									@RequestParam("categoryname") String categoryId,
    									@RequestParam("name") String sName,
    									@RequestParam("alias") String sAlias,
    									@RequestParam("description") String sDescription,
    									@RequestParam(value = "subcategorystatus",required = false,defaultValue = "off") String sSubCategoryStatus) {
    	
    	SubCategoryData subCategoryData = null;
    	logger.debug("subCategoryId : " + subCategoryId);
    	if(subCategoryId != null && !subCategoryId.isEmpty()) {
    		subCategoryData = subCategoryDataService.findOne(new Integer(subCategoryId));
    	}else {
    		subCategoryData = new SubCategoryData();
    	}
    	
    	subCategoryData.setCategoryId(new Integer(categoryId));
    	subCategoryData.setName(sName);
    	subCategoryData.setAlias(sAlias);
    	subCategoryData.setDescription(sDescription);
    	subCategoryData.setStatus(sSubCategoryStatus);
    	subCategoryData.setCreateDate(new Date());
    	subCategoryData.setModifiedTimestamp(new Date());
    	
    	AccountData accountData = CommonHelper.getAccount();
    	accountData = accountDataService.findOne(accountData.getId());
    	
    	subCategoryData.setLastModifiedBy(accountData.getId());
    	subCategoryData = subCategoryDataService.create(subCategoryData);
    	
    	String message = "";
    	if(subCategoryData != null) {
    		message = "Yes";
    	}else {
    		message = "No";
    	}
    	logger.debug(message);
    	return ResponseEntity.ok(message);
    }

    
}