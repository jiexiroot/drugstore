package com.jiexi.drug.service;

import com.jiexi.drug.pojo.Member;
import com.jiexi.drug.pojo.Users;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-27 16:06
 */
public interface AdminService {
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
    Member getMemberByUid(String uid);



}
