package com.jk.service.impl;

import com.jk.model.Hydj;
import com.jk.model.Hygl;
import com.jk.model.Hyzc;
import org.springframework.stereotype.Service;
import com.jk.dao.ShopMapper;
import com.jk.model.Tree;
import com.jk.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/8.
 */
@Service("shopservice")
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopMapper shopmapper;


    public List<Tree> getTree() {
        return shopmapper.getTree();
    }

    /*@Override
    public List<String> gethygl() {
        return shopmapper.gethygl();
    }*/
    //会员管理查询
    @RequestMapping("gethygl")
    public List<Hygl> gethygl() {
        List<Hygl> gethygl = shopmapper.gethygl();
        return gethygl;
    }
    //会员等级查询
    @RequestMapping("gethydj")
    public List<Hydj> gethydj() {
        List<Hydj> gethydj = shopmapper.gethydj();
        return gethydj;
    }
    //会员注册项查询
    /*@RequestMapping("gethyzc")
    public List<Hyzc> gethyzc(){
        List<Hyzc> gethyzc = shopmapper.gethyzc();
        return gethyzc();
    }*/
    //会员管理新增
    @Override
    public void insertHygl(Hygl hygl) {
        //获取当前系统时间
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //当前时间转化为字符串 format()    将字符串转化成当前时间 parse()
        String time1 = sdf.format(date);
        hygl.setCreate_date(time1);

        shopmapper.insertHygl(hygl);
    }
    //会员等级新增
    @Override
    public void insertHydj(Hydj hydj) {

        shopmapper.insertHydj(hydj);
    }
    /* @Override
     public List<String> gethyglByPage(Integer page, Integer rows) {
         page = (page-1)*rows;
         return shopmapper.gethyglByPage(page,rows);
     }*/
    //会员管理删除
   @Override
   public void deleteHygl(Hygl hygl) {
       String[] split = hygl.getIds().split(",");
       List<Integer> list = new ArrayList<Integer>();
       for (String string : split) {
           list.add(Integer.valueOf(string));
       }
       shopmapper.deleteHygl(list);
   }
    //会员等级删除
    @Override
    public void deleteHydj(Hydj hydj) {
        String[] split = hydj.getIds().split(",");
        List<Integer> list = new ArrayList<Integer>();
        for (String string : split) {
            list.add(Integer.valueOf(string));
        }
        shopmapper.deleteHydj(list);
    }
    //会员管理回显
    @Override
    public Hygl updateHyglTab(String id) {
        return shopmapper.updateHyglTab(id);
    }
    //会员等级回显
    @Override
    public Hydj updateHydjById(String id) {
        return shopmapper.updateHydjById(id);
    }

    //会员管理修改
    @Override
    public void updateHygl(Hygl hygl) {
        shopmapper.updateHygl(hygl);

    }
    //会员等级修改
    @Override
    public void updateHydj(Hydj hydj) {
        shopmapper.updateHydj(hydj);

    }



}
