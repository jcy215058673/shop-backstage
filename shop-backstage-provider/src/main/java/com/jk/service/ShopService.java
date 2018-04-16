package com.jk.service;

import com.jk.model.Hydj;
import com.jk.model.Hygl;
import com.jk.model.Hyzc;
import com.jk.model.Tree;

import java.util.List;

/**
 * Created by Administrator on 2018/4/8.
 */
public interface ShopService {
    List<Tree> getTree();

   /* List<String> gethygl();*/

    /*List<String> gethyglByPage(Integer page, Integer rows);*/

    //查询
    public List<Hygl> gethygl();
    //新增
    void insertHygl(Hygl hygl);
    //删除
    public void deleteHygl(Hygl hygl);
    //回显
    Hygl updateHyglTab(String id);
    //修改
    void updateHygl(Hygl hygl);

   public List<Hydj> gethydj();
    void insertHydj(Hydj hydj);
    void deleteHydj(Hydj hydj);
    Hydj updateHydjById(String id);

    void updateHydj(Hydj hydj);

   /*public List<Hyzc> gethyzc();*/
}
