package com.jk.controller;

import com.jk.model.Delico;
import com.jk.service.DelicoService;
import com.jk.util.WriteUntil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by wbn on 2018/4/10.
 */
@Controller
@RequestMapping("/delicoController")
public class DelicoController extends BaseController{



    @Autowired
    private DelicoService delicoService;

    //跳转查询页面
    @RequestMapping("toshoudelico")
    public String toshoudelico(){
        return "delicolists";
    }

    //查询
    @RequestMapping("/delicoList")
    public void delicoList(HttpServletResponse response) {
        List<Delico> delicoList = delicoService.delicoList();
        super.writeJson(delicoList, response);
    }

    //批量删除
    @RequestMapping(value="deleteShopByIDs")
    public void deleteShopByIDs(HttpServletResponse response,Delico delico){
        delicoService.deleteShopByIDs(delico);
        WriteUntil.responseWrite(response, "{}");
    }

    //增加跳转页面
    @RequestMapping("toDelicoAdd")
    String toDelicoAdd(){
        return "adddelico";
    }

    //新增
    @RequestMapping(value="insertDelico")
    public void insertDelico(HttpServletResponse response,Delico delico){
        delicoService.insertDelico(delico);
        WriteUntil.responseWrite(response, "{}");
    }

    //修改回显
    @RequestMapping(value="toEditDelico")
    public String toEditDelico(Model model, Delico delico, HttpServletRequest request){
        Delico e = delicoService.toEditShopById(delico);
        model.addAttribute("delico", e);
        return "updatedelico";
    }

    //修改
    @RequestMapping(value="updateDelicoById")
    public void updateDelicoById(HttpServletResponse response,Delico delico){
        delicoService.updateDelicoById(delico);
        WriteUntil.responseWrite(response, "{}");

    }
}
