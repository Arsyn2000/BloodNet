package com.taim.conduire.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.ServletContext;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.constants.ConstantCodes;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.domain.CompanyData;
import com.taim.conduire.service.AccountDataService;
import com.taim.conduire.service.CompanyDataService;
import com.taim.datatable.CompanyDataDtRepository;

@Controller
@RequestMapping("/admin/inventory/company")
@Validated
public class CompanyController {
	private static final Logger logger = LogManager.getLogger();
    
    @Autowired
    private AccountDataService accountDataService;
    
    @Autowired
    private CompanyDataService companyDataService;
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private CompanyDataDtRepository companyDataDtRepository;
    
    @Autowired
    ServletContext servletContext;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String distributor(Model model) {
    	AccountData accountData = CommonHelper.getAccount();
    	model.addAttribute("accountData", accountData);
    	model.addAttribute("companyData", new CompanyData()); 
        return "admin/company";
    }
    
    @RequestMapping(value = "/check-unique-company-name", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<String> checkUniqueDistributorName(@RequestParam("name") String name,
    														 @RequestParam("id") String id) {
        String resultStr = "true";
        CompanyData companyData = companyDataService.findByName(name);
        if(companyData != null && !companyData.getId().toString().equalsIgnoreCase(id)) {
        	resultStr = "false";
        }
        return ResponseEntity.ok(resultStr);
    }

    @RequestMapping(value = "/load-company", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<List<CompanyData>> loadCompany() {
    	List<CompanyData> listCompanyData = companyDataService.findAll();
    	logger.debug(listCompanyData);
        return ResponseEntity.ok(listCompanyData);
    }
    
    @RequestMapping(value = "/get-company/{query}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<?> getCompany(@PathVariable("query") String companyId) {
    	logger.debug("companyId : " + companyId);
    	CompanyData companyData = companyDataService.findOne(new Integer(companyId));
        return ResponseEntity.ok(companyData);
    }
    
    @RequestMapping(value = "/get-company-for-datatable", method=RequestMethod.POST)
    @ResponseBody
    public DataTablesOutput<CompanyData> getCompanyForDatatable(@RequestBody DataTablesInput input) {
    	logger.debug("getCompanyForDatatable " + input);
    	  return companyDataDtRepository.findAll(input);
    	  //return categoryDataDtRepository.findAll(input,getCategorySpecification());
    } 
    
    @SuppressWarnings("unused")
	private Specification<CompanyData> getCompanySpecification() {
        return new Specification<CompanyData>() {
            @Override
            public javax.persistence.criteria.Predicate toPredicate(Root<CompanyData> root,
                                         CriteriaQuery<?> query,
                                         CriteriaBuilder criteriaBuilder) {
            	javax.persistence.criteria.Predicate companyStatusPredicate = criteriaBuilder.equal(root.get("status"), ConstantCodes.ON);
                return criteriaBuilder.and(companyStatusPredicate);
            }
        };
    }
    
    @RequestMapping(value = "/delete-company/{query}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseEntity<?> deleteCompany(@PathVariable("query") String companyId) {
    	logger.debug("companyId: " + companyId);
    	CompanyData companyData = companyDataService.findOne(new Integer(companyId));
    	logger.debug("companyData : " + companyData);
    	companyDataService.deleteById(new Integer(companyId));
        return ResponseEntity.ok("Distributor deleted !!");
    }
    
    
    @RequestMapping(value = "/company-create", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> companyCreate( @RequestParam(value = "companyid",required = false) String companyId,
											@RequestParam("name") String sName,
											@RequestParam("alias") String sAlias,
											@RequestParam("description") String sDescription,
											@RequestParam("url") String sUrl,
											@RequestParam("email") String sEmail,
											@RequestParam("phone") String sPhone,
											@RequestParam("fax") String sFax,
											@RequestParam("logo-file") MultipartFile file,
											@RequestParam("address") String sAddress,
											@RequestParam("discount") String sDiscount,
											@RequestParam(value = "status",required = false,defaultValue = "off") String sStatus) {
    	AccountData accountData = CommonHelper.getAccount();
    	accountData = accountDataService.findOne(accountData.getId());
    	
    	logger.debug("companyId : " + companyId);
    	logger.debug("name : " + sName);
    	logger.debug("alias : " + sAlias);
    	logger.debug("sDescription : " + sDescription);
    	logger.debug("sUrl : " + sUrl);
    	logger.debug("sEmail : " + sEmail);
    	logger.debug("sPhone : " + sPhone);
    	logger.debug("sFax : " + sFax);
    	logger.debug("sLogoFile : " + file.getOriginalFilename());
    	logger.debug("sAddress : " + sAddress);
    	logger.debug("sDiscount : " + sDiscount);
    	logger.debug("sStatus : " + sStatus);
    	
    	try {
    		String fileName = file.getOriginalFilename();
    		String extension = fileName.substring(fileName.lastIndexOf("."));
    		logger.debug("File Location :: " + "./upload/" + sName.replaceAll(" ", "-") + "-logo" + extension);
			FileCopyUtils.copy(file.getBytes(),new File("./upload/" + sName.replaceAll(" ", "-") + "-logo" + extension));
		} catch (IOException e) {
			logger.error("Error uploading image : " + e.getMessage(),e);
		}
    	return ResponseEntity.ok("Yes");
    	
    }

}