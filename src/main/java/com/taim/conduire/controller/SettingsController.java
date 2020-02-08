
package com.taim.conduire.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.taim.conduire.constants.ConstantCodes;

@Controller
@Validated
public class SettingsController {
	private static final Logger logger = LogManager.getLogger();
	
	
	@RequestMapping(value = "customer/settings", method = RequestMethod.GET)
    public String customerIndex(Model model) {
    	model.addAttribute("menu", "Setting");
    
    	return "customer/settings";
    }
    
   
}