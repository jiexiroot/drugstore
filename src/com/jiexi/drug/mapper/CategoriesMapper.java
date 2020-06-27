package com.jiexi.drug.mapper;

import com.jiexi.drug.pojo.Categories;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author GOU
 * @Date 2020-06-19 19:35
 */
public interface CategoriesMapper {
    /**
     * 查询种类名称
     * @param cid
     * @return
     */
    @Select("select * from categories where id = #{Cid}")
    public Categories selectCname(@Param("Cid")int cid);
}
