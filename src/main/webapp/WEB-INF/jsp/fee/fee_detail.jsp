﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />       
        <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.0.0.js"></script>
    </head>
    <body>
      <!--Logo区域开始-->
		<%@ include file="../include/Logo.jsp" %>
		<!--Logo区域结束-->
        <!--导航区域开始-->
		<%@ include file="../include/menu.jsp" %>
        <!--导航区域结束-->
        <!--主要区域开始-->
       <script type="text/javascript">
        $(function(){
        	var cost_type='${detail.cost_type}'
        	if(cost_type=='0'){
           	    $("#monthly").attr("checked",true)  
           	}else if(cost_type=='1'){
           	   $("#package").attr("checked",true)  
           	}else if(cost_type=='2'){
           	  $("#timeBased").attr("checked",true)  
           	}
        	var state = '${detail.cost_state}'
        	if(state=='0'){
        		$("#state").html("开通")
        	}else if(state=='1'){
        		$("#state").html("暂停")
        	}else if(state=='2'){
        		$("#state").html("删除")
        	}
        }) 
       </script>
        <div id="main">            
            <form  class="main_form">
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly="readonly" value="${detail.cost_id }" /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly="readonly" value="${detail.cost_name }"/></div>
                <div class="text_info clearfix"><span>资费状态：</span></div>
                <div class="input_info">
                    <select class="readonly" disabled="disabled" >
                        <option id="state"></option>
                    </select>                        
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="radFeeType" id="monthly"  disabled="disabled" />
                    <label for="monthly">包月</label>
                    <input type="radio" name="radFeeType" id="package" disabled="disabled" />
                    <label for="package">套餐</label>
                    <input type="radio" name="radFeeType" id="timeBased" disabled="disabled" />
                    <label for="timeBased">计时</label>
                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input type="text" class="readonly"readonly="readonly" value="${detail.cost_basetime }"  />
                    <span>小时</span>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text"  class="readonly" readonly="readonly" value="${detail.cost_basemoney }" />
                    <span>元</span>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text"  class="readonly" readonly="readonly" value="${detail.cost_singlemoney }" />
                    <span>元/小时</span>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text"  class="readonly" readonly="readonly" value="${detail.cost_createtime }" /></div>      
                <div class="text_info clearfix"><span>启动时间：</span></div>
                <div class="input_info"><input type="text"  class="readonly" readonly="readonly" value="${detail.cost_starttime}"/></div>      
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70 readonly" readonly="readonly">${detail.cost_instruction }</textarea>
                </div>                    
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/cost/costInfo.do';" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
