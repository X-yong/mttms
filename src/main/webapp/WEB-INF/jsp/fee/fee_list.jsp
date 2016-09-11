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
        <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.0.0.js"></script>
        <script language="javascript" type="text/javascript">
                   
            //排序按钮的点击事件
            function sort(btnObj) {
                if (btnObj.className == "sort_desc")
                    btnObj.className = "sort_asc";
                else
                    btnObj.className = "sort_desc";
            }
			$(function(){
				var order ='${order}'
				var by = '${by}'
			 if('${order}'=='月租'){
				var order = document.getElementById("b1");
				if('${by}'=='0'){									
					order.className = "sort_desc";
				}else 
					order.className = "sort_asc";
			}
			if('${order}'=='基费'){
				var order = document.getElementById("b2");
			     if('${by}'=='0')									
					order.className = "sort_desc";
				else 
					order.className = "sort_asc";
			}
			if('${order}'=='时长'){
				var order = document.getElementById("b3");
				 if('${by}'=='0')									
					order.className = "sort_desc";
				else 
					order.className = "sort_asc";
			} 
				
				$("#b1").click(function(){
					var order = $("#b1").val();
					var  by=$("#b1").prop("class")
					var a=0
					if(by=="sort_desc"){
						a=0
					}else a=1
					window.location.href ="${pageContext.request.contextPath}/cost/order.do?order="+order+'&a='+a
				})
				$("#b2").click(function(){
					var order = $("#b2").val();
					var  by=$("#b2").prop("class")
					if(by=="sort_desc"){
						a=0
					}else a=1
					window.location.href ="${pageContext.request.contextPath}/cost/order.do?order="+order+'&a='+a
				})
				$("#b3").click(function(){
					var order = $("#b3").val();
					var  by=$("#b3").prop("class")
					if(by=="sort_desc"){
						a=0
					}else a=1
					window.location.href ="${pageContext.request.contextPath}/cost/order.do?order="+order+'&a='+a
				})
				
			})
    
            //启用
            function startFee(i) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                $.ajax({
                      url:'${pageContext.request.contextPath}/cost/startCost.do',
                      data:{cost_id:i},
                      type:"post",
                      success:function(result){
                    	  if(result=="success"){
                    		 $("#d1").hide()
                    		  $("#operate_result_info").html("资费启用成功！")
                    		  document.getElementById("operate_result_info").style.display = "block";
                    		  window.setTimeout("showResultDiv(false);", 1000);
                    	  }else{
                    		 $("#operate_result_info").html("资费启用失败！")
                    		  document.getElementById("operate_result_info").style.display = "block";
                    		  window.setTimeout("showResultDiv(false);", 1000);
                    	  }
                      }          	
                })
            }
            //删除
            function deleteFee(j) {
                var r = window.confirm("确定要删除此资费吗？");
                $.ajax({
                    url:'${pageContext.request.contextPath}/cost/deleteCost.do',
                    data:{cost_id:j},
                    type:"post",
                    success:function(result){
                  	  if(result=="success"){
                  		$("#d2").hide()
                  		// document.getElementById("d2").style.display = "none";
                  		$("#operate_result_info").html("资费已删除！")
                  		 document.getElementById("operate_result_info").style.display = "block";
                  		 window.setTimeout("showResultDiv(false);", 2000);
                  	  }else{
                  		$("#operate_result_info").html("资费删除失败！")
                  		 document.getElementById("operate_result_info").style.display = "block";
                  		 window.setTimeout("showResultDiv(false);", 2000);
                  	  }
                    }          	
              })
            }
            //提示消息
            function showResultDiv(flag) {
                var divResult = document.getElementById("operate_result_info");
                if (flag){
                    divResult.style.display = "block";
                    window.location.href='${pageContext.request.contextPath}/cost/costInfo.do';
                }else{
                    divResult.style.display = "none";
                    window.location.href='${pageContext.request.contextPath}/cost/costInfo.do';
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
            <form id="form" >
                <!--排序-->
                <div class="search_add">
                    <div>
                        <input type="button" value="月租" id="b1" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="基费" id="b2" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="时长" id="b3" class="sort_asc" onclick="sort(this);" />
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/addCost.do';" />
                </div> 
                <!--启用操作的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                                                          启用资费成功！
                </div>    
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th>基本时长</th>
                            <th>基本费用</th>
                            <th>单位费用</th>
                            <th>创建时间</th>
                            <th>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr>  
                        <c:forEach items="${fpage}"  var="resultFeeList" varStatus="status">  
                        <tr>
                            <td>${resultFeeList.cost_id }</td>
                            <td><a href="${pageContext.request.contextPath}/cost/detailCost.do?cost_name=${resultFeeList.cost_name}">${resultFeeList.cost_name}</a></td>
                            <td>${resultFeeList.cost_basetime }</td>
                            <td>${resultFeeList.cost_basemoney }</td>
                            <td>${resultFeeList.cost_singlemoney }</td>
                            <td>${resultFeeList.cost_createtime }</td>
                            <td>${resultFeeList.cost_starttime }</td>
                            <td>${resultFeeList.cost_state =='0'?'开通':resultFeeList.cost_state =='1'?'暂停':'删除'}</td>
                            <td> 
                             <div>                               
                                <input type="button" value="启用" id="${resultFeeList.cost_id }1" class="btn_start" onclick="startFee(${resultFeeList.cost_id });" />
                                <input type="button" value="修改" id="${resultFeeList.cost_id }2" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/cost/selectCost.do?cost_id=${resultFeeList.cost_id }'" />
                                <input type="button" value="删除" id="${resultFeeList.cost_id }3" class="btn_delete" onclick="deleteFee(${resultFeeList.cost_id });" />
                             </div>
                            </td>
                        </tr>
                        <script>
                        var state =${resultFeeList.cost_state}
                           if(state=='0' | state=='2'){
                        	   $("#${resultFeeList.cost_id }1").hide()
                        	   $("#${resultFeeList.cost_id }2").hide()
                        	   $("#${resultFeeList.cost_id }3").hide()
                           }
                          
                        </script>
                      </c:forEach> 
                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
        	    <%--若当前页为第一页只能进行下一页操作 ，当前页码大于1可以进行上一页操作 --%>
				<c:choose>
				<c:when test= "${currPage >1 && currPage < allPage}">
				 <a href = "${pageContext.request.contextPath}/cost/page.do?currPage=1">首页 </a>
				 <a href = "${pageContext.request.contextPath}/cost/page.do?currPage=${currPage-1}">上一页</a>
				 <a href = "${pageContext.request.contextPath}/cost/page.do?currPage=${currPage+1}">下一页</a>
				 <a href = "${pageContext.request.contextPath}/cost/page.do?currPage=${allPage}"> 尾页</a>
				 </c:when>
				 <c:when test = "${currPage==1}">
				 <a href = "#" >首页 </a>
				 <a href = "#">上一页</a>
				 <a href = "${pageContext.request.contextPath}/cost/page.do?currPage=${currPage+1}">下一页</a>
				 <a href = "${pageContext.request.contextPath}/cost/page.do?currPage=${allPage}"> 尾页</a>
				 </c:when>
				 <c:when test = "${currPage==allPage}">
				 <a href = "${pageContext.request.contextPath}/cost/page.do?currPage=1" >首页 </a>
				 <a href = "${pageContext.request.contextPath}/cost/page.do?currPage=${currPage-1}">上一页</a>
				 <a href = "#">下一页</a>
				 <a href = "#"> 尾页</a>
				 </c:when> 
				 </c:choose>
				   第${currPage}页/共${allPage}页     
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
