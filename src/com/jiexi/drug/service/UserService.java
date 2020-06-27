package com.jiexi.drug.service;

import com.jiexi.drug.pojo.Users;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-15 16:17
 */
public interface UserService {
    /**
     * 用户登录方法
     * @param loginname  手机号码与登录名
     * @param password  密码
     * @return true 代表登录成功  false代表登录失败
     */
    public List<String> dologin(String loginname, String password);

    /**
     *  用户注册方法
     * @param username      用户登录名
     * @param password      用户密码
     * @param nickname      用户昵称（选填）
     * @param address       用户地址（选填）
     * @param telphone      用户电话（选填）
     * @return  true 代表用户登录名在数据库中没有重复，注册成功	false 代表用户登录名在数据库中存在，注册失败
     */
    public int doregister(String username,String password,String nickname,String address,String telphone);


    /**
     * 当用户输入完用户名时，马上判断数据库中是否有重名
     * @param username
     * @return true 有 false 否
     */
    public boolean repeatName(String username);

    /**
     * 判断vip
     * @return
     */
    int judgeVip(int id);


    /**
     * 查询信息
     * @param id
     * @return
     */
    Users selectByid(int id);

    /**
     * 修改密码
     * @param id
     * @param password
     */
    void editPassword(int id,String password);

    /**
     * 修改信息
     * @param id
     * @param nickname
     * @param address
     * @param telphone
     */
    void editInfo(int id,String nickname,String address,String telphone);

}
