/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;


import com.shakil.etailor.model.Zone;
import org.springframework.stereotype.Service;

@Service
public interface Zoneservice {
    public String insertZone(Zone z);

    public String updateZone(Zone z);

    public Integer deleteZone(int id);

    public String viewZone();

    public Zone viewOneZone(int id);
    
}
