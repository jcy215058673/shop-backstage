package com.jk.controller;
import com.jk.model.Order;
import com.jk.model.Shipping;
import com.jk.service.OrderService;
import com.jk.service.ShippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by 杨棋洋 on 2018/4/8.
 */
@Controller
@RequestMapping("/shippingController")
public class ShippingController extends BaseController {

    @Autowired
    private ShippingService shippingService;


    //跳转到发货管理查询页面
    @RequestMapping("tofahuo")
    public String tofahuo() {
        return "yang/shippingshow";
    }

    //跳转到修改管理页面
    @RequestMapping("Toupdshipping")
    public String Toupdshipping() {
        return "yang/updshipping";
    }

    //跳转到发货管理新增页面
    @RequestMapping("Toshipping")
    public String Toshipping() {
        return "yang/addshipping";
    }

    //发货管理查询
   @RequestMapping("/findshipping")
    public void findshipping(Shipping shipping, HttpServletResponse response,Integer page, Integer rows) {
        List<Shipping> shipList = shippingService.shipList(shipping,page,rows);
        super.writeJson(shipList, response);
    }



 //新增
 @RequestMapping("addshp")
 public void addshp(Shipping shipping, HttpServletResponse response){
     Map<String, Object> map = new HashMap<String, Object>();
     try {
         shippingService.addshp(shipping);
         map.put("success", true);
     } catch (Exception e) {
         e.printStackTrace();
         map.put("success", false);
     }
     super.writeJson(map, response);
 }

    //修改
    @RequestMapping("updship")
    public void updship(Shipping shipping, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            shippingService.updship(shipping);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        super.writeJson(map, response);
    }

    //删除
    @RequestMapping("deleteship")
    // @ResponseBody
    public void deleteship(String ids, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            shippingService.deleteship(ids);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        super.writeJson(map, response);
    }

}
