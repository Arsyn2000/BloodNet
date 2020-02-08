package com.taim.conduire.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taim.conduire.constants.ConstantCodes;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.dto.AccountDataDTO;
import com.taim.conduire.dto.aaData;
import com.taim.conduire.service.AccountDataService;

@Controller
@RequestMapping("/admin")
@Validated
public class AdminController {
	private static final Logger logger = LogManager.getLogger();
    
    @Autowired
    private AccountDataService accountDataService;
    
    @PersistenceContext
    private EntityManager entityManager;
    
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String view(Model model) {

        return "admin/shopifyorder";
    }

 

    @RequestMapping(value = "/check-unique-username", method = RequestMethod.GET)
    @ResponseBody
    public String checkUniqueUserName(@RequestParam("username") String username) {
        String resultStr = "";
        try {
            accountDataService.loadUserByUsername(username);
            resultStr += "User name (" + username + ") already exist";
        } catch (UsernameNotFoundException e) {
            resultStr += "User name (" + username + ") available";
        }
        return resultStr;
    }

    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String customerPage(Model model) {

        return "admin/customer";
    }

}