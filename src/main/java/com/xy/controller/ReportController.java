package com.xy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xy.service.BillService;
import com.xy.util.Pagenation;

@Controller
@RequestMapping("/report")
public class ReportController  {
	@Resource
	private BillService billService;
	
   @RequestMapping("/searchAll")
   @ResponseBody
   public Map searchAll(@RequestParam(value="page",defaultValue="1")int page,
                        @RequestParam(value="rows",defaultValue="5")int rows,
	                    @RequestParam(value="tab",defaultValue="-1")int tab){
	 System.out.println("报表查询");
	 System.out.println("rows:"+rows);
	 System.out.println("tab:"+tab);
	   Map map = new HashMap();
	   Pagenation pagenation = new Pagenation(page, rows);
	   map.put("start",pagenation.getStart() );
	   if(tab ==1) map.put("rows",3 );
	   else  map.put("rows",rows );
	   map.put("tab", tab);
	   return billService.billSelectAllService(map);
   }
}
