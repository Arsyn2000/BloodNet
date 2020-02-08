package com.taim.conduire.controller;

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.domain.AccountData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    

    @RequestMapping(value = {"/", "index", "index.html"})
    public String getHome(final HttpSession httpSession) {
        final AccountData accountData = CommonHelper.getAccount();
        if (accountData == null) {
            return "redirect:/login";
        }
        httpSession.setAttribute("pId", accountData.getId());

        return "redirect:/" + accountData.getAccountType().toLowerCase() ;
    }
}