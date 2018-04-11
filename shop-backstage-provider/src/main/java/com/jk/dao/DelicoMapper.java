package com.jk.dao;

import com.jk.model.Delico;
import java.math.BigDecimal;
import java.util.List;

public interface DelicoMapper {
    
    List<Delico> delicoList();

    void deleteShopByIDs(List<Integer> list);

    void insertDelico(Delico delico);

    Delico toEditShopById(Delico delico);

    void updateDelicoById(Delico delico);
}