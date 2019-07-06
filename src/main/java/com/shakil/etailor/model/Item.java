/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author alami
 */
@Entity
public class Item {

    //itemid, tailorid, itemname, makingcost, makingtime
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int itemid;
    private int tailorid;
    private String itemname;
    private int makingcost;
    private int makingtime;

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public int getTailorid() {
        return tailorid;
    }

    public void setTailorid(int tailorid) {
        this.tailorid = tailorid;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public int getMakingcost() {
        return makingcost;
    }

    public void setMakingcost(int makingcost) {
        this.makingcost = makingcost;
    }

    public int getMakingtime() {
        return makingtime;
    }

    public void setMakingtime(int makingtime) {
        this.makingtime = makingtime;
    }

}
