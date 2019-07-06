package com.shakil.etailor.controller;

import com.shakil.etailor.model.Zone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.shakil.etailor.service.Zoneservice;

@Controller

public class ZoneController {

    @Autowired
    Zoneservice zs;

    @RequestMapping("/showingzonepage")
    public ModelAndView showzspage() {
        String zonegsonlist = zs.viewZone();
        ModelAndView mv = new ModelAndView("admin/addzone", "addZoneObject1", new Zone());
        mv.addObject("zonemodelobject", zonegsonlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingzone", params = "Addzone")
    public String addzone(@ModelAttribute("addZoneObject1") Zone u) {
        zs.insertZone(u);
        return "redirect:/showingzonepage";
    }

    @RequestMapping(value = "/addingzone", params = "Editzone")
    public String editzone(@ModelAttribute("addZoneObject1") Zone u) {
        zs.updateZone(u);
        return "redirect:/showingzonepage";
    }

    @RequestMapping("removezone/{zoneid}")
    public String removezone(@PathVariable("zoneid") int zoneid) {
        zs.deleteZone(zoneid);
        return "redirect:/showingzonepage";
    }

    @RequestMapping("/editzonebutton")
    public ModelAndView passingonezone(@RequestParam("getzoneid") int zoneid) {

        Zone onezone = zs.viewOneZone(zoneid);
        String zonegsonlist = zs.viewZone();
        ModelAndView mv = new ModelAndView("admin/addzone", "addZoneObject1", onezone);
        mv.addObject("zonemodelobject", zonegsonlist);
        mv.addObject("check", "false");
        return mv;
    }
}
