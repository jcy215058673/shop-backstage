package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.SpecificationMapper;
import com.jk.model.Specification;
import com.jk.service.ISpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/10.
 */
@Service("specificationService")
public class SpecificationServiceImpl implements ISpecificationService{

    @Autowired
    private SpecificationMapper specificationMapper;

    public JSONObject querySpecificationList(Specification specification, int rows, int page) {
        long total = specificationMapper.querySpecificationTotal();
        int start = (page-1)*rows+1;
        List<Specification> brands = specificationMapper.querySpecificationList(specification, start, rows);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", brands);
        return json;
    }
}
