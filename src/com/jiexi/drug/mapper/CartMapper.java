package com.jiexi.drug.mapper;

import com.jiexi.drug.pojo.Cart;
import com.jiexi.drug.pojo.Carts;
import com.jiexi.drug.pojo.Drugs;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-20 11:13
 */
public interface CartMapper {

    /**
     * 通过用户id来查找购物车
     * @param uid
     * @return
     */
    @Select("select cartid,did,uid,cartAmount,DrugName,ShopName,Approval,PublisherId,spec,model,imgurl,price,amount,publishers.`Name` " +
            "from drugs,cart,publishers where publishers.id = drugs.PublisherId and drugs.id = cart.did and uid=#{uid}")
    List<Cart> selectByuid(@Param("uid")int uid);

    /**
     * 添加购物车
     * @param carts
     */
    @Insert("insert into cart(did,uid,cartAmount) values (#{cart.did},#{cart.uid},#{cart.cartAmount})")
    void addCart(@Param("cart") Carts carts);

    /**
     * 删除购物车
     * @param ids
     * @return
     */
    int delCart(@Param("ids")int[] ids);
}
