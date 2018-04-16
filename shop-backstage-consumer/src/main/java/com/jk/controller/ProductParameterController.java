package com.jk.controller;

import com.jk.model.ProductParameter;
import com.jk.service.ProductParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
@Controller
@RequestMapping("/productParameterController")
public class ProductParameterController extends BaseController{
    @Autowired
    private ProductParameterService productParameterService;
//查询商品参数列表
    @RequestMapping("/queryProductParameter")
    public ModelAndView queryProductParameter(){
        List<ProductParameter> parameters=productParameterService.queryProductParameter();
        ModelAndView mav = new ModelAndView();
        mav.addObject("parameters",parameters);
        mav.setViewName("grr/parameterList");
        return mav;
    }

    //新增商品参数列表
    @RequestMapping("/addParameter")
    public String addParameter(){
        return "grr/addParameter";
    }
}
