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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.taim.conduire.domain.AdminData;
import com.taim.conduire.domain.AdminNotificationData;
import com.taim.conduire.domain.ClientData;
import com.taim.conduire.domain.ClientNotificationData;
import com.taim.conduire.domain.HospitalData;
import com.taim.conduire.service.AdminDataService;
import com.taim.conduire.service.AdminNotificationDataService;
import com.taim.conduire.service.ClientDataService;
import com.taim.conduire.service.HospitalDataService;

@Controller
@RequestMapping("/bloodnet")
@Validated
public class BloodNetController {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private ClientDataService clientDataService;
    @Autowired
    private AdminDataService adminDataService;
    @Autowired
    private HospitalDataService hospitalDataService;
    @Autowired
    private AdminNotificationDataService adminNotificationDataService;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String view(Model model) {
    	//String because string is returned
    	//AccountData accountData = CommonHelper.getAccount();
    	//model.addAttribute("accountData", accountData);
    	logger.debug("This is a test log");
    	return "bloodnet/login";
    }
    
    @RequestMapping(value = "/loginpage",method = RequestMethod.POST)
    public String login(@RequestParam(value = "email",required = true) String sEmail,
 					    @RequestParam(value = "password",required = true) String sPassword,
 					    Model model){
    	logger.debug("email "+sEmail);
		logger.debug("password "+sPassword);
		
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	
		
    		
    		
    		if(!listAdminData.isEmpty()) {
        		if(listAdminData.get(0).getPassword().equals(sPassword)) {
        			
        			model.addAttribute("fname", listAdminData.get(0).getFirstName());
        			model.addAttribute("lname", listAdminData.get(0).getLastName());
        			model.addAttribute("email", listAdminData.get(0).getEmailId());
        			return "bloodnet/adminhome";
        		}else {
        			return "bloodnet/loginwhenpasswordincorrect";
        		}
        	}
    		else if(!listClientData.isEmpty() && listClientData.get(0).getStatus().equals("active")) {
        		if(listClientData.get(0).getPassword().equals(sPassword)) {
        			
        			model.addAttribute("fname", listClientData.get(0).getFirstName());
        			model.addAttribute("lname", listClientData.get(0).getLastName());
        			model.addAttribute("email", listClientData.get(0).getEmailId());
        			return "bloodnet/clienthome";
        		}else {
        			return "bloodnet/loginwhenpasswordincorrect";
        		}
        	}
    		else if(!listHospitalData.isEmpty() && listHospitalData.get(0).getStatus().equals("active")) {
        		if(listHospitalData.get(0).getPassword().equals(sPassword)) {
        			if(listHospitalData.get(0).getQtyO()<=30.0 ||  listHospitalData.get(0).getQtyA()<=25.0 
        					|| listHospitalData.get(0).getQtyB()<=20.0 || listHospitalData.get(0).getQtyAb()<=15.0) {
        				model.addAttribute("name", listHospitalData.get(0).getName());
            			model.addAttribute("email", listHospitalData.get(0).getEmailId());
            			model.addAttribute("notificationdata", "Blood scarcity");
            			model.addAttribute("type", "not");
        				return "bloodnet/scarcitynotification";
        			}
        			model.addAttribute("name", listHospitalData.get(0).getName());
        			model.addAttribute("email", listHospitalData.get(0).getEmailId());
        			return "bloodnet/hospitalhome";
        		}else {
        			return "bloodnet/loginwhenpasswordincorrect";
        		}
        	}
    		else {
    			return "bloodnet/loginwhenemailincorrect";
    		}
    	}

    @RequestMapping(value = "/forgot-password",method = RequestMethod.GET)
    public String forgotPassword() {
    	return "bloodnet/passwordrecovery";
    }
    
    @RequestMapping(value = "/password-recovery",method = RequestMethod.POST)
    public String passwordPassword() {
    	return "bloodnet/enterotp";
    }
    
