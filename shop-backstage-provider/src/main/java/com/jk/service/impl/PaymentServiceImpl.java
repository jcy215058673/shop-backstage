package com.jk.service.impl;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.dao.PaymentMapper;
import com.jk.model.Payment;
import com.jk.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by yangzhichao on 2018-04-03.
 */
@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentMapper paymentMapper;

    public List<Payment> querypayment(Payment payment) {
        List<Payment> paymentList = paymentMapper.querypayment(payment);
        return paymentList;
    }
/*
   public JSONObject querypayment(Payment payment) {

       JSONObject json= paymentMapper.querypayment(payment);

       return json;


   }*/
//卸载
    public int xz(Payment payment) {
    // TODO Auto-generated method stub
    return paymentMapper.xz(payment);
    }


    //安装
    public int az(Payment payment) {
        // TODO Auto-generated method stub
        return paymentMapper.az(payment);
    }

}
