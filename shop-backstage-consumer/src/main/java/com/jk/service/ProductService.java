package com.jk.service;

import com.jk.model.Product;

import java.util.List;

/**
 * Created by admin on 2018/4/9.
 */
public interface ProductService {
    List<Product> productList();

    void addProductList(Product product);
}
