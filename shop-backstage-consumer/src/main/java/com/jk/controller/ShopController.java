package com.jk.controller;


import com.jk.model.Hydj;
import com.jk.model.Hygl;
import com.jk.model.Hyzc;
import com.jk.model.Tree;
import com.jk.service.ShopService;
import com.jk.util.WriteUntil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/8.
 */
@Controller
@RequestMapping("shopController")
public class ShopController extends BaseController{
    @Autowired
    private ShopService shopservice;

    /*@RequestMapping("gethygl")
    @ResponseBody
    public Map<String,Object> gethygl(Integer page,Integer rows){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("total", shopservice.gethygl().size());
        map.put("rows", shopservice.gethyglByPage(page,rows));
        return map;
    }*/
    //---------------------------------------------------------------------------------会员管理
    //查询
    @RequestMapping("hygltree")
    public String toHygltree(){
        return "list";
    }

    @RequestMapping("/gethygl")
    public void gethygl(HttpServletResponse response) {
        List<Hygl> gethygl = shopservice.gethygl();
        super.writeJson(gethygl, response);
    }
    //增加跳转页面
    @RequestMapping("toHyglAddTab")
    String toHyglAddTab(){
        return "addhygl";
    }

    //新增
    @RequestMapping(value="insertHygl",method= RequestMethod.POST)
    public void insertHygl(HttpServletResponse response,Hygl hygl){
        shopservice.insertHygl(hygl);
        WriteUntil.responseWrite(response, "{}");
    }
    //批量删除
    @RequestMapping(value="deleteHygl",method=RequestMethod.GET)
    public void deleteHygl(HttpServletResponse response,Hygl hygl){
        shopservice.deleteHygl(hygl);
        WriteUntil.responseWrite(response, "{}");
    }
    //修改回显
    @RequestMapping(value="updateHyglById")
    public String updateHyglTab(String id, HttpServletRequest request){
        Hygl hygl = shopservice.updateHyglTab(id);
        request.setAttribute("hygl",hygl);
        return "updatehygl";
    }

    //修改
    @RequestMapping(value="updateHygl")
    public void updateHygl(HttpServletResponse response,Hygl hygl){
        shopservice.updateHygl(hygl);
        WriteUntil.responseWrite(response, "{}");

    }
    //----------------------------------------------------------------------------------会员等级
    //查询
    @RequestMapping("hydjtree")
    public String toHydjtree(){
        return "listhydj";
    }

    @RequestMapping("/gethydj")
    public void gethydj(HttpServletResponse response) {
        List<Hydj> gethydj = shopservice.gethydj();
        super.writeJson(gethydj, response);
    }
    //增加跳转页面
    @RequestMapping("toHydjAddTab")
    String toHydjAddTab(){
        return "addhydj";
    }

    //新增
    @RequestMapping(value="insertHydj",method= RequestMethod.POST)
    public void insertHydj(HttpServletResponse response,Hydj hydj){
        shopservice.insertHydj(hydj);
        WriteUntil.responseWrite(response, "{}");
    }

    //批量删除
    @RequestMapping(value="deleteHydj",method=RequestMethod.GET)
    public void deleteHydj(HttpServletResponse response,Hydj hydj){
        shopservice.deleteHydj(hydj);
        WriteUntil.responseWrite(response, "{}");
    }
    //修改回显
    @RequestMapping(value="updateHydjById")
    public String updateHydjById(String id, HttpServletRequest request){
        Hydj hydj = shopservice.updateHydjById(id);
        request.setAttribute("hydj",hydj);
        return "updatehydj";
    }

    //修改
    @RequestMapping(value="updateHydj")
    public void updateHydj(HttpServletResponse response,Hydj hydj){
        shopservice.updateHydj(hydj);
        WriteUntil.responseWrite(response, "{}");

    }
    //---------------------------------------------------------------------------会员注册项
    //查询
    /*@RequestMapping("hyzctree")
    public String toHyzctree(){
        return "listhyzc";
    }

    @RequestMapping("/gethyzc")
    public void gethyzc(HttpServletResponse response) {
        List<Hyzc> gethyzc = shopservice.gethyzc();
        super.writeJson(gethyzc, response);
    }*/
}
