package com.jiexi.drug.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author GOU
 * @Date 2020-06-30 10:32
 */
public class StringToSqlDate {

    public static java.sql.Timestamp getNowDate_StrToSqlDate() {
        //设置日期格式
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // new Date()为获取当前系统时间
        String strDate = sf.format(new Date());
        java.util.Date date = null;
        try {
            date = sf.parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        java.sql.Timestamp dateSQL = new java.sql.Timestamp(date.getTime());
        return dateSQL;
    }
}
