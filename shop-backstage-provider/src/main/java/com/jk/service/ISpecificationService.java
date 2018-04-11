package com.jk.service;


import com.alibaba.fastjson.JSONObject;
import com.jk.model.Specification;

/**
 * Created by Administrator on 2018/4/10.
 */
public interface ISpecificationService {
    JSONObject querySpecificationList(Specification specification, int rows, int page);
}
