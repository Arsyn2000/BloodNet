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
import com.taim.conduire.domain.HospitalNotificationData;
import com.taim.conduire.service.AdminNotificationDataService;
import com.taim.conduire.service.ClientDataService;
import com.taim.conduire.service.HospitalDataService;
import com.taim.conduire.service.HospitalNotificationDataService;

@Controller
@RequestMapping("/hospital-notification")
@Validated
public class HospitalNotificationController {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private HospitalNotificationDataService hospitalNotificationDataService;
    @Autowired
    private HospitalDataService hospitalDataService;
    
    
    @RequestMapping(value = "/view-hospital-notifications", method = RequestMethod.GET)
    public String viewHospitalNotifications(@RequestParam(value = "email",required = true) String sEmail,
    								 Model model
    									){
    	
    	logger.debug("Inside viewHospitalNotifications");
    	logger.debug("sEmail " + sEmail);
    	
    	List<HospitalNotificationData> listHospitalNotificationData = hospitalNotificationDataService.findByReceiver(sEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    		
        logger.debug("Leaving viewHospitalNotifications");
        model.addAttribute("listHospitalNotificationData", listHospitalNotificationData);
        model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sEmail);
        return "bloodnet/viewhospitalnotifications";
        
    }
    
    @RequestMapping(value = "/view-particular-notification", method = RequestMethod.GET)
    public String viewParticularNotification(@RequestParam(value = "email",required = true) String sEmail,
    										@RequestParam(value = "not_id",required = true) String sNotId,
    								 Model model
    									){
    	
    	logger.debug("Inside viewParticularNotification");
    	logger.debug("sEmail " + sEmail);
    	logger.debug("sNotId " + sNotId);
    	
    	int iNotId=Integer.parseInt(sNotId);  
    	List<HospitalNotificationData> listHospitalNotificationData = hospitalNotificationDataService.findByHnotificationId(iNotId);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    		
        logger.debug("Leaving viewParticularNotification");
        model.addAttribute("listHospitalNotificationData", listHospitalNotificationData);
        model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sEmail);
		model.addAttribute("data", listHospitalNotificationData.get(0).getData());
        return "bloodnet/viewparticularnotification";
        
    }
}