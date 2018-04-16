package com.jk.service.impl;

import com.jk.dao.DeliverycenterMapper;
import com.jk.model.DeliveryCenter;
import com.jk.service.IDeliverycenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User：意中人
 * Date:2018/04/09
 * Time:16:34
 */
@Service("deliverycenterService")
public class DeliverycenterServiceImpl implements IDeliverycenterService{

    @Autowired
    private DeliverycenterMapper deliverycenterMapper;

    //查询
    public List<DeliveryCenter> queryDeliveryCenter(DeliveryCenter deliverycenter) {
        List<DeliveryCenter> deliverycenterList = deliverycenterMapper.queryDeliveryCenter(deliverycenter);
        return deliverycenterList;
    }

    //删除
    public int delDeliverycenter(String ids) {
        return deliverycenterMapper.delDeliverycenter(ids);
    }

    //新增
    public void addDeliverycenter(DeliveryCenter deliverycenter) {
        deliverycenterMapper.addDeliverycenter(deliverycenter);
    }

    //回显
    public DeliveryCenter updateDeliverycenterById(Long id) {
        return deliverycenterMapper.updateDeliverycenterById(id);
    }

    //修改
    public void updateDeliverycenter(DeliveryCenter deliverycenter) {
        deliverycenterMapper.updateDeliverycenter(deliverycenter);
    }

}
