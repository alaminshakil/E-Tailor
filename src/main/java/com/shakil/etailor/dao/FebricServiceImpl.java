/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.Febric;
import com.shakil.etailor.service.FebricService;
import java.util.List;
import org.hibernate.Query;
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
public class FebricServiceImpl implements FebricService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertFebric(Febric f) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(f);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateFebric(Febric f) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(f);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteFebric(int febricid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Febric f = (Febric) s.get(Febric.class, febricid);
        s.delete(f);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewFebric() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Febric> febriclist = s.createQuery("from Febric").list();
        Gson g = new Gson();
        String febriclistgson = g.toJson(febriclist);
        t.commit();
        s.close();
        return febriclistgson;
    }

    @Override
    public Febric viewOneFebric(int febricid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Febric febric = (Febric) s.get(Febric.class, febricid);
        t.commit();
        s.close();
        return febric;
    }

    @Override
    public List<Febric> showFebricByItemId(int itemid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        String hql = "SELECT x from Febric x WHERE x.itemid=:iid";
        Query query = s.createQuery(hql);
        query.setInteger("iid", itemid);
        List<Febric> list = query.list();
        t.commit();
        s.close();

        return list;

    }

}
