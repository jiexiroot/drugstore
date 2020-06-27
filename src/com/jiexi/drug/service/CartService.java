package com.jiexi.drug.service;

import com.jiexi.drug.pojo.Cart;
import com.jiexi.drug.pojo.Carts;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-20 14:36
 */
public interface CartService {

    /**
     * 将购物车信息进行分类 并传入map对象
     * @param uid
     * @return
     */
    List<Cart> showCart(int uid);

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
