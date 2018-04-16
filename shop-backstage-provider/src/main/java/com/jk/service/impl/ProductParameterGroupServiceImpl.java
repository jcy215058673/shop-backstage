package com.jk.service.impl;

import com.jk.dao.ProductParameterGroupMapper;
import com.jk.model.ProductParameterGroup;
import com.jk.service.ProductParameterGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
@Service("productParameterGroupService")
public class ProductParameterGroupServiceImpl implements ProductParameterGroupService {
    @Autowired
    private ProductParameterGroupMapper productParameterGroupMapper;

    //查询商品参数组
    @Override
    public List<ProductParameterGroup> queryParameterGroup() {
        List<ProductParameterGroup> group=productParameterGroupMapper.queryParameterGroup();
        return group;
    }
}
