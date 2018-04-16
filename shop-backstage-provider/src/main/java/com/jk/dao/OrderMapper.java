package com.jk.dao;
import com.jk.model.Order;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface OrderMapper {
    /**
     * 用户列表查询
     * @param user
     */

    // public List<Order> orderList(Order order);
    //long orderListTotal(Order order);
   // List<Order> orderListPage( Order order, Integer start, Integer rows);
    //分页查询
    List<Order> orderList(@Param("order") Order order, @Param("page") Integer page, @Param("rows") Integer rows);

  //查看
    List<Order> queryorder(@Param("order") Order order, @Param("ff") Integer ff);



    void updateorder(Order order);

    void deletreorder(@Param("ff") String[] ff);

   // Order Toupdorderhui(Order order);
}