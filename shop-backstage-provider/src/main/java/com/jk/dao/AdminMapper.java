package com.jk.dao;

import com.jk.model.Admin;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Admin record);

    int insertSelective(Admin record);

    public List<Admin> queryadmin(Admin admin);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    //删除
    void deladmin(List<Integer> adminlist);
}