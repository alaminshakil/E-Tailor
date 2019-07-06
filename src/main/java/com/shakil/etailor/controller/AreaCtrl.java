package com.shakil.etailor.controller;

import com.shakil.etailor.model.Area;
import com.shakil.etailor.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.shakil.etailor.service.Zoneservice;

@Controller
public class AreaCtrl {

    @Autowired
    AreaService as;
    @Autowired
    Zoneservice zs;

    @RequestMapping("/showareapage")
    public ModelAndView showarea() {
        String area = as.viewArea();
        String zone = zs.viewZone();
        ModelAndView mv = new ModelAndView("admin/addarea", "AreaObject", new Area());
        mv.addObject("aList", area);
        mv.addObject("zList", zone);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingarea", params = "Add")
    public String addarea(@ModelAttribute("AreaObject") Area s) {
        as.insertArea(s);
        return "redirect:/showareapage";
    }

    @RequestMapping(value = "/addingarea", params = "Edit")
    public String editarea(@ModelAttribute("AreaObject") Area s) {
        as.updateArea(s);
        return "redirect:/showareapage";
    }

    @RequestMapping("removearea/{Id}")
    public String removearea(@PathVariable("Id") int areaId) {
        as.deleteArea(areaId);
        return "redirect:/showareapage";
    }

    @RequestMapping("/editareabutton")
    public ModelAndView passingonearea(@RequestParam("getareaid") int areaid) {
        Area ar = as.viewOneArea(areaid);
        String area = as.viewArea();
        String zone = zs.viewZone();
        ModelAndView mv = new ModelAndView("admin/addarea", "AreaObject", ar);
        mv.addObject("aList", area);
        mv.addObject("zList", zone);
        mv.addObject("check", "false");
        return mv;
    }
}
