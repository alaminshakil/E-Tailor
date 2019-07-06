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
public class Measurement {
  //measurementid, itemid, tailorid, measurementname
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int measurementid;
    private int itemid;
    private int tailorid;
    private String measurementname;

    public int getMeasurementid() {
        return measurementid;
    }

    public void setMeasurementid(int measurementid) {
        this.measurementid = measurementid;
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

    public String getMeasurementname() {
        return measurementname;
    }

    public void setMeasurementname(String measurementname) {
        this.measurementname = measurementname;
    }
    
    
}
