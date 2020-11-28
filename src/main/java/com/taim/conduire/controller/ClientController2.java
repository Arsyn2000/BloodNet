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
import com.taim.conduire.domain.ClientData;
import com.taim.conduire.service.ClientDataService;

@Controller
@RequestMapping("/client")
@Validated
public class ClientController2 {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private ClientDataService clientDataService;
    
    /*@RequestMapping(value = "", method = RequestMethod.GET)
    public ResponseEntity<String> view(Model model) {
    	//String because string is returned
    	logger.debug("This is a reply from /test2 endpoint");
        return ResponseEntity.ok("This is a reply from /test2 endpoint");
    }*/
    
    @RequestMapping(method = RequestMethod.POST)
    public String createClient(@RequestParam(value = "clientId",required = false) String clientId,
      									  @RequestParam(value = "first_name",required = true) String sFirstName,
    									  @RequestParam(value = "last_name",required = true) String sLastName,
    									  @RequestParam(value = "email_id",required = true) String sEmailId,
    									  @RequestParam(value = "password",required = true) String sPassword,
    									  @RequestParam(value = "phone_number",required = true) String sPhoneNumber,
    									  @RequestParam(value = "blood_group",required = true) String sBloodGroup,
    									  @RequestParam(value = "birth_date",required = true) String sBirthDate,
    									  @RequestParam(value = "aadhar_number",required = true) String sAadharNumber,
    									  @RequestParam(value = "area",required = true) String sArea
    									){
    	
    	logger.debug("Inside createClient");
    	logger.debug("sFirstName " + sFirstName);
    	logger.debug("sLastName " + sLastName);
    	logger.debug("sEmailId " + sEmailId);
    	logger.debug("sPassword " + sPassword);
    	logger.debug("sPhoneNumber " + sPhoneNumber);
    	logger.debug("sBloodGroup " + sBloodGroup);
    	logger.debug("sBirthDate " + sBirthDate);
    	logger.debug("sAadharNumber " + sAadharNumber);
    	logger.debug("sArea " + sArea);
    	
    	Date date = new Date();  
    	DateFormat outputFormatter = new SimpleDateFormat("yyyy/MM/dd");
    	String output = outputFormatter.format(date);
    	logger.debug(output);
    	
    	String year_then = sBirthDate.substring(0, 4);
    	String year_now = output.substring(0, 4);
    	logger.debug(Integer.parseInt(year_now));
    	logger.debug(Integer.parseInt(year_then));
    	Integer year_diff = Integer.parseInt(year_now)-Integer.parseInt(year_then);
    	logger.debug(year_diff);
    	
    	if(year_diff>=18 && year_diff<=60) {
    		ClientData clientData = new ClientData();
        	clientData.setFirstName(sFirstName);
        	clientData.setLastName(sLastName);
        	clientData.setEmailId(sEmailId);
        	clientData.setPassword(sPassword);
        	clientData.setPhoneNumber(sPhoneNumber);
        	clientData.setBloodGroup(sBloodGroup);
        	clientData.setBloodDonationCount(0);
        	clientData.setSignUpDate(output);
        	clientData.setBirthDate(sBirthDate);
        	clientData.setAadharNumber(sAadharNumber);
        	clientData.setArea(sArea);
        	clientData.setStatus("active");
        	
        	
        	List<ClientData> listClientData = clientDataService.findByEmailId(sEmailId);
        	List<ClientData> listClientData1 = clientDataService.findByAadharNumber(sAadharNumber);
        	if(listClientData.size()==0 && listClientData1.size()==0) {
        		clientData = clientDataService.create(clientData);
        		logger.debug("Leaving createClient");
        		return "bloodnet/loginaftercreation";
        	}else {
        		logger.debug("Leaving createClient");
        		return "bloodnet/clientsignupwhenuserexixts";
        	}
    	}
    	else {
    		logger.debug("Leaving createClient");
    		return "bloodnet/loginwhenabove18";
    	}
    	
    	
    }
    
    @RequestMapping(value = "/find-all-client", method=RequestMethod.GET)
    public ResponseEntity<?> findAllClient(){
    	logger.debug("Inside findAllClient");
    	
    	List<ClientData> listClientData = clientDataService.findAll();
    	logger.debug("listClientData " + listClientData.size());
    	logger.debug("Leaving findAllClient");
    	return ResponseEntity.ok(listClientData);
    }
    
