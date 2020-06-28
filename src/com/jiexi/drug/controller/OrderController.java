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
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.*;

import static org.apache.log4j.helpers.LogLog.error;

/**
 * @author GOU
 * @Date 2020-06-21 20:17
 */
@Controller
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    UserService userService;




    @RequestMapping("/api/showorder")
    @ResponseBody
    public Map<String, Object> showOrder(HttpSession session){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        Map<String,Object> userIF = (Map<String, Object>) session.getAttribute("userIF");
        if( userIF != null){
            String uid = (String) userIF.get("userid");
            List<Orders> orders = orderService.showOrder(Integer.parseInt(uid),0);
            if(orders.size()==0){
                resultMap.put("result",2);
                resultMap.put("message","购物车为空");
            }else{
                resultMap.put("result",1);
                resultMap.put("message",orders);
                session.setAttribute("orderList",orders);
            }
        }else{
            resultMap.put("result",0);
            resultMap.put("message","空参数");
        }
        return resultMap;
    }

    @RequestMapping("/api/showOkorder")
    @ResponseBody
    public Map<String, Object> showOkOrder(HttpSession session){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        Map<String,Object> userIF = (Map<String, Object>) session.getAttribute("userIF");
        if( userIF != null){
            String uid = (String) userIF.get("userid");
            List<Orders> orders = orderService.showOrder(Integer.parseInt(uid),1);
            if(orders.size()==0){
                resultMap.put("result",2);
                resultMap.put("message","购物车为空");
            }else{
                resultMap.put("result",1);
                resultMap.put("message",orders);
                session.setAttribute("orderList",orders);
            }
        }else{
            resultMap.put("result",0);
            resultMap.put("message","空参数");
        }
        return resultMap;
    }


    /**
     * 生成订单
     * @param obj
     * @return
     */
    @RequestMapping("/api/addorder")
    @ResponseBody
    public Map<String, Object> addOrder(@RequestBody JSONObject obj){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        String data=obj.toJSONString();
        JSONObject json = JSON.parseObject(data);
        String orders = json.getString("orders");
        if(!(orders.equals(""))){
            JSONArray ordersArray= JSONArray.parseArray(orders);
            for(int i=0;i<ordersArray.size();i++){
                Order order =new Order();
                Integer uid=JSONObject.parseObject(JSONObject.toJSONString(ordersArray.get(i))).getInteger("uid");
                Integer amount=JSONObject.parseObject(JSONObject.toJSONString(ordersArray.get(i))).getInteger("amount");
                Integer did=JSONObject.parseObject(JSONObject.toJSONString(ordersArray.get(i))).getInteger("did");
                Integer cid=JSONObject.parseObject(JSONObject.toJSONString(ordersArray.get(i))).getInteger("cid");
                order.setUid(uid);
                order.setAmount(amount);
                order.setDid(did);
                order.setCid(cid);
                orderService.addOrder(order);
                resultMap.put("result","1");
                resultMap.put("message","订单生成成功");
            }
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
    @RequestMapping("/api/deleteOrder")
    @ResponseBody
    public Map<String, Object> deleteOrder(String oid){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if(!("".equals(oid))){
            orderService.deleteOrder(Integer.parseInt(oid));
            resultMap.put("result","1");
            resultMap.put("message","删除成功");
        }else{
            resultMap.put("     result","0");
            resultMap.put("message","空参数");
        }
        return resultMap;
    }

    /**
     * 支付功能
     * @param httpResponse
     * @param request
     * @param session
     * @throws IOException
     */
    @RequestMapping("/api/alipay")
    public void alipay(HttpServletResponse httpResponse,HttpServletRequest request,HttpSession session) throws IOException {

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        String WIDsubject = "JX Drug_Store";
        String WIDbody = "购买界面";
        Map<String,Object> objectMap = new HashMap<String,Object>();
        objectMap.put("ids",request.getParameter("ids"));
        objectMap.put("price",request.getParameter("price"));
        session.setAttribute("payInfo",objectMap);
        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new String(request.getParameter("ids").getBytes("ISO-8859-1"),"UTF-8");
        //付款金额，必填
        String total_amount = new String(request.getParameter("price").getBytes("ISO-8859-1"),"UTF-8");
        //订单名称，必填
        String subject = new String(WIDsubject.getBytes("ISO-8859-1"),"UTF-8");
        //商品描述，可空
        String body = new String(WIDbody.getBytes("ISO-8859-1"),"UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
        //		+ "\"total_amount\":\""+ total_amount +"\","
        //		+ "\"subject\":\""+ subject +"\","
        //		+ "\"body\":\""+ body +"\","
        //		+ "\"timeout_express\":\"10m\","
        //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

        //请求
        String result = "";
        try {
            // 调用SDK生成表单
            result = alipayClient.pageExecute(alipayRequest).getBody();
        } catch (com.alipay.api.AlipayApiException e) {
            e.printStackTrace();
        }

        httpResponse.setContentType("text/html;charset=" + AlipayConfig.charset);
        // 直接将完整的表单html输出到页面
        httpResponse.getWriter().write(result);
        httpResponse.getWriter().flush();
        httpResponse.getWriter().close();
    }


    /**
     * 注意异步返回结果通知是以post请求形式返回的
     * @param request
     * @return
     */
    @RequestMapping("notifyUrl")
    public String notify_url(HttpServletRequest request){
        Map<String, String> paramsMap = convertRequestParamsToMap(request);
        String out_trade_no= paramsMap.get("out_trade_no");
        String tradeStatus= paramsMap.get("trade_status");
        try {
            boolean signVerified = AlipaySignature.rsaCheckV1(paramsMap, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
            //无论同步异步都要验证签名
            if(signVerified){
                if(tradeStatus.equals("TRADE_FINISHED") || tradeStatus.equals("TRADE_SUCCESS")){
                    //处理自己系统的业务逻辑，如：将支付记录状态改为成功，需要返回一个字符串success告知支付宝服务器

                    return "Okorder";
                } else {
                    //支付失败不处理业务逻辑
                    return "order";
                }
            }else {
                //签名验证失败不处理业务逻辑
                return "order";
            }
        } catch (com.alipay.api.AlipayApiException e) {
            e.printStackTrace();
            return "order";
        }
    }

    //注意同步返回结果是以get请求形式返回的
    @RequestMapping("returnUrl")
    public String return_url(HttpServletRequest request,HttpSession session){
        Map<String, String> paramsMap = convertRequestParamsToMap(request);
        try {
            boolean signVerified = AlipaySignature.rsaCheckV1(paramsMap, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
            if(signVerified){
                Map<String,Object> result = (Map<String, Object>) session.getAttribute("payInfo");
                Map<String,Object> userIF = (Map<String, Object>) session.getAttribute("userIF");
                String ids = (String) result.get("ids");
                String[] ids_2 = ids.split("_");
                String price = (String) result.get("price");
                String uid = (String) userIF.get("userid");
                int[] ids_3 = StringToInt.strArrayToIntArray(ids_2);
                orderService.payorder(ids_3);
                if(userService.judgeVip(Integer.parseInt(uid)) == 2){
                    System.out.println(uid + price + ids);
                    orderService.addPoint(Integer.parseInt(uid),Float.parseFloat(price));


                }

                orderService.addPayInfo(Float.parseFloat(price),ids);
                //跳转支付成功界面
                return "Okorder";

            }else {
                //跳转支付失败界面
                return "order";
            }
        } catch (com.alipay.api.AlipayApiException e) {
            e.printStackTrace();
        }
        return "order";
    }


    //将请求中的参数转换为Map
    public static Map<String, String> convertRequestParamsToMap(HttpServletRequest request) {
        Map<String, String> retMap = new HashMap();
        Set<Map.Entry<String, String[]>> entrySet = request.getParameterMap().entrySet();
        Iterator var3 = entrySet.iterator();

        while(true) {
            while(var3.hasNext()) {
                Map.Entry<String, String[]> entry = (Map.Entry)var3.next();
                String name = (String)entry.getKey();
                String[] values = (String[])entry.getValue();
                int valLen = values.length;
                if(valLen == 1) {
                    retMap.put(name, values[0]);
                } else if(valLen <= 1) {
                    retMap.put(name, "");
                } else {
                    StringBuilder sb = new StringBuilder();
                    String[] var9 = values;
                    int var10 = values.length;

                    for(int var11 = 0; var11 < var10; ++var11) {
                        String val = var9[var11];
                        sb.append(",").append(val);
                    }

                    retMap.put(name, sb.toString().substring(1));
                }
            }

            return retMap;
        }
    }

    //将字符串转换为UTF-8编码以防出现乱码错误
    public static String getUTF8XMLString(String xml) {
        StringBuffer sb = new StringBuffer();
        sb.append(xml);
        String xmString = "";
        String xmlUTF8="";
        try {
            xmString = new String(sb.toString().getBytes("UTF-8"));
            xmlUTF8 = URLEncoder.encode(xmString, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return xmlUTF8;
    }
}




