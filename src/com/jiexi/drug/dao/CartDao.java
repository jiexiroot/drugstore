package com.jiexi.drug.dao;

import com.jiexi.drug.pojo.Cart;
import com.jiexi.drug.pojo.Carts;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-20 14:32
 */
public interface CartDao {

    /**
     * 通过用户id来查找购物车
     * @param uid
     * @return
     */
    List<Cart> selectByuid(int uid);

    /**
     * 添加购物车
     * @param carts
     */
    void addCart(Carts carts);

    /**
     * 删除购物车
     * @param ids
     * @return
     */
    int delCart(@Param("ids")int[] ids);
}
