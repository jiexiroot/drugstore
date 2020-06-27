<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/22
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <%@ page import="com.jiexi.drug.config.*"%>
  <%@ page import="com.alipay.api.*"%>
  <%@ page import="com.alipay.api.request.*"%>
  <%@ page import="java.util.Map" %>
  <%@ page import="java.util.HashMap" %>
</head>
<body>
<%
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
  String result = alipayClient.pageExecute(alipayRequest).getBody();

  //输出
  out.println(result);
%>
</body>
</html>
