package com.jk.service.impl;

import com.jk.dao.DeliverytemplateMapper;
import com.jk.model.Deliverytemplate;
import com.jk.service.IDeliverytemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User：意中人
 * Date:2018/04/08
 * Time:14:06
 */
@Service("deliverytemplateService")
public class DeliverytemplateServiceImpl implements IDeliverytemplateService{

    @Autowired
    private DeliverytemplateMapper deliverytemplateMapper;

    //查询
    public List<Deliverytemplate> queryDeliverytemplate(Deliverytemplate deliverytemplate) {
        List<Deliverytemplate> deliverytemplateList = deliverytemplateMapper.queryDeliverytemplate(deliverytemplate);
        return deliverytemplateList;
    }

    //回显
    public Deliverytemplate updateDeliverytemplateById(Long id) {
        return deliverytemplateMapper.updateDeliverytemplateById(id);
    }

    //修改
    public void updateDeliverytemplate(Deliverytemplate deliverytemplate) {
        deliverytemplateMapper.updateDeliverytemplate(deliverytemplate);
    }

    //新增
    public void addDeliverytemplate(Deliverytemplate deliverytemplate){
        deliverytemplateMapper.addDeliverytemplate(deliverytemplate);
    }

    //删除
    public int delDeliverytemplates(String ids) {
        return deliverytemplateMapper.delDeliverytemplates(ids);
    }
}
