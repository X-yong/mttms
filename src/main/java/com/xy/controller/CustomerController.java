package com.xy.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.xy.entity.Cost;
import com.xy.entity.Customer;
import com.xy.service.BusinessService;
import com.xy.service.CustomerService;
import com.xy.util.Paging;
/**
 * 财务账号模块
 * @author soonsmile
 *
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Resource
	private CustomerService customerService;
	@Resource
	private BusinessService businessService;
   /**
    * 查询所有账务信息
    * @param request
    * @return
    */
	@RequestMapping("/searchAllInfo")
	public String searchAllInfo(Customer customer,HttpServletRequest request){
		System.out.println("查询所有账务账号信息");
		HttpSession session = request.getSession();
		List<Customer> result = customerService.selectCustomerByConditionService(customer);
		/**********************************分页**********************************/
		String currPages = request.getParameter("currPage");
		Paging page = new Paging();
		Map map= page.paging(result, currPages);
		request.setAttribute("aPage", map.get("fpage"));
    	request.setAttribute("currPage",map.get("currPage"));
    	request.setAttribute("allPage", map.get("allPage"));
    	request.setAttribute("echo", customer);
    	session.setAttribute("resultCustomer", result);
	   return  "account/account_list";
	}
    //点击翻页
 	@RequestMapping("/page")
 	public String page(HttpServletRequest request){
 		 HttpSession session = request.getSession();
 		 List<Customer> resultPage =  (List<Customer>) session.getAttribute("resultCustomer");
 		 String currPages = request.getParameter("currPage");
 		 System.out.println("从前台获取的当前页"+currPages);
 		 Paging page = new Paging();//调用分页方法
 		 Map map= page.paging(resultPage, currPages);
 		 request.setAttribute("aPage", map.get("fpage"));
 	     request.setAttribute("currPage",map.get("currPage"));
 	     request.setAttribute("allPage", map.get("allPage")); 
 		return "account/account_list";
 	}
 	/**
 	 * 增加账务账号
 	 * @return
 	 */
   @RequestMapping("/addCustomer")
   @ResponseBody
   public String addCustomer(Customer customer,@RequestParam("r_password")String r_password, HttpServletRequest request){
	   System.out.println("添加账务账号");
	   String c_password =customer.getC_password();
	   if(!c_password.equals(r_password)) return "passwordError";//判断两次密码是否相等
	   Customer byCustomerId = customerService.selectCustomerByIdcard(customer);
	   if(byCustomerId ==null){
	   int result = customerService.insertCustomer(customer);
	   System.out.println(result);
	   if(result !=0){
		   return "success";
	   }else 
	   return "fail";
	   }else
		   return "alreadyExit";   
    }
    /**
     * 开通或暂停操作
     * @param customer
     * @param request
     * @return
     */
   @RequestMapping("/openOrStop")
   public String  openOrStop(Customer customer,HttpServletRequest request){
	   System.out.println("开通或暂停");
	   String state = customer.getC_state();
	   int re=0;
	   int openOrStop = customerService.operateStopService(customer);  
	   if("1".equals(state)){
		   int c_id=customer.getC_id();//获取c_id调用business的方法
		   re = businessService.operateBycidService(c_id);
		   if(openOrStop !=0 && re !=0)
		     request.setAttribute("message", "操作成功！"); 
		   else  request.setAttribute("message", "操作失败！");
	   }else {
	   if(openOrStop !=0 ){
	     request.setAttribute("message", "操作成功！");
	   }else
	     request.setAttribute("message", "操作失败！");
	   }
	   return "redirect:/customer/searchAllInfo.do";
   }
   /**
	 * 查询详单，通过c_id
	 * @param request
	 * @return
	 */
   @RequestMapping("detailSelect")
   public String detailSelect(Customer customer,HttpServletRequest request,Model model){
	   System.out.println("查询详细");
	   System.out.println(customer.getC_id());
	   Customer result = customerService.detailSelectService(customer);
	   String c_otherid = result.getC_otherid();
	   customer.setC_otherid(c_otherid);
	   Customer resultCid = customerService.selectByOtherIdService(customer);   
	   int c_id = resultCid.getC_id();
	   String time="";
	   String state = result.getC_state();
	   if("0".equals(state)){
		   time = result.getC_opentime();
	   }else if("1".equals(state)){
		   time = result.getC_stoptime();
	   }else if("2".equals(state)){
		   time = result.getC_deletetime();
	   }
	   String brith = result.getC_idcard();
	   StringBuffer briths =new StringBuffer() ;
	   briths.append(brith.substring(6,10 )+"年");
	   briths.append(brith.substring(10,12 )+"月");
	   briths.append(brith.substring(12,14 )+"日");
	   model.addAttribute("brith",briths);
       model.addAttribute("time",time);
       model.addAttribute("c_id",c_id);
	   request.setAttribute("resultDetail", result);
	   return "account/account_detail";
   }
   /**
    * 删除财务账号
    * @param customer
    * @param request
    * @return
    */
   @RequestMapping("/deleteCustomer")
   @ResponseBody
   public String deleteCustomer(Customer customer,HttpServletRequest request){
	   System.out.println("删除账务账号！");
	   int rd = businessService.updateBusinessByCidService(customer);
	   int result = customerService.deleteCustomerService(customer);
	   if(result !=0){
	    if(rd != 0){   
		   return "success";
	   }else return "nobusiness";
	   }else return "fail";
	   
   }
   /**
    * 通过c_id查询所有信息
    * @param customer
    * @param request
    * @return
    */
   @RequestMapping("searchBycid")
   public String searchBycid(Customer customer ,HttpServletRequest request){
	   System.out.println("使用cid查询账务账号信息");
	   HttpSession session = request.getSession();
	   Customer result = customerService.detailSelectService(customer);
	   String password = result.getC_password();
	   String brith = result.getC_idcard();
	   StringBuffer briths =new StringBuffer() ;
	   briths.append(brith.substring(6,10 )+"年");
	   briths.append(brith.substring(10,12 )+"月");
	   briths.append(brith.substring(12,14 )+"日");
	   session.setAttribute("password",password);
	   request.setAttribute("resultByCid",result );
	   request.setAttribute("brith",briths);
	   return "account/account_modi";
   }
   /**
    * 修改账务信息
    * @param customer
    * @param request
    * @return
    */
   @RequestMapping("/updateCustomer")
   @ResponseBody
   public String updateCustomer(Customer customer ,HttpServletRequest request){
	  System.out.println("修改账务信息");
	  HttpSession session = request.getSession();
	  String oldPassword = (String) session.getAttribute("password");//旧密码
	  String o_password = request.getParameter("o_password");//获取输入的旧密码
	  String newPassword = request.getParameter("c2_password");//新密码
	  String rePassword = request.getParameter("r_password");//重复密码
	  if(o_password != null && o_password != "" && newPassword != null && newPassword != "" && rePassword != null && rePassword != ""){
	  if(!oldPassword.equals(o_password)){
		  return "pswne";
	  }else if(!newPassword.equals(rePassword)){
		  return "repswne";
	  }
	  customer.setC_password(newPassword);
	    System.out.println("密码验证通过，修改信息");
	  }
	    System.out.println("调用sevice层");
	  int result = customerService.updateCustomerService(customer);  
		  if(result !=0){
			  return "success";
		  }else
		  
	   return "fail";
   }
   
   
   
   
}
