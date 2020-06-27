package com.jiexi.drug.mapper;

import com.jiexi.drug.pojo.Users;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * @author GOU
 * @Date 2020-06-27 15:50
 */
public interface AdminMapper {

    /**
     * 显示管理员首页
     * @param id
     * @return
     */
    @Select("select * from users where id = #{id}")
    Users selectAdmin(@Param("id")int id);

    /**
     * 更新管理员密码
     * @param id
     * @param password
     * @return
     */
    @Update("update users set password = #{password} where id = #{id}")
    int updateAdminPwd(@Param("id")int id,@Param("password")String password);

    /**
     * 查询该用户名是否存在
     * @param username
     * @return
     */
    @Select("select count(*) from users where username = #{username}")
    int selectIsTrue(@Param("username")String username);

    /**
     * 查询该用户是否为管理员用户
     * @param username
     * @return
     */
    @Select("select count(*) from users where userRoleId = 3 and username = #{username}")
    int selectIsAdmin(@Param("username")String username);

    /**
     * 升级成管理员用户
     * @param username
     * @return
     */
    @Update("update users set userRoleId = 3 where username = #{username}")
    int setAdmin(@Param("username")String username);
}
