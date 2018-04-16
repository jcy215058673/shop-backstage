package com.jk.service;

import com.jk.model.Peisong;

import java.util.List;

/**
 * Created by wbn on 2018/4/8.
 */
public interface PeisongService {

    //查询
    public List<Peisong> peisongList(Peisong peisong);

    //删除
    public void deleteShopByIDs(Peisong peisong);

    //新增
    void insertPeisong(Peisong peisong);

    //查询回显
    Peisong toEditShopById(Peisong peisong);
    //修改
    void updatePeisongById(Peisong peisong);
}
