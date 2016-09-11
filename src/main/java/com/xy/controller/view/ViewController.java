package com.xy.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/view")
public class ViewController {
	/**************登陆和管理员模块*********************/
	@RequestMapping("/login")
	public String welcome(){
		System.out.println("已接收跳转到登陆页面");
		return "login";
	}
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/role")
	public String role() {
		return "role/role_list";
	}
	@RequestMapping("/addAdmin")
	public String admin() {
		return "admin/admin_add";
	}
	
	@RequestMapping("/business")
	public String business() {
		return "service/service_list";
	}
	/*@RequestMapping("/account")
	public String account() {
		return "account/account_list";
	}*/
	@RequestMapping("/bill")
	public String bill() {
		return "bill/bill_list";
	}
	@RequestMapping("/report")
	public String report() {
		return "report/report_list";
	}
	
	@RequestMapping("/changePsw")
	public String changePsw() {
		return "user/user_modi_pwd";
	}
	@RequestMapping("/exit")
	public String exit() {
		return "login";
	}
	/***************资费管理模块**************************/
	@RequestMapping("addCost")
	public String addCost(){
		return "fee/fee_add";
	}
	/***************账务模块****************************/
	//跳到添加账务账号界面
	@RequestMapping("/addCustomer")
	public String addCustomer(){
		return "account/account_add";
	}
	/*************************************************/
	@RequestMapping("businessShow")
	public String businessShow(){
		return "service/service_list";
	}
	
	
}
