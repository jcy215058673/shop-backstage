package com.jk.service;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.Payment;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by yangzhichao on 2018-04-03.
 */
public interface PaymentService {

    /**
     * 用户列表查询
     * @param payment
     * @return
     */
    public List<Payment> querypayment(Payment payment);

/*
    JSONObject querypayment(Payment payment);
*/
    //卸载
    int xz(Payment payment);

    //安装
    int az(Payment payment);
}
