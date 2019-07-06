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
public class Febric {
    //febricid, itemid, tailorid, febricname, febriccost, photourl

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int febricid;
    private int itemid;
    private int tailorid;
    private String febricname;
    private int febriccost;
    private String photourl;

    public int getFebricid() {
        return febricid;
    }

    public void setFebricid(int febricid) {
        this.febricid = febricid;
    }

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

    public String getFebricname() {
        return febricname;
    }

    public void setFebricname(String febricname) {
        this.febricname = febricname;
    }

    public int getFebriccost() {
        return febriccost;
    }

    public void setFebriccost(int febriccost) {
        this.febriccost = febriccost;
    }

    public String getPhotourl() {
        return photourl;
    }

    public void setPhotourl(String photourl) {
        this.photourl = photourl;
    }

}
