package com.jk.service;

import com.jk.model.Refunds;
import com.jk.model.Shipping;

import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/10.
 */
public interface ShippingService {

    public List<Shipping> shipList(Shipping shipping, Integer page, Integer rows);

    void deleteship(String ids);

    void addshp(Shipping shipping);

    void updship(Shipping shipping);
}
