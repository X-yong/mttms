<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.0.0.js"></script>
        <script language="javascript" type="text/javascript">
 	function checks(){
 		var reg_name =/^[a-zA-Z\d\_\u2E80-\u9FFF]{1,20}$/
 		var reg =/^[a-zA-Z\d\_\u2E80-\u9FFF]{1,30}$/
 		var reg_password =/^[a-zA-Z\d\_\u2E80-\u9FFF]{6,30}$/
	    var reg_phone = /^1[3|4|5|7|8]\d{9}$/
      	var reg_email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
      	var a_name=$("#a_name").val()
      	var a_username=$("#a_username").val()
      	var a_password=$("#a_password").val()
      	var r_password=$("#r_password").val()
      	var a_phone=$("#a_phone").val()
      	var a_email=$("#a_email").val()
      	var a_authority=$("input[name='a_authoritys']:checked").length;
      	
	   if(a_name==null ||a_name==""){
  		   $("#e_name").addClass("validate_msg_long error_msg")
  		   $("#e_name").html("姓名不能为空！");
  		   return false;
  		} else if(reg_name.test(a_name)==false){
		   $("#e_name").addClass("validate_msg_long error_msg")
		   $("#e_name").html("你输入的姓名格式错误！！");
		   return false;
  	   }
      	$("#e_name").html("")
	  if(a_username==null ||a_username==""){
   		   $("#e_username").addClass("validate_msg_long error_msg")
   		   $("#e_username").html("管理员账号不能为空！");
   		   return false;
      }else if(reg.test(a_username)==false){
		   $("#e_username").addClass("validate_msg_long error_msg")
		   $("#e_username").html("你输入的管理员账号格式错误！！");
		   return false;
	  }
      	  $("#e_username").html("")
	 if(a_password==null ||a_password==""){
		  $("#e_password").addClass("validate_msg_long error_msg")
		  $("#e_password").html("密码不能为空！");
		  return false;
     }else if(reg_password.test(a_password)==false){
		  $("#e_password").addClass("validate_msg_long error_msg")
		  $("#e_password").html("你输入的密码格式错误！！");
		  return false;
  	 }
      	$("#e_password").html("")
	 if(r_password==null ||r_password==""){
		 $("#re_password").addClass("validate_msg_long error_msg")
		 $("#re_password").html("重复密码不能为空！");
		 return false;
     }
     if(a_password != r_password){
    	 $("#re_password").addClass("validate_msg_long error_msg")
		 $("#re_password").html("两次密码不相等！");
    	 return false;
     }	
      	$("#re_password").html("")
	 if(a_phone==null ||a_phone==""){
 		$("#e_phone").addClass("validate_msg_long error_msg")
 		$("#e_phone").html("电话号码不能为空！");
 		return false;
     }else if(reg_phone.test(a_phone)==false){
 		$("#e_phone").addClass("validate_msg_long error_msg")
 		$("#e_phone").html("你输入的电话号码格式错误！！");
 	    return false;
     }
      	$("#e_phone").html("")
	if(a_email==null ||a_email==""){
     	$("#e_email").addClass("validate_msg_long error_msg")
     	$("#e_email").html("电子邮件不能为空！");
     	return false;
     } else if(reg_email.test(a_email)==false){
 		$("#e_email").addClass("validate_msg_long error_msg")
 		$("#e_email").html("你输入的电子邮件格式错误！！");
 		return false;
     }
      	$("#e_email").html("")
	if(a_authority < 1){
		$("#e_authoritys").addClass("validate_msg_long error_msg")
    	$("#e_authoritys").html("请至少选择一个权限！！");
		return false;
     }
      	$("#e_authoritys").html("")
      	return true;
 	}
 		/* $(function(){
 		 $("#save").click(function (){
 			if(checks()==true){
 			  $.ajax({
				url:'${pageContext.request.contextPath}/admin/addAdminSave.do',
       			data:$("#form").serialize(),
       			type:"post",
				success:function(result){
					if(result =="success" ){
						showResult()	
					}else if(result=="aleryExit"){
						$("#e_username").addClass("validate_msg_long error_msg")
        				$("#e_username").html("此账号已经注册！！");
					}else if(result=="error"){
						alert("添加管理员失败！！！")
					}else if(result=="pswNotEqual"){
						$("#re_password").addClass("validate_msg_long error_msg")
   	        			$("#re_password").html("两次密码不相等！");
					}
				 } 	   	
         })      				
      }
   })
 	    
 }) */
          
            //保存成功的提示消息
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
                    window.location.href='${pageContext.request.contextPath}/admin/adminInfo.do';
                    }
                } 
            $(function(){
            	var message = '${message}'
            	if(message!=null && message !=""){
            		showResult();
            	}	
            })
            
        </script>
    </head>
    <body>
          <!--Logo区域开始-->
		<%@ include file="../include/Logo.jsp" %>
		<!--Logo区域结束-->
        <!--导航区域开始-->
		<%@ include file="../include/menu.jsp" %>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <div id="save_result_info" class="save_success">添加管理员成功！！</div>
            <form  id="form" class="main_form" onsubmit="return checks()" action="${pageContext.request.contextPath}/admin/addAdminSave.do" method="post" enctype="multipart/form-data">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text"  id = "a_name" value="${echo.a_name }" name="a_name" />
                        <span class="required">*</span>
                        <div class="validate_msg_long" id="e_name">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                        <input type="text" id = "a_username" value="${echo.a_username }" name="a_username"  />
                        <span class="required">*</span>
                        <div class="validate_msg_long" id="e_username">30长度以内的字母、数字和下划线的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                        <input type="password"  id = "a_password" name="a_password"  />
                        <span class="required">*</span>
                        <div class="validate_msg_long " id="e_password">6到30长度以内的字母、数字和下划线的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>重复密码：</span></div>
                    <div class="input_info">
                        <input type="password" id = "r_password" name="r_password"   />
                        <span class="required">*</span>
                        <div class="validate_msg_long " id="re_password">两次密码必须相同</div>
                    </div>      
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" id = "a_phone" name="a_phone" value="${echo.a_phone }" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium " id="e_phone">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" id = "a_email" name="a_email" value="${echo.a_email }" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium " id="e_email">50长度以内，正确的 email 格式</div>
                    </div>
                   <div class="text_info clearfix"><span>照片上传：</span></div>
                   <div class="input_info">
                   <input type="file" accept=".jpg,.png,.jpeg,.bmp" name ="file" /><br/>
                   </div>
                    <div class="text_info clearfix"><span>权限：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll"  >
                            <ul>
<!--                                 <li><input type="checkbox" name="a_authoritys" value = "角色管理"/>角色管理</li>
                                <li><input type="checkbox" name="a_authoritys" value = "管理员管理"/>管理员管理</li>
 -->                            <li><input type="checkbox" name="a_authoritys" value = "资费管理"/>资费管理</li>
                                <li><input type="checkbox" name="a_authoritys" value = "账务管理"/>账务管理</li>
                                <li><input type="checkbox" name="a_authoritys" value = "业务管理"/>业务管理</li>
                                <li><input type="checkbox" name="a_authoritys" value = "账单管理"/>账单管理</li>
                                <li><input type="checkbox" name="a_authoritys" value = "报表管理"/>报表管理</li>
                            </ul>
                        </div>
                        <span class="required">*</span>
                        <div class="validate_msg_tiny " id="e_authoritys">至少选择一个</div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="submit" value="保存" class="btn_save" id="save" />
                        <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/admin/adminInfo.do'"/>
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
