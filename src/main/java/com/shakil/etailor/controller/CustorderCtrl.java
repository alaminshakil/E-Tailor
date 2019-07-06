/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.shakil.etailor.model.Custorder;
import com.shakil.etailor.service.CustomerinfoService;
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
public class CustorderCtrl {

    @Autowired
    CustorderService os;
    @Autowired
    CustomerinfoService cs;
    @Autowired
    TailorinfoService tis;

    @RequestMapping("/showorderpage")
    public ModelAndView showorder() {
        String order = os.viewOrder();
        String cust = cs.viewCustomer();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/order", "OrderObject", new Custorder());
        mv.addObject("oList", order);
        mv.addObject("cList", cust);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingorder", params = "Add")
    public String addsorder(@ModelAttribute("OrderObject") Custorder o) {
        os.insertOrder(o);
        return "redirect:/";
    }

    @RequestMapping(value = "/addingorder", params = "Edit")
    public String editorder(@ModelAttribute("OrderObject") Custorder o) {
        os.updateOrder(o);
        return "redirect:/showorderpage";
    }

    @RequestMapping("removingorder/{Id}")
    public String removeorder(@PathVariable("Id") int orderId) {
        os.deleteOrder(orderId);
        return "redirect:/showorderpage";
    }

    @RequestMapping("/editorder")
    public ModelAndView passingoneorder(@RequestParam("getorderid") int orderid) {
//        Order o = ois.viewOneOrder(orderid);
        String order = os.viewOrder();
        String cust = cs.viewCustomer();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/order", "OrderObject", os.viewOneOrder(orderid));
        mv.addObject("oList", order);
        mv.addObject("cList", cust);
        mv.addObject("tList", tailor);
        mv.addObject("check", "false");
        return mv;
    }

}
