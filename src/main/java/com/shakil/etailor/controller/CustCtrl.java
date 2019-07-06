/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.controller;

import com.google.gson.Gson;
import com.shakil.etailor.model.Area;
import com.shakil.etailor.model.Custorder;
import com.shakil.etailor.model.Febric;
import com.shakil.etailor.model.Item;
import com.shakil.etailor.model.Measurement;
import com.shakil.etailor.model.Ordermeasurement;
import com.shakil.etailor.model.Payment;
import com.shakil.etailor.model.Tailorinfo;
import com.shakil.etailor.model.Zone;
import com.shakil.etailor.service.AreaService;
import com.shakil.etailor.service.CustomerinfoService;
import com.shakil.etailor.service.CustorderService;
import com.shakil.etailor.service.FebricService;
import com.shakil.etailor.service.ItemService;
import com.shakil.etailor.service.MeasurementService;
import com.shakil.etailor.service.OrderMeasurementService;
import com.shakil.etailor.service.PaymentService;
import com.shakil.etailor.service.TailorinfoService;
import com.shakil.etailor.service.Zoneservice;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author alami
 */
@Controller
public class CustCtrl {

    @Autowired
    CustomerinfoService cis;
    @Autowired
    AreaService as;
    @Autowired
    Zoneservice zs;
    @Autowired
    ItemService is;
    @Autowired
    TailorinfoService tis;
    @Autowired
    FebricService fs;
    @Autowired
    MeasurementService ms;
    @Autowired
    OrderMeasurementService oms;
    @Autowired
    CustorderService os;
    @Autowired
    PaymentService ps;

