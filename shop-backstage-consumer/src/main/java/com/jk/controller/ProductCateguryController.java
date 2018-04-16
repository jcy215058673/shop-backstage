package com.jk.controller;

import com.jk.model.ProductCategory;
import com.jk.service.ProductCateguryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
@Controller
@RequestMapping("/productCateguryController")
public class ProductCateguryController extends BaseController{
    @Autowired
    private ProductCateguryService productCateguryService;

    //查询商品分类列表
    @RequestMapping("/queryProductCategury")
    public ModelAndView queryProductCategury(){
        List<ProductCategory> category=productCateguryService.queryProductCategury();
        ModelAndView mav = new ModelAndView();
        mav.addObject("category",category);
        mav.setViewName("grr/categoryList");
        return mav;
    }

    //新增商品分类
    @RequestMapping("/addCategory")
    public String addCategory(){
        return "grr/addCategory";
    }
}
