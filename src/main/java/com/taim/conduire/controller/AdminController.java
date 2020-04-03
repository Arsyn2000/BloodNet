package com.taim.conduire.controller;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.domain.AccountData;

@Controller
@RequestMapping("/admin")
@Validated
public class AdminController {
	private static final Logger logger = LogManager.getLogger();
    
    @PersistenceContext
    private EntityManager entityManager;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String view(Model model) {
    	AccountData accountData = CommonHelper.getAccount();
    	model.addAttribute("accountData", accountData);
        return "admin/dashboard";
    }

}