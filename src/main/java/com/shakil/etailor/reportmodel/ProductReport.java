/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.reportmodel;

/**
 *
 * @author User
 */
public class ProductReport {

    int tailorid;
    int zoneid;
    String payoption;
    String orderdate;
    String deliveryoption;

    public String getDeliveryoption() {
        return deliveryoption;
    }

    public void setDeliveryoption(String deliveryoption) {
        this.deliveryoption = deliveryoption;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public String getPayoption() {
        return payoption;
    }

    public void setPayoption(String payoption) {
        this.payoption = payoption;
    }

    public int getZoneid() {
        return zoneid;
    }

    public void setZoneid(int zoneid) {
        this.zoneid = zoneid;
    }

    public int getTailorid() {
        return tailorid;
    }

    public void setTailorid(int tailorid) {
        this.tailorid = tailorid;
    }

}
