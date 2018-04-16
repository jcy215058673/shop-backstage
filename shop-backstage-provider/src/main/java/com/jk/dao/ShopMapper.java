package com.jk.dao;

import com.jk.model.Hydj;
import com.jk.model.Hygl;
import com.jk.model.Hyzc;
import com.jk.model.Tree;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/4/8.
 */
public interface ShopMapper {
    List<Tree> getTree();

    /*List<String> gethygl();*/

    /*List<String> gethyglByPage(@Param("page") Integer page, @Param("rows") Integer rows);*/

    public List<Hygl> gethygl();

    void insertHygl(Hygl hygl);

    public void deleteHygl(List<Integer> list);

    Hygl updateHyglTab(String id);

    void updateHygl(Hygl hygl);

   public List<Hydj> gethydj();

    void insertHydj(Hydj hydj);

    void deleteHydj(List<Integer> list);

    Hydj updateHydjById(String id);

    void updateHydj(Hydj hydj);

   /* List<Hyzc> gethyzc();*/
}
