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
           var c_name = $("#c_name").val()
           var c_phone = $("#c_phone").val()
           var c_otherid=$("#c_otherid").val()
           var c_idcard = $("#c_idcard").val()
           var c_email = $("#c_email").val()
           var c_address = $("#c_address").val()
           var c_postcode = $("#c_postcode").val()
           var c_qq = $("#c_qq").val()
           var n_password = $("#n_password").val()
           var reg_name = /^[a-zA-Z\d\_\u2E80-\u9FFF]{1,20}$/
           var reg_password = /^[a-zA-Z\d\_]{1,30}$/
           var reg_otherid=/(^\d{15}$)|(^\d{17}(\d|X)$)/
		   var reg_phone =/(^(\d{3,4}-)?\d{7,8})$|(13[0-9]{9})/  
		   var reg_email = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/
		   var reg_number = /^[1-9]\d{5}(?!\d)$/
		   var reg_qq = /^[1-9][0-9]{5,13}$/ 
		   var reg_address = /^[a-zA-Z\d\u2E80-\u9FFF]{1,30}$/
		     if(c_name ==null||c_name==""){
	        		$("#e_name").addClass("validate_msg_long error_msg")
	      			$("#e_name").html("姓名不能为空！");
	        		return false
	        	  }	else if(reg_name.test(c_name)==false){
	        		$("#e_name").addClass("validate_msg_long error_msg")
	        	    $("#e_name").html("姓名格式错误！");
	        		   return false
	        	  }
	              $("#e_name").html("");
	              if(n_password !=null && n_password !=""){
		        	 if(reg_password.test(n_password)==false){
		        		$("#e_newPassword").addClass("validate_msg_long error_msg")
		        	    $("#e_newPassword").html("密码格式错误！");
		        		   return false
		        	  }
	              }
		              $("#e_newPassword").html("");
	              if(c_phone==null||c_phone==""){
		                $("#e_phone").addClass("validate_msg_long error_msg")
		              	$("#e_phone").html("电话不能为空！");
		              	   return false
		           }else if(reg_phone.test(c_phone)==false){
		                $("#e_phone").addClass("validate_msg_long error_msg")
		                $("#e_phone").html("电话格式错误！");
		                    return false
		           }
		        	  $("#e_phone").html("");
	              if(c_otherid ==null||c_otherid==""){
	          		    $("#e_otherid").addClass("validate_msg_long error_msg")
	        		    $("#e_otherid").html("推荐人身份证号不能为空！");
	        		   return false
	          	  }else if(reg_otherid.test(c_otherid)==false){
	          		    $("#e_otherid").addClass("validate_msg_long error_msg")
	          	        $("#e_otherid").html("推荐人身份证号格式错误！");
	          		   return false
	          	  }
	        	  $("#e_otherid").html("");
	        	  if(c_email ==null||c_email==""){
	          		    $("#e_email").addClass("validate_msg_long error_msg")
	        		    $("#e_email").html("电子邮件不能为空！");
	        		   return false
	          	  }else if(reg_email.test(c_email)==false){
	          		    $("#e_email").addClass("validate_msg_long error_msg")
	          	        $("#e_email").html("电子邮件格式错误！");
	          		   return false
	          	  }
	        	  $("#e_email").html("");
	        	  if(c_address ==null||c_address==""){
	          		    $("#e_address").addClass("validate_msg_long error_msg")
	        		    $("#e_address").html("地址不能为空！");
	        		   return false
	          	  }else if(reg_address.test(c_address)==false){
	          		    $("#e_address").addClass("validate_msg_long error_msg")
	          	        $("#e_address").html("地址格式错误！");
	          		   return false
	          	  }
	        	  $("#e_address").html("");
	        	  if(c_postcode ==null||c_postcode==""){
	          		    $("#e_postcode").addClass("validate_msg_long error_msg")
	        		    $("#e_postcode").html("邮编不能为空！");
	        		   return false
	          	  }else if(reg_number.test(c_postcode)==false){
	          		    $("#e_postcode").addClass("validate_msg_long error_msg")
	          	        $("#e_postcode").html("邮编格式错误！");
	          		   return false
	          	  }
	        	  $("#e_postcode").html("");
	        	  if(c_qq ==null||c_qq==""){
	          		    $("#e_qq").addClass("validate_msg_long error_msg")
	        		    $("#e_qq").html("qq不能为空！");
	        		   return false
	          	  }else if(reg_qq.test(c_qq)==false){
	          		    $("#e_qq").addClass("validate_msg_long error_msg")
	          	        $("#e_qq").html("qq格式错误！");
	          		   return false
	          	  }
	        	  $("#e_qq").html("");
	        	  
	        	  
	        	  	  return true
        }
        //显示修改密码的信息项
            function showPwd(chkObj) {
                if (chkObj.checked)
                    document.getElementById("divPwds").style.display = "block";
                else
                    document.getElementById("divPwds").style.display = "none";
            }
            $(function(){
            	$("#c_work").val('${resultByCid.c_work }');
            	$("input[type='radio']").val(['${resultByCid.c_sex }']).checked="checked";
            }) 
            $(function(){
            	$("#save").click(function(){
            		if(checks()==true){
            			$.ajax({
         					url :'${pageContext.request.contextPath}/customer/updateCustomer.do' ,
         					data: $("form").serialize(),
         					type: "post"  ,
         					success:function(result){
         						if(result=="success"){
         							$("#save_result_info").addClass("save_success");
         							$("#save_result_info").html("修改成功！")
         							showResult()
         						}else if(result=="pswne"){
         							$("#e_oldpassword").addClass("validate_msg_long error_msg")
         							$("#e_oldpassword").html("旧密码不相等！")
         						}else if(result=="repswne"){
         							$("#e_repassword").addClass("validate_msg_long error_msg")
         							$("#e_repassword").html("两次密码必须相同！！")
         						}else {
         							$("#save_result_info").addClass("save_fail");
        							$("#save_result_info").html("修改失败！")
        							showResult()
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
                if (flag)
                    divResult.style.display = "block";
                else{
                    divResult.style.display = "none";
				    window.location.href='${pageContext.request.contextPath}/customer/searchAllInfo.do'
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
            <!--保存成功或者失败的提示消息-->          
            <div id="save_result_info" class="save_success">操作成功！</div>
            <form  class="main_form">
                    <!--必填项-->
                    <div class="text_info clearfix"><span>账务账号ID：</span></div>
                    <div class="input_info">
                        <input type="text" value="${resultByCid.c_id }" name="c_id" readonly="readonly" class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" value="${resultByCid.c_name }" id="c_name" name="c_name"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long " id="e_name">20长度以内的汉字、字母和数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>身份证：</span></div>
                    <div class="input_info">
                        <input type="text" name="idcard"  value="${resultByCid.c_idcard }" readonly="readonly" class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>登录账号：</span></div>
                    <div class="input_info">
                        <input type="text" value="${resultByCid.c_username }" name="c_username" readonly="readonly" class="readonly"  />                        
                        <div class="change_pwd">
                            <input id="chkModiPwd" type="checkbox" onclick="showPwd(this);" />
                            <label for="chkModiPwd">修改密码</label>
                        </div>
                    </div>
                    <!--修改密码部分-->
                    <div id="divPwds">
                        <div class="text_info clearfix" ><span>旧密码：</span></div>
                        <div class="input_info">
                            <input type="password" name="o_password" id="o_password" onblur="checkOld()" />
                            <span class="required">*</span>
                            <div class="validate_msg_long" id="e_oldpassword">30长度以内的字母、数字和下划线的组合</div>
                        </div>
                        <div class="text_info clearfix"><span>新密码：</span></div>
                        <div class="input_info">
                            <input type="password" name="c2_password" id="n_password"/>
                            <span class="required">*</span>
                            <div class="validate_msg_long" id="e_newPassword">30长度以内的字母、数字和下划线的组合</div>
                        </div>
                        <div class="text_info clearfix"><span>重复新密码：</span></div>
                        <div class="input_info">
                            <input type="password" name="r_password" id="r_password" onblur="checkRe()"/>
                            <span class="required">*</span>
                            <div class="validate_msg_long" id="e_repassword">两次密码必须相同</div>
                        </div>  
                    </div>                   
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" id="c_phone" value="${resultByCid.c_phone }" name="c_phone"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium " id="e_phone">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input type="text" name="c_otherid" id="c_otherid" value="${resultByCid.c_otherid }"/>
                        <div class="validate_msg_long " id="e_otherid">正确的身份证号码格式</div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input type="text" value="${brith}" name="brith"  readonly="readonly" class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" id="c_email" value="${resultByCid.c_email }" name="c_email" />
                        <div class="validate_msg_medium" id="e_email">50长度以内，合法的 Email 格式</div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                        <select name="c_work" id="c_work">
                            <option value="干部">干部</option>
                            <option value="学生">学生</option>
                            <option value="技术人员">技术人员</option>
                            <option value="其他">其他</option>
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info fee_type">
                        <input type="radio" name="c_sex" id="female" value='2' />
                        <label for="female">女</label>
                        <input type="radio" name="c_sex" id="male" value='1'  />
                        <label for="male">男</label>
                    </div> 
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text" class="width350" id ="c_address" value="${resultByCid.c_address }" name="c_address"/>
                        <div class="validate_msg_tiny" id="e_address">50长度以内</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input type="text" name="c_postcode" id="c_postcode" value="${resultByCid.c_postcode }"/>
                        <div class="validate_msg_long" id="e_postcode">6位数字</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input id="c_qq" type="text" name="c_qq" value="${resultByCid.c_qq }"/>
                        <div class="validate_msg_long" id="e_qq">5到13位数字</div>
                    </div>                
                    <!--操作按钮-->
                    <div class="button_info clearfix">
                        <input type="button" value="保存" class="btn_save"  id="save" onclick="return checks();" />
                        <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/customer/searchAllInfo.do'" />
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
