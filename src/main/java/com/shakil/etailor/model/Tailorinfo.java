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
import javax.persistence.Transient;

/**
 *
 * @author R38 (JAVA)
 */
@Entity
public class Tailorinfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    int tailorid;
    String tailorname;
    int zoneid;
    int areaid;
    String deliveryoption;
    String payoption;
    String phone;
    String tailoraddress;
    String emailid;
    @Transient
    private String username;
    @Transient
    private String password="123";
    @Transient
    private String role="ROLE_TAILOR";
    @Transient
    private String status="True";

    public int getTailorid() {
        return tailorid;
    }

    public void setTailorid(int tailorid) {
        this.tailorid = tailorid;
    }

    public String getTailorname() {
        return tailorname;
    }

    public void setTailorname(String tailorname) {
        this.tailorname = tailorname;
    }

    public int getZoneid() {
        return zoneid;
    }

    public void setZoneid(int zoneid) {
        this.zoneid = zoneid;
    }

    public int getAreaid() {
        return areaid;
    }

    public void setAreaid(int areaid) {
        this.areaid = areaid;
    }

    public String getDeliveryoption() {
        return deliveryoption;
    }

    public void setDeliveryoption(String deliveryoption) {
        this.deliveryoption = deliveryoption;
    }

    public String getPayoption() {
        return payoption;
    }

    public void setPayoption(String payoption) {
        this.payoption = payoption;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTailoraddress() {
        return tailoraddress;
    }

    public void setTailoraddress(String tailoraddress) {
        this.tailoraddress = tailoraddress;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
