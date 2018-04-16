package com.jk.service;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.Role;

import java.util.List;

/**
 * Created by wbn on 2018/4/10.
 */
public interface RoleService {
    List<Role> roleList(Role role);

    void deleteShopByIDs(Role role);

    void insertRole(Role role);

    Role toEditShopById(Role role);

    void updateRoleById(Role role);
}
