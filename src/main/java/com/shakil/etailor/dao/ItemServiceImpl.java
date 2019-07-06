/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.dao;

import com.google.gson.Gson;
import com.shakil.etailor.model.Item;
import com.shakil.etailor.service.ItemService;
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
public class ItemServiceImpl implements ItemService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertItem(Item i) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(i);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateItem(Item i) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(i);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteItem(int itemid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Item i = (Item) s.get(Item.class, itemid);
        s.delete(i);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewItem() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Item> itemlist = s.createQuery("from Item").list();
        Gson g = new Gson();
        String itemlistgson = g.toJson(itemlist);
        t.commit();
        s.close();
        return itemlistgson;
    }

    @Override
    public Item viewOneItem(int itemid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Item item = (Item) s.get(Item.class, itemid);
        t.commit();
        s.close();
        return item;
    }

    @Override
    public List<Item> showItemByTailorId(int tailorid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();

        String hql = "SELECT x from Item x WHERE x.tailorid=:tid";
        Query query = s.createQuery(hql);

        query.setInteger("tid", tailorid);

        List<Item> list = query.list();

        t.commit();
        s.close();

        return list;

    }

}
