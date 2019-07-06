/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.Measurement;
import com.shakil.etailor.service.MeasurementService;
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
public class MeasurementServiceImpl implements MeasurementService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertMeasurement(Measurement m) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(m);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateMeasurement(Measurement m) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(m);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteMeasurement(int measurementid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Measurement m = (Measurement) s.get(Measurement.class, measurementid);
        s.delete(m);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewMeasurement() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Measurement> measurementlist = s.createQuery("from Measurement").list();
        Gson g = new Gson();
        String measurementlistgson = g.toJson(measurementlist);
        t.commit();
        s.close();
        return measurementlistgson;
    }

    @Override
    public Measurement viewOneMeasurement(int measurementid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Measurement measurement = (Measurement) s.get(Measurement.class, measurementid);
        t.commit();
        s.close();
        return measurement;
    }

}
