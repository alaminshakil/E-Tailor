/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shakil.etailor.service;

import com.shakil.etailor.model.Item;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author alami
 */
@Service
public interface ItemService {

    public String insertItem(Item i);

    public String updateItem(Item i);

    public String deleteItem(int itemid);

    public String viewItem();

    public Item viewOneItem(int itemid);

    public List<Item> showItemByTailorId(int tailorid);
}
