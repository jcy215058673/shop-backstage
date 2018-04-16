package com.jk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * User：意中人
 * Date:2018/04/04
 * Time:13:43
 */
@Controller
@RequestMapping("/usercontroller")
public class UserController extends BaseController{


    @RequestMapping("add")
    public String add(){
        return "long/Deliverytemplate";
    }
    @RequestMapping("adds")
    public String adds(){
        return "long/DeliveryCenter";
    }
    @RequestMapping("addAll")
    public String addAll(){
        return "long/loglist";
    }
}
