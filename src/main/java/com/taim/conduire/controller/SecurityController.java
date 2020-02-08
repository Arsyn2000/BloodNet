package com.taim.conduire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class SecurityController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@RequestParam(value = "error", defaultValue = "false") boolean error, Model model) {
        model.addAttribute("error", error);

        return "security/login";
    }

	@RequestMapping(value = "/thanks", method = RequestMethod.GET)
    public String thanks(Model model) {
        return "security/login";
    }

}