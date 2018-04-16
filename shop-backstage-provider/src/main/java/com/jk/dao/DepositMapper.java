package com.jk.dao;

import com.jk.model.Deposit;
import com.jk.model.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepositMapper {
    /**
     * 用户列表查询
     * @param user
     */

    //分页查询
    List<Deposit> depositList(@Param("deposit") Deposit deposit, @Param("page") Integer page, @Param("rows") Integer rows);


    List<Deposit> qquerydeposit(@Param("deposit") Deposit deposit, @Param("ff") Integer ff);
}