package com.jk.dao;

import com.jk.model.Deliverytemplate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * User：意中人
 * Date:2018/04/08
 * Time:14:07
 */
public interface DeliverytemplateMapper {

    List<Deliverytemplate> queryDeliverytemplate(Deliverytemplate deliverytemplate);

    Deliverytemplate updateDeliverytemplateById(Long id);

    void updateDeliverytemplate(Deliverytemplate deliverytemplate);

    void addDeliverytemplate(Deliverytemplate deliverytemplate);

    int delDeliverytemplates(@Param("ids") String ids);
}
