package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Product;

import java.util.List;

/**
 * Created by admin on 2018/4/9.
 */
public interface ProductService {
    //查询商品列表
    List<Product> productList();
    //新增商品基本信息
    void addProductList(Product product);
}
