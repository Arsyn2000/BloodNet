package com.taim.conduire.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.taim.conduire.domain.ClientNotificationData;
import com.taim.conduire.domain.HospitalData;
import com.taim.conduire.domain.HospitalNotificationData;
import com.taim.conduire.service.AdminNotificationDataService;
import com.taim.conduire.service.ClientDataService;
import com.taim.conduire.service.ClientNotificationDataService;
import com.taim.conduire.service.HospitalDataService;
import com.taim.conduire.service.HospitalNotificationDataService;

@Controller
@RequestMapping("/client-notification")
@Validated
public class ClientNotificationController {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private ClientNotificationDataService clientNotificationDataService;
    @Autowired
    private ClientDataService clientDataService;
    @Autowired
    private HospitalDataService hospitalDataService;
    
    
    @RequestMapping(value = "/view-client-notifications", method = RequestMethod.GET)
    public String viewClientNotifications(@RequestParam(value = "email",required = true) String sEmail,
    								 Model model
    									){
    	
    	logger.debug("Inside viewClientNotifications");
    	logger.debug("sEmail " + sEmail);
    	
    	List<ClientNotificationData> listClientNotificationData = clientNotificationDataService.findByReceiver(sEmail);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    		
        logger.debug("Leaving viewClientNotifications");
        model.addAttribute("listClientNotificationData", listClientNotificationData);
        model.addAttribute("fname", listClientData.get(0).getFirstName());
        model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("email", sEmail);
        return "bloodnet/viewclientnotifications";
        
    }
    
    @RequestMapping(value = "/view-particular-client-notification", method = RequestMethod.GET)
    public String viewParticularClientNotification(@RequestParam(value = "email",required = true) String sEmail,
    										@RequestParam(value = "not_id",required = true) String sNotId,
    								 Model model
    									){
    	
    	logger.debug("Inside viewParticularClientNotification");
    	logger.debug("sEmail " + sEmail);
    	logger.debug("sNotId " + sNotId);
    	
    	int iNotId=Integer.parseInt(sNotId);  
    	logger.debug("iNotId " + iNotId);
    	List<ClientNotificationData> listClientNotificationData = clientNotificationDataService.findByCnotificationId(iNotId);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    		
        logger.debug("Leaving viewParticularClientNotification");
        model.addAttribute("listClientNotificationData", listClientNotificationData);
        model.addAttribute("fname", listClientData.get(0).getFirstName());
        model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("email", sEmail);
		model.addAttribute("data", listClientNotificationData.get(0).getData());
        return "bloodnet/viewparticularclientnotification";
        
    }
    
    @RequestMapping(value = "/blood-donation-notification", method = RequestMethod.GET)
    public String bloodDonationNotification(@RequestParam(value = "email",required = true) String sEmail,
											@RequestParam(value = "type",required = false) String stype,
										    Model model){
    	logger.debug("Inside bloodDonationNotification");
    	logger.debug("sEmail " + sEmail);
    	/*logger.debug("sA " + sA);
    	logger.debug("sB " + sB);
    	logger.debug("sAB " + sAB);
    	logger.debug("sO " + sO);*/
    	logger.debug("stype " + stype);
    	
    	String array1[]= stype.split(",");
    	for(String str :array1) {
    		logger.debug(str);
    	}
    	List<String> str = new ArrayList<String>();
    	str = Arrays.asList(array1);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	List<ClientData> listClientData = clientDataService.findByArea(listHospitalData.get(0).getArea());
    	
    	Date date = new Date();  
    	DateFormat outputFormatter = new SimpleDateFormat("dd/MM/yyyy");
    	String output = outputFormatter.format(date);
    	logger.debug(output);
    	
    	SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
    	String sTime = localDateFormat.format(date);
    	logger.debug(sTime);
    	logger.debug(str);
    	for(ClientData clientData:listClientData) {
    		logger.debug("Inside for loop");
    		logger.debug(clientData.getBloodGroup().toLowerCase());
    		if(str.contains(clientData.getBloodGroup().toLowerCase())) {
    			logger.debug("Inside first if");
    			if(clientData.getStatus().equals("active")) {
    				logger.debug("Inside if block for checking if the client is active or not");
        			ClientNotificationData clientNotificationData = new ClientNotificationData();
                	clientNotificationData.setReceiver(clientData.getEmailId());
                	clientNotificationData.setSender(sEmail);
                	clientNotificationData.setData("Blood of Type "+clientData.getBloodGroup()+" required at hospital "+listHospitalData.get(0).getName());
                	clientNotificationData.setType("not");
                	clientNotificationData.setStatus(1);
                	clientNotificationData.setCreationDate(output);
                	clientNotificationData.setCreationTime(sTime);
                	clientNotificationData = clientNotificationDataService.create(clientNotificationData);
        		}
    			else {
    				logger.debug("Else block of active if");
    			}
    		}
    		else {
    			logger.debug("Else block of first if");
    		}
    	}
    	
    	logger.debug("Leaving bloodDonationNotification");
    	model.addAttribute("email", sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
    	return "bloodnet/hospitalneedblood";
    	
    }

}