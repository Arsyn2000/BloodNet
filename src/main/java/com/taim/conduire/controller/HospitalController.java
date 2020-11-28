package com.taim.conduire.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.taim.conduire.domain.HospitalData;
import com.taim.conduire.service.HospitalDataService;


@Controller
@RequestMapping("/hospital")
@Validated
public class HospitalController {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private HospitalDataService hospitalDataService;
    
    @RequestMapping(method = RequestMethod.POST)
    public String createHospital(@RequestParam(value = "hospital_id",required = false) Integer iHospitalId,
      									  @RequestParam(value = "name",required = true) String sName,
    									  @RequestParam(value = "email_id",required = true) String sEmailId,
    									  @RequestParam(value = "password",required = true) String sPassword,
    									  @RequestParam(value = "phone_number",required = true) String sPhoneNumber,
    									  @RequestParam(value = "qty_a",required = true) Float fQtyA,
    									  @RequestParam(value = "qty_b",required = true) Float fQtyB,
    									  @RequestParam(value = "qty_ab",required = true) Float fQtyAb,
    									  @RequestParam(value = "qty_o",required = true) Float fQtyO,
    									  @RequestParam(value = "area",required = true) String sArea
    									){
    	
    	logger.debug("Inside createHospital");
    	logger.debug("sName " + sName);
    	logger.debug("sEmailId " + sEmailId);
    	logger.debug("sPassword " + sPassword);
    	logger.debug("sPhoneNumber " + sPhoneNumber);
    	logger.debug("fQtyA " + fQtyA);
    	logger.debug("fQtyB " + fQtyB);
    	logger.debug("fQtyAb " + fQtyAb);
    	logger.debug("fQtyO " + fQtyO);
    	logger.debug("sArea " + sArea);
    	
    	String msg;
    	HospitalData hospitalData = new HospitalData();
    	hospitalData.setName(sName);
    	hospitalData.setEmailId(sEmailId);
    	hospitalData.setPassword(sPassword);
    	hospitalData.setPhoneNumber(sPhoneNumber);
    	hospitalData.setQtyA(fQtyA);
    	hospitalData.setQtyB(fQtyB);
    	hospitalData.setQtyAb(fQtyAb);
    	hospitalData.setQtyO(fQtyO);
    	hospitalData.setArea(sArea);
    	hospitalData.setStatus("active");
    	Date date = new Date();  
    	DateFormat outputFormatter = new SimpleDateFormat("yyyy/MM/dd");
    	String output = outputFormatter.format(date);
    	hospitalData.setSignUpDate(output);
        	
        	
        List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
        if(listHospitalData.size()==0) {
        	hospitalData = hospitalDataService.create(hospitalData);
        	logger.debug("Leaving createHospital of if portion");
        	return "bloodnet/loginaftercreation";
        }else {
        	logger.debug("Leaving createHospital");
        	return "bloodnet/hospitalsignupwhenuseralreadyexixts";
        }
    }
    
   @RequestMapping(value = "/find-all-hospital", method=RequestMethod.GET)
    public ResponseEntity<?> findAllHospital(){
    	logger.debug("Inside findAllHospital");
    	List<HospitalData> listHospitalData = hospitalDataService.findAll();
    	logger.debug("listHospitalData " + listHospitalData.size());
    	logger.debug("Leaving findAllHospital");
    	return ResponseEntity.ok(listHospitalData);
    }
    
    @RequestMapping(value = "/find-hospital-by-name", method = RequestMethod.GET)
    public ResponseEntity<?> findByName(@RequestParam("name") String sName){
    	logger.debug("Inside findHospitalByName");
    	logger.debug("sName " + sName);
    	List<HospitalData> listHospitalData = hospitalDataService.findByName(sName);
    	logger.debug("Leaving findHospitalByName");
    	return ResponseEntity.ok(listHospitalData);
    }
    
    @RequestMapping(value = "/find-hospital-by-email-id", method = RequestMethod.GET)
    public ResponseEntity<?> findByEmailId(@RequestParam("email_id") String sEmailId){
    	logger.debug("Inside findByEmailId");
    	logger.debug("sEmailId " + sEmailId);
    		
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
    	HospitalData hospitalData = null;
    	if(!listHospitalData.isEmpty()) {
    		logger.debug("Inside if condition");
    		hospitalData = listHospitalData.get(0);
    	}
    	logger.debug("Leaving findByEmailId");
    	return ResponseEntity.ok(hospitalData);
    }
    
