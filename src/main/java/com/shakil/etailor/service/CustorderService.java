/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Custorder;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author alami
 */
@Service
public interface CustorderService {

    public String insertOrder(Custorder o);

    public String updateOrder(Custorder o);

    public String deleteOrder(int orderid);

    public String viewOrder();

    public Custorder viewOneOrder(int orderid);
    
    public List<Custorder> tailorOrder(int tailorid);
    
    public List<Custorder> SinglecustOrder(int custid);
}
