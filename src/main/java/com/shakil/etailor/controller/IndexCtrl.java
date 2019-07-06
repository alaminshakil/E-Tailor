package com.shakil.etailor.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexCtrl {

    @RequestMapping(value = "/")
    public String indexPage(ModelMap map) {
        return "public/main";
    }

      @RequestMapping(value = "/adminpanel")
    public String adminPanel(ModelMap map) {
        Date d = new Date();
        SimpleDateFormat si = new SimpleDateFormat("hh:mm:ss a");
        map.addAttribute("time", si.format(d));
        return "admin";
    }
    
//    @RequestMapping(value = "/tailorpanel")
//    public String tailorPanel(ModelMap map) {
//        Date d = new Date();
//        SimpleDateFormat si = new SimpleDateFormat("hh:mm:ss a");
//        map.addAttribute("time", si.format(d));
//        return "tailor";
//    }
    
    @RequestMapping(value = "/customerpanel")
    public String customerPanel(ModelMap map) {
        Date d = new Date();
        SimpleDateFormat si = new SimpleDateFormat("hh:mm:ss a");
        map.addAttribute("time", si.format(d));
        return "customer";
    }  
    
}
