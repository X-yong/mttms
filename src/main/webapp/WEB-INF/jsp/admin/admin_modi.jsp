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
        $(function(){
        	<%--设置chockbox选中   --%>
            var authority = ${resultAdminInfo.a_authority}+""
            var authoritys =document.getElementsByName("a_authoritys")
            for(var i=1;i<=7;i++){
            	if(authority.indexOf(i+2+"") !=-1){
            		authoritys[i-1].checked=true;
            	}
            }       	
        }) 
        function checks(){
        		var name = $("#name").val();
        		var phone = $("#phone").val();
        		var email = $("#email").val();
        		var a_authority=$("input[name='a_authoritys']:checked").length;
        		var reg_name= /^[\u4E00-\u9FA5]{0,20}/;
        		var reg_phone = /^1[3|4|5|7|8]\d{9}$/;
        		var reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/; 
        	  
        		if(name==null ||name==""){
        			$("#e_name").addClass("validate_msg_long error_msg")
        			$("#e_name").html("姓名不能为空！");
        		    return false;
        		}else if(reg_name.test(name)==false){
        				$("#e_name").addClass("validate_msg_long error_msg")
        				$("#e_name").html("你输入的姓名格式错误！！");
        				return false;
        			}
        	    $("#e_name").html("")
        		if(phone==null ||phone==""){
        			$("#e_phone").addClass("validate_msg_long error_msg")
        			$("#e_phone").html("电话号码不能为空！");
        			return false;
        		}else if(reg_phone.test(phone)==false){
        				$("#e_phone").addClass("validate_msg_long error_msg")
        				$("#e_phone").html("你输入的电话号码格式错误！！");
        				return false;
        			}
        		    $("#e_phone").html("")
        		if(email==null ||email==""){
        			$("#e_email").addClass("validate_msg_long error_msg")
        			$("#e_email").html("电子邮件不能为空！");
        			return false;
        		}else if(reg_email.test(email)==false){
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
        $(function(){
        	$("#save").click(function(){
        		if(checks()==true){
        			$.ajax({
        				url:'${pageContext.request.contextPath}/admin/updateAdminSaves.do',
            			data:$("#form").serialize(),
            			type:"post",
            			success:function(result){
            				if(result =="success"){
            					showResult()
            				}else{alert("修改信息失败！！！")}
            			}
            		 }) 
        		}
        		
        	})
        })
        //保存成功的提示消息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else{
                	divResult.style.display = "none";
                	window.location.href='${pageContext.request.contextPath}/admin/adminInfo.do'
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
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            
            <form id="form" class="main_form">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" id="name" name="a_name" value="${resultAdminInfo.a_name}" />
                        <span class="required">*</span>
                        <div class="validate_msg_long" id="e_name">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${resultAdminInfo.a_username}"  /></div>
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" id="phone" name="a_phone" value="${resultAdminInfo.a_phone}"  />
                        <span class="required">*</span>
                        <div class="validate_msg_long " id="e_phone">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" id="email" name="a_email" value="${resultAdminInfo.a_email}"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium " id="e_email">50长度以内，正确的 email 格式</div>
                    </div>
                    <div class="text_info clearfix"><span>权限：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
                                <!-- <li><input type="checkbox" name="a_authoritys" value = "角色管理"/>角色管理</li> -->
                               <!--  <li><input type="checkbox" name="a_authoritys" value = "管理员管理"/>管理员管理</li> -->
                                <li><input type="checkbox" name="a_authoritys" value = "资费管理"/>资费管理</li>
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
                        <input type="button" value="保存" class="btn_save" id="save" onclick="return checks()" />
                        <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/admin/adminInfo.do'"/>
                    </div>
                </form>  
               
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
