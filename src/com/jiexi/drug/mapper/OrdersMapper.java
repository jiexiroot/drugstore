package com.jiexi.drug.mapper;

import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Orders;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.aspectj.weaver.ast.Or;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-20 16:13
 */
public interface OrdersMapper {

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
    @Select("select orderid,`order`.did,`type`,`order`.amount as buyAmount,shopdate,DrugName,ShopName,Approval,PublisherId,spec,model,imgurl,price,drugs.amount as stockAmount,publishers.`Name` from drugs,`order`,publishers where publishers.id = drugs.PublisherId and drugs.id = `order`.did and order.uid = #{uid} and order.type = #{type}")
    List<Orders> showOrder(@Param("uid")int uid,@Param("type") int type);

    /**
     * 不分类查询订单
     * @param uid
     * @return
     */
    @Select("select orderid,`order`.did,`type`,`order`.amount as buyAmount,shopdate,DrugName,ShopName,Approval,PublisherId,spec,model,imgurl,price,drugs.amount as stockAmount,publishers.`Name` from drugs,`order`,publishers where publishers.id = drugs.PublisherId and drugs.id = `order`.did and order.uid = #{uid}")
    List<Orders> showAllOrder(@Param("uid")int uid);

    /**
     * 支付订单
     * @param oids
     */
    void payorder(@Param("oids")int[] oids);

    /**
     * 会员增加积分
     * @param id
     * @param price
     */
    void addPoint(@Param("id")int id,@Param("price") float price);

    /**
     * 添加支付表信息记录
     * @param price
     * @param ids
     */
    void addPayInfo(@Param("price")float price,@Param("ids")String ids);

    /**
     * 删除订单
     * @param oid
     * @return
     */
    @Select("delete from `order` where orderid = #{oid}")
    void deleteOrder(@Param("oid")int oid);

    /**
     * 获得会员等级
     * @param uid
     * @return
     */
    @Select("select LevelsId from member where userId=#{userid}")
    int selectLevelsId(@Param("userid")int uid);
}
