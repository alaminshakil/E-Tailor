/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Tailorinfo;
import com.shakil.etailor.model.Zone;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author R38 (JAVA)
 */
@Service
public interface TailorinfoService {

    public String insertTailor(Tailorinfo tr);

    public String updateTailor(Tailorinfo tr);

    public String deleteTailor(int tailorid);

    public String viewTailor();

    public Tailorinfo viewOneTailor(int tailorid);

    public List<Tailorinfo> showTailorByAreaId(int areaid);

    public Tailorinfo showOneTailorbyEmail(String email);
}
