package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.model.DeliveryCenter;
import com.jk.service.IDeliverycenterService;
import com.jk.util.WriteUntil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * User：意中人
 * Date:2018/04/09
 * Time:16:24
 */
@Controller
@RequestMapping("deliverycentercontroller")
public class DeliveryCenterController extends BaseController{

    @Autowired
    private IDeliverycenterService  deliverycenterservice;

    //查询
    @RequestMapping("queryDeliveryCenter")
    public void queryDeliveryCenter(DeliveryCenter deliverycenter,HttpServletResponse response){
        List<DeliveryCenter> deliverycenterList=deliverycenterservice.queryDeliveryCenter(deliverycenter);
        super.writeJson(deliverycenterList, response);
    }

    //批量删除
    @RequestMapping("delDeliverycenter")
    @ResponseBody
    public Object delDeliverycenter(String ids){
        int i = deliverycenterservice.delDeliverycenter(ids);
        return i;
    }

    //跳转新增页面
    @RequestMapping("toAdd")
    public String toAdd(){
        return "long/addDeliveryCenter";
    }

    //新增
    @RequestMapping("/addDeliverycenter")
    public void addDeliverycenter(DeliveryCenter deliverycenter, HttpServletResponse response){
        deliverycenterservice.addDeliverycenter(deliverycenter);
        WriteUntil.responseWrite(response, "{}");
    }

    //回显
    @RequestMapping("updateDeliverycenterById")
    public String updateDeliverycenterById(Long id,HttpServletRequest request){
        DeliveryCenter deliverycenter = deliverycenterservice.updateDeliverycenterById(id);
        request.setAttribute("deliverycenter", deliverycenter);
        return "long/addDeliveryCenter";
    }

    //修改
    @RequestMapping("updateDeliverycenter")
    public void updateDeliverycenter(DeliveryCenter deliverycenter,HttpServletResponse response){
        deliverycenterservice.updateDeliverycenter(deliverycenter);
        WriteUntil.responseWrite(response, "{}");
    }
}
