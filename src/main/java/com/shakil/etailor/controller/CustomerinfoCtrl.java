
package com.shakil.etailor.controller;



import com.shakil.etailor.model.Customerinfo;
import com.shakil.etailor.service.AreaService;
import com.shakil.etailor.service.CustomerinfoService;
import com.shakil.etailor.service.Zoneservice;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author alamin
 */
@Controller
public class CustomerinfoCtrl {

    @Autowired
    CustomerinfoService cis;
    @Autowired
    AreaService as;
    @Autowired
    Zoneservice zs;

    @RequestMapping("/showcustomerpage")
    public ModelAndView showtrpage() {
        String customerlist = cis.viewCustomer();
        String areaList = as.viewArea();
        String zoneList = zs.viewZone();
        ModelAndView mv = new ModelAndView("admin/addcustomer", "newCustomerObject", new Customerinfo());
        mv.addObject("customerlist", customerlist);
        mv.addObject("arealist",areaList);
        mv.addObject("zonelist",zoneList);
        mv.addObject("check", "true");
        return mv;
    }
    
     @RequestMapping(value = "/customeradd", params = "Add")
    public String addareapage(@ModelAttribute("newCustomerObject") Customerinfo tr, HttpServletRequest request) {
        cis.insertCustomer(tr);
        return "redirect:/showcustomerpage";
    }
    @RequestMapping(value = "/customeradd", params = "Edit")
    public String editareapage(@ModelAttribute("newCustomerObject") Customerinfo ti, HttpServletRequest request) {
        cis.updateCustomer(ti);
        return "redirect:/showcustomerpage";
    }
     @RequestMapping("removingcustomer/{custId}")
    public String removearea(@PathVariable("custId") int custid) {
        cis.deleteCustomer(custid);
        return "redirect:/showcustomerpage";
    }
    

    
    @RequestMapping("/editingcustomer")
    public ModelAndView edittailorpage(@RequestParam("getcustid") int custid) {
        String customerlist = cis.viewCustomer();
        String areaList = as.viewArea();
        String zoneList = zs.viewZone();
        ModelAndView mv = new ModelAndView("admin/addcustomer", "newCustomerObject", cis.viewOneCustomer(custid));
        mv.addObject("customerlist", customerlist);
        mv.addObject("arealist",areaList);
        mv.addObject("zonelist",zoneList);
        mv.addObject("check", "false");
        return mv;
    }
    
}
