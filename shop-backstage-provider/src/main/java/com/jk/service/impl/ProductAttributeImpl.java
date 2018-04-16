package com.jk.service.impl;

import com.jk.dao.ProductAttributeMapper;
import com.jk.model.ProductAttribute;
import com.jk.service.ProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
@Service("productAttributeService")
public class ProductAttributeImpl implements ProductAttributeService {
    @Autowired
    private ProductAttributeMapper productAttributeMapper;

    //查询商品属性列表
    @Override
    public List<ProductAttribute> queryProductAttribute() {
       List<ProductAttribute> productAttributes=productAttributeMapper.queryProductAttribute();
        return productAttributes;
    }
}
