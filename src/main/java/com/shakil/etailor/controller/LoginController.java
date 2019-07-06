package com.shakil.etailor.controller;

import com.shakil.etailor.model.User;
import com.shakil.etailor.service.CustomerinfoService;
import com.shakil.etailor.service.TailorinfoService;
import java.util.Collection;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.shakil.etailor.service.Userservice;

@Controller
public class LoginController {

    @Autowired
    Userservice user;
    @Autowired
    CustomerinfoService cis;
    @Autowired
    TailorinfoService tis;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLogin() {
        return "login";
    }

    @RequestMapping(value = "/loginsuccess")
    public String loginsuccess(HttpSession session) {
        System.out.println("success..........");
        String userid = SecurityContextHolder.getContext().getAuthentication().getName();
        User us = user.viewUser(userid);
        Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        String page = "";
        String rolea = "ROLE_ADMIN";
        String rolec = "ROLE_CUSTOMER";
        String rolet = "ROLE_TAILOR";
        for (GrantedAuthority authority : authorities) {

            if (authority.getAuthority().equals(rolea)) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("Userphone", us.getPhone());
                session.setAttribute("email", us.getEmailid());
                session.setAttribute("UserId", userid);
                page = "redirect:/adminpanel";

            } else if (authority.getAuthority().equals(rolec)) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("Userphone", us.getPhone());
                session.setAttribute("email", us.getEmailid());
                session.setAttribute("UserId", userid);
                session.setAttribute("customerinfo", cis.showOneCustomerbyEmail(userid));
                page = "redirect:/customerpanel";

            } else if (authority.getAuthority().equals(rolet)) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("Userphone", us.getPhone());
                session.setAttribute("email", us.getEmailid());
                session.setAttribute("UserId", userid);
                session.setAttribute("tailorinfo", tis.showOneTailorbyEmail(userid));

                page = "redirect:/tailorpanel";

            } else {
                return "redirect:/";
            }
        }
        return page;
    }
}
