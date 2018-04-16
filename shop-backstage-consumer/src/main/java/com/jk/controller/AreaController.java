package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.LogP;
import com.jk.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * User：意中人
 * Date:2018/04/10
 * Time:08:54
 */
@Controller
@RequestMapping("areacontroller")
public class AreaController extends BaseController{

    @Autowired
    private IAreaService areaservice;

    @RequestMapping("queryArea")
    public void queryArea(HttpServletResponse response){
        List list = areaservice.queryArea();
        super.writeJson(list, response);
    }

    //查询日志记录
    @RequestMapping("queryMongo")
    private void queryMongo(int page,int rows,LogP logP,HttpServletResponse response){
        JSONObject jsonObject = areaservice.queryMongo(page, rows, logP);
        super.writeJson(jsonObject, response);
    }

}