    @RequestMapping("/selectzone")
    public ModelAndView showzspage() {
        String zonegsonlist = zs.viewZone();
        ModelAndView mv = new ModelAndView("customer/addzone", "addZoneObject1", new Zone());
        mv.addObject("zonemodelobject", zonegsonlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/selectarea")
    public ModelAndView showarea() {
        String area = as.viewArea();
        String zone = zs.viewZone();
        ModelAndView mv = new ModelAndView("customer/addarea", "AreaObject", new Area());
        mv.addObject("aList", area);
        mv.addObject("zList", zone);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/selectitem")
    public ModelAndView showitem() {
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("customer/item", "ItemObject", new Item());
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/selectfebric")
    public ModelAndView showtailor() {
        String febric = fs.viewFebric();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("customer/febric", "FebricObject", new Febric());
        mv.addObject("fList", febric);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/selecttailor")
    public ModelAndView showtrpage() {
        String tailorgsonlist = tis.viewTailor();
        String areaList = as.viewArea();
        String zoneList = zs.viewZone();
        ModelAndView mv = new ModelAndView("customer/addtailor", "newTailorObject", new Tailorinfo());
        mv.addObject("tailormodelobject", tailorgsonlist);
        mv.addObject("arealist", areaList);
        mv.addObject("zonelist", zoneList);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/selectmsnt")
    public ModelAndView showmsnt() {
        String msnt = ms.viewMeasurement();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("customer/measurement", "MsntObject", new Measurement());
        mv.addObject("msntList", msnt);
        mv.addObject("iList", item);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/selectmsntdetail")
    public ModelAndView showorderms() {
        String orderms = oms.viewOrdermeasurement();
        String order = os.viewOrder();
        String item = is.viewItem();
        String measurement = ms.viewMeasurement();
        ModelAndView mv = new ModelAndView("customer/ordermeasurement", "OMsObject", new Ordermeasurement());
        mv.addObject("odmList", orderms);
        mv.addObject("oList", order);
        mv.addObject("iList", item);
        mv.addObject("mList", measurement);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/selectpayment")
    public ModelAndView showpayment() {
        String payment = ps.viewPayment();
        String order = os.viewOrder();
        String customer = cis.viewCustomer();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("customer/payment", "PaymentObject", new Payment());
        mv.addObject("pList", payment);
        mv.addObject("oList", order);
        mv.addObject("cList", customer);
        mv.addObject("tList", tailor);
        mv.addObject("check", "true");
        return mv;
    }
    
    
    //zone Selected
    @RequestMapping("/selectZoneBtn")
    public ModelAndView processZoneid(@RequestParam("getZoneId") int zoneid, HttpSession session) {
        Zone zoneSelected = zs.viewOneZone(zoneid);
        session.setAttribute("zoneSelected", zoneSelected);
        List<Area> arealistbyzone = as.showAreaByZoneId(zoneid);
        Gson g = new Gson();
        String area = as.viewArea();
        String zone = zs.viewZone();
        ModelAndView mv = new ModelAndView("customer/addarea", "AreaObject", new Area());
        mv.addObject("aList", area);
        mv.addObject("zList", zone);
        mv.addObject("check", "true");
        String alistgson = g.toJson(arealistbyzone);
        mv.addObject("alistgson", alistgson);
        
        return mv;
        //return "redirect:/selectarea";
    }
     @RequestMapping("/selectAreaBtn")
    public ModelAndView processAreaid(@RequestParam("getAreaId") int areaid, HttpSession session) {
        Area areaSelected = as.viewOneArea(areaid);
        session.setAttribute("areaSelected", areaSelected);
        List<Tailorinfo> tailorlistbyarea = tis.showTailorByAreaId(areaid);
        Gson g = new Gson();
        String tailor = tis.viewTailor();
        String zone = zs.viewZone();
        String area = as.viewArea();
        ModelAndView mv = new ModelAndView("customer/addtailor", "TailorObject", new Tailorinfo());
        mv.addObject("tList", tailor);
        mv.addObject("aList", area);
        mv.addObject("zList", zone);
        mv.addObject("check", "true"); 
        String tlistgson = g.toJson(tailorlistbyarea);
        mv.addObject("tlistgson", tlistgson);
        
        return mv;
    }

    @RequestMapping("/selectTailorBtn")
    public ModelAndView processTailorid(@RequestParam("getTailorId") int tailorid, HttpSession session) {
        Tailorinfo tailorSelected = tis.viewOneTailor(tailorid);
        session.setAttribute("tailorSelected", tailorSelected);
        List<Item> itemlistbytailor = is.showItemByTailorId(tailorid);
        Gson g = new Gson();
        String item = is.viewItem();
        String tailor = tis.viewTailor();
        ModelAndView mv = new ModelAndView("customer/item", "ItemObject", new Tailorinfo());
        mv.addObject("tList", tailor);
        mv.addObject("iList", item);
        mv.addObject("check", "true");
        String ilistgson = g.toJson(itemlistbytailor);
        mv.addObject("ilistgson", ilistgson);
        
        return mv;
    }   
    
    @RequestMapping("/selectItemBtn")
    public ModelAndView processItemid(@RequestParam("getItemId") int itemid, HttpSession session) {
        Item itemSelected = is.viewOneItem(itemid);
        session.setAttribute("itemSelected", itemSelected);
        List<Febric> febriclistbyitem = fs.showFebricByItemId(itemid);
        Gson g = new Gson();
        String febric = fs.viewFebric();
        String item = is.viewItem();
        ModelAndView mv = new ModelAndView("customer/febric", "FebricObject", new Febric());
        mv.addObject("fList", febric);
        mv.addObject("iList", item);
        mv.addObject("check", "true");
        String flistgson = g.toJson(febriclistbyitem);
        mv.addObject("flistgson", flistgson);
        
        return mv;
    }   
    @RequestMapping("/selectFebricBtn")
    public ModelAndView processFebricid(@RequestParam("getFebricId") int febricid, HttpSession session) {
        Febric febricSelected = fs.viewOneFebric(febricid);
        session.setAttribute("febricSelected", febricSelected);
        Gson g = new Gson();
        String febric = fs.viewFebric();
        String item = is.viewItem();
        ModelAndView mv = new ModelAndView("customer/order", "OrderObject", new Custorder());
        mv.addObject("fList", febric);
        mv.addObject("iList", item);
        mv.addObject("check", "true");
      
        return mv;
    }   
    
    @RequestMapping("/viewOrderByCustomer")
    public ModelAndView showorder(int custid, HttpSession session) {
        int cid=(int) session.getAttribute("custid");
        List<Custorder> orderbycust = os.SinglecustOrder(cid);
        Gson g = new Gson();
        ModelAndView mv = new ModelAndView("customer/custorder", "OrderObject", new Custorder());
        mv.addObject("check", "true");
        String orderbycustgson = g.toJson(orderbycust);
        mv.addObject("orderbycustgson", orderbycustgson);
        return mv;
    }

@RequestMapping(value = "/custprofile")
    public String custProfilePage(ModelMap map) {
        return "customer/custprofile";
    }    
}
