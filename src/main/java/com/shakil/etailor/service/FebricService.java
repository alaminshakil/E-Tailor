/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;


import com.shakil.etailor.model.Febric;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author alami
 */
@Service
public interface FebricService {
    public String insertFebric(Febric f);
    public String updateFebric(Febric f);
    public String deleteFebric(int febricid);
    public String viewFebric();
    public Febric viewOneFebric(int febricid);
    public List<Febric> showFebricByItemId(int tailorid);
}
