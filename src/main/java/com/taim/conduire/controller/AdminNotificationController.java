package com.taim.conduire.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

import com.taim.conduire.domain.AdminNotificationData;
import com.taim.conduire.domain.ClientData;
import com.taim.conduire.domain.HospitalData;
import com.taim.conduire.service.AdminNotificationDataService;
import com.taim.conduire.service.ClientDataService;
import com.taim.conduire.service.HospitalDataService;

@Controller
@RequestMapping("/adminnotification")
@Validated
public class AdminNotificationController {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private AdminNotificationDataService adminNotificationDataService;
    @Autowired
    private HospitalDataService hospitalDataService;
    @Autowired
    private ClientDataService clientDataService;
    
    
    @RequestMapping(value = "/scarcity-notification", method = RequestMethod.GET)
    public String createNotification(@RequestParam(value = "notification_data",required = true) String sNotificationData,
    								 @RequestParam(value = "type",required = true) String sType,
    								 @RequestParam(value = "sender",required = true) String sSender,
    								 Model model
    									){
    	
    	logger.debug("Inside createNotification");
    	logger.debug("sNotificationData " + sNotificationData);
    	logger.debug("sType " + sType);
    	logger.debug("sSender " + sSender);
    	
    	Date date = new Date();  
    	DateFormat outputFormatter = new SimpleDateFormat("dd/MM/yyyy");
    	String output = outputFormatter.format(date);
    	logger.debug(output);
    	
    	SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
    	String sTime = localDateFormat.format(date);
    	//long time = date.getTime();
    	//String sTime = Long.toString(time);
    	logger.debug(sTime);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sSender);
    	List<AdminNotificationData> listAdminNotificationData = adminNotificationDataService.findBySender(sSender);
    	logger.debug(listAdminNotificationData);
    	if(!listAdminNotificationData.isEmpty() && listAdminNotificationData.get(0).getType().equals("not")) {
    		if(listAdminNotificationData.get(0).getStatusAdmin()==0) {
        		AdminNotificationData adminNotificationData = new AdminNotificationData();
            	adminNotificationData.setNotificationData(sNotificationData);
            	adminNotificationData.setCreationDate(output);
            	adminNotificationData.setType(sType);
            	adminNotificationData.setStatusAdmin(1);
            	adminNotificationData.setCreationTime(sTime);
            	adminNotificationData.setSender(sSender);
            	adminNotificationData = adminNotificationDataService.create(adminNotificationData);
        	}
    		else {
    			//Do nothing
    		}
    	}
    	else {
    		AdminNotificationData adminNotificationData = new AdminNotificationData();
        	adminNotificationData.setNotificationData(sNotificationData);
        	adminNotificationData.setCreationDate(output);
        	adminNotificationData.setType(sType);
        	adminNotificationData.setStatusAdmin(1);
        	adminNotificationData.setCreationTime(sTime);
        	adminNotificationData.setSender(sSender);
        	adminNotificationData = adminNotificationDataService.create(adminNotificationData);
    	}
    	
        logger.debug("Leaving createNotification");
        model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sSender);
        return "bloodnet/hospitalhome";
        
    }
    
    @RequestMapping(value = "/contact-us-notification", method = RequestMethod.GET)
    public String createContactUsNotification(@RequestParam(value = "notification_data",required = true) String sNotificationData,
    								 @RequestParam(value = "sender",required = true) String sSender,
    								 Model model
    									){
    	
    	logger.debug("Inside createContactUsNotification");
    	logger.debug("sNotificationData " + sNotificationData);
    	//logger.debug("sType " + sType);
    	logger.debug("sSender " + sSender);
    	
    	Date date = new Date();  
    	DateFormat outputFormatter = new SimpleDateFormat("dd/MM/yyyy");
    	String output = outputFormatter.format(date);
    	logger.debug(output);
    	
    	SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
    	String sTime = localDateFormat.format(date);
    	//long time = date.getTime();
    	//String sTime = Long.toString(time);
    	logger.debug(sTime);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sSender);
    	//List<AdminNotificationData> listAdminNotificationData = adminNotificationDataService.findBySender(sSender);
    	//if(!listAdminNotificationData.isEmpty()) {
    		//if(listAdminNotificationData.get(0).getStatusAdmin1()==0 && listAdminNotificationData.get(0).getStatusAdmin2()==0) {
        		AdminNotificationData adminNotificationData = new AdminNotificationData();
            	adminNotificationData.setNotificationData(sNotificationData);
            	adminNotificationData.setCreationDate(output);
            	adminNotificationData.setType("faq-not");
            	adminNotificationData.setStatusAdmin(1);
            	adminNotificationData.setCreationTime(sTime);
            	adminNotificationData.setSender(sSender);
            	adminNotificationData = adminNotificationDataService.create(adminNotificationData);
        	//}
    	//}
    	/*else {
    		AdminNotificationData adminNotificationData = new AdminNotificationData();
        	adminNotificationData.setNotificationData(sNotificationData);
        	adminNotificationData.setCreationDate(output);
        	adminNotificationData.setType(sType);
        	adminNotificationData.setStatusAdmin1(1);
        	adminNotificationData.setStatusAdmin2(1);
        	adminNotificationData.setCreationTime(sTime);
        	adminNotificationData.setSender(sSender);
        	adminNotificationData = adminNotificationDataService.create(adminNotificationData);
    	}*/
    	
            	
        logger.debug("Leaving createContactUsNotification");
        model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sSender);
        return "bloodnet/hospitalcontactus";
        
    }
    
    @RequestMapping(value = "/client-contact-us-notification", method = RequestMethod.GET)
    public String clientCreateContactUsNotification(@RequestParam(value = "notification_data",required = true) String sNotificationData,
    								 @RequestParam(value = "sender",required = true) String sSender,
    								 Model model
    									){
    	
    	logger.debug("Inside clientCreateContactUsNotification");
    	logger.debug("sNotificationData " + sNotificationData);
    	logger.debug("sSender " + sSender);
    	
    	Date date = new Date();  
    	DateFormat outputFormatter = new SimpleDateFormat("dd/MM/yyyy");
    	String output = outputFormatter.format(date);
    	logger.debug(output);
    	
    	SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
    	String sTime = localDateFormat.format(date);
    	logger.debug(sTime);
    	
    	List<ClientData> listClientData = clientDataService.findByEmailId(sSender);
    	AdminNotificationData adminNotificationData = new AdminNotificationData();
       	adminNotificationData.setNotificationData(sNotificationData);
      	adminNotificationData.setCreationDate(output);
      	adminNotificationData.setType("faq-not");
      	adminNotificationData.setStatusAdmin(1);
      	adminNotificationData.setCreationTime(sTime);
      	adminNotificationData.setSender(sSender);
      	adminNotificationData = adminNotificationDataService.create(adminNotificationData);
            	
        logger.debug("Leaving clientCreateContactUsNotification");
        model.addAttribute("name", listClientData.get(0).getFirstName());
        model.addAttribute("name", listClientData.get(0).getLastName());
		model.addAttribute("email", sSender);
        return "bloodnet/clientcontactus";
        
    }
}