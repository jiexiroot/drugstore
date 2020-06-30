package com.jiexi.drug.dao;

import com.jiexi.drug.pojo.Drugs;
import com.jiexi.drug.pojo.Member;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Users;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author GOU
 * @Date 2020-06-27 16:04
 */
public interface AdminDao {

    /**
     * 查询管理员信息
     * @param id
     * @return
     */
    Users selectAdmin(int id);

    /**
     * 更新管理员密码
     * @param id
     * @param password
     * @return
     */
    int updateAdminPwd(int id,String password);

    /**
     * 查询该用户名是否存在
     * @param username
     * @return
     */
    int selectIsTrue(String username);

    /**
     * 查询该用户是否为管理员用户
     * @param username
     * @return
     */
    int selectIsAdmin(String username);

    /**
     * 升级成管理员用户
     * @param username
     * @return
     */
    int setAdmin(String username);

    /**
     * 查询所有用户的信息并且可以模糊查找
     * @param useStr
     * @return
     */
    List<Users> getByLikeNameUsers(String useStr);

    /**
     * 通过uid查询vip信息
     * @param uid
     * @return
     */
    Member getMemberByUid(int uid);

    /**
     * 查询订单信息并分页
     * @param index 起始位置
     * @param limit 分页数量
     * @return 订单信息
     */
    List<Order> selectOrderInfo(int index, int limit, String searchStr);

    /**
     * 添加药品
     * @param drugs
     * @return
     */
    int addDrug(Drugs drugs);

    /**
     * 后台查询药品
     * @param index
     * @param limit
     * @param searchStr
     * @param cStr
     * @param pStr
     * @return
     */
    List<Drugs> selectDrugInfo(int index, int limit, String searchStr, String cStr, String pStr);

    /**
     * 恢复登录权限
     * @param id
     * @return
     */
    int disabledId(int id);

    /**
     * 禁用登录权限
     * @param id
     * @return
     */
    int abledId(int id);

    /**
     * 根据药品id查询该药品的信息
     * @param did
     * @return
     */
    Drugs getDrugByDid(int did);

    /**
     * 根据分类id查找分类名字
     * @param cid
     * @return
     */
    String getDrugCName(int cid);

    /**
     * 根据厂商id查找厂商名字
     * @param pid
     * @return
     */
    String getDrugPName(int pid);

    /**
     * 根据药品id进行删除
     * @param did
     * @return
     */
    int delDrugsById(int did);
}
