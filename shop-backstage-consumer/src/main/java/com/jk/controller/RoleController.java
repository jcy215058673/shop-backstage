package com.jk.controller;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.Role;
import com.jk.service.RoleService;
import com.jk.util.WriteUntil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Created by wbn on 2018/4/10.
 */
@Controller
@RequestMapping("/roleController")
public class RoleController extends BaseController{



    @Autowired
    private RoleService roleService;

/*    //跳转查询页面
    @RequestMapping("toshourole")
    String toshourole(){
        return "rolelists";
    }*/

    //查询
    @RequestMapping("/roleList")

    public void roleList(Role role ,HttpServletResponse response) {

        List<Role> list =  roleService.roleList(role);
        super.writeJson(list, response);

    }

    //批量删除
    @RequestMapping(value="deleteShopByIDs",method= RequestMethod.GET)
    public void deleteShopByIDs(HttpServletResponse response,Role role){
        roleService.deleteShopByIDs(role);
        WriteUntil.responseWrite(response, "{}");
    }

/*    //新增
    @RequestMapping(value="insertRole",method=RequestMethod.POST)
    public void insertRole(HttpServletResponse response,Role role){
        roleService.insertRole(role);

    }*/

  //增加跳转页面
    @RequestMapping("toRoleAdd")

    String toRoleAdd(){

        return "lzh/addrole";

    }

    //新增
    @RequestMapping("insertRole")
    public void insertRole(HttpServletResponse response,Role role){

        roleService.insertRole(role);
        WriteUntil.responseWrite(response, "{}");
    } 


    //修改
    @RequestMapping(value="updateRoleById")
    public void updateRoleById(HttpServletResponse response,Role role){
        roleService.updateRoleById(role);
        WriteUntil.responseWrite(response, "{}");
    }
    //增加跳转页面
    @RequestMapping("torole")
    String torole(){
        return "lzh/showrole";
    }
}
