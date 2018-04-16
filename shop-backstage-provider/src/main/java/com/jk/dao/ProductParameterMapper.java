package com.jk.dao;

import com.jk.model.ProductParameter;
import java.math.BigDecimal;
import java.util.List;

public interface ProductParameterMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProductParameter record);

    int insertSelective(ProductParameter record);

    ProductParameter selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProductParameter record);

    int updateByPrimaryKey(ProductParameter record);
    //查询商品参数列表
    List<ProductParameter> queryProductParameter();
}