package com.jk.dao;

import com.jk.model.ProductParameterGroup;

import java.util.List;

public interface ProductParameterGroupMapper {
    int insert(ProductParameterGroup record);

    int insertSelective(ProductParameterGroup record);

    //查询商品参数组
    List<ProductParameterGroup> queryParameterGroup();
}