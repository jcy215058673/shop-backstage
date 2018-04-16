package com.jk.service;

import com.jk.model.ProductAttribute;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
public interface ProductAttributeService {
    //查询商品属性列表
    List<ProductAttribute> queryProductAttribute();
}
