package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.AreaMapper;
import com.jk.model.LogP;
import com.jk.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User：意中人
 * Date:2018/04/10
 * Time:08:56
 */
@Service("areaService")
public class AreaServiceImpl implements IAreaService{

    @Autowired
    private AreaMapper areamapper;

    @Autowired
    private MongoTemplate mongoTemplate;

    public List queryArea() {
        return areamapper.queryArea();
    }

    public JSONObject queryMongo(int page, int rows, LogP logP) {
        //mongodb分页查询
        Query query=new Query();
        long totalCount = mongoTemplate.count(query, LogP.class,"logP");
        int start = (page-1)*rows;
        query.skip(start);
        query.limit(rows);

        Criteria cr =new Criteria();

        if (logP.getReturnval()!=null&&logP.getReturnval()!="") {
            query.addCriteria(Criteria.where("returnval").regex((String) logP.getReturnval()));
        }
        if(logP.getQidate()!=null&&logP.getQidate()!=""){
            query.addCriteria(Criteria.where("mondate").gt(logP.getQidate()));
        }
        if(logP.getEnddate()!=null&&logP.getEnddate()!=""){
            query.addCriteria(cr.andOperator(Criteria.where("mondate").lt(logP.getEnddate())));
        }
        List<LogP> find = mongoTemplate.find(query, LogP.class,"logP");
        JSONObject json=new JSONObject();
        json.put("total", totalCount);
        json.put("rows", find);
        return json;
    }

}
