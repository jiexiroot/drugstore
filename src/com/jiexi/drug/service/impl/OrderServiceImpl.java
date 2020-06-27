package com.jiexi.drug.service.impl;

import com.jiexi.drug.dao.OrderDao;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Orders;
import com.jiexi.drug.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-21 20:22
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderDao orderDao;
    @Override
    public void addOrder(Order order) {
        orderDao.addOrder(order);
    }

    @Override
    public List<Orders> showOrder(int uid,int type) {
        return orderDao.showOrder(uid,type);
    }

    @Override
    public void payorder(int[] oids) {
        orderDao.payorder(oids);
    }

    @Override
    public void addPoint(int id, float price) {
        orderDao.addPoint(id,price);

    }

    @Override
    public void addPayInfo(float price, String ids) {
        orderDao.addPayInfo(price,ids);
    }

    @Override
    public void deleteOrder(int oid) {
        orderDao.deleteOrder(oid);
    }

    @Override
    public List<Orders> showAllOrder(int uid) {
        return orderDao.showAllOrder(uid);
    }

}