    @RequestMapping(value = "/find-client-by-first-name", method = RequestMethod.GET)
    public ResponseEntity<?> findUserByFirstName(@RequestParam("first_name") String sFirstName){
    	logger.debug("Inside findUserByFirstName");
    	logger.debug("sFirstName " + sFirstName);
    	
    	List<ClientData> listClientData = clientDataService.findByFirstName(sFirstName);
    	ClientData clientData = null;
    	if(!listClientData.isEmpty()) {
    		clientData = listClientData.get(0);
    	}
    	logger.debug("Leaving findUserByFirstName");
    	return ResponseEntity.ok(clientData);
    }
    
    @RequestMapping(value = "/find-client-by-last-name", method = RequestMethod.GET)
    public ResponseEntity<?> findUserByLastName(@RequestParam("last_name") String sLastName){
    	logger.debug("Inside findUserByLastName");
    	logger.debug("sLastName " + sLastName);
    	
    	List<ClientData> listClientData = clientDataService.findByLastName(sLastName);
    	ClientData clientData = null;
    	if(!listClientData.isEmpty()) {
    		clientData = listClientData.get(0);
    	}
    	logger.debug("Leaving findUserByLastName");
    	return ResponseEntity.ok(clientData);
    }
    
    @RequestMapping(value = "/find-client-by-phone-number", method = RequestMethod.GET)
    public ResponseEntity<?> findUserByPhoneNumber(@RequestParam("phone_number") String sPhoneNumber){
    	logger.debug("Inside findUserByPhoneNumber");
    	logger.debug("sPhoneNumber " + sPhoneNumber);
    	
    	List<ClientData> listClientData = clientDataService.findByPhoneNumber(sPhoneNumber);
    	ClientData clientData = null;
    	if(!listClientData.isEmpty()) {
    		clientData = listClientData.get(0);
    	}
    	logger.debug("Leaving findUserByPhoneNumber");
    	return ResponseEntity.ok(clientData);
    }
    
