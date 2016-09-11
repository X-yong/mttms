package com.xy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xy.entity.Cost;
import com.xy.service.CostService;
import com.xy.util.Paging;

@Controller
@RequestMapping("/cost")
/**
 * 资费管理模块
 * @author soonsmile
 *
 */
public class CostController{
	@Resource
	private CostService costService;
	
	/**
	 * 查询所有资费信息
	 * @param cost
	 * @param request
	 * @return
	 */
	@RequestMapping("/costInfo")
	 public String costInfo(Cost cost,HttpServletRequest request) {
		System.out.println("查询所有资费信息！");
		HttpSession session = request.getSession();
		List<Cost> allResult = costService.selectCostService();
		/**********************************分页**********************************/
		String currPages = request.getParameter("currPage");
		Paging page = new Paging();
		Map map= page.paging(allResult, currPages);
		request.setAttribute("fpage", map.get("fpage"));
    	request.setAttribute("currPage",map.get("currPage"));
    	request.setAttribute("allPage", map.get("allPage"));
    	session.setAttribute("resultCost", allResult);
		return "fee/fee_list";
	}
	//点击翻页
	@RequestMapping("/page")
	public String page(HttpServletRequest request){
		 HttpSession session = request.getSession();
		 List<Cost> resultPage = (List<Cost>) session.getAttribute("resultCost");
		 String currPages = request.getParameter("currPage");
		 System.out.println("从前台获取的当前页"+currPages);
		 System.out.println(resultPage.size());
		 Paging page = new Paging();//调用分页方法
		 Map map= page.paging(resultPage, currPages);
		 request.setAttribute("fpage", map.get("fpage"));
	     request.setAttribute("currPage",map.get("currPage"));
	     request.setAttribute("allPage", map.get("allPage")); 
		return "fee/fee_list";
	}
	/**
	 * 增加资费
	 */
	@RequestMapping("/addCost")
	@ResponseBody
	public String addCost(Cost cost ,HttpServletRequest request){
		System.out.println("增加资费");
		System.out.println("资费名："+cost.getCost_name());
		System.out.println("资费类型："+cost.getCost_type());
		System.out.println("基本时长"+cost.getCost_basetime());
		String cost_name= cost.getCost_name();
		Cost result = costService.selectCostServiceByName(cost_name);
		if(result==null){
			System.out.println("当前资费不存在，可以添加。");
			int add = costService.insertCostService(cost);
			if(add !=0){
				return "success";
			}else return "error";
		}else{
			System.out.println("该资费已存在！");
			return "alreadyExist";
		}
	}
	/**
	 *启用资费
	 * @return
	 */
	@RequestMapping("/startCost")
	@ResponseBody
	public String startCost(Cost cost){
		System.out.println("启用资费");
		int start = costService.startCost(cost);
		if(start !=0){
			return "success";
		}else 
		return "fail";
	}
	/**
	 *删除资费
	 * @return
	 */
	@RequestMapping("/deleteCost")
	@ResponseBody
	public String deleteCost(Cost cost){
		System.out.println("删除资费");
		int start = costService.deleteCostService(cost);
		if(start !=0){
			return "success";
		}else 
		return "fail";
	}
	/**
	 * 资费详情
	 * @param cost
	 * @param request
	 * @return
	 */
	@RequestMapping("/detailCost")
	public String detailCost(Cost cost,HttpServletRequest request){
		System.out.println("查看一条资费详细信息");
		String cost_name = request.getParameter("cost_name");
		
		Cost detail = costService.selectCostServiceByName(cost_name);
		
		System.out.println(detail.getCost_type());
		request.setAttribute("detail", detail);
		return "fee/fee_detail";
	}
	/************************修改资费**************************/
	@RequestMapping("/selectCost")
	public String selectCost (Cost cost,HttpServletRequest request){
		System.out.println("修改资费的查询资费");
		Cost sresult = costService.selectCostServiceById(cost);
		request.setAttribute("sresult",sresult);
		return "fee/fee_modi";
	}
	@RequestMapping("/updatecost")
	public String updateCost(Cost cost,HttpServletRequest request){
		System.out.println("修改资费信息");
		System.out.println(cost.getCost_id());
		
		int uresult = costService.updateCostService(cost);
		if(uresult !=0){
			request.setAttribute("result",1 );
			return "redirect:/cost/costInfo.do";
		}else 
		return "fee/fee_modi";
	}
	/**
	 * 排序
	 * @return
	 */
	@RequestMapping("/order")
	public String orderCost(HttpServletRequest request){
		HttpSession session = request.getSession();
		String order=request.getParameter("order");
		String by = request.getParameter("a");
		System.out.println(order);
		System.out.println(by);
		Map map = new HashMap();
		map.put("order",order);
		map.put("i", by);
		List<Cost> rCosts = costService.orderCostService(map);
		System.out.println("排序成功");
		request.setAttribute("order",order );
		request.setAttribute("by",by );
		session.setAttribute("allResult", rCosts);
		
		String currPages = request.getParameter("currPage");
		Paging page = new Paging();
		Map map2= page.paging(rCosts, currPages);
		request.setAttribute("fpage", map2.get("fpage"));
    	request.setAttribute("currPage",map2.get("currPage"));
    	request.setAttribute("allPage", map2.get("allPage"));
    	System.out.println();
		return "fee/fee_list";
	}
	@RequestMapping("/publicPage")
	public String publicPage(HttpServletRequest request){
		
		
		return "fee/fee_list";
	}
	
}
