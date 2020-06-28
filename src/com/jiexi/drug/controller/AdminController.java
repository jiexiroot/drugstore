package com.jiexi.drug.controller;

import com.jiexi.drug.pojo.Member;
import com.jiexi.drug.pojo.Users;
import com.jiexi.drug.service.AdminService;
import com.jiexi.drug.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GOU
 * @Date 2020-06-27 15:49
 */
@Controller
@RequestMapping("admin")
@SessionAttributes({ "nowadmin" })
public class AdminController {

    @Autowired
    AdminService adminService;

    /**
     * 显示主页
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("index")
    public String AdminIndex(Model model, HttpSession session){

        Map<String,Object> userIF = (Map<String, Object>) session.getAttribute("userIF");
        if( userIF != null){
            String uid = (String) userIF.get("userid");
            Users users = adminService.selectAdmin(Integer.parseInt(uid));
            model.addAttribute("nowadmin",users);
        }else{
            return "login";
        }
        return "admin/adminIndex";
    }

    /**
     * 修改密码
     * @param request
     * @param model
     * @param oldpassword
     * @param uid
     * @param password
     * @return
     */
    @RequestMapping("updatepwd")
    public String UpdatePwd(HttpServletRequest request , Model model, String oldpassword,String uid, String password){
        Users users = (Users) request.getSession(false).getAttribute("nowadmin");
        if (!users.getPassword().equals(MD5.MD5(oldpassword))) {
            model.addAttribute("msg", "原密码错误");
            return "admin/adminPassword";
        }
        int r = adminService.updateAdminPwd(Integer.parseInt(uid),password);
        if (r > 0) {
            model.addAttribute("msg", "修改成功，请重新登录");
            request.getSession(false).removeAttribute("nowadmin");
            request.getSession(false).removeAttribute("userIF");
            return "login";
        }
        model.addAttribute("msg", "修改失败");
        return "admin/adminPassword";
    }

    /**
     * 添加管理员用户
     * @param account
     * @param model
     * @return
     */
    @RequestMapping("addadmin")
    public String addadmin(String account,Model model){

        // 检查用户是否存在
        int isTrue = adminService.selectIsTrue(account);
        if (isTrue == 0){
            model.addAttribute("msg", account + "   该账号不存在");
            model.addAttribute("icon", 2);
            return "admin/adminAddAdmin";
        }

        // 检查用户是否是管理员
        int result =adminService.selectIsAdmin(account);
        if (result > 0){
            model.addAttribute("msg", account + "   该账号已经是管理员用户");
            model.addAttribute("icon", 2);
            return "admin/adminAddAdmin";
        }

        // 注册管理员用户
        adminService.setAdmin(account);
        model.addAttribute("msg","注册成功，可以登录");
        model.addAttribute("icon", 1);
        return "admin/adminAddAdmin";
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpSession session,Model model){
        session.invalidate();
        session.setAttribute("msg2","退出成功");
        return "main";
    }

    /**
     * 查询所有用户信息
     * @param userstr
     * @param model
     * @return
     */
    @RequestMapping("getusers")
    public String getusers(String userstr, Model model){
        if (userstr != null) {
            model.addAttribute("userstr","以下是关于'" + userstr + "'的信息");
            userstr = "%" + userstr + "%";
        } else {
            model.addAttribute("userstr","以下全部成员的信息");
            userstr = "%%";
        }
        List<Users> list = adminService.getByLikeNameUsers(userstr);
        model.addAttribute("list",list);
        return "admin/adminUser";
    }

    /**
     * 用户详情信息
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("getuser")
    public String getuser(String uid,Model model){
        Map<String ,Object> objectMap = new HashMap<String, Object>();
        //查询用户基本信息
        Users users = adminService.selectAdmin(Integer.parseInt(uid));
        objectMap.put("user",users);
        if (users.getUserRoleId() == 2){
            Member member = adminService.getMemberByUid(uid);
            objectMap.put("member",member);
            String vips = null;
            switch ((int) member.getLevelsId()){
                case 1:
                    vips = "黄铜会员";
                    break;
                case 2:
                    vips = "白银会员";
                    break;
                case 3:
                    vips = "黄金会员";
                    break;
                case 4:
                    vips = "钻石会员";
                    break;
                case 5:
                    vips = "终生会员";
                    break;
                default:
                    vips = "";
                    break;
            }
            objectMap.put("vips",vips);
        }
        model.addAttribute("userInfo",objectMap);
        return  "admin/adminUserDetail";
    }
}
