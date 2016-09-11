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
        <script  language="javascript" type="text/javascript">
      
               function enter(){
        			var a_username = $("#a_username").val();
        			var a_password  = $("#a_password").val();
        			var a=b=true;
        			cname.innerHTML="";
        			cpsw.innerHTML="";
        			if (a_username == ""|| a_username.length >20) {
    					cname.innerHTML="登录名不能为空或长度不能大于20！";
    					a=false;
        			}
    				if (a_password == ""|| a_password.length >20) {
    					cpsw.innerHTML="密码不能为空或密码长度不能大于20！";
    					b=false
    				}
    				if(a&b){
    					$("#form").submit();
    				}
               }     
        	  
        	
        </script>
    </head>
    <body class="index">
        <div class="login_box">
        <form  id="form" action="${pageContext.request.contextPath}/admin/xy.do" method="post" >
            <div align="center" style="color: green" ><font id="errorInfo" >${errorInfo}</font></div>
            <table>
                <tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2"><input name="a_username" type="text" class="width150" id="a_username" value ="${a_username}"/></td>
                    <td class="login_error_info"><span class="required" id="cname"></span></td>
                </tr>
                <tr>
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input name="a_password" type="password" class="width150" id="a_password" value="${a_password}" onkeydown="javascript:if(event.keyCode==13)enter();"/></td>
                    <td><span class="required" id="cpsw"></span></td>
                </tr> 
                <tr>
                    <td></td>
                    <td class="login_button" colspan="2">
                       <input type="button" name ="sub" value = "提交" class="btn_save" onclick="enter()"></input>  
                    </td>    
                    <td><span class="required"></span></td>                
                </tr>
            </table>
			</form>
		</div>
	</body>
</html>