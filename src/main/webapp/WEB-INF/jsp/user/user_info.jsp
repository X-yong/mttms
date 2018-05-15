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
	    	var name = $("#name").val();
	   		var phone = $("#phone").val();
	   		var email = $("#email").val();
	   		var reg_name= /^[\u4E00-\u9FA5]{0,20}/
	   		var reg_phone = /^1[3|4|5|7|8]\d{9}$/
	        var reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/; 
	   		if(name==null ||name==""){
	   			$("#e_name").addClass("validate_msg_long error_msg")
	   			$("#e_name").html("姓名不能为空！");
	   			return false
	   		}else if(reg_name.test(name)==false){
				$("#e_name").addClass("validate_msg_long error_msg")
				$("#e_name").html("你输入的姓名格式错误！！");
				return false
	   			}
	   	        $("#e_name").html("")
	   		if(phone==null ||phone==""){
	   			$("#e_phone").addClass("validate_msg_long error_msg")
	   			$("#e_phone").html("电话号码不能为空！");
	   			return false
	   		}else if(reg_phone.test(phone)==false){
				$("#e_phone").addClass("validate_msg_long error_msg")
				$("#e_phone").html("你输入的电话号码格式错误！！");
				return false
	   			}
	   	        $("#e_phone").html("")
	   		if(email==null ||email==""){
	   			$("#e_email").addClass("validate_msg_long error_msg")
	   			$("#e_email").html("电子邮件不能为空！");
	   			return false
	   		}else if(reg_email.test(email)==false){
				$("#e_email").addClass("validate_msg_long error_msg")
				$("#e_email").html("你输入的电子邮件格式错误！！");
				return false
	   			}
	   	        $("#e_email").html("")
	   		return true;
    	   
       }    
        $(function(){
        	$("#save").click(function(){
        	if(checks()==true){
  			 	$.ajax({
    				url:'${pageContext.request.contextPath}/admin/updateInfo.do',
        			data:$("#form").serialize(),
        			type:"post",
        			success:function(result){
        				if(result !=null || result != ""){
        					showResult()
        				}else {alert("保存信息失败！！！")}
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
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            } 
        </script>
    </head>
    <body>
       <!--Logo区域开始-->
		<%@ include file="../include/Logo.jsp" %>
		<!--Logo区域结束-->
        <!--导航区域开始-->
		<%@ include file="../include/menu.jsp" %>
		<input id="indexs" value="userinfo" hidden/>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">信息保存成功,下次登录生效！</div><!--保存失败，数据并发错误！-->
            <form  id ="form" class="main_form">
                <div class="text_info clearfix"><span>管理员账号：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly"  name = "a_username"  value="${sessionScope.resultUserinfo.a_username}" /></div>
                <div class="text_info clearfix"><span>权限：</span></div>
                <div class="input_info">
                    <input type="text" readonly="readonly" class="readonly width400" name ="a_authority"  value="${sessionScope.resultUserinfo.a_authority}" />
                </div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input type="text" name = "a_name" id="name" value="${sessionScope.resultUserinfo.a_name}"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="e_name">20长度以内的汉字</div>
                </div>
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name = "a_phone" id="phone" value="${sessionScope.resultUserinfo.a_phone}" />
                   <span class="required">*</span>
                    <div class="validate_msg_medium" id="e_phone" >电话号码格式：手机或固话</div>
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name = "a_email" id="email" value="${sessionScope.resultUserinfo.a_email}" />
                   <span class="required">*</span>
                    <div class="validate_msg_medium" id="e_email">50长度以内，符合 email 格式</div>
                </div>
                 <div class="text_info clearfix"><span>用户图片：</span></div>
                  <div class="input_info">
                   <img src="<%=request.getContextPath()%>${adminInfo.a_photo}" alt="photo"/>
                </div>
                  <div class="text_info clearfix"><span>照片上传：</span></div>
                   <div class="input_info">
                   <input type="file" accept=".jpg,.png,.jpeg,.bmp" name ="file" /><br/>
                   </div>  
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" name ="a_createtime" value="${sessionScope.resultUserinfo.a_createtime}"/></div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="checks()" id = "save" />
                    <input type="reset" value="取消" class="btn_save" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
