package com.taim.conduire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/client2")
@Validated
public class ClientController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
    public String view(Model model) {
        return "client/index";
    }

	
}