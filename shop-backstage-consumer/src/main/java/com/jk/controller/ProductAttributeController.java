package com.jk.controller;

import com.jk.model.ProductAttribute;
import com.jk.service.ProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by admin on 2018/4/15.
 */
@Controller
@RequestMapping("/productAttributeController")
public class ProductAttributeController extends BaseController{
    @Autowired
    private ProductAttributeService productAttributeService;

    @RequestMapping("/queryProductAttribute")
    public ModelAndView queryProductAttribute(){
        List<ProductAttribute> attributes=productAttributeService.queryProductAttribute();
        ModelAndView mav = new ModelAndView();
        mav.addObject("attributes",attributes);
        mav.setViewName("grr/attributeList");
        return mav;
    }

    //新增商品属性
    @RequestMapping("/addAttribute")
    public String addAttribute(){
        return "grr/addAttributeList";
    }

}
