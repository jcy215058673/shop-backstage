package com.jk.dao;

import com.jk.model.Specification;
import com.jk.model.SpecificationValue;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/4/10.
 */
public interface SpecificationMapper {
    //总条数
    long querySpecificationTotal();
    //当前页数据
    List<Specification> querySpecificationList(@Param("spec") Specification specification, @Param("start") int start, @Param("rows") int rows);

    void pldelSpecification(String id);

    void addSpecification(Specification specification);

    void addSpecificationValue(SpecificationValue specificationValue);

    void pldelSpecificationValue(String specification);
}
