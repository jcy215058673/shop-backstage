package com.jk.dao;

import com.jk.model.Product;

import java.util.List;

public interface ProductMapper {
    int insert(Product record);

    int insertSelective(Product record);
//查询商品列表
    List<Product> productList();
//新增商品基本信息
    void addProductList(Product product);
}