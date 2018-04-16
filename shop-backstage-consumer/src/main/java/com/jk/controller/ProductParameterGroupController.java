package com.jk.controller;

import com.jk.model.ProductParameterGroup;
import com.jk.service.ProductParameterGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
@Controller
@RequestMapping("/productParameterGroupController")
public class ProductParameterGroupController extends BaseController{
    @Autowired
    private ProductParameterGroupService productParameterGroupService;

    //查询商品参数组
    @RequestMapping("/queryParameterGroup")
    public ModelAndView queryParameterGroup(){
        List<ProductParameterGroup> group= productParameterGroupService.queryParameterGroup();
        ModelAndView mav = new ModelAndView();
        mav.addObject("group",group);
        mav.setViewName("grr/parameterGroupList");
        return mav;
    }

}
