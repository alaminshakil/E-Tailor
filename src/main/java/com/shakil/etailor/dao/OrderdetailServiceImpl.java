/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.Orderdetail;
import com.shakil.etailor.service.OrderdetailService;
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
public class OrderdetailServiceImpl implements OrderdetailService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertOrderdetail(Orderdetail od) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(od);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateOrderdetail(Orderdetail od) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(od);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteOrderdetail(int detailid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Orderdetail a = (Orderdetail) s.get(Orderdetail.class, detailid);
        s.delete(a);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewOrderdetail() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Orderdetail> odlist = s.createQuery("from Orderdetail").list();
        Gson g = new Gson();
        String odlistgson = g.toJson(odlist);
        t.commit();
        s.close();
        return odlistgson;
    }

    @Override
    public Orderdetail viewOneOrderdetail(int detailid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Orderdetail orderdetail = (Orderdetail) s.get(Orderdetail.class, detailid);
        t.commit();
        s.close();
        return orderdetail;
    }

}
