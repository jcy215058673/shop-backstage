package com.jk.service.impl;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.dao.RoleMapper;
import com.jk.model.Role;
import com.jk.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by wbn on 2018/4/10.
 */
@Service("roleService")
public class RoleServiceImpl  implements RoleService{

    @Autowired
    private RoleMapper rolemapper;

    //查询

    public List<Role> roleList(Role role) {
        List<Role> roleList = rolemapper.roleList(role);
        return roleList;
    }
   /* public JSONObject roleList(Integer page, Integer rows, Role role) {
        //总条数
        long totalCount = rolemapper.queryTotals(role);
        //当前页数据————————oracle分页   关键字 rownum    两个参数：起始位置、结束位置
        //起始位置 =（当前页-1）*每页条数
        int start = (page-1)*rows+1;
        //结束位置 = 起始位置+每页条数
        int end = start + rows;
        //查询当前页数据
        List<Role> r = rolemapper.roleList(start,end,role);
        JSONObject json = new JSONObject();
        json.put("total", totalCount);
        json.put("rows", r);
        return json;
    }*/

   //删除

    public void deleteShopByIDs(Role role) {


        String[] split = role.getHrmempIDS().split(",");
        List<Integer> list = new ArrayList();
        for (String string : split) {
            list.add(Integer.valueOf(string));
        }
        rolemapper.deleteShopByIDs(list);
    }

    //新增

    public void insertRole(Role role) {
        rolemapper.insertRole(role);
    }


    public Role toEditShopById(Role role) {
        return rolemapper.toEditShopById(role);
    }


    public void updateRoleById(Role role) {
        rolemapper.updateRoleById(role);
    }
}
