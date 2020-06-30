package com.jiexi.drug.dao;

import com.jiexi.drug.pojo.Member;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Users;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-27 16:04
 */
public interface AdminDao {

    /**
     * 查询管理员信息
     * @param id
     * @return
     */
    Users selectAdmin(int id);

    /**
     * 更新管理员密码
     * @param id
     * @param password
     * @return
     */
    int updateAdminPwd(int id,String password);

    /**
     * 查询该用户名是否存在
     * @param username
     * @return
     */
    int selectIsTrue(String username);

    /**
     * 查询该用户是否为管理员用户
     * @param username
     * @return
     */
    int selectIsAdmin(String username);

    /**
     * 升级成管理员用户
     * @param username
     * @return
     */
    int setAdmin(String username);

    /**
     * 查询所有用户的信息并且可以模糊查找
     * @param useStr
     * @return
     */
    List<Users> getByLikeNameUsers(String useStr);

    /**
     * 通过uid查询vip信息
     * @param uid
     * @return
     */
    Member getMemberByUid(int uid);

    /**
     * 查询订单信息并分页
     * @param index 起始位置
     * @param limit 分页数量
     * @return 订单信息
     */
    List<Order> selectOrderInfo(int index, int limit, String searchStr);
}
