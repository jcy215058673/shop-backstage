package com.jk.service;

import com.jk.model.Deliverytemplate;

import java.util.List;

/**
 * User：意中人
 * Date:2018/04/08
 * Time:14:06
 */
public interface IDeliverytemplateService {

    List<Deliverytemplate> queryDeliverytemplate(Deliverytemplate deliverytemplate);

    Deliverytemplate updateDeliverytemplateById(Long id);

    void updateDeliverytemplate(Deliverytemplate deliverytemplate);

    void addDeliverytemplate(Deliverytemplate deliverytemplate);

    int delDeliverytemplates(String ids);
}
