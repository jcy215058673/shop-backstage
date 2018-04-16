package com.jk.dao;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    
    /*JSONObject roleList(int start, int end, Role role);*/

    List<Role> roleList(Role role);

   /* long queryTotals(Role role);*/

     void deleteShopByIDs(List<Integer> list);

    void insertRole(Role role);

    Role toEditShopById(Role role);

    void updateRoleById(Role role);
}