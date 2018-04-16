package com.jk.dao;

import com.jk.model.ProductCategory;
import java.math.BigDecimal;
import java.util.List;

public interface ProductCategoryMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProductCategory record);

    int insertSelective(ProductCategory record);

    ProductCategory selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProductCategory record);

    int updateByPrimaryKey(ProductCategory record);
    //查看商品分类列表
    List<ProductCategory> queryProductCategury();
}