    @RequestMapping(value = "/find-hospital-by-phone-number", method = RequestMethod.GET)
    public ResponseEntity<?> findByPhoneNumber(@RequestParam("phone_number") String sPhoneNumber){
    	logger.debug("Inside findByPhoneNumber");
    	logger.debug("sPhoneNumber " + sPhoneNumber);
    		
    	List<HospitalData> listHospitalData = hospitalDataService.findByPhoneNumber(sPhoneNumber);
    	HospitalData hospitalData = null;
    	if(!listHospitalData.isEmpty()) {
    		hospitalData = listHospitalData.get(0);
    	}
    	logger.debug("Leaving findByPhoneNumber");
    	return ResponseEntity.ok(hospitalData);
    }
    
	@RequestMapping(value = "/find-hospital-by-qtyA", method = RequestMethod.GET)
    public ResponseEntity<?> findByQtyA(@RequestParam("flag") Float fFlag){
    	logger.debug("Inside findByQtyA");
    	logger.debug("fFlag " + fFlag);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findAll();
    	List<HospitalData> listHospitalData1 = new ArrayList<HospitalData>();
    	
    	for (HospitalData i : listHospitalData) {
             if(i.getQtyA()>=fFlag) {
            	 listHospitalData1.add(i);
             }
         }
    	logger.debug("Leaving findByQtyA");
    	return ResponseEntity.ok(listHospitalData1);
    }
	
	@RequestMapping(value = "/find-hospital-by-qtyB", method = RequestMethod.GET)
    public ResponseEntity<?> findByQtyB(@RequestParam("flag") Float fFlag){
    	logger.debug("Inside findByQtyB");
    	logger.debug("fFlag " + fFlag);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findAll();
    	List<HospitalData> listHospitalData1 = new ArrayList<HospitalData>();
    	
    	for (HospitalData i : listHospitalData) {
             if(i.getQtyB()>=fFlag) {
            	 listHospitalData1.add(i);
             }
         }
    	logger.debug("Leaving findByQtyB");
    	return ResponseEntity.ok(listHospitalData1);
    }
	
	@RequestMapping(value = "/find-hospital-by-qtyAB", method = RequestMethod.GET)
    public ResponseEntity<?> findByQtyAb(@RequestParam("flag") Float fFlag){
    	logger.debug("Inside findByQtyAb");
    	logger.debug("fFlag " + fFlag);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findAll();
    	List<HospitalData> listHospitalData1 = new ArrayList<HospitalData>();
    	
    	for (HospitalData i : listHospitalData) {
             if(i.getQtyAb()>=fFlag) {
            	 listHospitalData1.add(i);
             }
         }
    	logger.debug("Leaving findByQtyAb");
    	return ResponseEntity.ok(listHospitalData1);
    }
	
	@RequestMapping(value = "/find-hospital-by-qtyO", method = RequestMethod.GET)
    public ResponseEntity<?> findByQtyO(@RequestParam("flag") Float fFlag){
    	logger.debug("Inside findByQtyO");
    	logger.debug("fFlag " + fFlag);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findAll();
    	List<HospitalData> listHospitalData1 = new ArrayList<HospitalData>();
    	
    	for (HospitalData i : listHospitalData) {
             if(i.getQtyO()>=fFlag) {
            	 listHospitalData1.add(i);
             }
         }
    	logger.debug("Leaving findByQtyO");
    	return ResponseEntity.ok(listHospitalData1);
    }
	
	@RequestMapping(value = "/find-hospital-by-sign-up-date", method = RequestMethod.GET)
    public ResponseEntity<?> findBySignUpDate(@RequestParam("sign_up_date") String sSignUpDate){
    	logger.debug("Inside findBySignUpDate");
    	logger.debug("signUpDate " + sSignUpDate);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findBySignUpDate(sSignUpDate);
    	logger.debug("listHospitalData " + listHospitalData.size());
    	logger.debug("Leaving findBySignUpDate");
    	return ResponseEntity.ok(listHospitalData);
    }
	
