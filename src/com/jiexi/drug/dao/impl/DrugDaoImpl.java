package com.jiexi.drug.dao.impl;

import com.jiexi.drug.dao.DrugDao;
import com.jiexi.drug.mapper.DrugMapper;
import com.jiexi.drug.pojo.Drugs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-15 22:10
 */
@Repository("drugDao")
public class DrugDaoImpl implements DrugDao {

    @Autowired
    DrugMapper drugMapper;

    @Override
    public List<Drugs> selectDrugs(int pages) {
        return drugMapper.selectDrugs(pages);
    }

    @Override
    public Drugs showDetails(int drugsId) {
        return drugMapper.showDetails(drugsId);
    }

    @Override
    public List<Drugs> selectLikeDrugs(String message) {
        return drugMapper.selectLikeDrugs(message);
    }

    @Override
    public int selectDrugNum() {
        return drugMapper.selectDrugNum();
    }
}
