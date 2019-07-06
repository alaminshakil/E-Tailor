/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.shakil.etailor.model.Payment;
import com.shakil.etailor.service.CustomerinfoService;
import com.shakil.etailor.service.PaymentService;
import com.shakil.etailor.service.TailorinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.shakil.etailor.service.CustorderService;

/**
 *
 * @author alami
 */
@Controller
public class PaymentCtrl {

    @Autowired
    PaymentService ps;
    @Autowired
    CustorderService os;
    @Autowired
    CustomerinfoService cs;
    @Autowired
    TailorinfoService tis;

    @RequestMapping("/showpaymentpage")
    public ModelAndView showpayment() {
        String payment = ps.viewPayment();
        String order = os.viewOrder();
        String customer = cs.viewCustomer();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/payment", "PaymentObject", new Payment());
        mv.addObject("pList", payment);
        mv.addObject("oList", order);
        mv.addObject("cList", customer);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingpayment", params = "Add")
    public String addsubject(@ModelAttribute("PaymentObject") Payment p) {
        ps.insertPayment(p);
        return "redirect:/showpaymentpage";
    }
    @RequestMapping(value = "/addingpayment", params = "Edit")
    public String editarea(@ModelAttribute("PaymentObject") Payment p) {
        ps.updatePayment(p);
        return "redirect:/showpaymentpage";
    }
    @RequestMapping("removepayment/{Id}")
    public String removearea(@PathVariable("Id") int payid) {
        ps.deletePayment(payid);
        return "redirect:/showpaymentpage";
    }
     @RequestMapping("/editpayment")
    public ModelAndView passingonepayment(@RequestParam("getpayid") int payid) {
        Payment p = ps.viewOnePayment(payid);
        String payment = ps.viewPayment();
        String order = os.viewOrder();
        String customer = cs.viewCustomer();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/payment", "PaymentObject", p);
        mv.addObject("pList", payment);
        mv.addObject("oList", order);
        mv.addObject("cList", customer);
        mv.addObject("tList", tailor);
        mv.addObject("check", "false");
        return mv;
    }
    
}
