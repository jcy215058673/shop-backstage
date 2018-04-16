package com.jk.service.impl;

import com.jk.dao.RefundsMapper;
import com.jk.model.Refunds;
import com.jk.service.RefundsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/9.
 */
@Service("refundsService")
public class RefundsServiceImpl implements RefundsService{

    @Autowired
    private RefundsMapper refundsMapper;

    //查询
   public List<Refunds> refundsList2() {
        List<Refunds> refundsList2 = refundsMapper.refundsList2();
        return refundsList2;
    }
    //分页查询
   /* public List<Refunds> refundsTiao(Refunds refunds, Integer page, Integer rows) {
        page = (page-1)*rows;
        return refundsMapper.refundsTiao(refunds,page,rows);
    }*/

    public List<Refunds> refundsList(Integer theid) {
        List<Refunds> refundsList = refundsMapper.refundsList(theid);
        return refundsList;
    }

    public void deletrefunds(String ids) {
        String [] ff = ids.split(",");
        refundsMapper.deletrefunds(ff);
    }

    public void addrefunds(Refunds refunds) {
        refundsMapper.addrefunds(refunds);
    }

    public void updrefunds(Refunds refunds) {
        refundsMapper.updrefunds(refunds);
    }
}
