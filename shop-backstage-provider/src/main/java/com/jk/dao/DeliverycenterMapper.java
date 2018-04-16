package com.jk.dao;

import com.jk.model.DeliveryCenter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * User：意中人
 * Date:2018/04/09
 * Time:16:32
 */
public interface DeliverycenterMapper {

    List<DeliveryCenter> queryDeliveryCenter(DeliveryCenter deliverycenter);

    int delDeliverycenter(@Param("ids") String ids);

    void addDeliverycenter(DeliveryCenter deliverycenter);

    DeliveryCenter updateDeliverycenterById(Long id);

    void updateDeliverycenter(DeliveryCenter deliverycenter);
}
