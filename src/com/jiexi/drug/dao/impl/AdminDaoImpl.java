package com.jiexi.drug.dao.impl;

import com.jiexi.drug.dao.AdminDao;
import com.jiexi.drug.mapper.AdminMapper;
import com.jiexi.drug.pojo.Drugs;
import com.jiexi.drug.pojo.Member;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-27 16:05
 */
@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
    @Autowired
    AdminMapper adminMapper;

    @Override
    public Users selectAdmin(int id) {
        return adminMapper.selectAdmin(id);
    }

    @Override
    public int updateAdminPwd(int id, String password) {
        return adminMapper.updateAdminPwd(id, password);
    }

    @Override
    public int selectIsTrue(String username) {
        return adminMapper.selectIsTrue(username);
    }

    @Override
    public int selectIsAdmin(String username) {
        return adminMapper.selectIsAdmin(username);
    }

    @Override
    public int setAdmin(String username) {
        return adminMapper.setAdmin(username);
    }

    @Override
    public List<Users> getByLikeNameUsers(String useStr) {
        return adminMapper.getByLikeNameUsers(useStr);
    }

    @Override
    public Member getMemberByUid(int uid) {
        return adminMapper.getMemberByUid(uid);
    }

    @Override
    public List<Order> selectOrderInfo(int index, int limit, String searchStr) {
        return adminMapper.selectOrderInfo(index, limit, searchStr);
    }

    @Override
    public int addDrug(Drugs drugs) {
        return adminMapper.addDrug(drugs);
    }

    @Override
    public List<Drugs> selectDrugInfo(int index, int limit, String searchStr, String cStr, String pStr) {
        return adminMapper.selectDrugInfo(index, limit, searchStr, cStr, pStr);
    }

    @Override
    public int disabledId(int id) {
        return adminMapper.disabledId(id);
    }

    @Override
    public int abledId(int id) {
        return adminMapper.abledId(id);
    }

    @Override
    public Drugs getDrugByDid(int did) {
        return adminMapper.getDrugByDid(did);
    }

    @Override
    public String getDrugCName(int cid) {
        return adminMapper.getDrugCName(cid);
    }

    @Override
    public String getDrugPName(int pid) {
        return adminMapper.getDrugPName(pid);
    }

    @Override
    public int delDrugsById(int did) {
        return adminMapper.delDrugsById(did);
    }


}
