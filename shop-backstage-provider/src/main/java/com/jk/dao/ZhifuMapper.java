package com.jk.dao;

import com.jk.model.Zhifu;

import java.util.List;

/**
 * Created by wbn on 2018/4/9.
 */
public interface ZhifuMapper {

    List<Zhifu> zhifuList(Zhifu zhifu);

    void deleteShopByIDss(List<Integer> list);

    void insertZhifu(Zhifu zhifu);

    Zhifu toEditZhifu(Zhifu zhifu);

    void updateZhifuById(Zhifu zhifu);
}
