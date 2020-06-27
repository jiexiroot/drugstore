package com.jiexi.drug.service.impl;

import com.jiexi.drug.dao.VipsDao;
import com.jiexi.drug.pojo.Vips;
import com.jiexi.drug.service.VipsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author GOU
 * @Date 2020-06-22 21:44
 */
@Service("vipsService")
public class VipsServiceImpl implements VipsService {
    @Autowired
    VipsDao vipsDao;

    @Override
    public boolean registerVip1(int id) {
        return vipsDao.registerVip1(id);
    }

    @Override
    public boolean registerVip2(int id) {
        return vipsDao.registerVip2(id);
    }

    @Override
    public Vips showVipsById(int id) {
        return vipsDao.showVipsById(id);
    }
}
