package com.jiexi.drug.dao.impl;

import com.jiexi.drug.dao.OrderDao;
import com.jiexi.drug.mapper.OrdersMapper;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-21 20:19
 */
@Repository("orderDao")
public class OrderDaoImpl implements OrderDao {
    @Autowired
    OrdersMapper ordersMapper;

    @Override
    public void addOrder(Order order) {
        ordersMapper.addOrder(order);
    }

    @Override
    public List<Orders> showOrder(int uid,int type) {
        return ordersMapper.showOrder(uid,type);
    }

    @Override
    public void payorder(int[] oids) {
        ordersMapper.payorder(oids);
    }

    @Override
    public void addPoint(int id, float price) {
        ordersMapper.addPoint(id,price);
    }

    @Override
    public void addPayInfo(float price, String ids) {
        ordersMapper.addPayInfo(price, ids);
    }

    @Override
    public void deleteOrder(int oid) {
        ordersMapper.deleteOrder(oid);
    }

    @Override
    public List<Orders> showAllOrder(int uid) {
        return ordersMapper.showAllOrder(uid);
    }

}
