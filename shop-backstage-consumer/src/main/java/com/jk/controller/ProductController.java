package com.jk.controller;
import com.alibaba.fastjson.JSONObject;
import com.jk.model.Product;
import com.jk.model.ProductCategory;
import com.jk.service.ProductCateguryService;
import com.jk.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by admin on 2018/4/12.
 */
@Controller
@RequestMapping("/productController")
public class ProductController extends BaseController{
    @Autowired
    private ProductService productService;

    @Autowired
    private ProductCateguryService productCateguryService;

 /*   @RequestMapping("/toProductList")
    public String toProductList(){
        return "grr/productList";
    }*/

  /*  @RequestMapping("/productList")
    @ResponseBody
    public Object productList(){
        JSONObject json = productService.productList();
        return json;
    }*/
    @RequestMapping("/productList")
    public ModelAndView productList(){
        ModelAndView mav = new ModelAndView();
        List<Product> productList = productService.productList();
        mav.addObject("productList",productList);
        mav.setViewName("grr/productList");
        return mav;
    }

    @RequestMapping("/addProductList")
    public String addProductList(HttpServletRequest request){
        List<ProductCategory> categories = productCateguryService.queryProductCategury();
        request.setAttribute("categories",categories);

        return "grr/addProduct";
    }

    @RequestMapping("/addToProductList")
    @ResponseBody
    public void addToProductList(Product product){
        productService.addProductList(product);
    }

}
