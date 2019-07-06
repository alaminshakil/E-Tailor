/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.shakil.etailor.model.Febric;
import com.shakil.etailor.service.FebricService;
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
public class FebricCtrl {

    @Autowired
    FebricService fs;
    @Autowired
    ItemService is;
    @Autowired
    TailorinfoService tis;

    @RequestMapping("/showfebricpage")
    public ModelAndView showtailor() {
        String febric = fs.viewFebric();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/febric", "FebricObject", new Febric());
        mv.addObject("fList", febric);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/febricadd", params = "Add")
    public String addfebric(@ModelAttribute("FebricObject") Febric f) {
        fs.insertFebric(f);
        return "redirect:/showfebricpage";
    }

    @RequestMapping(value = "/febricadd", params = "Edit")
    public String editfebric(@ModelAttribute("FebricObject") Febric f) {
        fs.updateFebric(f);
        return "redirect:/showfebricpage";
    }

    @RequestMapping("removingfebric/{Id}")
    public String removefebric(@PathVariable("Id") int febricid) {
        fs.deleteFebric(febricid);
        return "redirect:/showfebricpage";
    }

    @RequestMapping("/editingfebric")
    public ModelAndView passingonefebric(@RequestParam("getfebricid") int febricid) {
        Febric fb = fs.viewOneFebric(febricid);
        String febric = fs.viewFebric();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/febric", "FebricObject", fb);
        mv.addObject("fList", febric);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "false");
        return mv;
    }
}
