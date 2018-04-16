package com.jk.service.impl;

import com.jk.dao.HyzcMapper;
import com.jk.model.Hydj;
import com.jk.model.Hyzc;
import com.jk.service.HyzcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2018/4/13.
 */
@Service("hyzcservice")
public class HyzcServiceImpl implements HyzcService{
    @Autowired
    private HyzcMapper hyzcmapper;

    //会员注册项查询
    @RequestMapping("gethyzc")
    public List<Hyzc> gethyzc() {
        List<Hyzc> gethyzc = hyzcmapper.gethyzc();
        return gethyzc;
    }
}
