package com.jk.service;

import com.jk.model.ProductCategory;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
public interface ProductCateguryService {
    //查询商品分类列表
    List<ProductCategory> queryProductCategury();
}
