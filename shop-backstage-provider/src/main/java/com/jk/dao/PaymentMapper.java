package com.jk.dao;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.Payment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PaymentMapper {
    /**
     * 用户列表查询
     * @param payment
     */
    public List<Payment> querypayment(Payment payment);
   /* JSONObject querypayment(Payment payment);*/
   //卸载
   int xz(Payment payment);

    //安装
    int az(Payment payment);
}