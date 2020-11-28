package com.taim.conduire.controller;

import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

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

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.domain.FaqData;
import com.taim.conduire.service.FaqDataService;

@Controller
@RequestMapping("/faq")
@Validated
public class FaqController {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private FaqDataService faqDataService;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String view(Model model) {
    	//String because string is returned
    	AccountData accountData = CommonHelper.getAccount();
    	model.addAttribute("accountData", accountData);
    	logger.debug("This is a test log");
    	return "faq/index";
    }
    

    //create is post
    //select * is get
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> createFaq(@RequestParam(value = "question") String sQuestion,
    									@RequestParam(value = "answer") String sAnswer){
    	
    	logger.debug("Inside createFaq");
    	logger.debug("sQuestion " + sQuestion);
    	logger.debug("sAnswer " + sAnswer);
    	
    	
    	FaqData faqData = new FaqData();
    	faqData.setQuestion(sQuestion);
    	faqData.setAnswer(sAnswer);
    	faqData.setCreateDate(new Date());
    	faqData.setStatus("New");
    	//faqData.setLastModifiedBy(iLastModifiedBy);
    	faqData.setModifiedTimestamp(new Date());
    	
    	String message;
    	//List<FaqData> listFaqData = faqDataService.findByEmailAddress(sEmailAddress);
    	//if(listTestData2.size()==0) {
    		faqData = faqDataService.create(faqData);//?
    		message="New faq created. Faq Id : " + faqData.getId();
    	/*}else {
    		msg="User already exists";
    	}*/
    		
    	
    	logger.debug(message);
    	logger.debug("Leaving createFaq");
    	return ResponseEntity.ok(message);
    }
    
    //Path Variable
    @RequestMapping(value = "/status/{status}", method = RequestMethod.GET)
    public ResponseEntity<?> findFaq(@PathVariable("status") String sStatus){
    	logger.debug("Inside findFaq");
    	logger.debug("sStatus " + sStatus);
    	
    	List<FaqData> listFaqData = faqDataService.findByStatus(sStatus);//why not impl?
    	FaqData faqData = null;
    	if(!listFaqData.isEmpty()) {
    		faqData = listFaqData.get(0);//? why 0
    	}
    	logger.debug("Leaving findFaq");
    	return ResponseEntity.ok(listFaqData);
    }
    
    @RequestMapping(value = "/find-all-faq", method=RequestMethod.GET)
    public ResponseEntity<?> findAllFaq(){
    	logger.debug("Inside findAllFaq");
    	
    	List<FaqData> listFaqData = faqDataService.findAll();
    	logger.debug("listFaqData " + listFaqData.size());
    	logger.debug("Leaving findAllFaq");
    	return ResponseEntity.ok(listFaqData);
    }
    
    @RequestMapping(method=RequestMethod.DELETE)
    public ResponseEntity<?> faqDelete(@RequestParam("id") Integer id){
    	logger.debug("Inside faqDelete");
    	
    	faqDataService.deleteById(id);
    	//logger.debug("listFaqData " + listFaqData.size());
    	logger.debug("Leaving faqDelete");
    	return ResponseEntity.ok(id+" deleted");
    }
    
    @RequestMapping(method=RequestMethod.PATCH)
    public ResponseEntity<?> faqUpdate(@RequestParam("id") Integer id,
    								   @RequestParam(value = "question") String sQuestion,
									   @RequestParam(value = "answer") String sAnswer,
									   @RequestParam(value = "status") String sStatus){
    	logger.debug("Inside faqUpdate");
    	
    	logger.debug(id);
    	logger.debug(sQuestion);
    	logger.debug(sAnswer);
    	logger.debug(sStatus);
    	
    	FaqData faqData = faqDataService.findOne(id);
    	
    	if(!sQuestion.isEmpty()) {
    		faqData.setQuestion(sQuestion);
    	}
    	if(!sAnswer.isEmpty()) {
    		faqData.setAnswer(sAnswer);
    	}
    	if(!sStatus.isEmpty()) {
    		faqData.setStatus(sStatus);
    	}
    	faqDataService.update(faqData);
    	logger.debug("Leaving faqUpdate");
    	
    	return ResponseEntity.ok(id+" updated");
    }
    //GET is to read/retrive
    //POST is to create new user
    //PUT is to update an existing user. It is used to set an entity’s information completely.
    //PUT overwrites the entire entity if it already exists, and creates a new resource if it doesn’t exist.
    //PATCH is similar to put.
    //This means that you are only required to send the data that you want to update, and it won’t affect or change anything else. 
    //DELETE is used to delete a user
}