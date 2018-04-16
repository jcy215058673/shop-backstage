package com.jk.service.impl;

import com.jk.dao.DepositMapper;
import com.jk.model.Deposit;
import com.jk.service.DepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/11.
 */
@Service("depositService")
public class DepositServiceImpl implements DepositService{

    @Autowired
    private DepositMapper depositMapper;

    public List<Deposit> depositList(Deposit deposit, Integer page, Integer rows) {
        page = (page-1)*rows;
        return depositMapper.depositList(deposit,page,rows);
    }
    //查看
    public List<Deposit> qquerydeposit(Deposit deposit, Integer ff) {
        List<Deposit> qquerydeposit = depositMapper.qquerydeposit(deposit,ff);
        return qquerydeposit;
    }
}
