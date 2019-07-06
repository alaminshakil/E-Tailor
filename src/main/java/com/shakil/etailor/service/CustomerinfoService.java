/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Customerinfo;
import org.springframework.stereotype.Service;



/**
 *
 * @author R38 (JAVA)
 */
@Service
public interface CustomerinfoService {

    
    public String insertCustomer(Customerinfo tr);

    public String updateCustomer(Customerinfo tr);

    public String deleteCustomer(int custid);

    public String viewCustomer();

    public Customerinfo viewOneCustomer(int custid);
   
    public Customerinfo showOneCustomerbyEmail(String email);
}
