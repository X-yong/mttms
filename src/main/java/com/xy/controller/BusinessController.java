package com.xy.controller;

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

import com.xy.entity.Business;
import com.xy.entity.Cost;
import com.xy.entity.Customer;
import com.xy.service.BusinessService;
import com.xy.service.CostService;
import com.xy.service.CustomerService;
import com.xy.util.Pagenation;

@Controller
@RequestMapping("/business")
public class BusinessController  {
	@Resource
	private BusinessService businessService;
	@Resource
	private CustomerService customerService;
	@Resource
	private CostService costService;
	/**
	 * 增加业务
	 */
	/***************查询所有资费信息**********************/
	@RequestMapping("/searchCost")
	
	public String searchCost(HttpServletRequest request ,Model model){	
		System.out.println("查询所有资费");
		List resultCost =  costService.selectAllCostService();
		model.addAttribute("costname", resultCost);
		return "service/service_list";
	}
	/************查询账务账号存在*************************/
	@RequestMapping("/searchCustomer")
	@ResponseBody
	public Customer searchCustomer(Customer customer,HttpServletRequest request){
		System.out.println("通过身份证查账务账号！");
		HttpSession session = request.getSession();
		Customer resultCustomer = customerService.selectCustomerByIdcard(customer);
		if(resultCustomer !=null)
		session .setAttribute("c_id", resultCustomer.getC_id());
		return resultCustomer;
	}
	@RequestMapping("/addBusiness")
	@ResponseBody
	public String addBusiness(HttpServletRequest request){
		 System.out.println("增加业务！");
		 String r_ospassword  = request.getParameter("r_ospassword");
		 String c_idcard  = request.getParameter("c_idcard");
		 String cost_name  = request.getParameter("cost_name");
		 String b_ospassword  = request.getParameter("b_ospassword");
		 String b_osusername = request.getParameter("b_osusername");
	     HttpSession session = request.getSession();
	  
	    Map map = new HashMap();
	    int c_id = (Integer) session.getAttribute("c_id");
		//判断密码是否相等
	    if(!r_ospassword.equals(b_ospassword)){
		  return "fail";
		}
	    //判断该业务账号是否存在
		Business result = businessService.selectBusinessBycidService(c_id);
		if(result !=null) return "alreadyExit";
		//通过资费名查找资费id
		Cost cost = costService.selectCostServiceByName(cost_name);
		int cost_id = cost.getCost_id();
		map.put("c_id", c_id);
		map.put("b_osusername", b_osusername);
		map.put("b_ospassword", b_ospassword);
		map.put("b_state", "0");
		map.put("cost_id", cost_id);
		int results = businessService.insertBusinessService(map);
		if(results !=0)
		return "success";
		else return "error";
	}
	/**
	 * 查询所有业务信息
	 * @param business
	 * @param request
	 * @return
	 */
	@RequestMapping("/searchAllInfo")
	@ResponseBody
	public Map<String,Object> searchAllInfo(HttpServletRequest request,
			       @RequestParam(value="page",defaultValue="1")int page,
                   @RequestParam(value="rows",defaultValue="5")int rows,
                   @RequestParam(value="b_osusername",defaultValue="")String b_osusername,
                   @RequestParam(value="c_idcard",defaultValue="")String c_idcard,
                   @RequestParam(value="b_state",defaultValue="")String b_state){
		  System.out.println("查询所有业务账号信息");
		  
		  Map map = new HashMap<String, Object>();
		  Pagenation pagenation = new Pagenation(page, rows);
		  Customer cus = customerService.selectCustomerByidcardService(c_idcard);
		  int c_id =-1;
		  if(cus !=null){
		     c_id = cus.getC_id();
		  }
		  
		  if("开通".equals(b_state))
			  b_state ="0";
		  else if("暂停".equals(b_state))
		     b_state ="1";
		  else if("删除".equals(b_state))
			     b_state ="2";
		  else if("全部".equals(b_state) ){
			     b_state ="3";
		  }
		  map.put("start",pagenation.getStart() );
		  map.put("rows",rows );
		  map.put("b_osusername", b_osusername);
		  map.put("c_id", c_id);
		  map.put("b_state", b_state);
		  System.out.println(map.get("b_osusername"));
		  System.out.println(map.get("c_idcard"));
		  System.out.println(map.get("b_state"));
		  
		  return businessService.selectBusinessAllService(map);
	}
	/**
	 * 开通或暂停
	 */
	@RequestMapping("/openOrclose")
	@ResponseBody
	public String updateBusinessByBid(int b_id,String b_state){
		System.out.println("开通或暂停");
		System.out.println("b_id"+b_id);
		System.out.println("状态："+b_state);
		int result = businessService.updateBusinessByBidService(b_id,b_state);
		if(result !=0){
			return "success";
		}
		return "fail";
	}
	/**
	 * 删除操作
	 */
	@RequestMapping("/deleteOperate")
	@ResponseBody
	public String updateBusinessByBid(int b_id){
		System.out.println("删除业务账号！");
		System.out.println(b_id+"gjhk");
		int result = businessService.deleteBusinessByBidService(b_id);
		if(result !=0){
			return "success";
		}
		return "fail";
	}
	/**
	 * 修改业务账号信息
	 * @param b_id
	 * @param b_osusername
	 * @param cost_name
	 * @return
	 */
	/*@RequestMapping("/searchUpdate")
	public String searchUpdate(int b_id ,HttpServletRequest request){
		 Business business = businessService.selectAllBybidService(b_id);//查出账务账号
		 List costname = costService.selectAllCostService();
		 request.setAttribute("b_id",b_id );
		 request.setAttribute("b_osusername",business.getB_osusername());
		 request.setAttribute("costname",costname );
		return "service/service_modi";
	}*/
	
	@RequestMapping("/updateInfo")
	@ResponseBody
	public String updateBusinessInfo( int b_id,String b_osusername,String cost_name){
		System.out.println("修改业务信息！");
		
		Cost cost = costService.selectCostServiceByName(cost_name);
		int cost_id = cost.getCost_id();
		Map map = new HashMap();
		map.put("b_id", b_id);
		map.put("b_osusername", b_osusername);
		map.put("cost_id", cost_id);
		int result = businessService.updateBusinessInfoService(map);
		if(result !=0)
		return "success";
		else return "fail"; 
	}	
}
