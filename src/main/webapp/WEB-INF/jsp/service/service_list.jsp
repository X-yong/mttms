<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" media="all"
	href="../styles/global2.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="../styles/global_color.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/easyui/themes/default/easyui.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/easyui/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/plugins/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script language="javascript" type="text/javascript">
	$(function() {
		$("#dg").datagrid(
			{
				title : '业务账号信息',
				//iconCls:'icon-list',//图标
				width : '950px',
				height : '300px',
				/* nowrap:false,
				striped:true,
				border:true, 
				collapsible:false,//设置折叠*/
				url : '${pageContext.request.contextPath}/business/searchAllInfo.do',
				//sortName:'code',
				//sortOrder:'desc',
				remoteSort : false, //是否使用服务端排序
				idField : 'b_id', //定义主键
				singleSelect : true,//是否单选 
				pagination : true,//分页控件 
				rownumbers : true,//行号 
				pageSize : 5,//每页显示的记录条数，默认为10 
				pageList : [ 5, 10, 15 ],//可以设置每页记录条数的列表 
			/*  toolbar:[{
			 	text:'暂停',
			 	iconCls:'icon-edit',
			 	hander:function(){
			 		//function operation();
			 	}
			 },'-',{
			 	text:'修改',
			 	iconCls:'icon-edit',
			 	hander:function(){
			 		//function updates();
			 	}
			 },'-',{
			 	text:'删除',
			 	iconCls:'icon-remove',
			 	hander:function(){
			 		//function deletes();
			     }
			 }], */
			});
		//分页
		var pager = $('#dg').datagrid('getPager'); // get the pager of datagrid
		pager.pagination({

			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		/* onBeforeRefresh:function(){
			$('#dg').datagrid('reload')
			return true; 
		} */
		});
	})

	//删除
	function deleteBuss(i) {
		var r = window.confirm("确定要删除此业务账号吗？删除后将不能恢复。");
		if (r) {
	         $.ajax({
				url : "${pageContext.request.contextPath}/business/deleteOperate.do",
				data : {"b_id" : i},
				type : "post",
				success : function(result) {
					if (result == "success") {
						//window.location.href = '${pageContext.request.contextPath}/business/searchAllInfo.do';
						$('#dg').datagrid('reload')
					} else {
						alert("删除失败！！")
					}
				}
			})
		}
	}

	//开通或暂停
	function openOrClose(i, j) {
		var r = window.confirm("确定要开通或暂停此业务账号吗？");
		if (r) {
			$.ajax({
				url : "${pageContext.request.contextPath}/business/openOrclose.do",
				data : {"b_id" : i,	b_state : j},
				type : "post",
				success : function(result) {
					if (result == "success") {
						//window.location.href = '${pageContext.request.contextPath}/business/searchAllInfo.do';
						$('#dg').datagrid('reload')
					} else {
						alert("开通失败！！")
					}
				}
			})
		}

	}

	//表格数据格式化
	function formatId(val, row) {
		return row.customer.c_idcard;
	}
	function formatName(val, row) {
		return row.customer.c_name;
	}
	function formatCname(val, row) {
		return row.cost.cost_name;
	}
	function formatState(val, row) {
		if (val == 0)
			return "开通";
		if (val == 1)
			return "暂停";
		if (val == 2)
			return "删除";
	}
	//详细
	function formatDetail(val, row) {
		return '<a href="#" onclick="detailInfo('+row.b_id+')" class="easyui-linkbutton" iconCls="icon-edit">'
				+ val + '</a>'
	}
	//右侧操作按钮
	function formatOperate(val, row) {
		if (row.customer.c_state == 0) {
			if (row.b_state == 0)
				return '<input type="button" value="暂停" class="btn_pause" onclick="openOrClose('
						+ row.b_id
						+ ','
						+ 1
						+ ')" /> <input type="button" value="修改" class="btn_modify" onclick="modi('
						+ row.b_id
						+ ')"/> <input type="button" class="btn_delete"  value="删除" onclick="deleteBuss('
						+ row.b_id + ')"/>'
			else if (row.b_state == 1)
				return '<input type="button" value="开通" class="btn_start" onclick="openOrClose('
						+ row.b_id
						+ ','
						+ 0
						+ ')" /><input type="button" value="修改" class="btn_modify" onclick="modi('
						+ row.b_id
						+ ')"/> <input type="button" class="btn_delete" value="删除" onclick="deleteBuss('
						+ row.b_id + ')"/>'
		}
	}
	//搜索信息
	function doSearch() {
		$('#dg').datagrid('load', {
			c_idcard : $('#c_idcard').val(),
			b_osusername : $('#b_osusername').val(),
			b_state : $('#b_state').val()
		});
	}
	//查看详细信息
	function detailInfo(b_id) {
		$('#dg').datagrid('selectRecord',b_id);
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#detail').show();
			$('#main').hide();
			$('#d_name').val(row.customer.c_name);
			$('#d_idcard').val(row.customer.c_idcard);
			$('#d_costname').val(row.cost.cost_name);
			$('#d_costinstruction').val(row.cost.cost_instruction);
			var state = row.b_state;
			var createtime = row.b_createtime;
			var deletetime = row.b_deletetime;
			var stoptime = row.b_stoptime;
			
			if (state == '0') {
				$("#d_statetime").val(createtime)
			} else if (state == '1') {
				$("#d_statetime").val(stoptime)
			} else if (state == '2') {
				$("#d_statetime").val(deletetime)
			}
			//将name 匹配的字段的值填充到相应的位置
			$('#det').form('load', row);
			url = '${pageContext.request.contextPath}/business/searchAllInfo.do';
		}
	}
	//填充下拉栏
	$(function() {
		$("#state").combobox({
			name : 'b_state',
			url : '${pageContext.request.contextPath}/business/searchAllInfo.do',
			method : 'get',
			valueField : 'b_state',
			textField : 'b_state',
			panelHeight : 'auto'
		});					
	})
	//资费下拉栏
	/*  $(function() {
		$("#cc").combobox({
			url : '${pageContext.request.contextPath}/business/searchCost.do',
			valueField : 'cost_id',
			textField : 'cost_name'
		});
	})  */
	//查询账务账号
	function serachBuss() {
		var a_idcard = $("#a_idcard").val()
		       $.ajax({
					url : '${pageContext.request.contextPath}/business/searchCustomer.do',
					data : {c_idcard : a_idcard},
					type : "post",
					success : function(result) {
						if (result.c_username == null){
					     $("#ae_username").addClass("validate_msg_long error_msg")
						 $("#ae_username").html("此账务账号未开通或不存在请重新录入!");
						}else{
						 $("#a_username").val(result.c_username);
						 $("#ae_username").html("");
						}
					}
				});
	}
	//增加业务
	function addBusiness() {
		$('#main').hide();
		$('#add').show();
	}
	/* //增加点击保存业务
	 function saveBusiness(){
	        $('#addform').form('submit',{
	            url: '${pageContext.request.contextPath}/business/addBusiness.do',
	            onSubmit: function(){
	                return $(this).form('validate');
	            },
	            success: function(result){
	                var result = eval('('+result+')');
	                if (result.errorMsg){
	                    $.messager.show({
	                        title: 'Error',
	                        msg: result.errorMsg
	                    });
	                }
	            }
	        });
	    }  */
	//增加业务
	function saveBusiness() {
	    var c_idcard = $("#a_idcard").val()
	    var osuser = $("#osuser").val()	
	    var psw = $("#psw").val()	
	    var rpsw = $("#rpsw").val()	
	    var reg_idcard =/(^\d{15}$)|(^\d{17}(\d|X)$)/ 	
	    var reg_osuser =/^[a-zA-Z\d\_]{1,8}$/	
	    var reg_password = /^[a-zA-Z\d\_]{1,30}$/	
	    if(c_idcard ==null||c_idcard==""){
	    	$("#ae_idcard").addClass("validate_msg_long error_msg")
  			$("#ae_idcard").html("身份证号必填项！");
    		return  false;
    	  }	else if(reg_idcard.test(c_idcard)==false){
    		$("#ae_idcard").addClass("validate_msg_long error_msg")
    	    $("#ae_idcard").html("身份证号格式错误！");
    		return  false;
    	  }
            $("#ae_idcard").html("");
         if(osuser ==null||osuser==""){
       		$("#ae_osuser").addClass("validate_msg_long error_msg")
     		$("#ae_osuser").html("os账号是必填项！");
       		return  false;
        }else if(reg_osuser.test(osuser)==false){
      		$("#ae_osuser").addClass("validate_msg_long error_msg")
      	    $("#ae_osuser").html("os账号格式错误！");
      		return  false;
        }
            $("#ae_osuser").html("");   		
         if(psw ==null||psw==""){
       		$("#ae_psw").addClass("validate_msg_long error_msg")
     		$("#ae_psw").html("密码是必填项！");
       		return  false;
        }else if(reg_password.test(psw)==false){
       		$("#ae_psw").addClass("validate_msg_long error_msg")
       	    $("#ae_psw").html("密码格式错误！");
       		return  false;
          }
            $("#ae_psw").html(""); 
        if(rpsw ==null||rpsw==""){
     		$("#ae_rpsw").addClass("validate_msg_long error_msg")
   			$("#ae_rpsw").html("重复密码是必填项！");
     		return  false;
         }else if(reg_password.test(rpsw)==false){
       		$("#ae_rpsw").addClass("validate_msg_long error_msg")
       	    $("#ae_rpsw").html("重复密码格式错误！");
       		return  false;
           }
            $("#ae_rpsw").html(""); 
            return true;
	}
	    $(function(){
	    	$("#addbuss").click(function(){
	    		if(saveBusiness()==true){
    			$.ajax({
    				url : '${pageContext.request.contextPath}/business/addBusiness.do',
    				data : $("#addform").serialize(),
    				type : "post",
    				success : function(result) {
    					if (result == "fail") {
    						alert("请确认你的密码是否相同")
    					} else if (result == "error") {
    						alert("添加失败")
    					} else if (result == "success") {
    						alert("增加成功")
    						/* $('#add').hide();
    						$('#main').show(); */
    						window.location.href='${pageContext.request.contextPath}/business/searchCost.do'
    					} else if (result == "alreadyExit")
    						alert("此业务账号已存在！")
    				}
	    	    })
	    	  }
	    		
	    	})
	    })
	//修改
	function modi(b_id) {
		$('#dg').datagrid('selectRecord',b_id);
		var row = $('#dg').datagrid('getSelected');
		$('#b_id').val(b_id);
		$('#osuser').val(row.b_osusername);
		
		$('#main').hide();
		$('#add').show();
		$("#d1").hide();
		$("#d2").hide();
		$("#d6").hide();
		$("#d7").hide();
		$("#d3").show();
		$("#d4").show();
		$("#d5").show();
		$("#d8").show();
		$("#osuser").attr("disabled",true);
	}
	    //修改
	function modify() {
		var cost_name = $("#cc").val();
		var b_id =$("#b_id").val();
		var b_osusername =$('#osuser').val();
		//alert(b_id+b_osusername);
		$.ajax({
			url : '${pageContext.request.contextPath}/business/updateInfo.do',
			data : {"b_id":b_id,"b_osusername":b_osusername,"cost_name":cost_name},
			type : "post",
			success : function(result) {
				if (result == "success"){
				 	$("#save_result_info").removeClass("save_fail");
					$("#save_result_info").addClass("save_success");
					$("#save_result_info").html("修改成功！"); 
					showResult()
				}else if (result == "fail"){
				   $("#save_result_info").removeClass("save_success");
				   $("#save_result_info").addClass("save_fail");
				   $("#save_result_info").html("修改失败！");
				   showResult()
				}
			}
		})
			
	}
	 //保存成功的提示信息
    function showResult() {
        showResultDiv(true);
        window.setTimeout("showResultDiv(false);", 2000);
    }
    function showResultDiv(flag) {
        var divResult = document.getElementById("save_result_info");
        if (flag)
            divResult.style.display = "block";
        else{
            divResult.style.display = "none";
           window.location.href='${pageContext.request.contextPath}/business/searchCost.do';
        } 
    }
