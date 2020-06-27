package com.jiexi.drug.controller;

import com.jiexi.drug.pojo.Cart;
import com.jiexi.drug.pojo.Carts;
import com.jiexi.drug.service.CartService;
import com.jiexi.drug.util.StringToInt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-20 14:46
 */
@Controller
public class CartController {
    @Autowired
    CartService cartService;

    @RequestMapping("/api/showCart")
    @ResponseBody
    public Map<String,Object> showCart(String uid){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if("".equals(uid)){
            resultMap.put("result",0);
            resultMap.put("message","空参数");
        }else{
            List<Cart> cartList= cartService.showCart(Integer.parseInt(uid));
            if(cartList.size()==0){
                resultMap.put("result",2);
                resultMap.put("message","购物车为空");
            }else{
                resultMap.put("result",1);
                resultMap.put("cart",cartList);
            }

        }
        return resultMap;
    }

    @RequestMapping("/api/addCart")
    @ResponseBody
    public Map<String,Object> addCart(String uid,String did,String num){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        System.out.println(uid + " " + did);
        if("".equals(uid) || "".equals(did)){
            resultMap.put("result",0);
            resultMap.put("message","空参数");
        }else{
            Carts carts = new Carts(Integer.parseInt(did),Integer.parseInt(uid),Integer.parseInt(num));
            cartService.addCart(carts);
            resultMap.put("result",1);
            resultMap.put("message","添加成功");
        }
        return resultMap;
    }

    @RequestMapping("/api/delCart")
    @ResponseBody
    public Map<String, Object> delCart(String[] ids){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if(ids == null){
            resultMap.put("result",0);
            resultMap.put("message","空参数");
        }else{
            int[] ints = StringToInt.strArrayToIntArray(ids);
            cartService.delCart(ints);
            resultMap.put("result",1);
            resultMap.put("message","删除成功");
        }
        return resultMap;
    }
}
