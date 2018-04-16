package com.jk.dao;

import com.jk.model.Peisong;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by wbn on 2018/4/8.
 */
public interface PeisongMapper {

    public List<Peisong> peisongList(Peisong peisong);

    public void deleteShopByIDs(List<Integer> list);

    void insertPeisong(Peisong peisong);

    Peisong toEditShopById(Peisong peisong);

    void updatePeisongById(Peisong peisong);
}
