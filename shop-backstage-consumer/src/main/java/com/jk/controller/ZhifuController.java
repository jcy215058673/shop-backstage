package com.jk.controller;

import com.jk.model.Zhifu;
import com.jk.service.ZhifuService;
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
 * Created by wbn on 2018/4/9.
 */
@Controller
@RequestMapping("/zhifuController")
public class ZhifuController extends BaseController{



    @Autowired
    private ZhifuService zhifuService;


    //跳转查询页面
    @RequestMapping("tozhifu")
    String tozhifu(){
        return "zhifulist";
    }

    //查询
    @RequestMapping("/zhifuList")
    public void zhifuList(HttpServletResponse response) {
        List<Zhifu> zhifuList = zhifuService.zhifuList();
        super.writeJson(zhifuList, response);
    }

    //批量删除
    @RequestMapping(value="deleteShopByIDss")
    public void deleteShopByIDss(HttpServletResponse response,Zhifu zhifu){
        zhifuService.deleteShopByIDss(zhifu);
        WriteUntil.responseWrite(response, "{}");
    }

    //增加跳转页面
    @RequestMapping("toZhifuAdd")
    String toZhifuAdd(){
        return "addzhifu";
    }

    //新增
    @RequestMapping(value="insertZhifu")
    public void insertZhifu(HttpServletResponse response,Zhifu zhifu){
        zhifuService.insertZhifu(zhifu);
        WriteUntil.responseWrite(response, "{}");
    }

    //修改回显
    @RequestMapping(value="toEditZhifu")
    public String toEditZhifu(Model model, Zhifu zhifu, HttpServletRequest request){
        Zhifu e = zhifuService.toEditZhifu(zhifu);
        model.addAttribute("zhifu", e);
        return "updatezhifu";
    }

    //修改
    @RequestMapping(value="updateZhifuById")
    public void updateZhifuById(HttpServletResponse response,Zhifu zhifu){
        zhifuService.updateZhifuById(zhifu);
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
