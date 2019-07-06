/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.Ordermeasurement;
import com.shakil.etailor.service.OrderMeasurementService;
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
public class OrderMeasurementServiceImpl implements OrderMeasurementService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertOrdermeasurement(Ordermeasurement om) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(om);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateOrdermeasurement(Ordermeasurement om) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(om);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteOrdermeasurement(int ormeaid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Ordermeasurement a = (Ordermeasurement) s.get(Ordermeasurement.class, ormeaid);
        s.delete(a);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewOrdermeasurement() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Ordermeasurement> omlist = s.createQuery("from Ordermeasurement").list();
        Gson g = new Gson();
        String omlistgson = g.toJson(omlist);
        t.commit();
        s.close();
        return omlistgson;
    }

    @Override
    public Ordermeasurement viewOneOrdermeasurement(int ormeaid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Ordermeasurement om = (Ordermeasurement) s.get(Ordermeasurement.class, ormeaid);
        t.commit();
        s.close();
        return om;
    }

}
