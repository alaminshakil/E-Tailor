/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.shakil.etailor.model.Item;
import com.shakil.etailor.service.ItemService;
import com.shakil.etailor.service.TailorinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author alami
 */
@Controller
public class ItemCtrl {

    @Autowired
    ItemService is;
    @Autowired
    TailorinfoService tis;

    @RequestMapping("/showitempage")
    public ModelAndView showitem() {
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/item", "ItemObject", new Item());
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingitem", params = "Add")
    public String additem(@ModelAttribute("ItemObject") Item i) {
        is.insertItem(i);
        return "redirect:/showitempage";
    }

    @RequestMapping(value = "/addingitem", params = "Edit")
    public String edititem(@ModelAttribute("ItemObject") Item i) {
        is.updateItem(i);
        return "redirect:/showitempage";
    }

    @RequestMapping("removeitem/{Id}")
    public String removeitem(@PathVariable("Id") int itemId) {
        is.deleteItem(itemId);
        return "redirect:/showitempage";
    }

    @RequestMapping("/edititem")
    public ModelAndView passingoneitem(@RequestParam("getitemid") int itemid) {
        Item i = is.viewOneItem(itemid);
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/item", "ItemObject", i);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "false");
        return mv;
    }

}
