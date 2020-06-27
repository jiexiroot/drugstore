package com.jiexi.drug.service;

import com.jiexi.drug.pojo.Vips;
import org.apache.ibatis.annotations.Param;

/**
 * @author GOU
 * @Date 2020-06-22 21:43
 */
public interface VipsService {
    /**
     * 升级Vip 生成vip表数据
     * @param id
     * @return
     */
    boolean registerVip1(@Param("id")int id);

    /**
     * 升级Vip 更改用户权限
     * @param id
     * @return
     */
    boolean registerVip2(@Param("id")int id);

    /**
     * 通过uid显示vip信息
     * @param id
     * @return
     */
    Vips showVipsById(@Param("id")int id);
}