    @RequestMapping(value = "/find-client-by-email-id", method = RequestMethod.GET)
    public ResponseEntity<?> findByEmailId(@RequestParam("email_id") String sEmailId){
    	logger.debug("Inside findByEmailId");
    	logger.debug("sPhoneNumber " + sEmailId);
    	
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmailId);
    	ClientData clientData = null;
    	if(!listClientData.isEmpty()) {
    		clientData = listClientData.get(0);
    	}
    	logger.debug("Leaving findByEmailId");
    	return ResponseEntity.ok(clientData);
    }
    
    @RequestMapping(value = "/find-client-by-blood-group", method = RequestMethod.GET)
    public ResponseEntity<?> findByBloodGroup(@RequestParam("blood_group") String sBloodGroup){
    	logger.debug("Inside findByBloodGroup");
    	logger.debug("sPhoneNumber " + sBloodGroup);
    	
    	List<ClientData> listClientData = clientDataService.findByEmailId(sBloodGroup);
    	/*ClientData clientData = null;
    	if(!listClientData.isEmpty()) {
    		clientData = listClientData.get(0);
    	}*/
    	logger.debug("Leaving findByEmailId");
    	return ResponseEntity.ok(listClientData);
    }
   
    @RequestMapping(value = "/find-client-by-blood-donation-count", method = RequestMethod.GET)
    public ResponseEntity<?> findByBloodDonationCount(@RequestParam("blood_donation_count") Integer iBloodDonationCount){
    	logger.debug("Inside findByBloodDonationCount");
    	logger.debug("iBloodDonationCount " + iBloodDonationCount);
    	
    	List<ClientData> listClientData = clientDataService.findByBloodDonationCount(iBloodDonationCount);
    	/*ClientData clientData = null;
    	if(!listClientData.isEmpty()) {
    		clientData = listClientData.get(0);
    	}*/
    	logger.debug("Leaving findByEmailId");
    	return ResponseEntity.ok(listClientData);
    }
    
    @RequestMapping(value = "/find-client-by-sign-up-date", method = RequestMethod.GET)
    public ResponseEntity<?> findBySignUpDate(@RequestParam("sign_up_date") String dSignUpDate){
    	logger.debug("Inside findBySignUpDate");
    	logger.debug("dSignUpDate " + dSignUpDate);
    	
    	 
    	List<ClientData> listClientData = clientDataService.findBySignUpDate(dSignUpDate);
    	/*ClientData clientData = null;
    	if(!listClientData.isEmpty()) {
    		clientData = listClientData.get(0);
    	}*/
    	logger.debug("Leaving findBySignUpDate");
    	return ResponseEntity.ok(listClientData);
    }
    
    @RequestMapping(value = "/find-client-by-aadhar-number", method = RequestMethod.GET)
    public ResponseEntity<?> findByAadharNumber(@RequestParam("aadhar_number") String sAadharNumber){
    	logger.debug("Inside findByAadharNumber");
    	logger.debug("sAadharNumber " + sAadharNumber);
    	
    	List<ClientData> listClientData = clientDataService.findByAadharNumber(sAadharNumber);
    	ClientData clientData = null;
    	if(!listClientData.isEmpty()) {
    		clientData = listClientData.get(0);
    	}
    	logger.debug("Leaving findByAadharNumber");
    	return ResponseEntity.ok(clientData);
    }
    
    @RequestMapping(value = "/find-client-by-status", method = RequestMethod.GET)
    public ResponseEntity<?> findByStatus(@RequestParam("status") String sStatus){
    	logger.debug("Inside findByStatus");
    	logger.debug("sStatus " + sStatus);
    	
    	List<ClientData> listClientData = clientDataService.findByStatus(sStatus);
    	logger.debug("Leaving findByStatus");
    	return ResponseEntity.ok(listClientData);
    }
    
    @RequestMapping(value = "/delete-client",method=RequestMethod.GET)
    public String clientDelete(@RequestParam("email") String sEmailId){
    	logger.debug("Inside clientDelete");
    	
    	String msg;
    	ClientData clientData = new ClientData();
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmailId);
    	if(listClientData.size()!=0) {	
    		listClientData.get(0).setStatus("inactive");
    		clientDataService.update(listClientData.get(0));
    		logger.debug("Leaving clientDelete");
    		return "bloodnet/login";
    	}
    	else {
    		clientDataService.update(listClientData.get(0));
    		logger.debug("Leaving clientDelete");
    		return "";
    	}
    }
    
    @RequestMapping(value = "/client-update",method=RequestMethod.POST)
    public String clientUpdate(@RequestParam(value = "email") String sEmail,
    						   @RequestParam(value = "first_name") String sFirstName,
    						   @RequestParam(value = "last_name") String sLastName,
							   @RequestParam(value = "phone_number") String sPhoneNumber,
							   @RequestParam(value = "blood_group") String sBloodGroup,
							   @RequestParam(value = "birth_date") String sBirthDate,
							   @RequestParam(value = "update",required=false) String sUpdate ,
        					   @RequestParam(value = "cancel",required=false) String sCancel,
        					   Model model
    						   ){
			    	logger.debug("Inside clientUpdate");
			    	logger.debug(sEmail);
					logger.debug(sFirstName);
					logger.debug(sLastName);
					logger.debug(sPhoneNumber);
					logger.debug(sBloodGroup);
					logger.debug(sBirthDate);
					
					List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
					
						
						logger.debug(listClientData.get(0));
	    				if(sUpdate != null){
	    					if(!sFirstName.isEmpty()) {
	    						listClientData.get(0).setFirstName(sFirstName);
	    					}
	    					if(!sLastName.isEmpty()) {
	    						listClientData.get(0).setLastName(sLastName);
	    					}
	    					if(!sPhoneNumber.isEmpty()) {
	    						listClientData.get(0).setPhoneNumber(sPhoneNumber);
	    					}
	    					if(!sBloodGroup.isEmpty()) {
	    						listClientData.get(0).setBloodGroup(sBloodGroup);
	    					}
	    					if(!sBirthDate.isEmpty()) {
	    						listClientData.get(0).setBirthDate(sBirthDate);
	    					}
	    					clientDataService.update(listClientData.get(0));
	    				}
	    				
					
					logger.debug("Leaving clientUpdate");
					model.addAttribute("fname", listClientData.get(0).getFirstName());
					model.addAttribute("lname", listClientData.get(0).getLastName());
					model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
					model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
					model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
					model.addAttribute("email", sEmail);
					return "bloodnet/edit";
    }
    
    @RequestMapping(value = "/client-password-update",method=RequestMethod.POST)
    public String clientPasswordUpdate(@RequestParam(value = "email") String sEmail,
    								   @RequestParam(value = "password",required=true) String sPassword,
    						           @RequestParam(value = "new_password1",required=true) String sNewPassword1,
    			    			       @RequestParam(value = "new_password2",required=true) String sNewPassword2,
    								   @RequestParam(value = "update",required=false) String sUpdate ,
    				        		   @RequestParam(value = "cancel",required=false) String sCancel,
    								   Model model
										  ){
    	logger.debug("Inside clientPasswordUpdate");
    	logger.debug(sEmail);
    	logger.debug(sPassword);
    	logger.debug(sNewPassword1);
    	logger.debug(sNewPassword2);
    	String msg;
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmail);
    	if(sUpdate != null){
        	logger.debug(listClientData.get(0));
        	if(!listClientData.isEmpty()) {
        		if(listClientData.get(0).getPassword().equals(sPassword)){
        			if(sNewPassword1.equals(sNewPassword2)) {
        				listClientData.get(0).setPassword(sNewPassword1);
        				clientDataService.update(listClientData.get(0));
        				logger.debug(listClientData.get(0).getPassword());
        				msg="Password updated";
        			}
        			else {
        				msg="The new passwords don't match";
        			}
        		}
        		else {
        			msg="The current password entered is wrong";
        		}
        	}
        	else {
        		msg="Email Id not found";
        	}
    	}
    	logger.debug("Leaving clientPasswordUpdate");
    	model.addAttribute("fname", listClientData.get(0).getFirstName());
    	model.addAttribute("lname", listClientData.get(0).getLastName());
    	model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
    	model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
    	model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
    	model.addAttribute("email", sEmail);
    	return "bloodnet/edit";
    }
    
    @RequestMapping(value = "/client-email-id-update",method=RequestMethod.POST)
    public String clientEmailIdUpdate(@RequestParam(value = "aadhar_number",required=true) String sAadharNumber,
    								  @RequestParam(value = "email_id",required=true) String sEmailId,
    						          @RequestParam(value = "email_id1",required=true) String sEmailId1,
    						          @RequestParam(value = "email_id2",required=true) String sEmailId2,
    						          @RequestParam(value = "update",required=false) String sUpdate ,
  		        					  @RequestParam(value = "cancel",required=false) String sCancel,
  							          Model model
										  ){
    	logger.debug("Inside clientEmailIdUpdate");
    	logger.debug(sAadharNumber);
    	logger.debug(sEmailId);
    	logger.debug(sEmailId1);
    	logger.debug(sEmailId2);
    	String msg;
    	List<ClientData> listClientData = clientDataService.findByAadharNumber(sAadharNumber);
    	if(sUpdate != null){
        	logger.debug(listClientData.get(0));
        	if(!listClientData.isEmpty()) {
        		if(listClientData.get(0).getEmailId().equals(sEmailId)){
        			if(sEmailId1.equals(sEmailId2)) {
        				listClientData.get(0).setEmailId(sEmailId1);
        				clientDataService.update(listClientData.get(0));
        				logger.debug(listClientData.get(0).getEmailId());
        				msg="Email Id updated";
        			}
        			else {
        				msg="The new Email ids don't match";
        			}
        		}
        		else {
        			msg="The current Email Id entered is wrong";
        		}
        	}
        	else {
        		msg="Aadhar Number not found";
        	}
        	logger.debug("Leaving clientEmailIdUpdate");
        	model.addAttribute("fname", listClientData.get(0).getFirstName());
			model.addAttribute("lname", listClientData.get(0).getLastName());
			model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
			model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
			model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
			model.addAttribute("email", sEmailId1);
        	return "bloodnet/edit";
    	}
    	else {
    		logger.debug("Leaving clientEmailIdUpdate");
    		model.addAttribute("fname", listClientData.get(0).getFirstName());
			model.addAttribute("lname", listClientData.get(0).getLastName());
			model.addAttribute("phno", listClientData.get(0).getPhoneNumber());
			model.addAttribute("blood_group", listClientData.get(0).getBloodGroup());
			model.addAttribute("birth_date", listClientData.get(0).getBirthDate());
			model.addAttribute("email", sEmailId);
        	return "bloodnet/edit";
    	}
    		
    	
    	
    }
    
    @RequestMapping(value = "/client-blood-donation-count-update",method=RequestMethod.PATCH)
    public ResponseEntity<?> clientBloodDonationCountUpdate(@RequestParam(value = "email_id",required=true) String sEmailId){
    	logger.debug("Inside clientBloodDonationCountUpdate");
    	logger.debug(sEmailId);
    	
    	String msg;
    	List<ClientData> listClientData = clientDataService.findByEmailId(sEmailId);
    	
    	if(!listClientData.isEmpty()) {
    		listClientData.get(0).setBloodDonationCount(listClientData.get(0).getBloodDonationCount() +1);
    		clientDataService.update(listClientData.get(0));
    		msg = "Incremented by 1";
    	}
    	else {
    		msg = "Email Id not found";
    	}
    	logger.debug("Leaving clientEmailIdUpdate");
    	return ResponseEntity.ok(msg);
    }
    
}