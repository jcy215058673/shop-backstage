package com.jk.service.impl;

import com.jk.dao.PeisongMapper;
import com.jk.model.Peisong;
import com.jk.service.PeisongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wbn on 2018/4/8.
 */
@Service("peisongService")
public class PeisongServiceImpl implements PeisongService{

    @Autowired
    private PeisongMapper peisongmapper;

    //查询
    @RequestMapping("peisongList")
    public List<Peisong> peisongList(Peisong peisong) {
        List<Peisong> peisongList = peisongmapper.peisongList(peisong);
        return peisongList;
    }

    //删除
    @Override
    public void deleteShopByIDs(Peisong peisong) {
        String[] split = peisong.getHrmempIDS().split(",");
        List<Integer> list = new ArrayList();
        for (String string : split) {
            list.add(Integer.valueOf(string));
        }
        peisongmapper.deleteShopByIDs(list);
    }

    //新增
    @Override
    public void insertPeisong(Peisong peisong) {
        peisongmapper.insertPeisong(peisong);
    }

    @Override
    public Peisong toEditShopById(Peisong peisong) {
        return peisongmapper.toEditShopById(peisong);
    }

    @Override
    public void updatePeisongById(Peisong peisong) {
        peisongmapper.updatePeisongById(peisong);
    }

}
