/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.shakil.etailor.model.Custorder;
import com.shakil.etailor.model.Febric;
import com.shakil.etailor.model.Item;
import com.shakil.etailor.model.Measurement;
import com.shakil.etailor.model.Ordermeasurement;
import com.shakil.etailor.model.Payment;
import com.shakil.etailor.service.AreaService;
import com.shakil.etailor.service.CustomerinfoService;
import com.shakil.etailor.service.CustorderService;
import com.shakil.etailor.service.FebricService;
import com.shakil.etailor.service.ItemService;
import com.shakil.etailor.service.MeasurementService;
import com.shakil.etailor.service.OrderMeasurementService;
import com.shakil.etailor.service.PaymentService;
import com.shakil.etailor.service.TailorinfoService;
import com.shakil.etailor.service.Zoneservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author alami
 */
@Controller
public class TailorCtrl {

    @Autowired
    CustomerinfoService cis;
    @Autowired
    AreaService as;
    @Autowired
    Zoneservice zs;
    @Autowired
    ItemService is;
    @Autowired
    TailorinfoService tis;
    @Autowired
    FebricService fs;
    @Autowired
    MeasurementService ms;
    @Autowired
    OrderMeasurementService oms;
    @Autowired
    CustorderService os;
     @Autowired
    PaymentService ps;
     @Autowired
    CustomerinfoService cs;
    
    
      @RequestMapping("/tailoritem")
    public ModelAndView showitem() {
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("tailor/item", "ItemObject", new Item());
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }
     @RequestMapping("/tailorfebric")
    public ModelAndView showtailor() {
        String febric = fs.viewFebric();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("tailor/febric", "FebricObject", new Febric());
        mv.addObject("fList", febric);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }
     @RequestMapping("/tailormsnt")
    public ModelAndView showmsnt() {
        String msnt = ms.viewMeasurement();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("tailor/measurement", "MsntObject", new Measurement());
        mv.addObject("msntList", msnt);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }
    
    @RequestMapping("/tailormsntdetail")
    public ModelAndView showorderms() {
        String orderms = oms.viewOrdermeasurement();
        String order = os.viewOrder();
        String item = is.viewItem();
        String measurement = ms.viewMeasurement();
        ModelAndView mv = new ModelAndView("tailor/ordermeasurement", "OMsObject", new Ordermeasurement());
        mv.addObject("odmList", orderms);
        mv.addObject("oList", order);
        mv.addObject("iList", item);
        mv.addObject("mList", measurement);
        mv.addObject("check", "true");
        return mv;
    }
    @RequestMapping("/tailorpayment")
    public ModelAndView showpayment() {
        String payment = ps.viewPayment();
        String order = os.viewOrder();
        String customer = cs.viewCustomer();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("tailor/payment", "PaymentObject", new Payment());
        mv.addObject("pList", payment);
        mv.addObject("oList", order);
        mv.addObject("cList", customer);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }
     @RequestMapping("/tailorpanel")
    public ModelAndView showorder() {
        String order = os.viewOrder();
        String cust = cs.viewCustomer();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("/tailor", "OrderObject", new Custorder());
        mv.addObject("oList", order);
        mv.addObject("cList", cust);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }
    @RequestMapping(value = "/tailorprofile")
    public String custProfilePage(ModelMap map) {
        return "tailor/tailorprofile";
    } 
    
}
