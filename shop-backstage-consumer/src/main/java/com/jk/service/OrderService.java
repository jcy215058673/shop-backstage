package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Order;

import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/8.
 */
public interface OrderService {
    //public List<Order> orderList(Order order);
   // JSONObject orderList(Order order, Integer page, Integer rows);

    public List<Order> orderList(Order order, Integer page, Integer rows);

    //查看
    public  List<Order> queryorder(Order order, Integer ff);

    //查询回显
   // Order Toupdorderhui(Order order);

    void updateorder(Order order);

    void deletreorder(String ids);
}
