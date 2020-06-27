package com.jiexi.drug.service.impl;

import com.jiexi.drug.dao.CartDao;
import com.jiexi.drug.mapper.PublishersMapper;
import com.jiexi.drug.pojo.Cart;
import com.jiexi.drug.pojo.Carts;
import com.jiexi.drug.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-20 14:37
 */
@Service("cartService")
public class CartServiceImpl implements CartService {

    @Autowired
    CartDao cartDao;

    @Override
    public List<Cart> showCart(int uid) {
        return cartDao.selectByuid(uid);
    }

    @Override
    public void addCart(Carts carts) {
        cartDao.addCart(carts);
    }

    @Override
    public int delCart(int[] ids) {
        return cartDao.delCart(ids);
    }
}
