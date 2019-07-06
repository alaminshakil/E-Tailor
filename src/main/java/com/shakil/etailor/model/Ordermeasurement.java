/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author alami
 */
@Entity
public class Ordermeasurement implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //ormeaid, orderid, itemid, measurementid, measurementvalue
    private int ormeaid;
    private int orderid;
    private int itemid;
    private int measurementid;
    private int measurementvalue;

    public int getOrmeaid() {
        return ormeaid;
    }

    public void setOrmeaid(int ormeaid) {
        this.ormeaid = ormeaid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public int getMeasurementid() {
        return measurementid;
    }

    public void setMeasurementid(int measurementid) {
        this.measurementid = measurementid;
    }

    public int getMeasurementvalue() {
        return measurementvalue;
    }

    public void setMeasurementvalue(int measurementvalue) {
        this.measurementvalue = measurementvalue;
    }
}