    @RequestMapping(value = "/client-sign-up",method = RequestMethod.GET)
    public String clientSignUp() {
    	return "bloodnet/clientsignup";
    }
    @RequestMapping(value = "/hospital-sign-up",method = RequestMethod.GET)
    public String hospitalSignUp() {
    	return "bloodnet/hospitalsignup";
    }
    @RequestMapping(value = "/terms",method = RequestMethod.GET)
    public String terms() {
    	return "bloodnet/terms";
    }
    
    
    
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String homeRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	//String fEmail = email+".com";
    	//logger.debug("fEmail "+fEmail);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
		model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/clienthome";
    }
    
    @RequestMapping(value = "/client-gallery",method = RequestMethod.GET)
    public String clientGalleryRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
    	model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/clientgallery";
    }
    @RequestMapping(value = "/update-user",method = RequestMethod.GET)
    public String userNameRedirect(@RequestParam(value = "email") String sEmail,
			   					   Model model) {
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
		model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
		model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
		model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
		model.addAttribute("email", sEmail);
    	return "bloodnet/edit";
    }
    
    @RequestMapping(value = "/update-password",method = RequestMethod.GET)
    public String updatePassword(@RequestParam(value = "email") String sEmail,
			   					 Model model) {
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
		model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
		model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
		model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
		model.addAttribute("email", sEmail);
    	return "bloodnet/updatepassword";
    }
    @RequestMapping(value = "/update-email",method = RequestMethod.GET)
    public String updateEmail(@RequestParam(value = "email") String sEmail,
				 			 Model model) {
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
		model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
		model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
		model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
		model.addAttribute("email", sEmail);
    	return "bloodnet/updateemail";
    }
    @RequestMapping(value = "/client-cancel-button",method = RequestMethod.GET)
    public String clientCancelButton(@RequestParam(value = "email") String sEmail,
				 			 Model model) {
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
		model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
		model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
		model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
		model.addAttribute("email", sEmail);
    	return "bloodnet/edit";
    }
    
    @RequestMapping(value = "/client-donate-blood",method = RequestMethod.GET)
    public String clientDonateBlood(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	logger.debug("In clientDonateBlood");
    	logger.debug("email "+sEmail);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByArea(listClientData.get(0).getArea());
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
    	model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("email", sEmail);
		model.addAttribute("listHospitalData", listHospitalData);
		logger.debug("Leaving clientDonateBlood");
    	return "bloodnet/clientdonateblood";
    }
    
    @RequestMapping(value = "/client-need-blood",method = RequestMethod.GET)
    public String clientNeedBlood(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	logger.debug("In clientNeedBlood");
    	logger.debug("email "+sEmail);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
    	model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("email", sEmail);
		logger.debug("Leaving clientNeedBlood");
    	return "bloodnet/clientneedblood";
    }
    
    @RequestMapping(value = "/blood-donation-notification", method = RequestMethod.GET)
    public String bloodDonationNotification(@RequestParam(value = "email",required = true) String sEmail,
											@RequestParam(value = "type",required = false) String stype,
										    Model model){
    	logger.debug("Inside bloodDonationNotification");
    	logger.debug("sEmail " + sEmail);//Client email
    	logger.debug("stype " + stype);//Blood types he needs
    	
    	/*String array1[]= stype.split(",");
    	for(String str :array1) {
    		logger.debug(str);
    	}
    	List<String> str = new ArrayList<String>();
    	str = Arrays.asList(array1);*/
    	
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByArea(listClientData.get(0).getArea());
    	List<ClientData> listClientData2 = clientDataService.findByArea(listClientData.get(0).getArea());
    	List<ClientData> listClientData3   = new ArrayList<ClientData>();
    	for(ClientData clientData:listClientData2) {
    		if(clientData.getBloodGroup().toLowerCase().equals(stype)) {
    			listClientData3.add(clientData);
    		}
    	}

    	
    	
    	
    	logger.debug("Leaving bloodDonationNotification");
    	model.addAttribute("email", sEmail);
    	model.addAttribute("listHospitalData", listHospitalData);
    	model.addAttribute("listClientData3", listClientData3);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
    	model.addAttribute("lname", listClientData.get(0).getLastName());
    	return "bloodnet/clientneedbloodredirect";
    	
    }

    
    @RequestMapping(value = "/client-contact-us",method = RequestMethod.GET)
    public String clientContactUs(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	logger.debug("In clientContactUs");
    	logger.debug("email "+sEmail);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
    	model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/clientcontactus";
    }
    
    @RequestMapping(value = "/client-faq",method = RequestMethod.GET)
    public String clientFaq(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	//String fEmail = email+".com";
    	//logger.debug("fEmail "+fEmail);
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
		model.addAttribute("lname", listClientData.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/clientfaq";
    }
    
    
    @RequestMapping(value = "/admin-home",method = RequestMethod.GET)
    public String adminHomeRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	//String fEmail = email+".com";
    	//logger.debug("fEmail "+fEmail);
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listAdminData.get(0).getFirstName());
		model.addAttribute("lname", listAdminData.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/adminhome";
    }
    @RequestMapping(value = "/admin-notification",method = RequestMethod.GET)
    public String adminNotificationRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	List<AdminNotificationData> listAdminNotificationData = adminNotificationDataService.findAll();
    	List<AdminNotificationData> listAdminNotificationData1 = adminNotificationDataService.findByType("msg");
    	List<AdminNotificationData> listAdminNotificationData2 = adminNotificationDataService.findByType("mail");
    	model.addAttribute("fname", listAdminData.get(0).getFirstName());
		model.addAttribute("lname", listAdminData.get(0).getLastName());
		model.addAttribute("email", sEmail);
		model.addAttribute("listAdminNotificationData", listAdminNotificationData);
		model.addAttribute("listAdminNotificationData1", listAdminNotificationData1);
		model.addAttribute("listAdminNotificationData2", listAdminNotificationData2);
    	return "bloodnet/adminnotification";
    }
    @RequestMapping(value = "/admin-gallery",method = RequestMethod.GET)
    public String adminGalleryRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listAdminData.get(0).getFirstName());
    	model.addAttribute("lname", listAdminData.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/admingallery";
    }
    @RequestMapping(value = "/admin-post-on-social-platforms",method = RequestMethod.GET)
    public String adminPostOnSocialPlatformsRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	logger.debug("In adminPostOnSocialPlatformsRedirect");
    	logger.debug("email "+sEmail);
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listAdminData.get(0).getFirstName());
    	model.addAttribute("lname", listAdminData.get(0).getLastName());
		model.addAttribute("email", sEmail);
		logger.debug("Leaving adminPostOnSocialPlatformsRedirect");
    	return "bloodnet/adminpostonsocialplatforms";
    }
    @RequestMapping(value = "/admin-link",method = RequestMethod.GET)
    public String adminLink(@RequestParam(value = "email") String sEmail,
			   					   Model model) {
    	List<AdminData> listAdminData = adminDataService.findAll();
    	List<AdminData> listAdminData1 = adminDataService.findByEmailId(sEmail);
    	model.addAttribute("list", listAdminData);
    	model.addAttribute("fname", listAdminData1.get(0).getFirstName());
		model.addAttribute("lname", listAdminData1.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/admininfo";
    }
    @RequestMapping(value = "/admin-hospital-info",method = RequestMethod.GET)
    public String adminHospitalInfo(@RequestParam(value = "email") String sEmail,
			   					   Model model) {
    	List<HospitalData> listHospitalData = hospitalDataService.findAll();
    	List<AdminData> listAdminData1 = adminDataService.findByEmailId(sEmail);
    	model.addAttribute("list", listHospitalData);
    	model.addAttribute("fname", listAdminData1.get(0).getFirstName());
		model.addAttribute("lname", listAdminData1.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/hospitalinfo";
    }
    @RequestMapping(value = "/hospital-info-search",method = RequestMethod.GET)
    public String hospitalInfoSearch(@RequestParam(value = "email") String sEmail,
    							   @RequestParam(value = "flag") String sFlag,
    							   @RequestParam(value = "keyword") String sKeyword,
			                       Model model) {
    	logger.debug("In hospitalInfoSearch");
    	logger.debug("sFlag:"+sFlag);
    	logger.debug("sKeyword:"+sKeyword);
    	List<HospitalData> listHospitalData = null;
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	 
    	if(sFlag.equals("all")) {
    		logger.debug("In All");
    		listHospitalData = hospitalDataService.findAll();
    		logger.debug(listHospitalData);
        	
    	}
    	else if(sFlag.equals("name")) {
    		logger.debug("In Name");
    		logger.debug(sKeyword.trim());
    		listHospitalData = hospitalDataService.findByName(sKeyword);
    		logger.debug(listHospitalData);
    	}
    	else if(sFlag.equals("emailid")) {
    		logger.debug("In Email ID");
    		logger.debug(sKeyword.trim());
    		listHospitalData = hospitalDataService.findByEmailId(sKeyword);
    		logger.debug(listHospitalData);
    	}
    	else if(sFlag.equals("phno")) {
    		logger.debug("In Phone Number");
    		logger.debug(sKeyword.trim());
    		listHospitalData = hospitalDataService.findByPhoneNumber(sKeyword);
    		logger.debug(listHospitalData);
    	}
    	else if(sFlag.equals("status")) {
    		logger.debug("In Status");
    		logger.debug(sKeyword.trim());
    		listHospitalData = hospitalDataService.findByStatus(sKeyword);
    		logger.debug(listHospitalData);
    	}
    	else if(sFlag.equals("area")) {
    		logger.debug("In Area");
    		logger.debug(sKeyword.trim());
    		listHospitalData = hospitalDataService.findByArea(sKeyword);
    		logger.debug(listHospitalData);
    	}
    	else {
    		logger.debug("In else part");
    		logger.debug(listHospitalData);
    	}
    	model.addAttribute("list", listHospitalData);
    	model.addAttribute("fname", listAdminData.get(0).getFirstName());
		model.addAttribute("lname", listAdminData.get(0).getLastName());
		model.addAttribute("email", sEmail);
		logger.debug("Leaving hospitalInfoSearch");
		return "bloodnet/hospitalinfo";
    	
    }
    @RequestMapping(value = "/admin-client-info",method = RequestMethod.GET)
    public String adminClientInfo(@RequestParam(value = "email") String sEmail,
			   					   Model model) {
    	List<ClientData> listClientData = clientDataService.findAll();
    	List<AdminData> listAdminData1 = adminDataService.findByEmailId(sEmail);
    	model.addAttribute("list", listClientData);
    	model.addAttribute("fname", listAdminData1.get(0).getFirstName());
		model.addAttribute("lname", listAdminData1.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/clientinfo";
    }
    @RequestMapping(value = "/client-info-search",method = RequestMethod.GET)
    public String clientInfoSearch(@RequestParam(value = "email") String sEmail,
    							   @RequestParam(value = "flag") String sFlag,
    							   @RequestParam(value = "keyword") String sKeyword,
			                       Model model) {
    	logger.debug("In clientInfoSearch");
    	logger.debug("sFlag:"+sFlag);
    	logger.debug("sKeyword:"+sKeyword);
    	
    	List<ClientData> listClientData = null;
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	 
    	if(sFlag.equals("all")) {
    		logger.debug("In All");
    		listClientData = clientDataService.findAll();
    		logger.debug(listClientData);
        	
    	}
    	else if(sFlag.equals("firstName")) {
    		logger.debug("In First Name");
    		logger.debug(sKeyword.trim());
    		listClientData = clientDataService.findByFirstName(sKeyword);
    		logger.debug(listClientData);
    	}
    	else if(sFlag.equals("lastName")) {
    		logger.debug("In Last Name");
    		logger.debug(sKeyword.trim());
    		listClientData = clientDataService.findByLastName(sKeyword);
    		logger.debug(listClientData);
    	}
    	else if(sFlag.equals("emailid")) {
    		logger.debug("In Email ID");
    		logger.debug(sKeyword.trim());
    		listClientData = clientDataService.findByEmailId(sKeyword);
    		logger.debug(listClientData);
    	}
    	else if(sFlag.equals("phno")) {
    		logger.debug("In Phone Number");
    		logger.debug(sKeyword.trim());
    		listClientData = clientDataService.findByPhoneNumber(sKeyword);
    		logger.debug(listClientData);
    	}
    	else if(sFlag.equals("bloodGroup")) {
    		logger.debug("In Blood Group");
    		logger.debug(sKeyword.trim());
    		listClientData = clientDataService.findByBloodGroup(sKeyword);
    		logger.debug(listClientData);
    	}
    	else if(sFlag.equals("bloodDonationCount")) {
    		logger.debug("In Blood Donation Count");
    		logger.debug(sKeyword.trim());
    		int iKeyword=Integer.parseInt(sKeyword);  
    		listClientData = clientDataService.findByBloodDonationCount(iKeyword);
    		logger.debug(listClientData);
    	}
    	else if(sFlag.equals("aadharNumber")) {
    		logger.debug("In Aadhar Number");
    		logger.debug(sKeyword.trim());
    		listClientData = clientDataService.findByAadharNumber(sKeyword);
    		logger.debug(listClientData);
    	}
    	else if(sFlag.equals("status")) {
    		logger.debug("In Status");
    		logger.debug(sKeyword.trim());
    		listClientData = clientDataService.findByStatus(sKeyword);
    		logger.debug(listClientData);
    	}
    	else if(sFlag.equals("area")) {
    		logger.debug("In Area");
    		logger.debug(sKeyword.trim());
    		listClientData = clientDataService.findByArea(sKeyword);
    		logger.debug(listClientData);
    	}
    	else {
    		logger.debug("In else part");
    		logger.debug(listClientData);
    	}
    	model.addAttribute("list", listClientData);
    	model.addAttribute("fname", listAdminData.get(0).getFirstName());
		model.addAttribute("lname", listAdminData.get(0).getLastName());
		model.addAttribute("email", sEmail);
		logger.debug("Leaving clientInfoSearch");
		return "bloodnet/clientinfo";
    	
    }
    @RequestMapping(value = "/hospital-chart",method = RequestMethod.GET)
    public String adminHospitalChart(@RequestParam(value = "email") String sEmail,
    								 @RequestParam(value = "hospital_email") String sHospitalEmail,
    								 Model model) {
    	logger.debug("email "+sEmail);
    	logger.debug("sHospitalEmail "+sHospitalEmail);
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sHospitalEmail);
    	model.addAttribute("list", listHospitalData);
    	model.addAttribute("fname", listAdminData.get(0).getFirstName());
		model.addAttribute("lname", listAdminData.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/chart";
    }
    @RequestMapping(value = "/hospital-find-all",method = RequestMethod.GET)
    public ResponseEntity<?> hospitalFindAll() {
    	logger.debug("In hospitalFindAll");
    	List<HospitalData> listHospitalData = hospitalDataService.findAll();
		return ResponseEntity.ok(listHospitalData);
    }
    
    @RequestMapping(value = "/admin-faq",method = RequestMethod.GET)
    public String adminFaq(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	//String fEmail = email+".com";
    	//logger.debug("fEmail "+fEmail);
    	List<AdminData> listAdminData = adminDataService.findByEmailId(sEmail);
    	model.addAttribute("fname", listAdminData.get(0).getFirstName());
		model.addAttribute("lname", listAdminData.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/adminfaq";
    }
    
    
    @RequestMapping(value = "/hospital-link",method = RequestMethod.GET)
    public String hospitalLink(@RequestParam(value = "email") String sEmail,
			   					   Model model) {
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	//model.addAttribute("list", listHospitalData);
    	model.addAttribute("name", listHospitalData.get(0).getName());
    	model.addAttribute("phno", listHospitalData.get(0).getPhoneNumber());
    	model.addAttribute("qtyA", listHospitalData.get(0).getQtyA());
    	model.addAttribute("qtyB", listHospitalData.get(0).getQtyB());
    	model.addAttribute("qtyAB", listHospitalData.get(0).getQtyAb());
    	model.addAttribute("qtyO", listHospitalData.get(0).getQtyO());
		//model.addAttribute("lname", listAdminData1.get(0).getLastName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/hospitalinfoupdate";
    }
    @RequestMapping(value = "/hospital-home",method = RequestMethod.GET)
    public String hospitalHomeRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	//String fEmail = email+".com";
    	//logger.debug("fEmail "+fEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/hospitalhome";
    }
    @RequestMapping(value = "/hospital-gallery",method = RequestMethod.GET)
    public String hospitalGalleryRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/hospitalgallery";
    }
    @RequestMapping(value = "/hospital-need-blood",method = RequestMethod.GET)
    public String hospitalNeedBloodRedirect(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/hospitalneedblood";
    }
    @RequestMapping(value = "/hospital-contact-us",method = RequestMethod.GET)
    public String hospitalContactUs(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	logger.debug("In hospitalContactUs");
    	logger.debug("email "+sEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/hospitalcontactus";
    }
    @RequestMapping(value = "/hospital-faq",method = RequestMethod.GET)
    public String hospitalFaq(@RequestParam(value = "email") String sEmail,
			    			   Model model) {
    	
    	logger.debug("email "+sEmail);
    	//String fEmail = email+".com";
    	//logger.debug("fEmail "+fEmail);
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/hospitalfaq";
    }
    @RequestMapping(value = "/update-hospital-password",method = RequestMethod.GET)
    public String updateHospitalPassword(@RequestParam(value = "email") String sEmail,
			   					 Model model) {
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
		//model.addAttribute("lname", listClientData.get(0).getLastName());
		//model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
		//model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
		//model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
		model.addAttribute("email", sEmail);
    	return "bloodnet/updatehospitalpassword";
    }
    @RequestMapping(value = "/update-hospital-email",method = RequestMethod.GET)
    public String updateHospitalEmail(@RequestParam(value = "email") String sEmail,
			   					 Model model) {
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
		//model.addAttribute("lname", listClientData.get(0).getLastName());
		//model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
		//model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
		//model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
		model.addAttribute("email", sEmail);
    	return "bloodnet/updatehospitalemail";
    }
    @RequestMapping(value = "/cancel-button",method = RequestMethod.GET)
    public String cancelButton(@RequestParam(value = "email") String sEmail,
			   					 Model model) {
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmail);
    	model.addAttribute("name", listHospitalData.get(0).getName());
		model.addAttribute("email", sEmail);
    	return "bloodnet/hospitalinfoupdate";
    }
    
    
    @RequestMapping(value = "/signout",method = RequestMethod.GET)
    public String signOut() {
    	return "bloodnet/login";
    }
    
}