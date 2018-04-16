package com.jk.controller;

import com.jk.model.Peisong;
import com.jk.service.PeisongService;
import com.jk.util.WriteUntil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wbn on 2018/4/8.
 */
@Controller
@RequestMapping("/peisongController")
public class PeisongController extends BaseController{



    @Autowired
    private PeisongService peisongService;

    //跳转查询页面
    @RequestMapping("toshou")
    String toshou(){
        return "qqq";
    }

    //查询
    @RequestMapping("/peisongList")
    public void peisongList(HttpServletResponse response,Peisong peisong) {
        List<Peisong> peisongList = peisongService.peisongList(peisong);
        super.writeJson(peisongList, response);
    }

    //批量删除
    @RequestMapping(value="deleteShopByIDs")
    public void deleteShopByIDs(HttpServletResponse response,Peisong peisong){
        peisongService.deleteShopByIDs(peisong);
        WriteUntil.responseWrite(response, "{}");
    }

    //增加跳转页面
    @RequestMapping("toPeisongAdd")
    //动态下拉列表新增附表字段
    String toPeisongAdd(HttpServletRequest request,Peisong peisong){
        //动态查询表字段
        List<Peisong> peisongList = peisongService.peisongList(peisong);
        request.setAttribute("peisongList",peisongList);
        return "addpeisong";
    }

    //新增
    @RequestMapping(value="insertPeisong")
    public void insertPeisong(HttpServletResponse response,Peisong peisong){
        peisongService.insertPeisong(peisong);
        WriteUntil.responseWrite(response, "{}");
    }

    //修改回显
    @RequestMapping(value="toEditPeisong")
    public String toEditPeisong(Model model, Peisong peisong, HttpServletRequest request){
        Peisong e = peisongService.toEditShopById(peisong);
        model.addAttribute("peisong", e);
        return "updatepeisong";
    }

    //修改
    @RequestMapping(value="updatePeisongById")
    public void updatePeisongById(HttpServletResponse response,Peisong peisong){
        peisongService.updatePeisongById(peisong);
        WriteUntil.responseWrite(response, "{}");

    }


    //上传
    @RequestMapping("uploadResumeFiles")
    @ResponseBody
    public Map uploadResumeFiles(@RequestParam(value = "imgfiles", required = false) MultipartFile file,
                                 HttpServletRequest request, HttpServletResponse response){

        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        String	fileNameReal = new Date().getTime()+".jpg";

        File targetFile = new File(path, fileNameReal);
        //判断是否有文件夹，如果没有就新建一个
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
    //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map map = new HashMap<String, Object>();
        map.put("fileName", fileName);
        map.put("fileNameReal", fileNameReal);
        map.put("path", path);
        return map;
    }

}
