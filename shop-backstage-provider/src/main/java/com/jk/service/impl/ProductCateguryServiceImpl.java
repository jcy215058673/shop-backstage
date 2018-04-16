package com.jk.service.impl;

import com.jk.dao.ProductCategoryMapper;
import com.jk.model.ProductCategory;
import com.jk.service.ProductCateguryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
@Service("productCateguryService")
public class ProductCateguryServiceImpl implements ProductCateguryService {
    @Autowired
    ProductCategoryMapper productCateguryMapper;

    //查看商品分类列表
    @Override
    public List<ProductCategory> queryProductCategury() {
       List<ProductCategory> categories= productCateguryMapper.queryProductCategury();
        return categories;
    }
}
