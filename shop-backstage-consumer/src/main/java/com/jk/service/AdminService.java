package com.jk.service;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.Admin;
import com.jk.model.Role;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by yangzhichao on 2018-04-03.
 */
public interface AdminService {

    /**
     * 用户列表查询
     * @param admin
     * @return
     */
    public List<Admin> queryadmin(Admin admin);

    int deladmin(Admin admin);
}
