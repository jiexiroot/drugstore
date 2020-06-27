package com.jiexi.drug.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.jiexi.drug.config.AlipayConfig;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Orders;
import com.jiexi.drug.service.OrderService;
import com.jiexi.drug.service.UserService;
import com.jiexi.drug.util.StringToInt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

/**
 * @author GOU
 * @Date 2020-06-21 20:17
 */
@Controller
public class PhoneOrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    UserService userService;




    @RequestMapping("/api/Phoneshoworder")
    @ResponseBody
    public Map<String, Object> showOrder(String uid){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        System.out.println("uid"+uid);
        if(!("".equals(uid))){
            List<Orders> orders = orderService.showAllOrder(Integer.parseInt(uid));
            if(orders.size()==0){
                resultMap.put("result",2);
                resultMap.put("message","订单为空");
            }else{
                resultMap.put("result",1);
                resultMap.put("message",orders);
            }
        }else{
            resultMap.put("result",0);
            resultMap.put("message","空参数");
        }
        return resultMap;
    }

    @RequestMapping("/api/PhoneshowOkorder")
    @ResponseBody
    public Map<String, Object> showOkOrder(String uid){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if(!("".equals(uid))){
            List<Orders> orders = orderService.showOrder(Integer.parseInt(uid),1);
            if(orders.size()==0){
                resultMap.put("result",2);
                resultMap.put("message","购物车为空");
            }else{
                resultMap.put("result",1);
                resultMap.put("message",orders);
            }
        }else{
            resultMap.put("result",0);
            resultMap.put("message","空参数");
        }
        return resultMap;
    }


    /**
     * 生成订单
     * @return
     */
    @RequestMapping("/api/Phoneaddorder")
    @ResponseBody
    public Map<String, Object> PhoneaddOrder(String uid,String did,String cid){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if(!("".equals(uid))){
            Order order = new Order();
            Integer uid2=Integer.parseInt(uid);
            Integer did2=Integer.parseInt(did);
            Integer cid2=Integer.parseInt(cid);
            order.setUid(uid2);
            order.setDid(did2);
            order.setCid(cid2);
            order.setAmount(1);
            orderService.addOrder(order);
            resultMap.put("result","1");
            resultMap.put("message","订单生成成功");
        }else{
            resultMap.put("result","0");
            resultMap.put("message","订单生成失败");
        }
        return resultMap;
    }

    /**
     * 删除订单
     * @param oid
     * @return
     */
    @RequestMapping("/api/PhonedeleteOrder")
    @ResponseBody
    public Map<String, Object> deleteOrder(String oid){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if(!("".equals(oid))){
            orderService.deleteOrder(Integer.parseInt(oid));
            resultMap.put("result","1");
            resultMap.put("message","删除成功");
        }else{
            resultMap.put("result","0");
            resultMap.put("message","空参数");
        }
        return resultMap;
    }

    /**
     * 手机支付
     * @param oid
     * @return
     */
    @RequestMapping("/api/pay")
    @ResponseBody
    public Map<String, Object> pay(String oid){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if(!("".equals(oid))){
            int[] orders = {Integer.parseInt(oid)};
            orderService.payorder(orders);
            resultMap.put("result","1");
            resultMap.put("message","支付成功");
        }
        return resultMap;
    }





}




