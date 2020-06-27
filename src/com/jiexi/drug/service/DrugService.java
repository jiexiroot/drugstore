package com.jiexi.drug.service;

import com.jiexi.drug.pojo.Drugs;

import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-15 22:05
 */
public interface DrugService {

    /**
     * 查找产品
     * @param pages 页码
     * @return 列表数据
     */
    List<Drugs> selectDrugs(int pages);

    /**
     * 通过药品id查找该药品的详细信息
     * @param did
     * @return
     */
    Map<String, Object> showDetailsById(int did);

    /**
     * 模糊查找药品名
     * @param message
     * @return
     */
    List<Drugs> selectLikeDrugs(String message);
}
