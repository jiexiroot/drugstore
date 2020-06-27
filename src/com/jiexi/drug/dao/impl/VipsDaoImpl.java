package com.jiexi.drug.dao.impl;

import com.jiexi.drug.dao.VipsDao;
import com.jiexi.drug.mapper.VipMapper;
import com.jiexi.drug.pojo.Vips;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author GOU
 * @Date 2020-06-22 21:41
 */
@Repository("vipsDao")
public class VipsDaoImpl implements VipsDao {
    @Autowired
    VipMapper vipMapper;

    @Override
    public boolean registerVip1(int id) {
        return vipMapper.registerVip1(id);
    }

    @Override
    public boolean registerVip2(int id) {
        return vipMapper.registerVip2(id);
    }

    @Override
    public Vips showVipsById(int id) {
        return vipMapper.showVipsById(id);
    }
}
