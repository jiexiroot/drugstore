package com.jiexi.drug.service.impl;

import com.jiexi.drug.dao.DrugDao;
import com.jiexi.drug.dao.UserDao;
import com.jiexi.drug.pojo.Drugs;
import com.jiexi.drug.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-15 22:10
 */
@Service("drugService")
public class DrugServiceImpl implements DrugService {

    @Autowired
    DrugDao drugDao;

    @Override
    public List<Drugs> selectDrugs(int pages) {
        return drugDao.selectDrugs((pages-1)*30);
    }

    @Override
    public Map<String, Object> showDetailsById(int did) {
        Map<String,Object> resultMap = new HashMap<String, Object>();
        Drugs drugs = drugDao.showDetails(did);
        String[] Slist =drugs.getSpec().split("/");
        resultMap.put("drugs",drugs);
        resultMap.put("standard",Slist[1]);
        return resultMap;
    }

    @Override
    public List<Drugs> selectLikeDrugs(String message) {
        return drugDao.selectLikeDrugs(message);
    }
}
