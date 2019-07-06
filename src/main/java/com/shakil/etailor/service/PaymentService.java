/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Payment;
import org.springframework.stereotype.Service;

/**
 *
 * @author alami
 */
@Service
public interface PaymentService {
    public String insertPayment(Payment p);

    public String updatePayment(Payment p);

    public String deletePayment(int payid);

    public String viewPayment();

    public Payment viewOnePayment(int payid);
}
