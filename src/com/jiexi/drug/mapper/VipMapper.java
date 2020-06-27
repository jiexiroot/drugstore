package com.jiexi.drug.mapper;

import com.jiexi.drug.pojo.Vips;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * @author GOU
 * @Date 2020-06-22 21:12
 */
public interface VipMapper {


    /**
     * 升级Vip 生成vip表
     * @param id
     * @return
     */
    @Insert("insert into member(userid,points,levelsId) values (#{id},0,1)")
    boolean registerVip1(@Param("id")int id);
    /**
     * 升级Vip 更改用户权限
     * @param id
     * @return
     */
    @Update("update users set userRoleId = 2 where id = #{id}")
    boolean registerVip2(@Param("id")int id);

    /**
     * 查找vip
     * @param id
     * @return
     */
    @Select("select id as mid,levelsId as lid,userId as uid, points, levelName from member,viplevel where member.levelsId = viplevel.lid and userId = #{id}")
    Vips showVipsById(@Param("id")int id);
}
