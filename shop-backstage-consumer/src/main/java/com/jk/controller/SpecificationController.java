package com.jk.controller;



import com.alibaba.fastjson.JSONObject;
import com.jk.model.Specification;
import com.jk.service.ISpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2018/4/10.
 */
@Controller
@RequestMapping("/specification")
public class SpecificationController extends BaseController{

    @Autowired
    private ISpecificationService specificationService;

    @RequestMapping("/toSpecificationList")
    public String toSpecificationList(){
        return "specification/specificationList";
    }
    //查询
    @RequestMapping("querySpecificationList")
    @ResponseBody
    public Object querySpecificationList(Specification specification, int rows, int page,HttpServletResponse response){
        JSONObject json = specificationService.querySpecificationList(specification, rows, page);
        return json;
    }
}
