package com.jiexi.drug.controller;


import com.jiexi.drug.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 普通用户操作的主要功能
 * @author GOU
 * @Date 2020-06-15 18:16
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/test",produces = "application/json")
    public String getTest() throws Exception {
        System.out.println("aaa");
        return "Hello World";
    }

    /**
     * 登陆 请求映射ajax中的loginAjax方法
     * @param loginName
     * @param password
     * @return
     */
    @RequestMapping(value = "/api/loginAjax")
    @ResponseBody
    @CrossOrigin
    public Map<String,String> ajaxLogin(String loginName,String password,HttpSession session){
        Map<String,String> resultMap = new HashMap<String, String>();
        List<String> integerList = userService.dologin(loginName, password);
        switch (integerList.get(0)){
            case "0":
                resultMap.put("result","0");
                resultMap.put("message","登录失败,密码错误");
                break;
            case "1":
                resultMap.put("result","1");
                resultMap.put("message","登录成功");
                resultMap.put("userid",integerList.get(1).toString());
                resultMap.put("username",integerList.get(2).toString());
                Map<String,String> userIF=new HashMap<String, String>();
                userIF.put("userid",integerList.get(1).toString());
                userIF.put("username",integerList.get(2).toString());
                userIF.put("roleid",integerList.get(3).toString());
                session.setAttribute("userIF",userIF);
                break;
            case "2":
                resultMap.put("result","2");
                resultMap.put("message","账号已被禁止登陆，请联系管理员");
                break;
            default:break;
        }
        return resultMap;
    }

    //

    /**
     * 注册 请求映射axios中的registerAjax方法
     * @param username
     * @param password
     * @param telphone
     * @param address
     * @param nickname
     * @return
     */
    @RequestMapping("/api/registerAjax")
    @ResponseBody
    @CrossOrigin
    public Map<String,String> ajaxRegister(String username,String password,String telphone,String address,String nickname){
        Map<String,String> resultMap = new HashMap<String, String>();

        if( username == null || password == null){
            resultMap.put("result","2");
            resultMap.put("message","空数据");

        }else{
            switch (userService.doregister(username, password, nickname, address, telphone)){
                case 0:
                    resultMap.put("result","0");
                    resultMap.put("message","注册失败，用户名重复");
                    break;
                case 1:
                    resultMap.put("result","1");
                    resultMap.put("message","注册成功");
                    break;
                default: break;
            }
        }

        return resultMap;
    }

    /**
     * 注册时判断用户登录名是否重复
     * @param username
     * @return
     */
    @RequestMapping("/api/repeatName")
    @ResponseBody
    public Map<String,Object> repeatName(String username){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result",userService.repeatName(username)?1:0);
        return resultMap;
    }

    /**
     * 退出登陆
     * @param session
     * @return
     */
    @RequestMapping(value = "/api/logout")
    @ResponseBody
    public Map<String,String> Logout(HttpSession session){
        Map<String,String> resultMap = new HashMap<String, String>();
        resultMap.put("resultId","1");
        //清空session
        session.invalidate();
        return resultMap;
    }

    /**
     * 修改信息 1为修改信息 2为修改密码
     * @param chooseID
     * @param nickname
     * @param telphone
     * @param address
     * @param password
     * @return
     */
    @RequestMapping(value = "/api/EditInfo",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> edit(HttpSession session,String chooseID,String nickname,String telphone,String address,String password){
        Map<String,String> resultMap = new HashMap<String, String>();
        Map<String,Object> userIF = (Map<String, Object>) session.getAttribute("userIF");
        String uid = (String) userIF.get("userid");
        if(chooseID.equals("")){
            resultMap.put("result","0");
            resultMap.put("message","空参数");
        }else if(chooseID.equals("1")){
            if ("".equals(nickname) || "".equals(telphone) || "".equals(address)){
                resultMap.put("result","0");
                resultMap.put("message","空参数");
            }else{
                resultMap.put("result","11");
                resultMap.put("message","修改信息成功");
                userService.editInfo(Integer.parseInt(uid),nickname,address,telphone);
            }
        }else{
            if("".equals(password)){
                resultMap.put("result","0");
                resultMap.put("message","空参数");
            }else{
                resultMap.put("result","21");
                resultMap.put("message","修改密码成功");
                userService.editPassword(Integer.parseInt(uid),password);
                session.invalidate();
            }
        }
        return resultMap;
    }


    @RequestMapping(value = "/api/showUser",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectUser(HttpSession session){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        Map<String,Object> userIF = (Map<String, Object>) session.getAttribute("userIF");
        String uid = (String) userIF.get("userid");
        resultMap.put("info",userService.selectByid(Integer.parseInt(uid)));
        return resultMap;
    }



}
