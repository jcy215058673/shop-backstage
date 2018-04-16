package com.jk.dao;

import com.jk.model.Order;
import com.jk.model.Shipping;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShippingMapper {
    /**
     * 用户列表查询
     * @param user
     */

    public List<Shipping> shipList(@Param("shipping") Shipping shipping, @Param("page") Integer page, @Param("rows") Integer rows);

    void deleteship(@Param("ff") String[] ff);

    void addshp(Shipping shipping);

    void updship(Shipping shipping);
}