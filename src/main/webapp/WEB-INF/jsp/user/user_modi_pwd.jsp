<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />        
        <script type="text/javascript" src = "<%=request.getContextPath()%>/jquery/jquery-2.0.0.js"></script>
   		<script language="javascript" type="text/javascript">
   		function checks(){
    		var oldPsw = $("#oldPsw").val();
    		var newPsw = $("#newPsw").val();
    		var reNewPsw = $("#reNewPsw").val();
    		var reg_newPsw = /^\w+$/

    		if(oldPsw==null ||oldPsw==""){
    			$("#e_oldPsw").addClass("validate_msg_long error_msg")
    			$("#e_oldPsw").html("旧密码不能为空！");
    			 return false;
    		}
    		$("#e_oldPsw").html("")
    		if(newPsw==null ||newPsw==""){
    			$("#e_newPsw").addClass("validate_msg_long error_msg")
    			$("#e_newPsw").html("新密码不能为空！");
    			return false;
    		}else if(reg_newPsw.test(newPsw)==false){
   				$("#e_newPsw").addClass("validate_msg_long error_msg")
   				$("#e_newPsw").html("你输入的密码格式错误！！");
   				return false;
    			}
    		 $("#e_newPsw").html("")
    		if(reNewPsw==null ||reNewPsw==""){
    			$("#e_reNewPsw").addClass("validate_msg_long error_msg")
    			$("#e_reNewPsw").html("重复密码不能为空！");
    			return false;
    		}
    		 $("#e_reNewPsw").html("")
    		return true
   		}
   		
   		$(function(){
        	$("#save").click(function(){
        		if(checks()==true){
  			 	$.ajax({
    				url:'${pageContext.request.contextPath}/admin/updatePsw.do',
        			data:$("#form").serialize(),
        			type:"post",
        			success:function(result){
        				if(result=="pswUnlike"){
        					$("#e_oldPsw").addClass("validate_msg_long error_msg")
                			$("#e_oldPsw").html("你输入的旧密码有误！");
        				}
        				if(result=="rePswnulike"){
        					$("#e_reNewPsw").addClass("validate_msg_long error_msg")
                			$("#e_reNewPsw").html("两次密码不一样，请重新输入！");
        				}
        				if(result=="updateSuccess"){
        					showResult()
        				}
        				if(result=="error"){
        					alert("修改密码失败，请检查你的网络是否连接！！！")
        				}	
        			}
        		 }) 
        		}
        	})
        }) 
            //保存成功的提示信息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 2000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag){
                    divResult.style.display = "block";
                }else{
                    divResult.style.display = "none";
                window.location.href='${pageContext.request.contextPath}/view/login.do';
               } 
            }
        </script>
    </head>
    <body>
       <!--Logo区域开始-->
		<%@ include file="../include/Logo.jsp" %>
		<!--Logo区域结束-->
        <!--导航区域开始-->
		<%@ include file="../include/menu.jsp" %>
		<input id="indexs" value="pswmodi" hidden/>
        <!--导航区域结束-->
        <div id="main">      
            <!--保存操作后的提示信息：成功或者失败-->      
            <div id="save_result_info" class="save_success">修改密码成功，即将跳转到登陆界面！</div><!--保存失败，旧密码错误！-->
            <form  class="main_form" id="form">
                <div class="text_info clearfix"><span>旧密码：</span></div>
                <div class="input_info">
                    <input type="password" class="width200" id="oldPsw" name="oldPsw" /><span class="required">*</span>
                    <div class="validate_msg_medium" id="e_oldPsw">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>新密码：</span></div>
                <div class="input_info">
                    <input type="password" name="newPsw" class="width200" id="newPsw"/><span class="required">*</span>
                    <div class="validate_msg_medium" id="e_newPsw">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复新密码：</span></div>
                <div class="input_info">
                    <input type="password" class="width200" id="reNewPsw" name="reNewPsw" /><span class="required">*</span>
                    <div class="validate_msg_medium" id="e_reNewPsw">两次新密码必须相同</div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save"  onclick="checks()" id="save"/>
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
