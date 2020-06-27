package com.jiexi.drug.dao.impl;

import com.jiexi.drug.dao.UserDao;
import com.jiexi.drug.mapper.UserMapper;
import com.jiexi.drug.pojo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-15 16:15
 */
@Repository("userDao")
public class UserDaoImpl implements UserDao {

    @Autowired
    UserMapper userMapper;

    @Override
    public List<String> dologin(String loginName, String password) {
        Users users = new Users();
        Map<String,Object> map = new HashMap<String,Object>();
        users.setUsername(loginName);
        users.setPassword(password);
        map.put("user",users);
        map.put("flag",null);
        map.put("userid",null);
        userMapper.doLogin(map);
        String result=map.get("flag").toString();
        List<String> list = new ArrayList<>();
        list.add(result);
        if (result.equals("1")){
            String userid=map.get("userid").toString();
            String username = map.get("userN").toString();
            list.add(userid);
            list.add(username);
            list.add(userMapper.getRoleId(Integer.parseInt(userid))+"");
        }
        return list;
    }

    @Override
    public int doregister(String username, String password, String nickname, String address, String telphone) {
        Users users = new Users(username,password,nickname,address,telphone);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("user",users);
        map.put("flag",null);
        userMapper.doRegister(map);
        int result=Integer.parseInt(map.get("flag").toString());
        return result;
    }

    @Override
    public boolean repeatName(String username) {
        return userMapper.repeatName(username)==1 ? true:false;
    }

    @Override
    public int judgeVip(int id) {
        return userMapper.judgeVip(id);
    }

    @Override
    public Users selectByid(int id) {
        return userMapper.selectByid(id);
    }

    @Override
    public void editPassword(int id, String password) {
        userMapper.editPassword(id,password);
    }

    @Override
    public void editInfo(int id, String nickname, String address, String telphone) {
        userMapper.editInfo(id,nickname,address,telphone);
    }
}
