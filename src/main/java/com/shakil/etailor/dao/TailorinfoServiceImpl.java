/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.User;
import com.shakil.etailor.model.Userrole;
import com.shakil.etailor.model.Tailorinfo;
import com.shakil.etailor.model.Zone;
import com.shakil.etailor.service.TailorinfoService;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author R38 (JAVA)
 */
@Repository
public class TailorinfoServiceImpl implements TailorinfoService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertTailor(Tailorinfo tr) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        User u = new User();
        Userrole ur = new Userrole();
        u.setEmailid(tr.getEmailid());
        u.setUsername(tr.getTailorname());
        u.setPhone(tr.getPhone());

        ur.setEmailid(tr.getEmailid());
        ur.setPassword(tr.getPassword());
        ur.setRole(tr.getRole());
        ur.setStatus(tr.getStatus());
        s.save(tr);
        s.save(u);
        s.save(ur);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateTailor(Tailorinfo tr) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        User u = new User();
        Userrole ur = new Userrole();
        u.setEmailid(tr.getEmailid());
        u.setUsername(tr.getTailorname());
        u.setPhone(tr.getPhone());

        ur.setEmailid(tr.getEmailid());
        ur.setPassword(tr.getPassword());
        ur.setRole(tr.getRole());
        ur.setStatus(tr.getStatus());
        s.update(tr);
        s.update(u);
        s.update(ur);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteTailor(int tailorid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Tailorinfo u = (Tailorinfo) s.get(Tailorinfo.class, tailorid);
        s.delete(u);
        t.commit();
        s.close();

        return null;
    }

    @Override
    public String viewTailor() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Tailorinfo> tailorlist = s.createQuery("from Tailorinfo").list();
        Gson g = new Gson();
        String tailorlistgson = g.toJson(tailorlist);
        t.commit();
        s.close();
        return tailorlistgson;
    }

    @Override
    public Tailorinfo viewOneTailor(int tailorid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Tailorinfo u = (Tailorinfo) s.get(Tailorinfo.class, tailorid);
        t.commit();
        s.close();

        return u;
    }

    @Override
    public List<Tailorinfo> showTailorByAreaId(int areaid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();

        String hql = "SELECT x from Tailorinfo x WHERE x.areaid=:aid";
        Query query = s.createQuery(hql);

        query.setInteger("aid", areaid);

        List<Tailorinfo> list = query.list();

        t.commit();
        s.close();

        return list;

    }

    @Override
    public Tailorinfo showOneTailorbyEmail(String email) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Query q = s.createQuery(" select u from Tailorinfo u where emailid=?");
        List<Tailorinfo> sinfo = q.setParameter(0, email).list();
        t.commit();
        s.close();
        return sinfo.get(0);
    }
}
