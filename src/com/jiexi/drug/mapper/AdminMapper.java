package com.jiexi.drug.mapper;

import com.jiexi.drug.pojo.Member;
import com.jiexi.drug.pojo.Users;
import org.apache.ibatis.annotations.*;

import java.util.List;

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
    @Results(
        value = {
            @Result(id = true, property = "id",column = "Id"),
            @Result(property = "username",column = "Username"),
            @Result(property = "password",column = "Password"),
            @Result(property = "nickName",column = "NickName"),
            @Result(property = "address",column = "Address"),
            @Result(property = "telphone",column = "Telphone"),
            @Result(property = "userRoleId",column = "UserRoleId"),
            @Result(property = "stateId",column = "UserStateId"),
            @Result(property = "addtime",column = "Addtime"),
        }
    )
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

    /**
     * 查询用户信息
     * @param useStr
     * @return
     */
    @Select("select * from users where CONCAT(id,username) like #{useStr} and id != 4")
    @Results(
        value = {
            @Result(id = true, property = "id",column = "Id"),
            @Result(property = "username",column = "Username"),
            @Result(property = "password",column = "Password"),
            @Result(property = "nickName",column = "NickName"),
            @Result(property = "address",column = "Address"),
            @Result(property = "telphone",column = "Telphone"),
            @Result(property = "userRoleId",column = "UserRoleId"),
            @Result(property = "stateId",column = "UserStateId"),
            @Result(property = "addtime",column = "Addtime"),
        }
    )
    List<Users> getByLikeNameUsers(@Param("useStr") String useStr);

    /**
     * 查询用户积分与信息
     * @param uid
     * @return
     */
    @Select("select * from member where userId = #{uid}")
    Member getMemberByUid(@Param("uid")int uid);

    /**
     * 恢复登录权限
     * @param id
     * @return
     */
    @Update("update users set userStateId = 1 where id = #{id}")
    int abledId(@Param("id") int id);

    /**
     * 禁用登录权限
     * @param id
     * @return
     */
    @Update("update users set userStateId= 2 where id = #{id}")
    int disabledId(@Param("id")int id);
}
