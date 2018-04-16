package com.jk.service;


import com.alibaba.fastjson.JSONObject;
import com.jk.model.Specification;
import com.jk.model.SpecificationValue;

/**
 * Created by Administrator on 2018/4/10.
 */
public interface ISpecificationService {
    JSONObject querySpecificationList(Specification specification, int rows, int page);

    Integer pldelSpecification(String ids);

    Integer addSpecification(Specification specification, SpecificationValue specificationValue);
}
