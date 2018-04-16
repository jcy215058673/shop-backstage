package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.OrderMapper;

import com.jk.model.Order;
import com.jk.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/8.
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderMapper orderMapper;

    public List<Order> orderList(Order order,Integer page, Integer rows) {
        page = (page-1)*rows;
        return orderMapper.orderList(order,page,rows);

       // List<Order> orderList = orderMapper.orderList(order);
       // return orderList;
    }
   //查看
    public List<Order> queryorder(Order order, Integer ff) {
        List<Order> queryorder = orderMapper.queryorder(order,ff);
        return queryorder;
    }
//修改回显
   /* public Order Toupdorderhui(Order order) {
        return orderMapper.Toupdorderhui(order);
    }*/

    public void updateorder(Order order) {
        orderMapper.updateorder(order);
    }

    public void deletreorder(String ids) {
        String [] ff = ids.split(",");
        orderMapper.deletreorder(ff);
    }



   /* public List<Order> orderList(Order order) {
        List<Order> orderList = orderMapper.orderList(order);
        return orderList;
    }*/

   /* public JSONObject orderList(Order order, Integer page, Integer rows) {
       // select * from 表名 limit 起始位置 ，每页条数
        int start =(page-1)*rows;//起始位置 = (当前页-1)*每页条数
        long counts = orderMapper.orderListTotal(order);
        List<Order> colors = orderMapper.orderListPage(order,start,rows);
        JSONObject json = new JSONObject();
//		总条数的key值必须叫total
        json.put("total", counts);
//		当前页展示数据的key值必须叫rows
        json.put("rows", colors);
        return json;
    }*/

     /*  public List<Order> orderList(Order order, Integer page, Integer rows) {
        page = (page-1)*rows;
        return orderMapper.orderList(page,rows);
    }*/

}
