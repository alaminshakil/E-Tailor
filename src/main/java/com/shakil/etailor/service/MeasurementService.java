/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Measurement;
import org.springframework.stereotype.Service;

/**
 *
 * @author alami
 */
@Service
public interface MeasurementService {
     public String insertMeasurement(Measurement m);

    public String updateMeasurement(Measurement m);

    public String deleteMeasurement(int measurementid);

    public String viewMeasurement();

    public Measurement viewOneMeasurement(int measurementid);
}
