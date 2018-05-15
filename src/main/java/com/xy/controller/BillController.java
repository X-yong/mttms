package com.xy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xy.service.BillService;
import com.xy.service.CustomerService;
import com.xy.util.Pagenation;

@Controller
@RequestMapping("/bill")
public class BillController  {
	@Resource
	private BillService billService;
	@Resource
	private CustomerService customerService;
	
	/**
	 * 
	 * 搜索所有账单信息
	 */
	@RequestMapping("/searchAllBillInfo")
	@ResponseBody
	public Map searchAllBillInfo( HttpServletRequest request,
			  @RequestParam(value="page",defaultValue="1")int page,
              @RequestParam(value="rows",defaultValue="5")int rows,
			  @RequestParam(value="c_username",defaultValue="")String c_username,
			  @RequestParam(value="c_idcard",defaultValue="")String c_idcard,
			  @RequestParam(value="c_name",defaultValue="")String c_name,
			  @RequestParam(value="year",defaultValue="-1")String year,
			  @RequestParam(value="month",defaultValue="-1")String month
			){
		System.out.println("搜索所有账单信息");
		Pagenation pagenation = new Pagenation(page, rows);
		Map map = new HashMap();
		String yearmonth=null;
		if(year!=null && month !=null ){
	    	if("全部".equals(month)){
	    		  map.put("yearmonth", year);
	    	}else{
	    		int m = Integer.parseInt(month);
	    		if(m<10){
	    	    yearmonth = year+"-0"+month;
	    		}else{
	    		 yearmonth = year+"-"+month;
	    		}
	    		map.put("yearmonth", yearmonth);
	    	  }
	    	}
		map.put("c_idcard", c_idcard);
		map.put("c_username", c_username);
		map.put("c_name", c_name);
		map.put("start",pagenation.getStart() );
	    map.put("rows",rows );
		
		return billService.billSelectAllService(map);
	}
	/**
	 * 显示详单
	 */
	@RequestMapping("/detailInfo")
	@ResponseBody
	public Map detailInfo(String b_id,String yearmonth,
			  @RequestParam(value="page",defaultValue="1")int page,
              @RequestParam(value="rows",defaultValue="5")int rows){
		 System.out.println("查询详单！");
		 System.out.println("b_id："+b_id +"年月："+yearmonth);
		 Map map = new HashMap();
		 Pagenation pagenation = new Pagenation(page, rows);
		 if(b_id !=null && b_id !=""){
		 map.put("b_id", Integer.parseInt(b_id));
		 map.put("yearmonth",yearmonth);
		 map.put("rows", rows);
		 map.put("start", pagenation.getStart());
	     return billService.selectBillDetailService(map);
		 }
		 else return null;
			
			
	}
	
}
