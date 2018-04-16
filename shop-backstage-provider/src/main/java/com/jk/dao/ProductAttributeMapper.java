package com.jk.dao;

import com.jk.model.ProductAttribute;

import java.util.List;

public interface ProductAttributeMapper {
    int insert(ProductAttribute record);

    int insertSelective(ProductAttribute record);

    //查询商品属性列表
 List<ProductAttribute> queryProductAttribute();
}