	@RequestMapping(value = "/find-hospital-by-status", method = RequestMethod.GET)
    public ResponseEntity<?> findByStatus(@RequestParam("status") String sStatus){
    	logger.debug("Inside findByStatus");
    	logger.debug("sStatus " + sStatus);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByStatus(sStatus);
    	logger.debug("listHospitalData " + listHospitalData.size());
    	logger.debug("Leaving findByStatus");
    	return ResponseEntity.ok(listHospitalData);
    }
    
    @RequestMapping(value = "/delete-hospital",method=RequestMethod.GET)
    public String hospitalDelete(@RequestParam("email") String sEmailId){
    	logger.debug("Inside hospitalDelete");
    	
    	String msg;
    	HospitalData hospitalData = new HospitalData();
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
    	if(listHospitalData.size()!=0) {
    		listHospitalData.get(0).setStatus("inactive");
    		hospitalDataService.update(listHospitalData.get(0));
    		logger.debug("Leaving hospitalDelete");
    		return "bloodnet/login";
    	}
    	else {
    		logger.debug("Leaving hospitalDelete");
    		return "";
    	}
    	
    }
    
    @RequestMapping(value = "/hospital-update",method=RequestMethod.POST)
    public String hospitalUpdate(@RequestParam(value="hospital_id",required = false) Integer iHospitalId,
    		 							  @RequestParam(value = "name") String sName,
										  @RequestParam(value = "email",required=true) String sEmailId,
										  @RequestParam(value = "phone_number") String sPhoneNumber,
										  @RequestParam(value = "qty_a") String sQtyA,
										  @RequestParam(value = "qty_b") String sQtyB,
										  @RequestParam(value = "qty_ab") String sQtyAB,
										  @RequestParam(value = "qty_o") String sQtyO,
										  @RequestParam(value = "update",required=false) String sUpdate ,
			        					  @RequestParam(value = "cancel",required=false) String sCancel,
			        					  Model model
										  ){
    	logger.debug("Inside hospitalUpdate");
    	logger.debug(sName);
    	logger.debug(sEmailId);
    	logger.debug(sPhoneNumber);
    	logger.debug(sQtyA);
    	logger.debug(sQtyB);
    	logger.debug(sQtyAB);
    	logger.debug(sQtyO);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
    	logger.debug(listHospitalData.get(0));
    	
    	if(sUpdate != null){
    		if(!sName.isEmpty()) {
        		listHospitalData.get(0).setName(sName);
        	}
        	if(!sPhoneNumber.isEmpty()) {
        		listHospitalData.get(0).setPhoneNumber(sPhoneNumber);
        	}
        	if(!sQtyA.isEmpty()) {
        		float fQtyA=Float.parseFloat(sQtyA);  
        		listHospitalData.get(0).setQtyA(fQtyA);
        	}
        	if(!sQtyB.isEmpty()) {
        		float fQtyB=Float.parseFloat(sQtyB);  
        		listHospitalData.get(0).setQtyB(fQtyB);
        	}
        	if(!sQtyAB.isEmpty()) {
        		float fQtyAB=Float.parseFloat(sQtyAB);  
        		listHospitalData.get(0).setQtyAb(fQtyAB);
        	}
        	if(!sQtyO.isEmpty()) {
        		float fQtyO=Float.parseFloat(sQtyO);  
        		listHospitalData.get(0).setQtyO(fQtyO);
        	}
        	hospitalDataService.update(listHospitalData.get(0));
    	}
    	
    	model.addAttribute("name", listHospitalData.get(0).getName());
    	model.addAttribute("phno", listHospitalData.get(0).getPhoneNumber());
    	model.addAttribute("qtyA", listHospitalData.get(0).getQtyA());
    	model.addAttribute("qtyB", listHospitalData.get(0).getQtyB());
    	model.addAttribute("qtyAB", listHospitalData.get(0).getQtyAb());
    	model.addAttribute("qtyO", listHospitalData.get(0).getQtyO());
    	model.addAttribute("email", sEmailId);
    	logger.debug("Leaving hospitalUpdate");
    	
    	return "bloodnet/hospitalinfoupdate";
    }
    
