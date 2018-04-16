package com.jk.service;

import com.jk.model.Refunds;

import java.util.List;

/**
 * Created by 杨棋洋 on 2018/4/9.
 */
public interface RefundsService {

     //查询
    public List<Refunds> refundsList2();
  //分页查询
   // public List<Refunds> refundsTiao(Refunds refunds,Integer page, Integer rows);

   public List<Refunds> refundsList(Integer theid);

    void deletrefunds(String ids);

    void addrefunds(Refunds refunds);

    void updrefunds(Refunds refunds);

}
