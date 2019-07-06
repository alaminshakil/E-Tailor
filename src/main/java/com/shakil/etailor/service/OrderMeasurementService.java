/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Ordermeasurement;
import org.springframework.stereotype.Service;

/**
 *
 * @author alami
 */
@Service
public interface OrderMeasurementService {
    public String insertOrdermeasurement(Ordermeasurement om);

    public String updateOrdermeasurement(Ordermeasurement om);

    public String deleteOrdermeasurement(int ormeaid);

    public String viewOrdermeasurement();

    public Ordermeasurement viewOneOrdermeasurement(int ormeaid);
}
