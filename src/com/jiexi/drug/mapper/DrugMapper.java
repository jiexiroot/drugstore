package com.jiexi.drug.mapper;

import com.jiexi.drug.pojo.Drugs;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-17 10:55
 */
public interface DrugMapper {
    /**
     * 查找产品
     * @param pages 页码
     * @return 列表数据
     */
    List<Drugs> selectDrugs(@Param("Allpages") int pages);

    /**
     * 通过药品id查找该药品的详细信息
     * @param drugsId
     * @return
     */
    @Select("select * from drugs where id=#{did}")
    @Results(
        value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "drugName", column = "drugName"),
            @Result(property = "shopName", column = "shopName"),
            @Result(property = "approval", column = "approval"),
            @Result(property = "publisherId", column = "publisherId"),
            @Result(property = "publisherDate", column = "publisherDate"),
            @Result(property = "categoryId", column = "categoryId"),
            @Result(property = "spec", column = "spec"),
            @Result(property = "model", column = "model"),
            @Result(property = "imgurl", column = "imgurl"),
            @Result(property = "price", column = "price"),
            @Result(property = "cList", column = "categoryId",
            one = @One(select = "com.jiexi.drug.mapper.CategoriesMapper.selectCname"))
        }
    )
    Drugs showDetails(@Param("did")int drugsId);

    /**
     * 显示数组中的did来查询
     * @param dids
     * @return
     */
    List<Drugs> showDrugsByDids(@Param("did") List<Integer> dids);

    /**
     * did来查询
     * @param did
     * @return
     */
    @Select("select * from drugs where id=#{did}")
    Drugs showDrugsByDid(@Param("did") int did);

    /**
     * 模糊查找药品
     * @param message
     * @return
     */
    List<Drugs> selectLikeDrugs(@Param("message") String message);

    /**
     * 按照药品种类查找
     * @param content
     * @return
     */
    List<Drugs> selectDrugsByCName(@Param("content")String content);

    /**
     * 查找药品总数
     * @return
     */
    @Select("select count(*) from drugs")
    int selectDrugNum();
}
