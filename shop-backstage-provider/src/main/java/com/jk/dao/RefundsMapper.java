package com.jk.dao;

import com.jk.model.Refunds;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RefundsMapper {
    /**
     * 用户列表查询
     * @param user
     */
   /*查询*/
    public List<Refunds> refundsList2();
  /*查看*/
    public List<Refunds> refundsList(@Param("theid") Integer theid);

    void deletrefunds(@Param("ff") String[] ff);

    void addrefunds(Refunds refunds);

    void updrefunds(Refunds refunds);
  //分页查询
   // List<Refunds> refundsTiao(@Param("refunds")Refunds refunds,@Param("page") Integer page,@Param("rows") Integer rows);
}