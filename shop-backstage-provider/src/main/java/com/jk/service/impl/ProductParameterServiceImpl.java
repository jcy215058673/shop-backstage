package com.jk.service.impl;

import com.jk.dao.ProductParameterMapper;
import com.jk.model.ProductParameter;
import com.jk.service.ProductParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
@Service("productParameterService")
public class ProductParameterServiceImpl implements ProductParameterService {
    @Autowired
    private ProductParameterMapper productParameterMapper;

    //查询商品参数列表
    @Override
    public List<ProductParameter> queryProductParameter() {
        List<ProductParameter> parameters=productParameterMapper.queryProductParameter();
        return parameters;
    }
}
