<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <script src="<%=request.getContextPath()%>/jquery/jquery-2.0.0.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <script language="javascript" type="text/javascript">
	      	//保存结果的提示
	        function showResult(result) {
	        	if (result=='true'){
	            	$("#save_result_info").show().hide(2000)
	            	setTimeout("window.location.href='${pageContext.request.contextPath}/cost/costInfo.do'",2000)
	            }else{
	            	$("#save_result_info").attr("class","save_fail");
	        		$("#save_result_info").html("保存失败，资费名称重复!");
	        		$("#save_result_info").show().hide(2000)
	            }
	        }

	        //切换资费类型
            function feeTypeChange(type) {
                var inputArray = document.getElementById("main").getElementsByTagName("input");
                if (type == 1) {
                    inputArray[5].disabled = true;
                    inputArray[5].value = "";
                    inputArray[5].className += " readonly";
                    inputArray[6].disabled = false;
                    inputArray[6].className = "width100";
                    inputArray[7].disabled = true;
                    inputArray[7].className += " readonly";
                    inputArray[7].value = "";
                }
                else if (type == 2) {
                    inputArray[5].disabled = false;
                    inputArray[5].className = "width100";
                    inputArray[6].disabled = false;
                    inputArray[6].className = "width100";
                    inputArray[7].disabled = false;
                    inputArray[7].className = "width100";
                }
                else if (type == 3) {
                    inputArray[5].disabled = true;
                    inputArray[5].value = "";
                    inputArray[5].className += " readonly";
                    inputArray[6].disabled = true;
                    inputArray[6].value = "";
                    inputArray[6].className += " readonly";
                    inputArray[7].disabled = false;
                    inputArray[7].className = "width100";
                }
            }
          	//表单验证
            function validata(){
            	/*  初始化信息显示框  */
                $("#tariffNameMsg").attr("class","validate_msg_medium");
                $("#timeLongMsg").attr("class","validate_msg_medium");
                $("#tariffMsg").attr("class","validate_msg_medium");
                $("#timeTariffMsg").attr("class","validate_msg_medium");
                $("#tariffExplainMsg").attr("class","validate_msg_medium");
        		$("#tariffNameMsg").html("");
        		$("#timeLongMsg").html("");
        		$("#tariffMsg").html("");
        		$("#timeTariffMsg").html("");
        		$("#tariffExplainMsg").html("");
        		
                var regTariffName=/^([\u4e00-\u9fa5A-Za-z0-9]{4,50})$/;//2到50为的汉字或字母
                var regTimeLong=/^([1-5]\d{0,2}|600)$/; //1-600之间的整数
                var regTariff=/^\d{1,5}(\.\d{1,2})?$/;  //0-99999.99之间的数值
                var regTimeTariff=/^\d{1,5}(\.\d{1,2})?$/;  //0-99999.99之间的数值
                var regTariffExplain=/^([\u4e00-\u9fa5A-Za-z0-9]{4,100})$/;//4到100为的汉字或字母                
        		/* 校验资费名 */
            	if($("#cost_name").val()==""){
            		$("#tariffNameMsg").attr("class","validate_msg_medium error_msg");
            		$("#tariffNameMsg").html("资费名不能为空");
            		return false;
            	}
            	if(!regTariffName.test($("#cost_name").val())){
            		$("#tariffNameMsg").attr("class","validate_msg_medium error_msg");
            		$("#tariffNameMsg").html("资费名格式不正确，50长度的字母、数字、汉字和下划线的组合");
            		return false;
            	}
            	
            	/* 校验时长 */
            	if($("input:checked").val()=="1"){
                	if($("#cost_basetime").val()==""){
                		$("#timeLongMsg").attr("class","validate_msg_medium error_msg");
                		$("#timeLongMsg").html("时长不能为空");
                		return false;
                	}
                	if(!regTimeLong.test($("#cost_basetime").val())){
                		$("#timeLongMsg").attr("class","validate_msg_medium error_msg");
                		$("#timeLongMsg").html("时长格式不正确，请重新输入！");
                		return false;
                	}
            	}
            		
            	
            	/* 校验基本费用 */
            	if($("input:checked").val()!="2"){
                	if($("#cost_basemoney").val()==""){
                		$("#tariffMsg").attr("class","validate_msg_medium error_msg");
                		$("#tariffMsg").html("基本费用不能为空！");
                		return false;
                	}
                	if(!regTariff.test($("#cost_basemoney").val())){
                		$("#tariffMsg").attr("class","validate_msg_medium error_msg");
                		$("#tariffMsg").html("基本费用格式不正确，请重新输入！");
                		return false;
                	}
            	}
            	/* 校验单位费用 */
            	if($("input:checked").val()!="0"){
                	if($("#cost_singlemoney").val()==""){
                		$("#timeTariffMsg").attr("class","validate_msg_medium error_msg");
                		$("#timeTariffMsg").html("单位费用不能为空！");
                		return false;
                	}
                	if(!regTimeTariff.test($("#cost_singlemoney").val())){
                		$("#timeTariffMsg").attr("class","validate_msg_medium error_msg");
                		$("#timeTariffMsg").html("单位费用格式不正确，请重新输入！");
                		return false;
                	}
            	}
            	
            	/* 校验资费说明 */
            	if($("#cost_instruction").val()==""){
            		$("#tariffExplainMsg").attr("class","validate_msg_medium error_msg");
            		$("#tariffExplainMsg").html("资费说明不能为空");
            		return false;
            	}
            	if(!regTariffExplain.test($("#cost_instruction").val())){
            		alert($("#cost_instruction").val())
            		$("#tariffExplainMsg").attr("class","validate_msg_medium error_msg");
            		$("#tariffExplainMsg").html("资费说明格式不正确");
            		return false;
            	}
            	return true;
            }
			$(function(){
	           	$("#btn_modi").click(function(){
	           		if(validata()==true){
		           		$.ajax({
		           			url     : '${pageContext.request.contextPath}/cost/updatecost.do',
	            			data    : $("#myform").serialize(),
	            			success : function(result){
		           				showResult(result)
		           			}
		           		}) 
	           		}
	           	})
	        })
        </script>
    </head>
    <body >
        <!--Logo区域开始-->
		<%@ include file="../include/Logo.jsp" %>
		<!--Logo区域结束-->
        <!--导航区域开始-->
		<%@ include file="../include/menu.jsp" %>
		<input id="indexs" value="fee" hidden/>
        <!--导航区域结束--> 
        <!--主要区域开始-->
        <div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form id="myform" method="post" class="main_form" >
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly name="cost_id" value="${sresult.cost_id}"/></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                    <input type="text" id="cost_name" class="width300" name="cost_name" value="${sresult.cost_name}"/>
                    <span class="required">*</span>
                    <div id="tariffNameMsg" class="validate_msg_short"></div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="cost_type" ${sresult.cost_type=='0'?"checked":"" } value="0" id="monthly" onclick="feeTypeChange(1);" />
                    <label for="monthly">包月</label>
                    <input type="radio" name="cost_type" ${sresult.cost_type=='1'?"checked":"" } value="1" checked="checked" id="package" onclick="feeTypeChange(2);" />
                    <label for="package">套餐</label>
                    <input type="radio" name="cost_type" ${sresult.cost_type=='2'?"checked":"" } value="2" id="timeBased" onclick="feeTypeChange(3);" />
                    <label for="timeBased">计时</label>
                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input  type="text" id="cost_basetime" name="cost_basetime" value="${sresult.cost_basetime}" class="width100" />
                    <span class="info">小时</span>
                    <span class="required">*</span>
                    <div id="timeLongMsg" class="validate_msg_long"></div>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text" id="cost_basemoney" name="cost_basemoney" value="${sresult.cost_basemoney}" class="width100" />
                    <span class="info">元</span>
                    <span class="required">*</span>
                    <div id="tariffMsg" class="validate_msg_long"></div>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text" id="cost_singlemoney" name="cost_singlemoney" value="${sresult.cost_singlemoney}" class="width100" />
                    <span class="info">元/小时</span>
                    <span class="required">*</span>
                    <div id="timeTariffMsg" class="validate_msg_long"></div>
                </div>   
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70" id="cost_instruction" name="cost_instruction" >
                   	${sresult.cost_instruction}
                    </textarea>
                    <div id="tariffExplainMsg" class="validate_msg_short"></div>
                </div>                    
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" id="btn_modi"/>
                    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/cost/costInfo.do'" />
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">   
        </div>
    </body>
</html>
