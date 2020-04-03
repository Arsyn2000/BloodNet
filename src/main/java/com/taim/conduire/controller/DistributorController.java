package com.taim.conduire.controller;

import java.util.Date;
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
import com.taim.conduire.domain.DistributorData;
import com.taim.conduire.service.AccountDataService;
import com.taim.conduire.service.DistributorDataService;
import com.taim.datatable.DistributorDataDtRepository;

@Controller
@RequestMapping("/admin/inventory/distributor")
@Validated
public class DistributorController {
	private static final Logger logger = LogManager.getLogger();
    
    @Autowired
    private AccountDataService accountDataService;
    
    @Autowired
    private DistributorDataService distributorDataService;
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private DistributorDataDtRepository distributorDataDtRepository;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String distributor(Model model) {
    	AccountData accountData = CommonHelper.getAccount();
    	model.addAttribute("accountData", accountData);
        return "admin/distributor";
    }
    
    @RequestMapping(value = "/check-unique-distributor-name", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> checkUniqueDistributorName(@RequestParam("name") String name,@RequestParam("id") String id,@RequestParam("gstin") String gstin) {
        String resultStr = "true";
        
        DistributorData distributorData = distributorDataService.findByName(name);
        if(distributorData != null && !distributorData.getId().toString().equalsIgnoreCase(id) && !distributorData.getGstin().equalsIgnoreCase(gstin)) {
        	resultStr = "false";
        }
        return ResponseEntity.ok(resultStr);
    }

    @RequestMapping(value = "/load-distributor", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<List<DistributorData>> loadDistributor() {
    	List<DistributorData> listDistributorData = distributorDataService.findAll();
    	logger.debug(listDistributorData);
        return ResponseEntity.ok(listDistributorData);
    }
    
    @RequestMapping(value = "/get-distributor/{query}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> getDistributor(@PathVariable("query") String categoryId) {
    	logger.debug("categoryId : " + categoryId);
    	DistributorData distributorData = distributorDataService.findOne(new Integer(categoryId));
        return ResponseEntity.ok(distributorData);
    }
    
    @RequestMapping(value = "/get-distributor-for-datatable", method=RequestMethod.POST)
    @ResponseBody
    public DataTablesOutput<DistributorData> getDistributor(@RequestBody DataTablesInput input) {
    	logger.debug("getDistributor " + input);
    	  return distributorDataDtRepository.findAll(input);
    	  //return categoryDataDtRepository.findAll(input,getCategorySpecification());
    } 
    
    private Specification<DistributorData> getDistributorSpecification() {
        return new Specification<DistributorData>() {
            @Override
            public javax.persistence.criteria.Predicate toPredicate(Root<DistributorData> root,
                                         CriteriaQuery<?> query,
                                         CriteriaBuilder criteriaBuilder) {
            	javax.persistence.criteria.Predicate distributorStatusPredicate = criteriaBuilder.equal(root.get("status"), ConstantCodes.ON);
                return criteriaBuilder.and(distributorStatusPredicate);
            }
        };
    }
    
    @RequestMapping(value = "/delete-distributor/{query}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> deleteDistributor(@PathVariable("query") String distributorId) {
    	logger.debug("distributorId: " + distributorId);
    	
    	DistributorData distributorData = distributorDataService.findOne(new Integer(distributorId));
    	logger.debug("distributorData : " + distributorData);
    	
    	distributorDataService.deleteById(new Integer(distributorId));
    	
        return ResponseEntity.ok("Distributor deleted !!");
    }
    
    
    @RequestMapping(value = "/distributor-create", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> distributorCreate(@RequestParam(value = "distributorid",required = false) String distributorId,
    									@RequestParam("name") String sName,
    									@RequestParam("alias") String sAlias,
    									@RequestParam("address") String sAddress,
    									@RequestParam("gstin") String sGstin,
    									@RequestParam("contact-person") String sContactPerson,
    									@RequestParam("phone1") String sPhone1,
    									@RequestParam("phone2") String sPhone2,
    									@RequestParam("email") String sEmail,
    									@RequestParam("website") String sWebsite,
    									@RequestParam(value = "distributorstatus",required = false,defaultValue = "off") String sDistributorStatus) {
    	
    	DistributorData distributorData = null;
    	if(distributorId != null && !distributorId.isEmpty()) {
    		distributorData = distributorDataService.findOne(new Integer(distributorId));
    	}else {
    		distributorData = new DistributorData();
    	}
    	
    	distributorData.setAddress(sAddress);
    	distributorData.setAlias(sAlias);
    	distributorData.setContactPerson(sContactPerson);
    	distributorData.setCreateDate(new Date());
    	distributorData.setEmail(sEmail);
    	distributorData.setGstin(sGstin);
    	distributorData.setModifiedTimestamp(new Date());
    	distributorData.setName(sName);
    	distributorData.setPhone1(sPhone1);
    	distributorData.setPhone2(sPhone2);
    	distributorData.setStatus(sDistributorStatus);
    	distributorData.setWebsite(sWebsite);
    	
    	AccountData accountData = CommonHelper.getAccount();
    	accountData = accountDataService.findOne(accountData.getId());
    	
    	distributorData.setLastModifiedBy(accountData.getId());
    	distributorData = distributorDataService.create(distributorData);
    	
    	String message = "";
    	if(distributorData != null) {
    		message = "Yes";
    	}else {
    		message = "No";
    	}
    	logger.debug(message);
    	return ResponseEntity.ok(message);
    }

}