<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
<link type="text/css" rel="stylesheet" media="all"	href="../styles/global2.css" />
<link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
<link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/plugins/easyui/themes/default/easyui.css" />  
<link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/plugins/easyui/themes/icon.css"/> 
<script type="text/javascript"	src="${pageContext.request.contextPath}/plugins/easyui/jquery.min.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
        <script language="javascript" type="text/javascript">
            function changeTab(e,ulObj) {                
                var obj = e.srcElement || e.target;
                if (obj.nodeName == "A") {
                    var links = ulObj.getElementsByTagName("a");
                    for (var i = 0; i < links.length; i++) {
                        if (links[i].innerHTML == obj.innerHTML) {
                            links[i].className = "tab_on";
                        }
                        else {
                            links[i].className = "tab_out";
                        }
                    }
                }
            }
            $(function(){
        		$("#dt").datagrid({
        			title:'报表',		
        			width: '950px',
        			height: '370px',
        			url:'${pageContext.request.contextPath}/report/searchAll.do',
        			remoteSort:false,  //是否使用服务端排序
        	        idField:'bill_id', //定义主键
        	        singleSelect:true,//是否单选 
        	        pagination:true,//分页控件 
        	        rownumbers:true,//行号 
        	        pageSize: 5,//每页显示的记录条数，默认为10 
        	        pageList: [5,10,15],//可以设置每页记录条数的列表 
        		 
        		});
        		//分页
        		var pager = $('#dt').datagrid('getPager');    // get the pager of datagrid
        		pager.pagination({
        	        beforePageText: '第',//页数文本框前显示的汉字 
        	        afterPageText: '页    共 {pages} 页', 
        	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        		});
    
            }) 
           function forusername(val,row){
            	return row.customer.c_username;
            }
            function forcname(val,row){
            	return row.customer.c_name;
            } 
            function foridcard(val,row){
            	return row.customer.c_idcard;
            } 
            function forphone(val,row){
            	return row.customer.c_phone;
            } 
            function fortime(val,row){
            	var time = parseInt(val) + "秒";  
            	if( parseInt(val )> 60){  
            	    var second = parseInt(val) % 60;  
            	    var min = parseInt(val / 60);  
            	    time = min + "分" + second + "秒";  
            	    if( min > 60 ){  
            	        min = parseInt(val / 60) % 60;  
            	        var hour = parseInt( parseInt(val / 60) /60 );  
            	        time = hour + "小时" + min + "分" + second + "秒";  
            	  
            	        if( hour > 24 ){  
            	            hour = parseInt( parseInt(val / 60) /60 ) % 24;  
            	            var day = parseInt( parseInt( parseInt(val / 60) /60 ) / 24 );  
            	            time = day + "天" + hour + "小时" + min + "分" + second + "秒";  
            	        }  
            	    }  
            	}  
            	return time;          
            }
          function sort(){
        	  $('#dt').datagrid('load',{
       			tab: 1
            });
        	  
          }
         
        </script>
    </head>
    <body>
       <!--Logo区域开始-->
		<%@ include file="../include/Logo.jsp" %>
		<!--Logo区域结束-->
        <!--导航区域开始-->
		<%@ include file="../include/menu.jsp" %>
		<input id="indexs" value="report" hidden/>
        <!--导航区域结束-->
        <!--主要区域开始-->        
        <div id="report_main">
        	<div class="tabs">
    	        <ul onclick="changeTab(event,this);">
        	        <li><a href="${pageContext.request.contextPath}/view/report.do" class="tab_on" title="每位客户每月的累计时长">客户使用时长</a></li>
                    <li><a href="#" onclick="sort()" class="tab_out" title="每台服务器上累计时长最高的前三名客户">时长排行榜</a></li>
                </ul>
            </div>            
            <div class="report_box">
                <!--数据区域：用表格展示数据-->
                <div id="report_data">
                    <table id="dt" class="easyui-datagrid">
					<thead>
						<tr>	
							<th field="bill_id" sortable ="true" width="100" >账单ID</th>									    
							<th field="c_username"  width="100"  formatter = "forusername">账务账号</th>
							<th field="c_name"  width="120" formatter="forcname">客户名称</th>
							<th field="c_idcard" width="160" formatter="foridcard">身份证号码</th>
							<th field="c_phone" width="160" formatter="forphone">电话号码</th>
							<th field="yearmonth" sortable ="true" width="140">月份</th>
							<th field="alltime" sortable ="true" formatter="fortime" width="135" >累计时长</th>
						</tr>
					</thead> 
				</table> 
            </div>
           </div>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
          
        </div>
    </body>
</html>
