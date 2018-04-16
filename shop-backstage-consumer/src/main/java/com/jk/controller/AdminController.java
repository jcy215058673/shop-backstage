package com.jk.controller;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.Admin;
import com.jk.service.AdminService;
import com.jk.util.WriteUntil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by yangzhichao on 2018-04-03.
 */
@Controller
@RequestMapping("/adminController")
public class AdminController extends BaseController {
    //日志记录
    private static final Logger logger = Logger.getLogger(AdminController.class);

    @Autowired
    private AdminService adminService;

    /**
     * 用户列表查询
     * @param admin
     */
    @RequestMapping("/queryadmin")
    public void queryadmin(Admin admin, HttpServletResponse response) {
        List<Admin> adminList = adminService.queryadmin(admin);
        super.writeJson(adminList, response);
    }
/*    //删除
    @RequestMapping("deladmin")

    public Object deladmin(List<Integer>  ids){
        int a=adminService.deladmin(ids);
        return a;
    }*/

    //批量删除
    @RequestMapping(value="deladmin",method= RequestMethod.GET)
    public void deladmin(HttpServletResponse response,Admin admin){
        adminService.deladmin(admin);
        WriteUntil.responseWrite(response, "{}");
    }
    //增加跳转页面
    @RequestMapping("toadmin")
    String toadmin(){
        return "lzh/showadmin";
    }
}
