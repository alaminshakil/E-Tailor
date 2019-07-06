package com.shakil.etailor.dao;

import com.shakil.etailor.service.AreaService;
import com.shakil.etailor.model.Area;
import com.google.gson.Gson;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AreaServiceImpl implements AreaService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertArea(Area a) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(a);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateArea(Area a) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(a);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteArea(int areaid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Area a = (Area) s.get(Area.class, areaid);
        s.delete(a);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewArea() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Area> arealist = s.createQuery("from Area").list();
        Gson g = new Gson();
        String arealistgson = g.toJson(arealist);
        t.commit();
        s.close();
        return arealistgson;
    }

    @Override
    public Area viewOneArea(int areaid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Area area = (Area) s.get(Area.class, areaid);
        t.commit();
        s.close();
        return area;
    }

//    @Override
//    public Area showOneAreabyid(int zoneid) {
//        Session s = sessionFactory.openSession();
//        Transaction t = s.getTransaction();
//        t.begin();
//        Query q = s.createQuery(" select u from Area u where zoneid=?");
//        List<Area> sinfo = q.setParameter(0, zoneid).list();
//        t.commit();
//        s.close();
//        return sinfo.get(0);
//    }
    @Override
    public List<Area> showAreaByZoneId(int zoneid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();

        String hql = "SELECT x from Area x WHERE x.zoneid=:zid";
        Query query = s.createQuery(hql);

        query.setInteger("zid", zoneid);

        List<Area> list = query.list();

        t.commit();
        s.close();

        return list;
    }

}
