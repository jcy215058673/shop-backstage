package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.LogP;

import java.util.List;

/**
 * User：意中人
 * Date:2018/04/10
 * Time:08:55
 */
public interface IAreaService {

    List queryArea();

    JSONObject queryMongo(int page, int rows, LogP logP);
}
