package com.jk.service.impl;

import com.jk.dao.DelicoMapper;
import com.jk.model.Delico;
import com.jk.service.DelicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.ArrayList;
import java.util.List;

/**
 * Created by wbn on 2018/4/10.
 */
@Service("delicoService")
public class DelicoServiceImpl  implements DelicoService{

    @Autowired
    private DelicoMapper delicomapper;

    //查询
    @RequestMapping("delicoList")
    public List<Delico> delicoList() {
        List<Delico> delicoList = delicomapper.delicoList();
        return delicoList;
    }

    //删除
    @Override
    public void deleteShopByIDs(Delico delico) {
        String[] split = delico.getHrmempIDS().split(",");
        List<Integer> list = new ArrayList();
        for (String string : split) {
            list.add(Integer.valueOf(string));
        }
        delicomapper.deleteShopByIDs(list);
    }

    //新增
    @Override
    public void insertDelico(Delico delico) {
        delicomapper.insertDelico(delico);
    }

    @Override
    public Delico toEditShopById(Delico delico) {
        return delicomapper.toEditShopById(delico);
    }

    @Override
    public void updateDelicoById(Delico delico) {
        delicomapper.updateDelicoById(delico);
    }
}
