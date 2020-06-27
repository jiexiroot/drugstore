package com.jiexi.drug.controller;

import com.jiexi.drug.pojo.Vips;
import com.jiexi.drug.service.VipsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-22 21:45
 */
@Controller
public class VipsController {
    @Autowired
    VipsService vipsService;

    @RequestMapping(value = "/api/showVipInfo",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectVip(HttpSession session){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        Map<String,Object> userIF = (Map<String, Object>) session.getAttribute("userIF");
        String uid = (String) userIF.get("userid");
        if("".equals(uid)){
            resultMap.put("result",0);
            resultMap.put("info","空参数");
        }else{
            Vips vips= vipsService.showVipsById(Integer.parseInt(uid));
            if(vips != null){
                resultMap.put("result",1);
                resultMap.put("info",vips);
            }else{
                resultMap.put("result",2);
                resultMap.put("info","不是会员");
            }
        }

        return resultMap;
    }
    @RequestMapping(value = "/api/updateVip",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateVip(HttpSession session){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        Map<String,Object> userIF = (Map<String, Object>) session.getAttribute("userIF");
        String uid = (String) userIF.get("userid");
        if("".equals(uid)){
            resultMap.put("result",0);
            resultMap.put("info","空参数");
        }else{
            resultMap.put("result",1);
            vipsService.registerVip1(Integer.parseInt(uid));
            vipsService.registerVip2(Integer.parseInt(uid));
            resultMap.put("info","成功");
        }
        return resultMap;
    }




}
