/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.Payment;
import com.shakil.etailor.service.PaymentService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author alami
 */
@Repository
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertPayment(Payment p) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(p);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updatePayment(Payment p) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(p);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deletePayment(int payid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Payment a = (Payment) s.get(Payment.class, payid);
        s.delete(a);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewPayment() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Payment> paymentlist = s.createQuery("from Payment").list();
        Gson g = new Gson();
        String paymentlistgson = g.toJson(paymentlist);
        t.commit();
        s.close();
        return paymentlistgson;
    }

    @Override
    public Payment viewOnePayment(int payid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Payment payment = (Payment) s.get(Payment.class, payid);
        t.commit();
        s.close();
        return payment;
    }

}
