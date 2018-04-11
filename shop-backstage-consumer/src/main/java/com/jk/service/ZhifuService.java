package com.jk.service;

import com.jk.model.Zhifu;

import java.util.List;

/**
 * Created by wbn on 2018/4/9.
 */
public interface ZhifuService {

    List<Zhifu> zhifuList();

    void deleteShopByIDss(Zhifu zhifu);

    void insertZhifu(Zhifu zhifu);

    Zhifu toEditZhifu(Zhifu zhifu);

    void updateZhifuById(Zhifu zhifu);
}
