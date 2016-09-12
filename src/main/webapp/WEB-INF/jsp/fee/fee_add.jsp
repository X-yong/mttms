<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" media="all"
	href="../styles/global.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="../styles/global_color.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.0.0.js"></script>
<script language="javascript" type="text/javascript">
	function check() {
		var cost_name = $("#cost_name").val()
		var cost_basetime = $("#cost_basetime").val()
		var cost_basemoney = $("#cost_basemoney").val()
		var cost_singlemoney = $("#cost_singlemoney").val()
		var cost_instruction = $("#cost_instruction").val()
		var reg_name = /^[a-zA-Z\d\_\u2E80-\u9FFF]{1,50}$/
		var reg_basetime = /^([1-5]\d{0,2}|600)$/
		var reg_basemoney = /^\d{1,5}(\.\d{1,2})?$/
		var reg_singlemoney = /^([1-5]\d{0,2}|600)$/
		var reg_instruction =  /^[a-zA-Z0-9_\u4e00-\u9fa5]{1,100}$/
		var type = $("input[name='cost_type']:checked").val()
		
		if (cost_name == null || cost_name == "") {
			$("#name").addClass("validate_msg_long error_msg")
			$("#name").html("姓名不能为空！");
			return false
		}else if(reg_name.test(cost_name)==false){
			$("#name").addClass("validate_msg_long error_msg")
			$("#name").html("姓名格式错误！");
			return false
		}
		if(type=='0'){
			if (cost_basemoney == null || cost_basemoney == "") {
				$("#basemoney").addClass("validate_msg_long error_msg")
				$("#basemoney").html("基本费用不能为空！");
				return false
			}else if(reg_basemoney.test(cost_basemoney)==false){
				$("#basemoney").addClass("validate_msg_long error_msg")
				$("#basemoney").html("请输入0到99999.99之间的数！");
				return false
			}		
		}else if(type=='1'){
			if (cost_basetime == null || cost_basetime == "") {
				$("#basemtime").addClass("validate_msg_long error_msg")
				$("#basemtime").html("基本时长不能为空！");
				return false
			}else if(reg_basemoney.test(cost_basetime)==false){
				$("#basemtime").addClass("validate_msg_long error_msg")
				$("#basemtime").html("请输入1到600之间的整数！");
				return false
			}
			if (cost_basemoney == null || cost_basemoney == "") {
				$("#basemmoney").addClass("validate_msg_long error_msg")
				$("#basemmoney").html("基本费用不能为空！");
				return false
			}else if(reg_basemoney.test(cost_basemoney)==false){
				$("#basemmoney").addClass("validate_msg_long error_msg")
				$("#basemmoney").html("请输入0到99999.99之间的值！");
				return false
			}
			if (cost_singlemoney == null || cost_singlemoney == "") {
				$("#singlemoney").addClass("validate_msg_long error_msg")
				$("#singlemoney").html("单位费用不能为空！");
				return false
			}else if(reg_singlemoney.test(cost_singleoney)==false){
				$("#singlemoney").addClass("validate_msg_long error_msg")
				$("#singlemoney").html("请输入0到99999.99之间的值！");
				return false
			}	
		}else if(type=='2'){
			
			if (cost_singlemoney == null || cost_singlemoney == "") {
				$("#singlemoney").addClass("validate_msg_long error_msg")
				$("#singlemoney").html("单位费用不能为空！");
				return false
			}else if(reg_singlemoney.test(cost_singlemoney)==false){
				$("#singlemoney").addClass("validate_msg_long error_msg")
				$("#singlemoney").html("请输入0到99999.99之间的值！");
				return false
			}		
		}
		if (cost_instruction == null || cost_instruction == "") {
			alert("adada")
			$("#instruction").addClass("validate_msg_long error_msg")
			$("#instruction").html("请填写100字以内的资费说明！");
			return false
		}else if(reg_instruction.test(cost_instruction)==false){
			$("#instruction").addClass("validate_msg_long error_msg")
			$("#instruction").html("填写100长度的数字，字母，下划线的组合！");
			return false
		}
		return true
	}
		$(function() {
			$("#save").click(function(){
				if (check() == true) {
					$.ajax({
						url : '${pageContext.request.contextPath}/cost/addCost.do',
						data : $("#form").serialize(),
						type : "post",
						success : function(result) {
							if (result == "success") {
								$("#save_result_info").removeClass()
								$("#save_result_info").addClass("save_success")
								$("#f1").html("保存成功！")
								shouMessage()
							} else if (result == "alreadyExist") {
								$("#save_result_info").addClass("save_fail")
								$("#f1").html("当前资费已存在，请输入其他的资费名！")
								shouMessage()
							}
						}
					})

				}
				
			})
			
		})
	
	//保存结果的提示
	function shouMessage() {
		showResultDiv(true);
		window.setTimeout("showResultDiv(false);", 2000);
	}
	function showResultDiv(flag) {
		var divResult = document.getElementById("save_result_info");
		if (flag)
			divResult.style.display = "block";
		else{
			divResult.style.display = "none";
			window.location.href="${pageContext.request.contextPath}/cost/costInfo.do";
		}
	}
	//切换资费类型
	function feeTypeChange(type) {
		var inputArray = document.getElementById("main").getElementsByTagName(
				"input");
		if (type == 1) {
			inputArray[4].disabled = true;
			inputArray[4].value = "";
			inputArray[4].className += " readonly";
			inputArray[5].disabled = false;
			inputArray[5].className = "width100";
			inputArray[6].disabled = true;
			inputArray[6].className += " readonly";
			inputArray[6].value = "";
		} else if (type == 2) {
			inputArray[4].disabled = false;
			inputArray[4].className = "width100";
			inputArray[5].disabled = false;
			inputArray[5].className = "width100";
			inputArray[6].disabled = false;
			inputArray[6].className = "width100";
		} else if (type == 3) {
			inputArray[4].disabled = true;
			inputArray[4].value = "";
			inputArray[4].className += " readonly";
			inputArray[5].disabled = true;
			inputArray[5].value = "";
			inputArray[5].className += " readonly";
			inputArray[6].disabled = false;
			inputArray[6].className = "width100";
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
		<div id="save_result_info" class="save_success">
			<font id="f1"></font>
		</div>
		<form id="form" class="main_form">
			<div class="text_info clearfix">
				<span>资费名称：</span>
			</div>
			<div class="input_info">
				<input type="text" class="width300" id="cost_name" name="cost_name" />
				<span class="required">*</span>
				<div class="validate_msg_short" id="name">50长度的字母、数字、汉字和下划线的组合</div>
			</div>
			<div class="text_info clearfix">
				<span>资费类型：</span>
			</div>
			<div class="input_info fee_type">
				<input type="radio" id="monthly" name="cost_type" value="0" checked="checked"
					onclick="feeTypeChange(1);" /> <label for="monthly">包月</label> <input
					type="radio"  name="cost_type" value="1"
					id="package" onclick="feeTypeChange(2);" /> <label for="package">套餐</label>
				<input type="radio" id="timeBased" name="cost_type" value="2"
					onclick="feeTypeChange(3);" /> <label for="timeBased">计时</label>
			</div>
			<div class="text_info clearfix">
				<span>基本时长：</span>
			</div>
			<div class="input_info">
				<input type="text" name="cost_basetime" id="cost_basetime"
					class="width100" /> <span class="info">小时</span> <span
					class="required">*</span>
				<div class="validate_msg_long" id="basetime">1-600之间的整数</div>
			</div>
			<div class="text_info clearfix">
				<span>基本费用：</span>
			</div>
			<div class="input_info">
				<input type="text" name="cost_basemoney" id="cost_basemoney"
					class="width100" /> <span class="info">元</span> <span
					class="required">*</span>
				<div class="validate_msg_long " id="basemoney">0-99999.99之间的数值</div>
			</div>
			<div class="text_info clearfix">
				<span>单位费用：</span>
			</div>
			<div class="input_info">
				<input type="text" name="cost_singlemoney" id="cost_singlemoney"
					class="width100" /> <span class="info">元/小时</span> <span
					class="required">*</span>
				<div class="validate_msg_long " id="singlemoney">0-99999.99之间的数值</div>
			</div>
			<div class="text_info clearfix">
				<span>资费说明：</span>
			</div>
			<div class="input_info_high">
				<textarea class="width300 height70" name="cost_instruction"
					id="cost_instruction"></textarea>
				<div class="validate_msg_short " id="instruction">100长度的字母、数字、汉字和下划线的组合</div>
			</div>
			<div class="button_info clearfix">
				<input type="button" value="保存" class="btn_save" id="save" onclick="return check()" /> 
				<input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/cost/costInfo.do'"/>
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>
