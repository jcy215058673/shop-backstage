package com.jk.dao;

import com.jk.model.Delico;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface DelicoMapper {
    
    List<Delico> delicoList(@Param("delico") Delico delico, @Param("page") Integer page, @Param("rows") Integer rows);

    void deleteShopByIDs(List<Integer> list);

    void insertDelico(Delico delico);

    Delico toEditShopById(Delico delico);

    void updateDelicoById(Delico delico);
}