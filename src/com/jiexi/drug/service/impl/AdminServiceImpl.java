package com.jiexi.drug.service.impl;

import com.jiexi.drug.dao.AdminDao;
import com.jiexi.drug.pojo.Users;
import com.jiexi.drug.service.AdminService;
import com.jiexi.drug.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author GOU
 * @Date 2020-06-27 16:07
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;
    @Override
    public Users selectAdmin(int id) {
        return adminDao.selectAdmin(id);
    }

    @Override
    public int updateAdminPwd(int id, String password) {
        return adminDao.updateAdminPwd(id, MD5.MD5(password));
    }

    @Override
    public int selectIsTrue(String username) {
        return adminDao.selectIsTrue(username);
    }

    @Override
    public int selectIsAdmin(String username) {
        return adminDao.selectIsAdmin(username);
    }

    @Override
    public int setAdmin(String username) {
        return adminDao.setAdmin(username);
    }
}
