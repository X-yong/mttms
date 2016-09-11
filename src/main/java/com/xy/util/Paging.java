package com.xy.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Paging {
     public Map paging(List list,String currPages){
    /***************************公共分页**************************/
 		int currPage=1;//设置当前页
 		int allRow = list.size(); //总行数
     	System.out.println("返回总行数"+allRow);

     	int allPage = allRow%5==0 ?allRow/5:allRow/5+1; //总页数
     	System.out.println("返回总页数"+allPage);
     	//String page = request.getParameter("currPage");//从jsp获取当前页
     	if(!"".equals(currPages) && currPages!=null){
 			currPage = Integer.parseInt(currPages);
 			System.out.println(currPage);//输出当前页
 		}else{currPage = 1;
 		System.out.println("返回当前页:"+currPage); 
 		}	
     	int begin = currPage*5-4;
     	List ve = new ArrayList();
     	for(int i=0; i<5;i++ ){
     		if(begin+i<=allRow)
     		ve.add(list.get(begin+i-1));
     	}
     	Map map= new HashMap();
     	map.put("fpage", ve);
     	map.put("currPage", currPage);
     	map.put("allPage", allPage);
 	    System.out.println("分页完毕返回controller层");
    	 return map;
     }
}
