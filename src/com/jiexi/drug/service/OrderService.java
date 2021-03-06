package com.jiexi.drug.service;

import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-21 20:22
 */
public interface OrderService {

    /**
     * 生成订单
     * @param order
     */
    void addOrder(@Param("order") Order order);

    /**
     * 显示所有订单
     * @param uid
     * @return
     */
    List<Orders> showOrder(@Param("uid")int uid,int type);

    /**
     * 支付订单
     * @param oids
     */
    void payorder(int[] oids);

    /**
     * 会员增加积分
     * @param id
     * @param price
     */
    void addPoint(int id,float price);

    /**
     * 添加支付表信息记录
     * @param price
     * @param ids
     */
    void addPayInfo(float price,String ids);

    /**
     * 删除订单
     * @param oid
     * @return
     */
    void deleteOrder(int oid);

    /**
     * 不分类查询所有订单
     * @param uid
     * @return
     */
    List<Orders> showAllOrder(int uid);

    /**
     * 获得会员等级
     * @param uid
     * @return
     */
    int selectLevelsId(int uid);
}