    @RequestMapping(value = "/hospital-password-update",method=RequestMethod.POST)
    public String hospitalPasswordUpdate(@RequestParam(value = "email") String sEmailId,
    									 @RequestParam(value = "password",required=true) String sPassword,
    									 @RequestParam(value = "new_password1",required=true) String sNewPassword1,
    							         @RequestParam(value = "new_password2",required=true) String sNewPassword2,
    							         @RequestParam(value = "update",required=false) String sUpdate ,
      				        		     @RequestParam(value = "cancel",required=false) String sCancel,
      								     Model model
										  ){
    	logger.debug("Inside hospitalPasswordUpdate");
    	logger.debug(sEmailId);
    	logger.debug(sPassword);
    	logger.debug(sNewPassword1);
    	logger.debug(sNewPassword2);
    	
    	String msg;
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
    	logger.debug(listHospitalData.get(0));
    	if(sUpdate != null){
    		if(!listHospitalData.isEmpty()) {
        		if(listHospitalData.get(0).getPassword().equals(sPassword)){
        			if(sNewPassword1.equals(sNewPassword2)) {
        				listHospitalData.get(0).setPassword(sNewPassword1);
        				hospitalDataService.update(listHospitalData.get(0));
        				logger.debug(listHospitalData.get(0).getPassword());
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
    	
    	logger.debug("Leaving hospitalPasswordUpdate");
    	model.addAttribute("name", listHospitalData.get(0).getName());
    	model.addAttribute("phno", listHospitalData.get(0).getPhoneNumber());
    	model.addAttribute("qtyA", listHospitalData.get(0).getQtyA());
    	model.addAttribute("qtyB", listHospitalData.get(0).getQtyB());
    	model.addAttribute("qtyAB", listHospitalData.get(0).getQtyAb());
    	model.addAttribute("qtyO", listHospitalData.get(0).getQtyO());
    	model.addAttribute("email", sEmailId);
    	logger.debug("Leaving hospitalUpdate");
    	
    	return "bloodnet/hospitalinfoupdate";
    }
    
    @RequestMapping(value = "/hospital-email-id-update",method=RequestMethod.POST)
    public String hospitalEmailIdUpdate(@RequestParam(value = "phone_number",required=true) String sPhoneNumber,
    									@RequestParam(value = "email_id",required=true) String sEmailId,
    									@RequestParam(value = "email_id1",required=true) String sEmailId1,
    									@RequestParam(value = "email_id2",required=true) String sEmailId2,
    									@RequestParam(value = "update",required=false) String sUpdate ,
     				        		    @RequestParam(value = "cancel",required=false) String sCancel,
     								    Model model
										  ){
    	logger.debug("Inside hospitalEmailIdUpdate");
    	logger.debug(sPhoneNumber);
    	logger.debug(sEmailId);
    	logger.debug(sEmailId1);
    	logger.debug(sEmailId2);
    	
    	String msg;
    	List<HospitalData> listHospitalData = hospitalDataService.findByPhoneNumber(sPhoneNumber);
    	logger.debug(listHospitalData.get(0));
    	if(sUpdate != null){
    		if(!listHospitalData.isEmpty()) {
        		if(listHospitalData.get(0).getEmailId().equals(sEmailId)){
        			if(sEmailId1.equals(sEmailId2)) {
        				listHospitalData.get(0).setEmailId(sEmailId1);
        				hospitalDataService.update(listHospitalData.get(0));
        				logger.debug(listHospitalData.get(0).getEmailId());
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
        		msg="Phone Number not found";
        	}
    	}
    	
    	logger.debug("Leaving hospitalEmailIdUpdate");
    	return "bloodnet/hospitalinfoupdate";
    }
    
    
    @RequestMapping(value = "/hospital-qtyA-update",method=RequestMethod.PATCH)
    public ResponseEntity<?> hospitalQtyAUpdate(@RequestParam(value = "email_id",required=true) String sEmailId,
										    @RequestParam(value = "password",required=true) String sPassword,
										    @RequestParam(value = "qtyA",required=true) Float fQtyA
										  ){
    	logger.debug("Inside hospitalQtyAUpdate");
    	
    	
    	logger.debug(sEmailId);
    	logger.debug(sPassword);
    	logger.debug(fQtyA);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
    	logger.debug(listHospitalData.get(0));
    	String msg;
    	if(!listHospitalData.isEmpty()) {
    		if(listHospitalData.get(0).getPassword().equals(sPassword)) {
        		Float qtyA = listHospitalData.get(0).getQtyA();
        		qtyA += fQtyA;
        		listHospitalData.get(0).setQtyA(qtyA);
        		msg="Succesfully updated";
        	}
        	else {
        		msg="Wrong Password";
        	}
    	}
    	else {
    		msg="EmailId not found";
    	}
    		
    	
    	
    	
    	hospitalDataService.update(listHospitalData.get(0));
    	logger.debug("Leaving hospitalQtyAUpdate");
    	
    	return ResponseEntity.ok(msg);
    }
    
    @RequestMapping(value = "/hospital-qtyB-update",method=RequestMethod.PATCH)
    public ResponseEntity<?> hospitalQtyBUpdate(@RequestParam(value = "email_id",required=true) String sEmailId,
										    @RequestParam(value = "password",required=true) String sPassword,
										    @RequestParam(value = "qtyB",required=true) Float fQtyB
										  ){
    	logger.debug("Inside hospitalQtyBUpdate");
    	
    	
    	logger.debug(sEmailId);
    	logger.debug(sPassword);
    	logger.debug(fQtyB);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
    	logger.debug(listHospitalData.get(0));
    	String msg;
    	if(!listHospitalData.isEmpty()) {
    		if(listHospitalData.get(0).getPassword().equals(sPassword)) {
        		Float qtyB = listHospitalData.get(0).getQtyB();
        		qtyB += fQtyB;
        		listHospitalData.get(0).setQtyB(qtyB);
        		msg="Succesfully updated";
        	}
        	else {
        		msg="Wrong Password";
        	}
    	}
    	else {
    		msg="EmailId not found";
    	}
        hospitalDataService.update(listHospitalData.get(0));
    	logger.debug("Leaving hospitalQtyBUpdate");
    	
    	return ResponseEntity.ok(msg);
    }
    
    @RequestMapping(value = "/hospital-qtyAB-update",method=RequestMethod.PATCH)
    public ResponseEntity<?> hospitalQtyABUpdate(@RequestParam(value = "email_id",required=true) String sEmailId,
										    @RequestParam(value = "password",required=true) String sPassword,
										    @RequestParam(value = "qtyAB",required=true) Float fQtyAB
										  ){
    	logger.debug("Inside hospitalQtyABUpdate");
    	
    	
    	logger.debug(sEmailId);
    	logger.debug(sPassword);
    	logger.debug(fQtyAB);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
    	logger.debug(listHospitalData.get(0));
    	String msg;
    	if(!listHospitalData.isEmpty()) {
    		if(listHospitalData.get(0).getPassword().equals(sPassword)) {
        		Float qtyAB = listHospitalData.get(0).getQtyAb();
        		qtyAB += fQtyAB;
        		listHospitalData.get(0).setQtyAb(qtyAB);
        		msg="Succesfully updated";
        	}
        	else {
        		msg="Wrong Password";
        	}
    	}
    	else {
    		msg="EmailId not found";
    	}
    	hospitalDataService.update(listHospitalData.get(0));
    	logger.debug("Leaving hospitalQtyABUpdate");
    	
    	return ResponseEntity.ok(msg);
    }
    
    @RequestMapping(value = "/hospital-qtyO-update",method=RequestMethod.PATCH)
    public ResponseEntity<?> hospitalQtyOUpdate(@RequestParam(value = "email_id",required=true) String sEmailId,
										    @RequestParam(value = "password",required=true) String sPassword,
										    @RequestParam(value = "qtyO",required=true) Float fQtyO
										  ){
    	logger.debug("Inside hospitalQtyOUpdate");
    	
    	
    	logger.debug(sEmailId);
    	logger.debug(sPassword);
    	logger.debug(fQtyO);
    	
    	List<HospitalData> listHospitalData = hospitalDataService.findByEmailId(sEmailId);
    	logger.debug(listHospitalData.get(0));
    	String msg;
    	if(!listHospitalData.isEmpty()) {
    		if(listHospitalData.get(0).getPassword().equals(sPassword)) {
        		Float qtyO = listHospitalData.get(0).getQtyO();
        		qtyO += fQtyO;
        		listHospitalData.get(0).setQtyO(qtyO);
        		msg="Succesfully updated";
        	}
        	else {
        		msg="Wrong Password";
        	}
    	}
    	else {
    		msg="EmailId not found";
    	}
        hospitalDataService.update(listHospitalData.get(0));
    	logger.debug("Leaving hospitalQtyOUpdate");
    	
    	return ResponseEntity.ok(msg);
    }
}