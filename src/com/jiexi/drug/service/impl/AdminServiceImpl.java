package com.jiexi.drug.service.impl;

import com.jiexi.drug.dao.AdminDao;
import com.jiexi.drug.pojo.Drugs;
import com.jiexi.drug.pojo.Member;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Users;
import com.jiexi.drug.service.AdminService;
import com.jiexi.drug.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<Users> getByLikeNameUsers(String useStr) {
        return adminDao.getByLikeNameUsers(useStr);
    }

    @Override
    public Member getMemberByUid(String uid) {
        return adminDao.getMemberByUid(Integer.parseInt(uid));
    }

    @Override
    public List<Order> selectOrderInfo(int pages, int limit, String searchStr) {
        return adminDao.selectOrderInfo( (pages-1)*limit, limit, searchStr);
    }

    @Override
    public int addDrug(Drugs drugs) {
        return adminDao.addDrug(drugs);
    }

    @Override
    public List<Drugs> selectDrugInfo(int pages, int limit, String searchStr, String cStr, String pStr) {
        return adminDao.selectDrugInfo((pages-1)*limit,limit,searchStr,cStr,pStr);
    }

    @Override
    public int disabledId(int id) {
        return adminDao.disabledId(id);
    }

    @Override
    public int abledId(int id) {
        return adminDao.abledId(id);
    }

    @Override
    public Drugs getDrugByDid(int did) {
        return adminDao.getDrugByDid(did);
    }

    @Override
    public String getDrugCName(int cid) {
        return adminDao.getDrugCName(cid);
    }

    @Override
    public String getDrugPName(int pid) {
        return adminDao.getDrugPName(pid);
    }

    @Override
    public int delDrugsById(int did) {
        return adminDao.delDrugsById(did);
    }


}
