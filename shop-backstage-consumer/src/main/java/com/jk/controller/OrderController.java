package com.jk.controller;
import com.jk.model.Order;
import com.jk.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by 杨棋洋 on 2018/4/8.
 */
@Controller
@RequestMapping("/orderController")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;


    //跳转到订单管理查询页面
    @RequestMapping("toordergl")
    public String toordergl() {
        return "yang/ordershow";
    }

    //跳转到查看订单管理
    @RequestMapping("TochakanOrder")
    public String TochakanOrder(){
        return "yang/chaOrder";
    }

    //跳转到订单管理修改页面
    @RequestMapping("Toupdorder")
    public String Toupdorder() {
        return "yang/updorder";
    }

    //订单管理查询
   @RequestMapping("/findordergl")
    public void findgoodgl(Order order, HttpServletResponse response,Integer page,Integer rows) {
        List<Order> orderList = orderService.orderList(order,page,rows);
        super.writeJson(orderList, response);
    }

    //订单管理查看
    @RequestMapping("/findorder")
    public void findorder(Order order, HttpServletResponse response,Integer ff) {
        List<Order> refundsList = orderService.queryorder(order,ff);
        super.writeJson(refundsList, response);
    }

    //修改回显

    /*@RequestMapping("Toupdorderhui")
    public String Toupdorderhui(Model model, Order order, HttpServletResponse response){
        Order ee = orderService.Toupdorderhui(order);
        model.addAttribute("orderhui", ee);
       return "updorder";

    }*/



    //修改
    @RequestMapping("updateorder")
    public void updateorder(Order order, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            orderService.updateorder(order);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        super.writeJson(map, response);
    }

    //删除
    @RequestMapping("deletorder")
    // @ResponseBody
    public void deletorder(String ids, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            orderService.deletreorder(ids);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        super.writeJson(map, response);
    }

}
