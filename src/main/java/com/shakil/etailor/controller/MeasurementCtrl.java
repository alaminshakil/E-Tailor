/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.shakil.etailor.model.Measurement;
import com.shakil.etailor.service.ItemService;
import com.shakil.etailor.service.MeasurementService;
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
public class MeasurementCtrl {

    @Autowired
    MeasurementService ms;
    @Autowired
    ItemService is;
    @Autowired
    TailorinfoService tis;

    @RequestMapping("/showmsntpage")
    public ModelAndView showmsnt() {
        String msnt = ms.viewMeasurement();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/measurement", "MsntObject", new Measurement());
        mv.addObject("msntList", msnt);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/msntadd", params = "Add")
    public String addmsnt(@ModelAttribute("MsntObject") Measurement m) {
        ms.insertMeasurement(m);
        return "redirect:/showmsntpage";
    }

    @RequestMapping(value = "/msntadd", params = "Edit")
    public String editmsnt(@ModelAttribute("MsntObject") Measurement m) {
        ms.updateMeasurement(m);
        return "redirect:/showmsntpage";
    }

    @RequestMapping("removemsnt/{Id}")
    public String removemsnt(@PathVariable("Id") int measurementId) {
        ms.deleteMeasurement(measurementId);
        return "redirect:/showmsntpage";
    }

    @RequestMapping("/editmsnt")
    public ModelAndView passingonearea(@RequestParam("getmeasurementid") int measurementid) {
        Measurement m = ms.viewOneMeasurement(measurementid);
        String msnt = ms.viewMeasurement();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("admin/measurement", "MsntObject", m);
        mv.addObject("msntList", msnt);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "false");
        return mv;
    }
}