</script>
</head>
<body>
	<!--Logo区域开始-->
	<%@ include file="../include/Logo.jsp"%>
	<!--Logo区域结束-->
	<!--导航区域开始-->
	<%@ include file="../include/menu.jsp"%>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
		<form id="form">
	   
			<!--查询-->
			<div class="search_add">
				<div>
					OS 账号：<input type="text" id="b_osusername" name="b_osusername"
						class="width100 text_search" />
				</div>
				<!--  <div>服务器 IP：<input type="text"  class="width100 text_search" /></div> -->
				<div>
					身份证：<input type="text" name="c_idcard" id="c_idcard"
						class="text_search" />
				</div>
				<div>
					状态： <select class="select_search" id="b_state" name="b_state">
						<option>全部</option>
						<option>开通</option>
						<option>暂停</option>
						<option>删除</option>
					</select>
				</div>
				<div>
					<input type="button" value="搜索" class="btn_search"
						onclick="doSearch()" />
					<input type="button" value="搜索所有" class="btn_search"
						onclick="location.href='${pageContext.request.contextPath}/business/searchCost.do';" />
				</div>
				<input type="button" value="增加" class="btn_add"
					onclick="addBusiness()" />
			</div>
		</form>
		<div id="operate_result_info" class="operate_success">
			<img src="../images/close.png"
				onclick="this.parentNode.style.display='none';" />删除成功！
		</div>

		<!--数据区域：用表格展示数据-->
		<div id="data">
			<table id="dg" class="easyui-datagrid">
				<thead>
					<tr>
						<th field="b_id" sortable="true" width="80"
							formatter="formatDetail">业务ID</th>
						<th field="c_id" sortable="true" width="80">财务账户ID</th>
						<th field="c_idcard" width="175" formatter="formatId">身份证号</th>
						<th field="c_name" width="90" formatter="formatName">姓名</th>
						<th field="b_osusername" width="70">OS账号</th>
						<th field="b_state" sortable="true" width="70"
							formatter="formatState">状态</th>
						<th field="cost_name" width="150" formatter="formatCname">资费名</th>
						<th field="operate" width="200" formatter="formatOperate">操作</th>
					</tr>
				</thead>
			</table>
			<!--主要区域结束-->

			<p>
				业务说明：<br /> 1、创建即开通，记载创建时间；<br /> 2、暂停后，记载暂停时间；<br />
				3、重新开通后，删除暂停时间；<br /> 4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
				5、业务账号不设计修改密码功能，由用户自服务功能实现；<br /> 6、暂停和删除状态的账务账号下属的业务账号不能被开通。
			</p>
		</div>
	</div>
	<!-- 详单界面  -->
	<div id="detail" hidden>
		<form id="det" method="post" class="main_form">
			<!--必填项-->
			<div class="text_info clearfix">
				<span>业务账号ID：</span>
			</div>
			<div class="input_info">
				<input type="text" name="b_id" readonly class="readonly" />
			</div>
			<div class="text_info clearfix">
				<span>账务账号ID：</span>
			</div>
			<div class="input_info">
				<input type="text" name="c_id" readonly class="readonly" />
			</div>
			<div class="text_info clearfix">
				<span>客户姓名：</span>
			</div>
			<div class="input_info">
				<input type="text" id="d_name" name="c_name"
					value='row.customer.c_name' readonly value="" class="readonly" />
			</div>
			<div class="text_info clearfix">
				<span>身份证号码：</span>
			</div>
			<div class="input_info">
				<input type="text" id="d_idcard" name="c_idcard" readonly
					class="readonly" />
			</div>
			<div class="text_info clearfix">
				<span>OS 账号：</span>
			</div>
			<div class="input_info">
				<input type="text" name="b_osusername" readonly class="readonly" />
			</div>
			<div class="text_info clearfix">
				<span>状态：</span>
			</div>
			<div class="input_info">
				<select disabled id="d_state" name="b_state">
					<option value='0'>开通</option>
					<option value='1'>暂停</option>
					<option value='2'>删除</option>
				</select>
			</div>
			<div class="text_info clearfix">
				<span>状态时间：</span>
			</div>
			<div class="input_info">
				<input type="text" id="d_statetime" readonly class="readonly" />
			</div>
			<div class="text_info clearfix">
				<span>资费 ID：</span>
			</div>
			<div class="input_info">
				<input type="text" name="cost_id" class="readonly" readonly />
			</div>
			<div class="text_info clearfix">
				<span>资费名称：</span>
			</div>
			<div class="input_info">
				<input type="text" id="d_costname" name="cost_name" readonly
					class="width200 readonly" />
			</div>
			<div class="text_info clearfix">
				<span>资费说明：</span>
			</div>
			<div class="input_info_high">
				<textarea class="width300 height70 readonly" id="d_costinstruction"
					name="cost_instruction" readonly></textarea>
			</div>
			<!--操作按钮-->
			<div class="button_info clearfix">
				<input type="button" value="返回" class="btn_save"
					onclick="location.href='${pageContext.request.contextPath}/view/businessShow.do';" />
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<!--增加-->
	<div id="add" hidden>
		<!--保存操作的提示信息-->
		 <div id="save_result_info" class="save_success">修改成功！</div>
		<form id="addform" class="main_form">
			<!--内容项-->
			<div id="d1">
				<div class="text_info clearfix">
					<span>身份证：</span>
				</div>
				<div class="input_info">
					<input type="text" id="a_idcard" name="c_idcard" /> <input
						type="button" value="查询账务账号" class="btn_search_large"
						onclick="serachBuss()" /> <span class="required">*</span>
					<div class="validate_msg_short" id="ae_idcard">请输入身份证号！</div>
				</div>
			</div>
			<div id="d2">
				<div class="text_info clearfix">
					<span>账务账号：</span>
				</div>
				<div class="input_info">
					<input type="text" id="a_username" name="c_username" /> <span
						class="required">*</span>
					<div class="validate_msg_long" id="ae_username">请输入你的账务账号</div>
				</div>
			</div>
			<div id="d3" hidden>
				<div class="text_info clearfix">
					<span>业务账号ID：</span>
				</div>
				<div class="input_info">
					<input type="text" name="b_id" id="b_id" readonly class="readonly" />
				</div>
			</div>
			<div id="d5">
				<div class="text_info clearfix">
					<span>登录 OS 账号：</span>
				</div>
				<div class="input_info">
					<input type="text" id="osuser" name="b_osusername" /> <span
						class="required">*</span>
					<div class="validate_msg_long" id="ae_osuser">请输入OS账号</div>
				</div>
			</div>
			<div id="d4">
				<div class="text_info clearfix">
					<span>资费名称：</span>
				</div>
				<div class="input_info">
                    <select class="width150" id="cc" name="cost_name">
                      <c:forEach items="${costname}" var="costnames" varStatus="status">
                         <option >${costnames.cost_name} </option>
                     </c:forEach>
                    </select>
                    <div class="validate_msg_long">请修改资费类型，或者取消修改操作。</div>                      
                </div>
			</div>
			<div id="d6">
				<div class="text_info clearfix">
					<span>密码：</span>
				</div>
				<div class="input_info">
					<input type="password" id="psw" name="b_ospassword" /> <span
						class="required">*</span>
					<div class="validate_msg_long" id="ae_psw">请输入密码</div>
				</div>
				<div class="text_info clearfix">
					<span>重复密码：</span>
				</div>
				<div class="input_info">
					<input type="password" id="rpsw" name="r_ospassword" /> <span
						class="required">*</span>
					<div class="validate_msg_long" id="ae_rpsw">请再次输入密码</div>
				</div>
			</div>
			<!--操作按钮-->
			<div id="d7" class="button_info clearfix">
				<input type="button" value="保存" class="btn_save" id="addbuss" onclick=" return saveBusiness();" />
			    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/business/searchCost.do'" />
			</div>
			<div id="d8" hidden class="button_info clearfix">
				<input type="button" value="保存" class="btn_save" onclick="modify();" />
				<input type="button" value="取消" class="btn_save"
					onclick="location.href='${pageContext.request.contextPath}/business/searchCost.do'" />
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>
