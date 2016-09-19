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
          function check(){
        	  var c_name=$("#c_name").val()
        	  var c_idcard=$("#c_idcard").val()
        	  var c_username=$("#c_username").val()
        	  var c_password=$("#c_password").val()
        	  var r_password=$("#r_password").val()
        	  var c_phone=$("#c_phone").val()
        	  var c_otherid=$("#c_otherid").val()
        	  var c_email=$("#c_email").val()
        	  var c_address=$("#c_address").val()
        	  var c_postcode=$("#c_postcode").val()
        	  var c_qq=$("#c_qq").val()
        	  var reg_name = /^[a-zA-Z\d\_\u2E80-\u9FFF]{1,20}$/
        	  var reg_idcard=/(^\d{15}$)|(^\d{17}(\d|X)$)/
              var reg_username = /^[a-zA-Z\d\_\u2E80-\u9FFF]{1,30}$/
              var reg_password = /^[a-zA-Z\d\_\u2E80-\u9FFF]{1,30}$/
		      var reg_phone =/^(0\\d{2,3}-\\d{7,8}(-\\d{3,5}){0,1})|(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})$/
	          var reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/; 
              var reg_address = /^[a-zA-Z\d\_\u2E80-\u9FFF]{1,50}$/
		      var reg_postcode = /^\d{6}$/;
              var reg_qq = /^\d{5,13}$/;
              
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
        	  if(c_idcard ==null||c_idcard==""){
          		$("#e_idcard").addClass("validate_msg_long error_msg")
        		$("#e_idcard").html("身份证号不能为空！");
        		   return false
          	  }else if(reg_idcard.test(c_idcard)==false){
          		$("#e_idcard").addClass("validate_msg_long error_msg")
          	    $("#e_idcard").html("身份证号格式错误！");
          		   return false
          	  }
        	  $("#e_idcard").html("");
        	  if(c_username ==null||c_username==""){
            	$("#e_username").addClass("validate_msg_long error_msg")
          		$("#e_username").html("登录账号不能为空！");
          		   return false
               }else if(reg_username.test(c_username)==false){
            	$("#e_username").addClass("validate_msg_long error_msg")
            	$("#e_username").html("登录账号格式错误！");
                   return false
              }
        	  $("#e_username").html("");
        	  if(c_password ==null||c_password==""){
              	$("#e_password").addClass("validate_msg_long error_msg")
            	$("#e_password").html("密码不能为空！");
            	   return false
              }else if(reg_password.test(c_password)==false){
              	$("#e_password").addClass("validate_msg_long error_msg")
              	$("#e_password").html("密码格式错误！");
                   return false
              }
        	  $("#e_password").html("");
        	  if(c_phone==null||c_phone==""){
                $("#e_phone").addClass("validate_msg_long error_msg")
              	$("#e_phone").html("电话不能为空！");
              	   return false
              }else if(reg_password.test(c_password)==false){
                $("#e_phone").addClass("validate_msg_long error_msg")
                $("#e_phone").html("电话格式错误！");
                    return false
              }
        	  $("#e_phone").html("");
        	  if(c_otherid !=null||c_otherid !=""){
       		   if(reg_idcard.test(c_otherid)==false){
                     $("#e_otherid").addClass("validate_msg_long error_msg")
                     $("#e_otherid").html("身份证格式错误！");
                         return false
                   }
             	  $("#e_otherid").html(""); 
        	  }
        	  if(c_email !=null && c_email !=""){
          	   if(reg_email.test(c_email)==false){
                  $("#e_email").addClass("validate_msg_long error_msg")
                  $("#e_email").html("电子邮件格式错误！");
                      return false
                }
          	      $("#e_email").html("");
        	  }
        	 if(c_address !=null && c_address !=""){
          	  if(reg_address.test(c_address)==false){
                $("#e_address").addClass("validate_msg_long error_msg")
                $("#e_address").html("地址格式错误！");
                    return false
              }
        	    $("#e_address").html("");
        	 }
        	 if(c_postcode !=null && c_postcode !=""){
        	  if(reg_postcode.test(c_postcode)==false){
                  $("#e_postcode").addClass("validate_msg_long error_msg")
                  $("#e_postcode").html("邮编格式错误！");
                      return false
                }
          	      $("#e_postcode").html("");
        	 }
        	 if(c_qq !=null && c_qq  !=""){
          	  if(reg_qq.test(c_qq)==false){
                 $("#e_qq").addClass("validate_msg_long error_msg")
                 $("#e_qq").html("qq格式错误！");
                     return false
               }
         	     $("#e_qq").html("");    
        	 }
        	  $("#re_password").html("");
        	  	  return true
          }   
        
          $(function(){
        	  $("#save").click(function(){
        		  if(check()==true){ 
        		   $.ajax({
        			   url : '${pageContext.request.contextPath}/customer/addCustomer.do',
					   data : $("#form").serialize(),
					   type : "post",
					   success : function(result){
						   if(result=="success"){
							    $("#save_result_info").removeClass("save_fail");
							    $("#save_result_info").addClass("save_success")
       			        	    $("#save_result_info").html("添加成功！！")
       			        	     showResult()
						   } else if(result=="passwordError"){
							    $("#re_password").removeClass("save_success")
        			        	$("#re_password").addClass("save_fail")
								$("#re_password").html("两次密码不相同！")
        			        }else if(result=="alreadyExit"){
        			        	$("#save_result_info").removeClass("save_success")
        			        	$("#save_result_info").addClass("save_fail")
        			        	$("#save_result_info").html("此账户已存在！")
        			        	showResult()
        			        }else{
        			        	$("#save_result_info").removeClass("save_success")
        			        	$("#save_result_info").addClass("save_fail")
        			        	$("#save_result_info").html("添加账务账号失败！")
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
                else
                    divResult.style.display = "none";
            }

            //显示选填的信息项
            function showOptionalInfo(imgObj) {
                var div = document.getElementById("optionalInfo");
                if (div.className == "hide") {
                    div.className = "show";
                    imgObj.src = "../images/hide.png";
                }
                else {
                    div.className = "hide";
                    imgObj.src = "../images/show.png";
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
		<input id="indexs" value="account" hidden/>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">       
            <!--保存成功或者失败的提示消息-->     
            <div id="save_result_info" ></div>
            <form id="form" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input type="text" name="c_name" id="c_name" />
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="e_name">20长度以内的汉字、字母和数字的组合</div>
                </div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" name="c_idcard" id="c_idcard" />
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="e_idcard">正确的身份证号码格式</div>
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <input type="text" name="c_username"  id="c_username"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="e_username">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input type="password" name="c_password" id="c_password"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="e_password">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password" name="r_password" id="r_password" />
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="re_password">两次密码必须相同</div>
                </div>     
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" name="c_phone" id="c_phone" class="width200"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="e_phone">正确的电话号码格式：手机或固话</div>
                </div>                
                <!--可选项-->
                <div class="text_info clearfix"><span>可选项：</span></div>
                <div class="input_info">
                    <img src="../images/show.png" alt="展开" onclick="showOptionalInfo(this);" />
                </div>
                <div id="optionalInfo" class="hide">
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input type="text" name="c_otherid" id="c_otherid" />
                        <div class="validate_msg_long" id="e_otherid">正确的身份证号码格式</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" name="c_email" id="c_email" class="width350"  />
                        <div class="validate_msg_tiny" id="e_email">50长度以内，合法的 Email 格式</div>
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
                        <input type="radio" name="c_sex" value="2" checked="checked" id="female" />
                        <label for="female">女</label>
                        <input type="radio" name="c_sex" value="1" id="male" />
                        <label for="male">男</label>
                    </div> 
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text" name="c_address" id="c_adress" class="width350"/>
                        <div class="validate_msg_tiny" id="e_adress">50长度以内</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input type="text" name="c_postcode" id="c_postcode"/>
                        <div class="validate_msg_long" id="e_postcode">6位数字</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input type="text" name="c_qq" id="c_qq"/>
                        <div class="validate_msg_long" id="e_qq">5到13位数字</div>
                    </div>                
                </div>
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" id="save" onclick="showResult();" />
                    <input type="reset" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/customer/searchAllInfo.do';"/>
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
