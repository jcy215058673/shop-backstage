package com.jk.controller;

import com.alibaba.dubbo.common.json.JSONObject;
import com.jk.model.Payment;
import com.jk.service.PaymentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by yangzhichao on 2018-04-03.
 */
@Controller
@RequestMapping("/paymentController")
public class PaymentController extends BaseController {
    //日志记录
    private static final Logger logger = Logger.getLogger(PaymentController.class);

    @Autowired
    private PaymentService paymentService;

    /**
     * 用户列表查询
     * @param payment
     */
    @RequestMapping("/querypayment")
    public void querypayment(Payment payment, HttpServletResponse response) {
        List<Payment> paymentList = paymentService.querypayment(payment);
        super.writeJson(paymentList, response);
    }
    //卸载
    @RequestMapping("xz")
    @ResponseBody
    private Object xz(Payment payment){
        int a=paymentService.xz(payment);

        return a;
    }
    //安装
    @RequestMapping("az")
    @ResponseBody
    private Object az(Payment payment){
        int b=paymentService.az(payment);
        return b;
    }
	 //增加跳转页面
    @RequestMapping("topayment")
    String topayment(){
        return "lzh/showpay";
    }
	
}
