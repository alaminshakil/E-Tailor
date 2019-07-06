package com.shakil.etailor.controller;

import com.shakil.etailor.dao.JasperReportDAO;
import com.shakil.etailor.reportmodel.ProductReport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author User
 */
@Controller
public class ReportController {
    //paybytailor
    @RequestMapping(value = "/reportView", method = RequestMethod.GET)
    public String loadSurveyPg(
            @ModelAttribute("reportInputForm") ProductReport reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "jasperreport/report";
    }
   
    @RequestMapping(value = "/reportView", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("reportInputForm") ProductReport reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "paybytailor";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int tailorid = reportInputForm.getTailorid();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("tailorid", tailorid);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    //tailorbyzone
     @RequestMapping(value = "/tailorByZone", method = RequestMethod.GET)
    public String tailorbyzone(
            @ModelAttribute("reportInputForm") ProductReport reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "jasperreport/report";
    }
    
    @RequestMapping(value = "/tailorByZone", method = RequestMethod.POST)
    public String generatetbzReport(@ModelAttribute("reportInputForm") ProductReport reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "tailorbyzone";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int zoneid = reportInputForm.getZoneid();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("zoneid", zoneid);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    //tailorbypayoption
    
     @RequestMapping(value = "/tailorByPay", method = RequestMethod.GET)
    public String tailorbypay(
            @ModelAttribute("reportInputForm") ProductReport reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "jasperreport/report";
    }
    
    @RequestMapping(value = "/tailorByPay", method = RequestMethod.POST)
    public String generatetbpReport(@ModelAttribute("reportInputForm") ProductReport reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "tailorbypayoption";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String payoption = reportInputForm.getPayoption();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("payoption", payoption);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    //OrderBetweenDate
    
     @RequestMapping(value = "/orderByDate", method = RequestMethod.GET)
    public String orderbydate(
            @ModelAttribute("reportInputForm") ProductReport reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "jasperreport/report";
    }
    
    @RequestMapping(value = "/orderByDate", method = RequestMethod.POST)
    public String generateobdReport(@ModelAttribute("reportInputForm") ProductReport reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "orderbetweendate";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String payoption = reportInputForm.getOrderdate();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("orderdate", payoption);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    //Deliveryoption
    
       @RequestMapping(value = "/tailorByDelivery", method = RequestMethod.GET)
    public String tailorbyde(
            @ModelAttribute("reportInputForm") ProductReport reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "jasperreport/report";
    }
    
    @RequestMapping(value = "/tailorByDelivery", method = RequestMethod.POST)
    public String generatetbdeReport(@ModelAttribute("reportInputForm") ProductReport reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "tailorbydtype";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String payoption = reportInputForm.getDeliveryoption();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("deliveryoption", payoption);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
    
}
