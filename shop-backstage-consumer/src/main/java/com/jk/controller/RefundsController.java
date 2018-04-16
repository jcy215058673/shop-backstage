package com.jk.controller;

import com.jk.model.Refunds;
import com.jk.service.RefundsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 杨棋洋 on 2018/4/9.
 */
@Controller
@RequestMapping("/refundsController")
public class RefundsController extends BaseController{

    @Autowired
    private RefundsService refundsService;


    //跳转到退款管理查询页面
    @RequestMapping("torefunds")
    public String torefunds(){
        return "yang/refunds";
    }

    //跳转到退款管理新增页面
    @RequestMapping("Toaddrefunds")
    public String Toaddrefunds(){
        return "yang/addrefunds";
    }

    //跳转到查看退款管理
    @RequestMapping("TochakanRefunds")
    public String TochakanRefunds(){
        return "yang/chakanRefunds";
    }

    //退款管理查询
    @RequestMapping("/refundsTiao")
    public void refundsTiao( HttpServletResponse response) {
        List<Refunds> refundsList = refundsService.refundsList2();
        super.writeJson(refundsList, response);
    }


   /* @RequestMapping("/refundsTiao")
    public void refundsTiao(Refunds refunds, HttpServletResponse response,Integer page,Integer rows) {
        List<Refunds> findorefunds = refundsService.refundsTiao(refunds,page,rows);
        super.writeJson(findorefunds, response);
    }*/

   //退款管理查看
    @RequestMapping("/findrefundsjb")
    public void findrefundsjb( HttpServletResponse response,Integer theid) {
        List<Refunds> refundsList = refundsService.refundsList(theid);
        super.writeJson(refundsList, response);
    }

    //删除
    @RequestMapping("/deletrefunds")
    @ResponseBody
    public void deletrefunds(String ids, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            refundsService.deletrefunds(ids);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        // super.writeJson(map);
        super.writeJson(map, response);
    }




    //新增
   @RequestMapping("addrefunds")
   // @ResponseBody
    public void addrefunds(Refunds refunds, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            refundsService.addrefunds(refunds);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
       super.writeJson(map, response);
    }

    //修改
    @RequestMapping("updrefunds")
    // @ResponseBody
    public void updrefunds(Refunds refunds, HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            refundsService.updrefunds(refunds);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        super.writeJson(map, response);
    }
}
