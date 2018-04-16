package com.jk.service.impl;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.dao.AdminMapper;
import com.jk.model.Admin;
import com.jk.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangzhichao on 2018-04-03.
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List<Admin> queryadmin(Admin admin) {
        List<Admin> adminList = adminMapper.queryadmin(admin);
        return adminList;
    }
/*
   public JSONObject queryadmin(Admin admin) {

       JSONObject json= adminMapper.queryadmin(admin);

       return json;


   }*/

    public void deladmin(Admin admin) {


        String[] split = admin.getHrmempIDS().split(",");
        List<Integer> adminlist = new ArrayList();
        for (String string : split) {
            adminlist.add(Integer.valueOf(string));
        }
        adminMapper.deladmin(adminlist);
    }
}
