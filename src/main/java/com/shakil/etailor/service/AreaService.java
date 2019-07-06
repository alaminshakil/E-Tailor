/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Area;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface AreaService {
    public String insertArea(Area a);

    public String updateArea(Area a);

    public String deleteArea(int areaid);

    public String viewArea();

    public Area viewOneArea(int areaid);
    
//    public Area showOneAreabyid(int zoneid);
    
    public List<Area> showAreaByZoneId(int zoneid);
}
