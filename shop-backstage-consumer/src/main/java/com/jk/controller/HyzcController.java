package com.jk.controller;

import com.jk.model.Hyzc;
import com.jk.service.HyzcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2018/4/13.
 */
@Controller
@RequestMapping("hyzcController")
public class HyzcController extends BaseController{
    @Autowired
    private HyzcService hyzcservice;

    //---------------------------------------------------------------------------会员注册项
    //查询
    @RequestMapping("hyzctree")
    public String toHyzctree(){
        return "listhyzc";
    }

    @RequestMapping("/gethyzc")
    public void gethyzc(HttpServletResponse response) {
        List<Hyzc> gethyzc = hyzcservice.gethyzc();
        super.writeJson(gethyzc, response);
    }
}
