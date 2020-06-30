package com.jiexi.drug.config;

import java.io.FileWriter;
import java.io.IOException;

/***
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016102800774112";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCtQLyNtpZL/LalsCVoPlJpm1ijg/r9yJSdynNEQmUuyZ43DUPjUYVafvpnY+Yy400RJNKNy5ZLdvewNBsporx5HSfFRx2pGtb7ud/S/qNB4ozg7bvsvtnokR0Qfe4zbneALHfVjT7WWicVLjxci+Gnv3rXWeHy0ekhz6jaNM9vUOjcnc98Su3xqCkt589sNibDhwwslLtO/vOhTMZS5p/kMyOrvp6y+SZO3SHK7tjsmerBoIhDkiEsXmYzWv0NnGu3CCkQiQbFmhX/rH8MKs6l24h4WWebqc02ztLeryvQVG708fXT6Xsr6DWmkwAp4Zqy9XW/rQQrfjouod2dHtJpAgMBAAECggEBAKHu2w29tjbpyrGMtTn83jyVFUEoT8U64CWnnxsSz83uZrHf9S8X+AOAoX1Xc0bnCxZWC3K68gww8ws/eI/u6ihtpsmOUdvIGV6I+foVRPSE0tY9fiOmsrfcQoUynxx1SL6FUbBJZ40kEFmMsKBzogOPRjrYaQbzServVEw3hhbsxxp4EwUDgtuLLEHhJmTig4Cs4DJik14q/9eRRH17iyA0Rkmxc598Xnzbw812HwKVx09WWiEOH1fbN+0gtSdJyBMJooZJWS5qy7QKaWYvusIfW0L/57kE5l2KGP3fiMEs8XfZuZxDWHqwpb9kEyZthv83Wh1y8LSj0l6k/vQx9vECgYEA4xz1q3fyVnhhwMjCW/ODnlqpaeYR6P9AzjsOORx7uRn0SitOWcU5mFTRR7ZreSmvM30uqf/d7EJgy0xXNU0Naps+5ffynzlLfILtGJ3E5gjJSfmHt6xpnZvhX4grK+NT+om3Be3sBim51if1VNMJAchbY9GZu2JuKmTryfNLyc0CgYEAw0oH8q441pngkqSW/NSsuv2FJr1oUEZyUmhVYOFPqa2Kbech1xGqLpjQoiCbtkkgQsl3s1ROmm+8oqdJcny0Xpc8//pEgHLznNKxhwB3bra7PBUc08BF+g8M3jBgtR5QY3sxtAW3BnV2CGYa9xPkQ5b4KhuXYJNQvEwObYds3w0CgYBAsiY1g0SwZziJf2cGZJcQzAjIlvZxJg1i8iW6FSgVcZRKcI2wOuOORlMbl5aD/GDhTP63BKFGRR5nq0aIc3un67N+NSSTQPIE9RLvWToWwVf9z6xeoSmw8Q/Bc/vAU9C/ZO2TLdR3aPl8TQOw9zDwpg+KntGpNH/nabpVXA4x3QKBgQCEIPGRs2jHYaM89FknxOj9NwxAssQCFDfDI84oVykj/0N6qngN4GjJUCFQoElaIs3OAiuXzIHGIbV6Qz8BU/hhS2g9NOHmGmBTCYaNdbZY1Q+HTi2L4zo1PruRFSBJSrJPLInraDZ2C0EJ27OA2heF134eVz6rW+CzFa5pUshJfQKBgQDYWFxYDjaAb/G8C92hPkTPCB1TExnJb/bZ7EBO2AhLWpmwtOOrOe/JFM+S3k67VbttogaM/wdFKiNZR1n8viJTVW7yy4QucN2Yp8ESdkym8aqFR6reMJYgytPEj3SZQE7gDyL0IjVRket4WfumJkXzs9msZtmamDqw++4xvzuBHw==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoDFYeC8Edrxa8uk4OaiHopqxMsNgwMZ8+kJibpvaYyDD2QGYgCibtGDpo+2kTAQKPTEE68T97nHZbi5hlSWoYCewTt4aIYgM4RSOJFfWXkVbdD2S9aDsycDUMjiYriFyDssGCH/FQeTYVAqD0qTg1W9uvhi8Yi+5ynIbP/UXOi5+07MGPXvSqumoNo2zG2ylTAsiEXcGxXnFqOzJ5YfjQ9Go+GX2NAsziF2MgmssWAoJAkvjEMNcyTrwuUmanmUTj4rxLyewJidxAO0YAHVU6dfPY584qjLHNKZmXnPpdlT98UV5OhvFaO+EmR8MUenpm09sHhJF0DBr41Pm9eeTMQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://39.99.211.44:8080/drugstore/notifyUrl";
//    public static String notify_url = "http://localhost:8080/drugstore/notifyUrl";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://39.99.211.44:8080/drugstore/returnUrl";
//    public static String return_url = "http://localhost:8080/drugstore/returnUrl";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "https://openapi.alipay.com/gateway.do";

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

}

