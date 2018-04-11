package com.jk.service;

import com.jk.model.Delico;

import java.util.List;

/**
 * Created by wbn on 2018/4/10.
 */
public interface DelicoService {

    List<Delico> delicoList();

    void deleteShopByIDs(Delico delico);

    void insertDelico(Delico delico);

    Delico toEditShopById(Delico delico);

    void updateDelicoById(Delico delico);
}
