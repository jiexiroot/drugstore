package com.jiexi.drug.controller;

import com.jiexi.drug.pojo.Drugs;
import com.jiexi.drug.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-15 21:59
 */
@Controller
public class DrugController {
    @Autowired
    DrugService drugService;

        /**
         * 分页查询商品
         * @param pages
         * @param model
         * @return
         */
        @RequestMapping("/api/selectAllBypages")
        public String selectAllByPages(String pages, Model model){
            model.addAttribute("dlist",drugService.selectDrugs(Integer.parseInt(pages)));
            model.addAttribute("isChoose",Integer.parseInt(pages));
            model.addAttribute("isShow",true);
            return "index";
        }

    /**
     * 加载所有第一页商品
     * @param pages
     * @param session
     * @return
     */
    @RequestMapping("/api/selectAll")
    @ResponseBody
    @CrossOrigin
    public Map<String,Object> selectAll(String pages, HttpSession session){
        Map<String,Object> resultMap = new HashMap<String, Object>();

        if( pages == null){
            resultMap.put("result","2");
            resultMap.put("message","空数据");
        }else{
            List<Drugs> drugsList = drugService.selectDrugs(Integer.parseInt(pages));
            resultMap.put("result","1");
            resultMap.put("message",drugsList);
            session.setAttribute("dlist",drugsList);
            session.setAttribute("dLength",drugService.selectDrugNum());
            session.setAttribute("isShow",true);
            session.setAttribute("isChoose",Integer.parseInt(pages));
        }
        return resultMap;
    }

    /**
     * 手机端查询信息
     * @param did
     * @return
     */
    @RequestMapping("/api/showPdetails")
    @ResponseBody
    @CrossOrigin
    public Map<String, Object> showdetails(String did){
        Map<String,Object> resultMap  = drugService.showDetailsById(Integer.parseInt(did));
        return resultMap;
    }

    /**
     * 电脑端查询信息
     * @param did
     * @param session
     * @return
     */
    @RequestMapping("/api/showdetails")
    public String showdetails(String did,HttpSession session){
        if ("".equals(did)){
            return "index";
        }else{
            Map<String,Object> resultMap = drugService.showDetailsById(Integer.parseInt(did));
            session.setAttribute("detail",resultMap);
        }
        return "drugDetail";
    }

    /**
     * 手机端搜索
     * @param message
     * @return
     */
    @RequestMapping("/api/SearchDrugs")
    @ResponseBody
    public Map<String,Object> selectDrugByMessage(String message){
        Map<String,Object> resultMap  = new HashMap<String, Object>();
        if(!("".equals(message))){
            resultMap.put("result","1");
            resultMap.put("resultList",drugService.selectLikeDrugs(message));
        }else{
            resultMap.put("result","0");
            resultMap.put("resultList",null);
        }
        return resultMap;
    }

    @RequestMapping("/api/searchPcDrugs")
    public String selectDrugsOnPC(String message, Model model){
        List<Drugs> drugsList = drugService.selectLikeDrugs(message);
        model.addAttribute("dlist",drugsList);
        model.addAttribute("dMessage","以下是关于'"+ message +"'的内容");
        model.addAttribute("isShow",false);
        return "index";
    }

}
