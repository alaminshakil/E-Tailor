/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.Custorder;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.shakil.etailor.service.CustorderService;
import org.hibernate.Query;

/**
 *
 * @author alami
 */
@Repository
public class CustorderServiceImpl implements CustorderService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertOrder(Custorder o) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(o);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateOrder(Custorder o) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(o);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteOrder(int orderid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Custorder a = (Custorder) s.get(Custorder.class, orderid);
        s.delete(a);
        t.commit();
        s.close();
        return null;
    }

@Override
    public String viewOrder() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Custorder> orderlist = s.createQuery("from Custorder").list();
        Gson g = new Gson();
        String orderlistgson = g.toJson(orderlist);
        t.commit();
        s.close();
        return orderlistgson;
    }

    @Override
    public Custorder viewOneOrder(int orderid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Custorder order = (Custorder) s.get(Custorder.class, orderid);
        t.commit();
        s.close();
        return order;
    }
    
    @Override
    public List<Custorder> tailorOrder(int tailorid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        String hql = "SELECT x from Order x WHERE x.tailorid=:tid";
        Query query = s.createQuery(hql);
        query.setInteger("tid", tailorid);
        List<Custorder> list = query.list();
        t.commit();
        s.close();

        return list;
    }

    @Override
    public List<Custorder> SinglecustOrder(int custid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        String hql = "SELECT x from Custorder x WHERE x.custid=:cid";
        Query query = s.createQuery(hql);
        query.setInteger("cid", custid);
        List<Custorder> list = query.list();
        t.commit();
        s.close();

        return list;
    }
    }
