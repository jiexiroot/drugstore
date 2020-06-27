package com.jiexi.drug.mapper;

import com.jiexi.drug.pojo.Users;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-15 16:21
 */
public interface UserMapper {


    /**
     * 用来登录的代理类方法
     * @param dataMap 通过自动映射将用户名与密码注入到User对象中 map对象由{"user",user}与{"result",resultId}组成
     * @return  1为登录成功 0为登录失败
     */
    void doLogin(Map<String,Object> dataMap);
    /**
     * 用来注册用户的代理类方法
     * @param dataMap map对象由{"user",user}与{"result",resultId}组成
     */
    void doRegister(Map<String,Object> dataMap);
    /**
     * 当用户输入完用户名时，马上判断数据库中是否有重名
     * @param username
     * @return true 有 false 否
     */
    @Select("select count(*) as result from users where username = #{user}")
    int repeatName(@Param("user") String username);
    /**
     * 修改收获地址
     * @param address
     * @param id
     * @return
     */
    @Update("update users set address = #{address} where id = #{id}")
    boolean editAddress(@Param("address")String address,@Param("id")int id);
    /**
     * 判断是否是会员
     * @param id
     * @return
     */
    @Select("select userRoleId from users where id = #{id} ")
    int judgeVip(@Param("id")int id);

    /**
     * 修改密码
     * @param id
     * @param password
     */
    @Update("update users set Password = #{password} where id = #{id} ")
    void editPassword(@Param("id")int id,@Param("password")String password);

    /**
     * 修改信息
     * @param id
     * @param nickname
     * @param address
     * @param telphone
     */
    @Update("update users set nickName = #{nickname} , address = #{address} , telphone = #{telphone}  where id = #{id} ")
    void editInfo(@Param("id")int id,@Param("nickname")String nickname,@Param("address")String address,@Param("telphone")String telphone);

    /**
     * 查询信息
     * @param id
     * @return
     */
    @Select("select username,nickname,address,telphone from users where id = #{id}")
    Users selectByid(@Param("id")int id);

    // 管理员功能

    /**
     * 显示所有用户
     * @return
     */
    @Select("select id,username,nickname,address,telphone,userRoleId,userStateId from users where id!=1")
    List<Users> showUser();
    /**
     * 恢复登录权限
     * @param id
     * @return
     */
    @Update("update users set userStateId = 1 where id = #{id}")
    int abledId(@Param("id") int id);
    /**
     * 禁用登录权限
     * @param id
     * @return
     */
    @Update("update users set userStateId= 2 where id = #{id}")
    int disabledId(@Param("id")int id);

    /**
     * 查询用户权限
     * @param id
     * @return
     */
    @Select("select userRoleId from users where id = #{id}")
    int getRoleId(@Param("id")int id);
}
