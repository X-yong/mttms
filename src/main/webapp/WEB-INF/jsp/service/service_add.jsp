<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/plugins/easyui/themes/bootstrap/easyui.css" />  
		<link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/plugins/easyui/themes/icon.css"/> 
		<script type="text/javascript"	src="${pageContext.request.contextPath}/plugins/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"	src="${pageContext.request.contextPath}/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
        <script language="javascript" type="text/javascript">
           //增加业务
          function checks(){
            	 $.ajax({
   				  url:'${pageContext.request.contextPath}/business/addBusiness.do',
   	              data:$("form").serialize() ,
   	              type:"post",
   	              success:function(result) {   
   					if(result=="fail"){
   						alert("请确认你的密码是否相同")
   					}else if(result=="error") {
   						alert("添加失败")
   					}else if(result=="success"){ alert("增加成功")}
   					 else if(result=="alreadyExit") alert("此业务账号已存在！")
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
                else
                    divResult.style.display = "none";
            }

            //查询账务账号
            function serachBuss(txtObj) {
              var c_idcard = $("#c_idcard").val()
	              $.ajax({
				  url:'${pageContext.request.contextPath}/business/searchCustomer.do',
	              data: {c_idcard:c_idcard},
	              type:"post",
	              success:function(result) {   
					$("#c_username").val(result.c_username)
	              }
			   })
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
            <!--保存操作的提示信息-->
            <div id="save_result_info" class="save_fail">保存失败！192.168.0.23服务器上已经开通过 OS 账号 “mary”。</div>
            <form  class="main_form">
                <!--内容项-->
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" class="easyui-textbox" id="c_idcard" name="c_idcard" data-options="required:true" />
                    <input type="button" value="查询账务账号"  class="btn_search_large" onclick="serachBuss()" />
                    <span class="required">*</span>
                    <div class="validate_msg_short">没有此身份证号，请重新录入。</div>
                </div>
                <div class="text_info clearfix"><span>账务账号：</span></div>
                <div class="input_info">
                    <input type="text" id="c_username" />
                    <span class="required">*</span>
                    <div class="validate_msg_long">没有此账务账号，请重新录入。</div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info">
                    <select name="cost_name">
                    <c:forEach items="${cost_name}" var="cost_names" varStatus="status">
                         <option >${cost_names.cost_name} </option>
                     </c:forEach>
                    </select>                        
                </div> 
                <div class="text_info clearfix"><span>登录 OS 账号：</span></div>
                <div class="input_info">
                    <input type="text" class="easyui-textbox"  name="b_osusername" data-options="required:true"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long"></div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input type="password" class="easyui-textbox" id="psw" name="b_ospassword" data-options="required:true"   />
                    <span class="required">*</span>
                    <div class="validate_msg_long"></div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password" class="easyui-textbox"  validType="equals['#psw']" name="r_ospassword" data-options="required:true" />
                    <span class="required">*</span>
                    <div class="validate_msg_long"></div>
                </div>     
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="checks();" />
                    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/view/businessShow.do'" />
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
