package com.jk.service;

import com.jk.model.DeliveryCenter;

import java.util.List;

/**
 * User：意中人
 * Date:2018/04/09
 * Time:16:33
 */
public interface IDeliverycenterService {

    List<DeliveryCenter> queryDeliveryCenter(DeliveryCenter deliverycenter);

    int delDeliverycenter(String ids);

    void addDeliverycenter(DeliveryCenter deliverycenter);

    DeliveryCenter updateDeliverycenterById(Long id);

    void updateDeliverycenter(DeliveryCenter deliverycenter);
}
