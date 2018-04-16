package com.jk.service.impl;

import com.jk.dao.ShippingMapper;
import com.jk.model.Refunds;
import com.jk.model.Shipping;
import com.jk.service.ShippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/10.
 */
@Service("shippingService")
public class ShippingServiceImpl implements ShippingService{

    @Autowired
    private ShippingMapper shippingMapper;
    public List<Shipping> shipList(Shipping shipping,Integer page, Integer rows) {
        List<Shipping> shipList = shippingMapper.shipList(shipping,page,rows);
        return shipList;
    }

    public void deleteship(String ids) {
        String [] ff = ids.split(",");
        shippingMapper.deleteship(ff);
    }

    public void addshp(Shipping shipping) {
        shippingMapper.addshp(shipping);
    }

    public void updship(Shipping shipping) {
        shippingMapper.updship(shipping);
    }
}
