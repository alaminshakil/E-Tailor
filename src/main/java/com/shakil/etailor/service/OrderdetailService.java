/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Orderdetail;
import org.springframework.stereotype.Service;

/**
 *
 * @author alami
 */
@Service
public interface OrderdetailService {

    public String insertOrderdetail(Orderdetail od);

    public String updateOrderdetail(Orderdetail od);

    public String deleteOrderdetail(int detailid);

    public String viewOrderdetail();

    public Orderdetail viewOneOrderdetail(int detailid);
}
