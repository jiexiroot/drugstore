package com.jiexi.drug.dao;

import com.jiexi.drug.pojo.Drugs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-15 22:05
 */
public interface DrugDao {

    /**
     * 查找产品
     * @param pages 页码
     * @return 列表数据
     */
    List<Drugs> selectDrugs(int pages);

    /**
     * 通过药品id查找该药品的详细信息
     * @param drugsId
     * @return
     */
    Drugs showDetails(@Param("did")int drugsId);

    /**
     * 模糊查找药品名
     * @param message
     * @return
     */
    List<Drugs> selectLikeDrugs(String message);
}
