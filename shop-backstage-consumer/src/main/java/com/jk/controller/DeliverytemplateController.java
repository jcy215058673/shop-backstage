package com.jk.controller;

import com.jk.model.Deliverytemplate;
import com.jk.service.IDeliverytemplateService;
import com.jk.util.WriteUntil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User：意中人
 * Date:2018/04/08
 * Time:14:14
 */
@Controller
@RequestMapping("deliverytemplatecontroller")
public class DeliverytemplateController extends BaseController{

    @Autowired
    private IDeliverytemplateService deliverytemplateservice;

    //查询
    @RequestMapping("queryDeliverytemplate")
    public void queryDeliverytemplate(Deliverytemplate deliverytemplate,HttpServletResponse response){
        List<Deliverytemplate> deliverytemplateList=deliverytemplateservice.queryDeliverytemplate(deliverytemplate);
        super.writeJson(deliverytemplateList, response);
    }

    //批量删除
    @RequestMapping("delDeliverytemplates")
    @ResponseBody
    public Object delDeliverytemplates(String ids){
        int i = deliverytemplateservice.delDeliverytemplates(ids);
        return i;
    }

    //跳转新增页面
    @RequestMapping("toAdd")
    public String toAdd(){
        return "long/addDeliverytemplate";
    }

    //新增
    @RequestMapping("/addDeliverytemplate")
    public void addDeliverytemplate(Deliverytemplate deliverytemplate, HttpServletResponse response){
        deliverytemplateservice.addDeliverytemplate(deliverytemplate);
        WriteUntil.responseWrite(response, "{}");
    }

    //回显
    @RequestMapping("updateDeliverytemplateById")
    public String updateDeliverytemplateById(Long id,HttpServletRequest request){
        Deliverytemplate deliverytemplate = deliverytemplateservice.updateDeliverytemplateById(id);
        request.setAttribute("deliverytemplate", deliverytemplate);
        return "long/addDeliverytemplate";
    }

    //修改
    @RequestMapping("updateDeliverytemplate")
    public void updateDeliverytemplate(Deliverytemplate deliverytemplate,HttpServletResponse response){
        deliverytemplateservice.updateDeliverytemplate(deliverytemplate);
        WriteUntil.responseWrite(response, "{}");
    }
}
