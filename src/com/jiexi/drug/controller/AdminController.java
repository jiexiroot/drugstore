package com.jiexi.drug.controller;

import com.jiexi.drug.pojo.Drugs;
import com.jiexi.drug.pojo.Member;
import com.jiexi.drug.pojo.Order;
import com.jiexi.drug.pojo.Users;
import com.jiexi.drug.service.AdminService;
import com.jiexi.drug.util.MD5;
import com.jiexi.drug.util.StringToSqlDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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
        model.addAttribute("msg2","退出成功");
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
        model.addAttribute("keys", userstr);
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

    /**
     * 查询所有订单信息
     * @return
     */
    @RequestMapping("getOrders")
    @ResponseBody
    public Map<String,Object> selectOrderInfo(int page,int limit,String searchStr){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if (searchStr != null) {
            searchStr = "%" + searchStr + "%";
        } else {
            searchStr = "%%";
        }
        List<Order> list = adminService.selectOrderInfo(page,limit,searchStr);
        if (list == null){
            resultMap.put("code",1);
        }else{
            resultMap.put("code",0);
        }
        resultMap.put("msg","解析成功");
        resultMap.put("count", 1000);
        resultMap.put("data",list);

        return resultMap;
    }

    /**
     * 图片上传
     * @param file
     * @return
     */
    @RequestMapping("upload")
    @ResponseBody
    public Map<String, Object> upload(MultipartFile file){
        String prefix="";
        String dateStr="";
        //保存上传
        OutputStream out = null;
        InputStream fileInput=null;
        try{
            if(file!=null){
                String originalName = file.getOriginalFilename();
                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
                Date date = new Date();
                String uuid = UUID.randomUUID()+"";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateStr = simpleDateFormat.format(date);
//                String filepath = "C:\\Users\\11636\\IdeaProjects\\drugstore\\out\\artifacts\\drugstore\\images\\products" + "\\" + dateStr+"\\"+uuid+"." + prefix;
                String filepath = "/usr/apache-tomcat-9.0.33/webapps/drugstore/images/products/" + dateStr+"/"+uuid+"." + prefix;


                File files=new File(filepath);
                //打印查看上传路径
                System.out.println(filepath);
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
                Map<String,Object> map2=new HashMap<String, Object>();
                Map<String,Object> map=new HashMap<String, Object>();
                map.put("code",0);
                map.put("msg","");
                map.put("data",map2);
                map2.put("src","/images/products/"+ dateStr+"/"+uuid+"." + prefix);
                return map;
            }

        }catch (Exception e){
        }finally{
            try {
                if(out!=null){
                    out.close();
                }
                if(fileInput!=null){
                    fileInput.close();
                }
            } catch (IOException e) {
            }
        }
        Map<String,Object> map=new HashMap<>();
        map.put("code",1);
        map.put("msg","");
        return map;

    }



    /**
     * 添加药品信息
     * @param drugs
     * @param model
     * @return
     */
    @RequestMapping("addDrug")
    public String addDrug(Drugs drugs,Model model,String spec_1,String spec_2){

        String spec = spec_1 + "/" + spec_2;
        java.sql.Timestamp timestamp = StringToSqlDate.getNowDate_StrToSqlDate();
        drugs.setPublishDate(timestamp);
        drugs.setSpec(spec);

        System.out.println(drugs);
        int s = adminService.addDrug(drugs);
        if (s == 1){
            model.addAttribute("addMsg",drugs.getDrugName() +",添加成功");
            model.addAttribute("addMsgId",1);
        }else{
            model.addAttribute("addMsg","添加失败");
            model.addAttribute("addMsgId",2);
        }
        return "admin/adminAddDrug";
    }

    /**
     * 获得药品信息
     * @param model
     * @param page
     * @param limit
     * @param searchStr
     * @param cStr
     * @param pStr
     * @return
     */
    @RequestMapping("getDrugs")
    @ResponseBody
    public Map<String,Object> getDrugs(Model model, int page, int limit, String searchStr, String cStr, String pStr){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if (searchStr != null) {
            searchStr = "%" + searchStr + "%";
        } else {
            searchStr = "%%";
        }
        if (cStr != null) {
            cStr = "%" + cStr + "%";
        } else {
            cStr = "%%";
        }
        if (pStr != null) {
            pStr = "%" + pStr + "%";
        } else {
            pStr = "%%";
        }
        List<Drugs> list = adminService.selectDrugInfo(page,limit,searchStr,cStr,pStr);
        if (list == null){
            resultMap.put("code",1);
        }else{
            resultMap.put("code",0);
        }
        resultMap.put("msg","解析成功");
        resultMap.put("count", 1000);
        resultMap.put("data",list);

        return resultMap;
    }

    /**
     * 药品详细详信息
     * 根据did查询药品
     * @param did
     * @return
     */
    @RequestMapping("getDrug")
    public String getDrug(int did, Model model){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Drugs drugs = adminService.getDrugByDid(did);
        String cName = adminService.getDrugCName((int) drugs.getCategoryId());
        String pName = adminService.getDrugCName((int) drugs.getPublisherId());
        resultMap.put("drugs",drugs);
        resultMap.put("cName",cName);
        resultMap.put("pName",pName);

        model.addAttribute("drugsInfo",resultMap);
        return "admin/adminDrugDetail";
    }

    /**
     * 禁止登陆权限
     * @param keys
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("disabled")
    public String disabled_Login(String keys,int uid,Model model){
        if (uid == 0){
            model.addAttribute("msg", "出现错误");
            model.addAttribute("icon",2);
            return getusers(keys,model);
        }else{
            if (adminService.disabledId(uid)>0){
                model.addAttribute("msg", "禁止该账号登陆，修改成功");
                model.addAttribute("icon",1);
                return getusers(keys,model);

            }else{
                model.addAttribute("msg", "修改失败");
                model.addAttribute("icon",2);
                return getusers(keys,model);
            }
        }
    }

    /**
     * 恢复登陆权限
     * @param keys
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("abled")
    public String abled_Login(String keys,int uid,Model model){
        if (uid == 0){
            model.addAttribute("msg", "出现错误");
            model.addAttribute("icon",2);
            return getusers(keys,model);
        }else{
            if (adminService.abledId(uid)>0){
                model.addAttribute("msg", "恢复该账号登陆，修改成功");
                model.addAttribute("icon",1);
                return getusers(keys,model);

            }else{
                model.addAttribute("msg", "修改失败");
                model.addAttribute("icon",2);
                return getusers(keys,model);
            }
        }
    }

    /**
     * 删除商品（建议二次确认）
     * @param did
     * @return
     */
    @RequestMapping("deleteDrugs")
    @ResponseBody
    public Map<String, Object> deleteDrugs(String did){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        if(!("".equals(did))){
            adminService.delDrugsById(Integer.parseInt(did));
            resultMap.put("result","1");
            resultMap.put("message","删除成功");
        }else{
            resultMap.put("result","0");
            resultMap.put("message","空参数");
        }
        return resultMap;
    }
}
