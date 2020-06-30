package com.jiexi.drug.test;

import com.jiexi.drug.dao.CartDao;
import com.jiexi.drug.mapper.*;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Users;
import com.jiexi.drug.service.DrugService;
import com.jiexi.drug.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-15 18:32
 */
public class LoginTest {
    ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
    UserService userService=(UserService) context.getBean("userService");
    DrugService drugService=(DrugService) context.getBean("drugService");
    CategoriesMapper categoriesMapper = (CategoriesMapper) context.getBean("categoriesMapper");
    DrugMapper drugMapper = (DrugMapper) context.getBean("drugMapper");
    CartMapper cartMapper = (CartMapper) context.getBean("cartMapper");
    CartDao cartDao = (CartDao) context.getBean("cartDao");
    UserMapper userMapper = (UserMapper) context.getBean("userMapper");
    OrdersMapper orderMapper = (OrdersMapper) context.getBean("ordersMapper");
    AdminMapper adminMapper = (AdminMapper) context.getBean("adminMapper");
    @Test
    public void t(){
//        boolean flag = userService.repeatName("gou");
//        System.out.println(flag);
//        String flag = userService.dologin("gou","123456").get(2);
//        System.out.println(flag);
//        List<Drugs> list = drugService.selectDrugs(1);
//        for (Drugs drug: list) {
//            System.out.println(drug);
//         }
//        Categories categories = categoriesMapper.selectCname(1);
//        System.out.println(categories);
//        Drugs drugs = drugMapper.showDetails(3);
//        String[] Slist =drugs.getSpec().split("/");
//        System.out.println(Slist[1]);
//        System.out.println(drugs);
//        List<Integer> list2= new ArrayList<Integer>();
//        list2.add(1);
//        list2.add(2);
//        List<Drugs> list = drugMapper.showDrugsByDids(list2);
//        for (Drugs drug: list) {
//            System.out.println(drug);
//        }
//        List<Cart>  carts = cartDao.selectByuid(1);
//        for (Cart cart: carts) {
//            System.out.println(cart);
//        }
//        userMapper.registerVip1(1);
//        userMapper.registerVip2(1);
//        orderMapper.addPoint(1,300);
//    orderMapper.payorder(new Integer[]{1});
//        List<Orders> orders = orderMapper.showOrder(1,0);
//        for (Orders o: orders) {
//            System.out.println(o);
//        }
//        String s = new String("123456");
//        System.out.println("原始：" + s);
//        System.out.println("MD5后：" + MD5.MD5(s));
//        System.out.println("MD5后再加密：" + MD5.JM(MD5.MD5(s)));
//        System.out.println("解密为MD5后的：" + MD5.JM(MD5.KL(MD5.MD5(s))));
//        System.out.println( adminMapper.selectAdmin(1));
//        List<Users> list = adminMapper.getByLikeNameUsers("%%");
//        for (Users u: list) {
//            System.out.println(u);
//        }
    }

}
