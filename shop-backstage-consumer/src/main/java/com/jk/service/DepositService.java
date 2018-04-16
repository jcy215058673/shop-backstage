package com.jk.service;

import com.jk.model.Deposit;

import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/11.
 */
public interface DepositService {

    public List<Deposit> depositList(Deposit deposit, Integer page, Integer rows);

    //查看
    public  List<Deposit> qquerydeposit(Deposit deposit, Integer ff);


}
