package com.jk.service.impl;

import com.jk.dao.ProductMapper;
import com.jk.model.Product;
import com.jk.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by admin on 2018/4/9.
 */
@Service("productService")
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductMapper productMapper;
    //查询商品信息
    public List<Product> productList(){
        List<Product> products = productMapper.productList();
        return products;
    }

    //新增商品列表
    @Override
    public void addProductList(Product product) {
        productMapper.addProductList(product);
    }

}
