package com.xy.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xy.entity.Admin;
import com.xy.service.AdminService;

@Controller
@RequestMapping("/admin")
/**
 * 管理员模块
 * @author soonsmile
 *
 */
public class AdminLoginController  {
	@Resource
	private AdminService adminService;
	/**
	 * 用户登陆
	 * @param admin
	 * @param request
	 * @return lonin or index
	 */
	@RequestMapping("/xy")
	public String login(Admin admin ,HttpServletRequest request ) {
		HttpSession session = request.getSession();
		Admin result = adminService.loginService(admin);
       if(result==null){
    	   System.out.println("密码错误");
    	   request.setAttribute("a_username", admin.getA_username());
    	   request.setAttribute("a_password", admin.getA_password());
    	   request.setAttribute("errorInfo", "请核对你的用户名或密码是否正确！");
    	   return "login";
       }else {
    	  String authority =result.getA_authority();
   		  System.out.println("当前用户权限："+authority);
    	  session.setAttribute("adminInfo", result);//将当前登陆用户的信息存在session里面
    	  System.out.println("密码正确跳转到index界面");
    	  return "index";
       }
	}
	/***************************管理员管理********************************************/
	/**
	 * 查询管理员
	 * @param request
	 * @return
	 */
	@RequestMapping("/adminInfo")
	public String adminInfo(Model model,Admin admin ,HttpServletRequest request){
	    System.out.println("查询管理员");
	    String a_name = request.getParameter("name");
	    String a_authority = request.getParameter("authority");
	    admin.setA_name(a_name);
	    admin.setA_authority(a_authority);
		List<Admin> resultAdminInfo = adminService.searchAdminInfoService(admin);//调用service层方法
		/***************************分页**************************/
		int currPage=1;//设置当前页
		int allRow = resultAdminInfo.size(); //总行数
    	System.out.println("返回总行数"+allRow);

    	int allPage = allRow%5==0 ?allRow/5:allRow/5+1; //总页数
    	System.out.println("返回总页数"+allPage);
    	String page = request.getParameter("currPage");//从jsp获取当前页
    	if(!"".equals(page) && page!=null){
			currPage = Integer.parseInt(page);
			System.out.println(currPage);//输出当前页
		}else{currPage = 1;
		System.out.println("返回当前页:"+currPage); 
		}	
    	int begin = currPage*5-4;
    	List ve = new ArrayList();
    	for(int i=0; i<5;i++ ){
    		if(begin+i<=allRow)
    		ve.add(resultAdminInfo.get(begin+i-1));
    	}
    	request.setAttribute("fpage", ve);
    	request.setAttribute("currPage",currPage);
    	request.setAttribute("allPage", allPage);
    	request.setAttribute("returnName",a_name );
		
		/********************************************************/
		HttpSession session = request.getSession();
		session.setAttribute("resultAdminInfo",resultAdminInfo);
    	//model.addAttribute("resultList",resultAdminInfo);
		return "admin/admin_list";
	}
	//点击下一页，上一页。。。。。调用
	@RequestMapping("/page")
	public String page(HttpServletRequest request){
		/***************************分页**************************/
		HttpSession session =request.getSession();
		List<Admin> resultAdminInfo = (List<Admin>) session.getAttribute("resultAdminInfo");
		int currPage=1;//设置当前页
		int allRow = resultAdminInfo.size(); //总行数
    	System.out.println("返回总行数"+allRow);

    	int allPage = allRow%5==0 ?allRow/5:allRow/5+1; //总页数
    	System.out.println("返回总页数"+allPage);
    	String page = request.getParameter("currPage");//从jsp获取当前页
    	if(!"".equals(page) && page!=null){
			currPage = Integer.parseInt(page);
			System.out.println(currPage);//输出当前页
		}else{currPage = 1;
		System.out.println("返回当前页:"+currPage); 
		}	
    	int begin = currPage*5-4;
    	List ve = new ArrayList();
    	for(int i=0; i<5;i++ ){
    		if(begin+i<=allRow)
    		ve.add(resultAdminInfo.get(begin+i-1));
    	}
    	request.setAttribute("fpage", ve);
    	request.setAttribute("currPage",currPage);
    	request.setAttribute("allPage", allPage);	
		return "admin/admin_list";
		
	}
	/**
	 * 增加管理员
	 * @param admin
	 * @return
	 * 使用@RequestParam("a_authoritys")String a_authoritys获取checkbox的值存到一个字符串中
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/addAdminSave")
	public String addAdmin(Admin admin,HttpServletRequest request,
			              @RequestParam("a_authoritys")String a_authoritys,
			              @RequestParam("file")MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("添加管理员");
		System.out.println("选择的权限："+a_authoritys);
		HttpSession session =request.getSession();		
		String r_password = request.getParameter("r_password");//获取重复密码
		admin.setA_authority(a_authoritys);
		request.setAttribute("echo", admin);

		/***********************图片上传*****************************/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		    String date = sdf.format(new Date());  //设置时间格式
			String path = request.getServletContext().getRealPath("/");//获取项目的绝对路径
		    System.out.println(path+"upload/"+date+file.getOriginalFilename());	
		    String p = "/upload/"+date+file.getOriginalFilename(); 
		    admin.setA_photo(p);//将图片路径存到数据库
		    //判断密码是否相等
    	 if(r_password.equals(admin.getA_password())){
		    Admin exitOrNot = adminService.selectExitAdminService(admin);//先判断该管理员账号是否存在是否存在
		    if(exitOrNot==null){
	    	  System.out.println("没有重复用户确认添加");
	    	  int add = adminService.insertAdminService(admin); //增加管理员
	    	    if(add ==0){
		    	    request.setAttribute("message", "增加管理员失败！！");
				    return "admin/admin_add";
	    	    }else {
		    		request.setAttribute("message", "增加管理员成功！！");
		    		request.setAttribute("tab", 1);
		    		file.transferTo(new File(path+"upload/"+date+file.getOriginalFilename()));
		    		return "admin/admin_add";
			    }
		    }else{
			    request.setAttribute("message", "该管理员账号已存在！！");
			    return "admin/admin_add";
		     }
	      }else {
			   request.setAttribute("message", "密码和重复密码不相等！！");
	  		   return "admin/admin_add";
	  }
	}
	/**
	 * 删除管理员
	 * @param admin
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteAdminSave")
	@ResponseBody
	public String deleteAdmin(Admin admin, HttpServletRequest request){
		//删除管理员
		int a_id = Integer.parseInt(request.getParameter("a_id"));
		admin.setA_id(a_id);
		int delete = adminService.deleteAdminService(admin);
		if(delete !=0){
			return "successDelete";
		}
		return "error";
	}
	/**
	 * 修改管理员信息，调用修改用户信息的接口实现
	 * @param admin
	 * @param request
	 * @return
	 */
	//显示修改管理员信息jsp
	@RequestMapping("/updateAdminView")
	public String updateAdminView(HttpServletRequest request,Admin admin){
		System.out.println("修改管理员信息");
		HttpSession session = request.getSession();
		int a_id = Integer.parseInt(request.getParameter("a_id"));
		admin.setA_id(a_id);
		Admin resultAdminInfo = adminService.selectByaidService(admin);
		request.setAttribute("resultAdminInfo", resultAdminInfo);
		session.setAttribute("a_id",a_id);
		return "admin/admin_modi";
	}//修改管理员信息
	@RequestMapping("/updateAdminSaves")
	@ResponseBody
	public String updateAdmin(Admin admin,@RequestParam("a_authoritys")String a_authoritys, HttpServletRequest request){
		HttpSession session = request.getSession();
		int a_id = (Integer) session.getAttribute("a_id");
		admin.setA_id(a_id);
		admin.setA_authority(a_authoritys);
		System.out.println("跳转到service 使用a_id作为条件");
		int resultAdminInfo = adminService.updateAdminService(admin);
		if(resultAdminInfo !=0){
			return "success";
		}else {
			return "fail";
		}
	}
	/**********************密码重置*************************/
	@RequestMapping("/restPsw")
	@ResponseBody
	public String restPsw(Admin admin,HttpServletRequest request){
		HttpSession session = request.getSession();
		String string[] = request.getParameterValues("restPsw");
		System.out.println("密码重置操作");
		if(string != null){
			List list = new ArrayList();
			 for(int i=0;i<string.length;i++){
				 list.add(string[i]);
			 }
			System.out.println(list);
			int rList = adminService.restPswsService(list);
			if(rList !=0){
				return "success";
			}
		}else{
			return "noSelect";
		}
		return "error";
	}
	/**********************查询并修改用户信息*******************************/	
	/*************查询信息****************/
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest request) {
		System.out.println("查询信息");
		HttpSession session = request.getSession();
		Admin  admin = (Admin)session.getAttribute("adminInfo");
		Admin result = adminService.selectByaidService(admin);
		System.out.println(result.getA_id());
		Admin cAdmin = adminService.nService(result);//转换权限输出格式
		session.setAttribute("resultUserinfo", cAdmin);
		return "user/user_info";
	}
	/*************修改信息****************/
	@RequestMapping("/updateInfo")
	@ResponseBody
	public String updateInfo(Admin admin,HttpServletRequest request ){
		HttpSession session = request.getSession();
		Admin admin2 = (Admin) session.getAttribute("adminInfo");
		admin.setA_password(admin2.getA_password());
		int resultUserInfo = adminService.updateInfoService(admin);
		System.out.println("已跳转到修改信息Controller");
		if(resultUserInfo !=0){
			System.out.println("修改信息成功！");
			return "userInfo";
		}else{
			System.out.println("修改信息失败");
			return null;
		}
	}
	/*********************修改密码****************************************/
	@RequestMapping("/updatePsw")
	@ResponseBody
	public String updatePsw(HttpServletRequest request ){
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminInfo");
		String a_username = admin.getA_username();
		String s_PSw  = admin.getA_password(); //旧密码
		String oldPsw = request.getParameter("oldPsw");//输入的旧密码
		String newPsw = request.getParameter("newPsw");//新密码
		String reNewPsw = request.getParameter("reNewPsw");//再次输入的新密码
	
		//判断旧密码是否相等
		if(!s_PSw.equals(oldPsw) ){
			return "pswUnlike";
		}else if(newPsw.equals(reNewPsw)){
			Map map = new HashMap();
			map.put("a_username", a_username);
			map.put("a_password", s_PSw);
			map.put("r_password", newPsw);
			int resultUpdatePsw = adminService.updatePasswordService(map);	//跳转到service层
			//判断结果
			if(resultUpdatePsw !=0){
				return "updateSuccess";	//AJAX提交，返回值无实际意义，仅区别返回null		
			}else return "error";
		}else{
			System.out.println("两次输入的新密码不等");
			return "rePswnulike";}		
	}
}
