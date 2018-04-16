package com.jk.controller;

import com.jk.model.Deposit;
import com.jk.service.DepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/11.
 */
@Controller
@RequestMapping("/depositController")
public class DepositController extends BaseController{

    @Autowired
    private DepositService depositService;


    //跳转到收款管理页面
    @RequestMapping("Toshoukuan")
    public String Toshoukuan() {
        return "yang/shoukuanManger";
    }

    //跳转到查看收款管理页面
    @RequestMapping("TochaShoukuan")
    public String TochaShoukuan() {
        return "yang/chakanShoukuan";
    }

    //收款管理查询
    @RequestMapping("/findshoukuan")
    public void findshoukuan(Deposit deposit, HttpServletResponse response, Integer page, Integer rows) {
        List<Deposit> depositList = depositService.depositList(deposit,page,rows);
        super.writeJson(depositList, response);
    }


    //收款管理查看
    @RequestMapping("/chaShoukuan")
    public void chaShoukuan(Deposit deposit, HttpServletResponse response,Integer ff) {
        List<Deposit> qquerydeposit = depositService.qquerydeposit(deposit,ff);
        super.writeJson(qquerydeposit, response);
    }
}
