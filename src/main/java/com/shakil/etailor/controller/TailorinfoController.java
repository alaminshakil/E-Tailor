package com.shakil.etailor.controller;

import com.shakil.etailor.model.Tailorinfo;
import com.shakil.etailor.service.AreaService;
import com.shakil.etailor.service.TailorinfoService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.shakil.etailor.service.Zoneservice;

/**
 *
 * @author alamin
 */
@Controller
public class TailorinfoController {

    @Autowired
    TailorinfoService tis;
    @Autowired
    AreaService as;
    @Autowired
    Zoneservice zs;

    @RequestMapping("/showtailorpage")
    public ModelAndView showtrpage() {
        String tailorgsonlist = tis.viewTailor();
        String areaList = as.viewArea();
        String zoneList = zs.viewZone();
        ModelAndView mv = new ModelAndView("admin/addtailor", "newTailorObject", new Tailorinfo());
        mv.addObject("tailormodelobject", tailorgsonlist);
        mv.addObject("arealist", areaList);
        mv.addObject("zonelist", zoneList);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/tailoradd", params = "Add")
    public String addareapage(@ModelAttribute("newTailorObject") Tailorinfo tr, HttpServletRequest request) {
        tis.insertTailor(tr);
        return "redirect:/showtailorpage";
    }

    @RequestMapping(value = "/tailoradd", params = "Edit")
    public String editareapage(@ModelAttribute("newTailorObject") Tailorinfo ti, HttpServletRequest request) {
        tis.updateTailor(ti);
        return "redirect:/showtailorpage";
    }

    @RequestMapping("removingtailor/{tailorId}")
    public String removearea(@PathVariable("tailorId") int tailorid) {
        tis.deleteTailor(tailorid);
        return "redirect:/showtailorpage";
    }

//     @RequestMapping("/viewtailor")
//    public ModelAndView viewtailordata(@RequestParam("getId") int tailorid, HttpSession session) {
//        Gson g = new Gson();
//        String tailordata = g.toJson(tis.viewOneTailor(tailorid));
//        ModelAndView mv = new ModelAndView("tailorname");
//        mv.addObject("tailor", tailordata);
//        return mv;
//    }
    @RequestMapping("/editingtailor")
    public ModelAndView edittailorpage(@RequestParam("gettailorid") int tailorid) {
        String tailorgsonlist = tis.viewTailor();
        String areaList = as.viewArea();
        String zoneList = zs.viewZone();
        ModelAndView mv = new ModelAndView("admin/addtailor", "newTailorObject", tis.viewOneTailor(tailorid));
        mv.addObject("tailormodelobject", tailorgsonlist);
        mv.addObject("arealist", areaList);
        mv.addObject("zonelist", zoneList);
        mv.addObject("check", "false");
        return mv;
    }

}
