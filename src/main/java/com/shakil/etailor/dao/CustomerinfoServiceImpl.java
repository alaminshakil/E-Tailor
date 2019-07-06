/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.Customerinfo;
import com.shakil.etailor.model.User;
import com.shakil.etailor.model.Userrole;
import com.shakil.etailor.service.CustomerinfoService;
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
public class CustomerinfoServiceImpl implements CustomerinfoService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertCustomer(Customerinfo tr) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        User u = new User();
        Userrole ur = new Userrole();
        u.setEmailid(tr.getEmailid());
        u.setUsername(tr.getCustname());
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
    public String updateCustomer(Customerinfo tr) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(tr);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteCustomer(int custid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Customerinfo ci = (Customerinfo) s.get(Customerinfo.class, custid);
        s.delete(ci);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewCustomer() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Customerinfo> custlist = s.createQuery("from Customerinfo").list();
        Gson g = new Gson();
        String custlistgson = g.toJson(custlist);
        t.commit();
        s.close();
        return custlistgson;
    }

    @Override
    public Customerinfo viewOneCustomer(int custid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Customerinfo u = (Customerinfo) s.get(Customerinfo.class, custid);
        t.commit();
        s.close();
        return u;
    }

    @Override
    public Customerinfo showOneCustomerbyEmail(String email) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Query q = s.createQuery(" select u from Customerinfo u where emailid=?");
        List<Customerinfo> sinfo = q.setParameter(0, email).list();
        t.commit();
        s.close();
        return sinfo.get(0);
    }

}
