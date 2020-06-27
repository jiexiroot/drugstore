package com.jiexi.drug.service.impl;

import com.jiexi.drug.dao.UserDao;
import com.jiexi.drug.pojo.Users;
import com.jiexi.drug.service.UserService;
import com.jiexi.drug.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-15 16:18
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    /**
     * 加密MD5
     * @param loginname  手机号码与登录名
     * @param password  密码
     * @return
     */
    @Override
    public List<String> dologin(String loginname, String password) {
        return userDao.dologin(loginname, MD5.MD5(password));
    }

    /**
     * 加密MD5
     * @param username      用户登录名
     * @param password      用户密码
     * @param nickname      用户昵称（选填）
     * @param address       用户地址（选填）
     * @param telphone      用户电话（选填）
     * @return
     */
    @Override
    public int doregister(String username, String password, String nickname, String address, String telphone) {
        return userDao.doregister(username, MD5.MD5(password), nickname, address, telphone);
    }

    @Override
    public boolean repeatName(String username) {
        return userDao.repeatName(username);
    }

    @Override
    public int judgeVip(int id) {
        return userDao.judgeVip(id);
    }

    @Override
    public Users selectByid(int id) {
        return userDao.selectByid(id);
    }

    @Override
    public void editPassword(int id, String password) {
        userDao.editPassword(id,MD5.MD5(password));
    }

    @Override
    public void editInfo(int id, String nickname, String address, String telphone) {
        userDao.editInfo(id, nickname, address, telphone);
    }
}
