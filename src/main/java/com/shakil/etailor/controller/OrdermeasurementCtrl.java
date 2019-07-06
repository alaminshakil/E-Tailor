/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.shakil.etailor.model.Ordermeasurement;
import com.shakil.etailor.service.ItemService;
import com.shakil.etailor.service.MeasurementService;
import com.shakil.etailor.service.OrderMeasurementService;
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
public class OrdermeasurementCtrl {

    @Autowired
    OrderMeasurementService oms;
    @Autowired
    CustorderService os;
    @Autowired
    ItemService is;
    @Autowired
    MeasurementService ms;

    @RequestMapping("/showordermspage")
    public ModelAndView showorderms() {
        String orderms = oms.viewOrdermeasurement();
        String order = os.viewOrder();
        String item = is.viewItem();
        String measurement = ms.viewMeasurement();
        ModelAndView mv = new ModelAndView("admin/ordermeasurement", "OMsObject", new Ordermeasurement());
        mv.addObject("odmList", orderms);
        mv.addObject("oList", order);
        mv.addObject("iList", item);
        mv.addObject("mList", measurement);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingorderms", params = "Add")
    public String addorderms(@ModelAttribute("OMsObject") Ordermeasurement om) {
        oms.insertOrdermeasurement(om);
        return "redirect:/showordermspage";
    }

    @RequestMapping(value = "/addingorderms", params = "Edit")
    public String editorderms(@ModelAttribute("OMsObject") Ordermeasurement om) {
        oms.updateOrdermeasurement(om);
        return "redirect:/showordermspage";
    }

    @RequestMapping("removeorderms/{Id}")
    public String removeorderms(@PathVariable("Id") int ormeaid) {
        oms.deleteOrdermeasurement(ormeaid);
        return "redirect:/showordermspage";
    }

    @RequestMapping("/editorderms")
    public ModelAndView passingoneorderms(@RequestParam("getormeaid") int ormeaid) {
        Ordermeasurement odms = oms.viewOneOrdermeasurement(ormeaid);
        String orderms = oms.viewOrdermeasurement();
        String order = os.viewOrder();
        String item = is.viewItem();
        String measurement = ms.viewMeasurement();
        ModelAndView mv = new ModelAndView("admin/ordermeasurement", "OMsObject", odms);
        mv.addObject("odmList", orderms);
        mv.addObject("oList", order);
        mv.addObject("iList", item);
        mv.addObject("mList", measurement);
        mv.addObject("check", "false");
        return mv;
    }
}
