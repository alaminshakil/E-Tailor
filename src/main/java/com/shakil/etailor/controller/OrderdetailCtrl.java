/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.shakil.etailor.model.Orderdetail;
import com.shakil.etailor.service.FebricService;
import com.shakil.etailor.service.ItemService;
import com.shakil.etailor.service.OrderdetailService;
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
public class OrderdetailCtrl {

    @Autowired
    OrderdetailService ods;
    @Autowired
    CustorderService os;
    @Autowired
    FebricService fs;
    @Autowired
    ItemService is;

    @RequestMapping("/showorderdetailpage")
    public ModelAndView showarea() {
        String odt = ods.viewOrderdetail();
        String order = os.viewOrder();
        String item = is.viewItem();
        String febric = fs.viewFebric();

        ModelAndView mv = new ModelAndView("admin/orderdetail", "OrderdetailObject", new Orderdetail());
        mv.addObject("odtList", odt);
        mv.addObject("oList", order);
        mv.addObject("iList", item);
        mv.addObject("fList", febric);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingodt", params = "Add")
    public String addsubject(@ModelAttribute("OrderdetailObject") Orderdetail od) {
        ods.insertOrderdetail(od);
        return "redirect:/showorderdetailpage";
    }

    @RequestMapping(value = "/addingodt", params = "Edit")
    public String editarea(@ModelAttribute("OrderdetailObject") Orderdetail od) {
        ods.updateOrderdetail(od);
        return "redirect:/showorderdetailpage";
    }

    @RequestMapping("removeodt/{Id}")
    public String removearea(@PathVariable("Id") int detailid) {
        ods.deleteOrderdetail(detailid);
        return "redirect:/showorderdetailpage";
    }

    @RequestMapping("/editodt")
    public ModelAndView passingonearea(@RequestParam("getdetailid") int detailid) {
        Orderdetail od = ods.viewOneOrderdetail(detailid);
        String odt = ods.viewOrderdetail();
        String order = os.viewOrder();
        String item = is.viewItem();
        String febric = fs.viewFebric();
        ModelAndView mv = new ModelAndView("admin/orderdetail", "OrderdetailObject", od);
        mv.addObject("odtList", odt);
        mv.addObject("oList", order);
        mv.addObject("iList", item);
        mv.addObject("fList", febric);
        mv.addObject("check", "false");
        return mv;
    }

}
