package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.SpecificationMapper;
import com.jk.model.Specification;
import com.jk.model.SpecificationValue;
import com.jk.service.ISpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2018/4/10.
 */
@Service("specificationService")
public class SpecificationServiceImpl implements ISpecificationService{



    @Autowired
    private SpecificationMapper specificationMapper;

    /**
     * 查询
     * @param specification
     * @param rows
     * @param page
     * @return
     */
    public JSONObject querySpecificationList(Specification specification, int rows, int page) {
        long total = specificationMapper.querySpecificationTotal();
        int start = (page-1)*rows+1;
        List<Specification> brands = specificationMapper.querySpecificationList(specification, start, rows);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", brands);
        return json;
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @Override
    public Integer pldelSpecification(String ids) {
        String[] idsArr = ids.split(",");
        for (int i = 0; i < idsArr.length; i++ ){
            specificationMapper.pldelSpecification(idsArr[i]);
            specificationMapper.pldelSpecificationValue(idsArr[i]);
        }
        return 1;
    }

    /**
     * 添加
     * @param specification
     * @param specificationValue
     * @return
     */
    @Override
    public Integer addSpecification(Specification specification, SpecificationValue specificationValue) {
        String uuid=UUID.randomUUID().toString().replace("-", "");
        specification.setId(uuid);
        specificationMapper.addSpecification(specification);

        String[] svnameArr = specificationValue.getSvname().split(",");
        String[] svordersArr = specificationValue.getSvorders().split(",");
        for(int i=0; i<svnameArr.length; i++){
            specificationValue.setSpecification(uuid);
            specificationValue.setSvname(svnameArr[i]);
            specificationValue.setSvorders(svordersArr[i]);
            specificationMapper.addSpecificationValue(specificationValue);
        }

        return 1;
    }
}
