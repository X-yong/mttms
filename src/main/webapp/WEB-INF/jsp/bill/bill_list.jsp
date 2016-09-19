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
            //写入下拉框中的年份和月份
            function initialYearAndMonth() {
                //写入最近3年
                var yearObj = document.getElementById("selYears");
                var year = (new Date()).getFullYear();
                for (var i = 0; i <= 2; i++) {
                    var opObj = new Option(year - i, year - i);
                    yearObj.options[i] = opObj;
                }
                //写入 12 月
                var monthObj = document.getElementById("selMonths");
                var opObj = new Option("全部", "全部");
                monthObj.options[0] = opObj;
                for (var i = 1; i <= 12; i++) {
                    var opObj = new Option(i, i);
                    monthObj.options[i] = opObj;
                }
            }
            $(function(){
        		$("#dg").datagrid({
        			title:'所有账单信息',		
        			width: '950px',
        			height: '270px',
        			url:'${pageContext.request.contextPath}/bill/searchAllBillInfo.do',
        			remoteSort:false,  //是否使用服务端排序
        	        idField:'bill_id', //定义主键
        	        singleSelect:true,//是否单选 
        	        pagination:true,//分页控件 
        	        rownumbers:true,//行号 
        	        pageSize: 5,//每页显示的记录条数，默认为10 
        	        pageList: [5,10,15],//可以设置每页记录条数的列表 
        		 
        		});
        		//分页
        		var pager = $('#dg').datagrid('getPager');    // get the pager of datagrid
        		pager.pagination({
        	        beforePageText: '第',//页数文本框前显示的汉字 
        	        afterPageText: '页    共 {pages} 页', 
        	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        		});
    
            })
      //显示格式化      
    function formatId(val ,row){
		return row.customer.c_idcard;
	}
	function formatCname(val ,row){
		return row.customer.c_name;
	}
	function formatCuser(val ,row){
		return row.customer.c_username;
	}
	//详单显示 格式化
	 function formatCostN(val,row){
		return row.cost.cost_name;
	}
    function formatOS(val,row){
		$("#d_2").html(row.business.b_osusername)
		return row.business.b_osusername;
	}  
	 
	/* ***************************详单****************************************** */
	 function formatDetail(val,row){
		return '<a href="#" onclick="detailInfo('+row.bill_id+')" class="easyui-linkbutton" iconCls="icon-edit">详单</a>'
	}
	function detailInfo(bill_id){
	 	$('#dg').datagrid('selectRecord',bill_id);
		var row = $('#dg').datagrid('getSelected');
		$("#d_1").html(row.customer.c_username);
		$("#d_3").html(row.yearmonth);
		$("#d_4").html(row.bill_money); 
		  
       	$("#main").hide();
		$("#detail").show();
		$("#dt").datagrid({
			title:'详单信息',		
			width: '950px',
			height: '270px',
			url:'${pageContext.request.contextPath}/bill/detailInfo.do?b_id='+row.b_id+'&yearmonth='+row.yearmonth,
			remoteSort:false,  //是否使用服务端排序
	        idField:'b_id', //定义主键
	        singleSelect:true,//是否单选 
	        pagination:true,//分页控件 
	        rownumbers:true,//行号 
	        pageSize: 5,//每页显示的记录条数，默认为10 
	        pageList: [5,10,15],//可以设置每页记录条数的列表 
		})
            var pager = $('#dt').datagrid('getPager');    // get the pager of datagrid
		    pager.pagination({
	        beforePageText: '第',//页数文本框前显示的汉字 
	        afterPageText: '页    共 {pages} 页', 
	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		}); 
	}
	/*********************************************************************************/	
	
	//条件查询
	 function searchBill(){
	  $('#dg').datagrid('load',{
		c_idcard: $('#b_idcard').val(),
		c_username: $('#b_username').val(),
		c_name: $('#b_name').val(),
		year: $('#selYears').val(),
		month: $('#selMonths').val()
	
	});
  }  
      </script>
    </head>
    <body onload="initialYearAndMonth();">
       <!--Logo区域开始-->
		<%@ include file="../include/Logo.jsp" %>
		<!--Logo区域结束-->
        <!--导航区域开始-->
		<%@ include file="../include/menu.jsp" %>
		<input id="indexs" value="bill" hidden/>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form  id="bill">
                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：<input type="text"   id="b_idcard" name="c_idcard" class="text_search" /></div>
                    <div>账务账号：<input type="text" id="b_username" name="c_username" class="width100 text_search" /></div>                            
                    <div>姓名：<input type="text" id="b_name" name="c_name" class="width70 text_search" /></div>
                    <div>
                        <select class="select_search" id="selYears" name="year">
                        </select>
                                                                   年
                        <select class="select_search" id="selMonths" name="month">
                        </select>
                                                                  月
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="searchBill()" /></div>
                    <div><input type="button" value="搜索所有" class="btn_search" onclick="location.href='${pageContext.request.contextPath}/view/bill.do';" /></div>
                </div>  
              <!--数据区域：用表格展示数据-->
			 <div id="data">
				<table id="dg" class="easyui-datagrid">
					<thead>
						<tr>										    
							<th field="bill_id"  width="80" align="center" >账单ID</th>
							<th field="c_name"  width="80"  align="center"formatter="formatCname">姓名</th>
							<th field="c_idcard" width="175"  align="center"formatter="formatId">身份证号</th>
							<th field="c_username" width="90" align="center" formatter="formatCuser">财务账号</th>
							<th field="bill_money" width="70" align="center">费用</th>
							<th field="yearmonth"  width="150" align="center">月份</th>
							<th field="pay_way" width="85" align="center">支付方式</th>
							<th field="pay_state" width="87"align="center" >支付状态</th>
							<th field="operate" width="100"align="center" formatter="formatDetail">操作</th>
						</tr>
					</thead> 
				</table> 
          <!--主要区域结束-->
                <p>业务说明：<br />
                1、设计支付方式和支付状态，为用户自服务中的支付功能预留；<br />
                2、只查询近 3 年的账单，即当前年和前两年，如2013/2012/2011；<br />
                3、年和月的数据由 js 代码自动生成；<br />
                4、由数据库中的ｊｏｂ每月的月底定时计算账单数据。</p>
                </div>                    
            </form>
        </div>
        <!-- 详单 -->
        <div id="detail" hidden>
            <form id="detf">
                <!--查询-->
                <div class="search_add">                        
                    <div>账务账号：<span class="readonly width70" id="d_1"></span></div>                            
                    <div>OS 账号：<span class="readonly width100" id="d_2" ></span></div>
                    <div>计费时间：<span class="readonly width70" id="d_3"></span></div>
                    <div>费用：<span class="readonly width70" id="d_4"></span></div>
                    <input type="button" value="返回" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/bill.do';" />
                </div>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                   <table id="dt" class="easyui-datagrid">
					<thead>
						<tr>	
							<th field="b_osusername"  width="100" align="center" formatter ="formatOS" >OS账号</th>									    
							<th field="loginIp"  width="150"  align="center">客户登陆IP</th>
							<th field="logintime"  width="160"  align="center">登入时刻</th>
							<th field="loginouttime" width="160"align="center" >登出时刻</th>
							<th field="duration" width="100" align="center">时长(秒)</th>
							<th field="d_money" width="100" align="center">费用</th>
							<th field="cost_name"  width="145" align="center" formatter="formatCostN">资费</th>
						</tr>
					</thead> 
				</table> 
                </div>
            </form>
        </div> 
        <!--主要区域结束-->
        <div id="footer">          
           
        </div>
    </body>
</html>
