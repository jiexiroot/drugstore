package com.jiexi.drug.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author GOU
 * @Date 2020-06-20 15:27
 */
public interface PublishersMapper {

    /**
     * 查询厂商名称
     * @param id
     * @return
     */
    @Select("select name from publishers where id = #{id}")
    String showPublishersName(@Param("Id")int id);
}
