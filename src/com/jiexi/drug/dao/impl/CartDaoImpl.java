package com.jiexi.drug.dao.impl;

import com.jiexi.drug.dao.CartDao;
import com.jiexi.drug.mapper.CartMapper;
import com.jiexi.drug.pojo.Cart;
import com.jiexi.drug.pojo.Carts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-20 14:34
 */
@Repository("cartDao")
public class CartDaoImpl implements CartDao {

    @Autowired
    CartMapper cartMapper;

    @Override
    public List<Cart> selectByuid(int uid) {
        return cartMapper.selectByuid(uid);
    }

    @Override
    public void addCart(Carts carts) {
        cartMapper.addCart(carts);
    }

    @Override
    public int delCart(int[] ids) {
        return cartMapper.delCart(ids);
    }
}
