package com.jk.service.impl;

import com.jk.dao.ZhifuMapper;
import com.jk.model.Zhifu;
import com.jk.service.ZhifuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wbn on 2018/4/9.
 */
@Service("zhifuService")
public class ZhifuServiceImpl implements ZhifuService{

    @Autowired
    private ZhifuMapper zhifumapper;

    @Override
    public List<Zhifu> zhifuList() {
        List<Zhifu> zhifuList = zhifumapper.zhifuList();
        return zhifuList;
    }

    @Override
    public void deleteShopByIDss(Zhifu zhifu) {
        String[] split = zhifu.getHrmempIDS().split(",");
        List<Integer> list = new ArrayList();
        for (String string : split) {
            list.add(Integer.valueOf(string));
        }
        zhifumapper.deleteShopByIDss(list);
    }

    @Override
    public void insertZhifu(Zhifu zhifu) {
        zhifumapper.insertZhifu(zhifu);
    }

    @Override
    public Zhifu toEditZhifu(Zhifu zhifu) {
        return zhifumapper.toEditZhifu(zhifu);
    }

    @Override
    public void updateZhifuById(Zhifu zhifu) {
        zhifumapper.updateZhifuById(zhifu);
    }
}
