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
   		<script>
   		$(function(){
   			
   			$("#s1").val("${resultDetail.c_state=='0'?'开通':resultDetail.c_state=='1'?'暂停':'删除' }")
   			$("#w1").val("${resultDetail.c_work}");
   		    $("input[type='radio']").val(["${resultDetail.c_sex}"]).checked="checked";
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
            <form class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${resultDetail.c_id } " readonly="readonly" class="readonly" /></div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info"><input type="text" value="${resultDetail.c_name }" readonly="readonly"/></div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" value="${resultDetail.c_idcard }" readonly="readonly" class="readonly" />
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <input type="text" value="${resultDetail.c_username }" readonly="readonly" class="readonly" />
                </div>                   
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" class="width200 readonly" readonly="readonly" value="${resultDetail.c_phone }" />
                </div>
                <div class="text_info clearfix"><span>推荐人账务账号ID：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${c_id }"  /></div>
                <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${resultDetail.c_otherid}" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info" >
                    <select id="s1" disabled="disabled">
                        <option >开通</option>
                        <option >暂停</option>
                        <option >删除</option>
                    </select>                        
                </div>                    
                <div class="text_info clearfix"><span>开通/暂停/删除时间：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${time}"/></div>

                <div class="text_info clearfix"><span>上次登录时间：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${resultDetail.c_onlinetime }" /></div>
                <div class="text_info clearfix"><span>上次登录IP：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${resultDetail.lastloginip }" /></div>
                <!--可选项数据-->
                <div class="text_info clearfix"><span>生日：</span></div>
                <div class="input_info">
                    <input type="text" readonly="readonly" class="readonly" value="${brith }" />
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input type="text" class="width350 readonly" readonly="readonly" value="${resultDetail.c_email }" />
                </div> 
                <div class="text_info clearfix"><span>职业：</span></div>
                <div class="input_info">
                    <select id="w1"  disabled="disabled">
                        <option value="干部" >干部</option>
                        <option value="学生">学生</option>
                        <option value="技术人员">技术人员</option>
                        <option value="其他">其他</option>
                    </select>                        
                </div>
                <div class="text_info clearfix"><span>性别：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="radSex" value="2"  id="female" disabled="disabled" />
                    <label for="female">女</label>
                    <input type="radio" name="radSex" value="1" id="male" disabled="disabled" />
                    <label for="male">男</label>
                </div> 
                <div class="text_info clearfix"><span>通信地址：</span></div>
                <div class="input_info"><input type="text" class="width350 readonly" readonly="readonly" value="${resultDetail.c_address }" /></div> 
                <div class="text_info clearfix"><span>邮编：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly="readonly" value="${resultDetail.c_postcode }" /></div> 
                <div class="text_info clearfix"><span>QQ：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly="readonly"   value="${resultDetail.c_qq }" /></div>                
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/customer/searchAllInfo.do';" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
