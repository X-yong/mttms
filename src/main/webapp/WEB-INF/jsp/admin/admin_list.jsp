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
          function deleteAdmin(s){
        		  var r = window.confirm("确定要删除此管理员吗？");
        		  if(r){
        			  $.ajax({
        				 url:'${pageContext.request.contextPath}/admin/deleteAdminSave.do',
                 		 data:{a_id:s},
                 		 type:"post",
         				 success:function(result){
         					 if(result=="successDelete"){
         					   $("#operate_result_info").removeClass("operate_fail")
           				 	   $("#operate_result_info").addClass("operate_success");
         					   showResult()
         					 }else{
         						 $("#operate_result_info").removeClass("operate_success")
             				 	 $("#operate_result_info").addClass("operate_fail");
         						 $("#operate_result_info").html("删除管理员失败");
         						 showResult()
         					 }
         				 } 
        			  })
        		  }
              } 
          //查询
          $(function(){
        	  $("#search").click(function(){
        		    $("#form").submit()    		  
        	  })
          })
          /* function requireSelect(){
          
        	 var name = document.getElementById("name").value;
        	 var authority =document.getElementById("selModules").value
        	 
        	 $.ajax({
 				 url:'${pageContext.request.contextPath}/admin/adminInfo.do',
          		 data:{a_name:name,a_authority:authority},
          		 type:"post",
  				 success:function(result){
  				 	$("#body").html(result)
  				 } 
        	  })
          }*/
        //删除成功的提示信息
          function showResult() {
              showResultDiv(true);
              window.setTimeout("showResultDiv(false);", 2000);
          }
          function showResultDiv(flag) {
              var divResult = document.getElementById("operate_result_info");
              if (flag)
                  divResult.style.display = "block";
              else{
                  divResult.style.display = "none";
			 	  window.location.href='${pageContext.request.contextPath}/admin/adminInfo.do';
              }
          }
          
        //显示角色详细信息
            function showDetail(flag, a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                   detailDiv.style.display = "none";
            }
            //重置密码
            function resetPwd() {
            	var r = window.confirm("确定要重置密码吗？");
            	if(r){
            	$.ajax({
    				 url:'${pageContext.request.contextPath}/admin/restPsw.do',
             		 data:$("#form2").serialize(),
             		 type:"post",
     				 success:function(result){
     				 	if(result=="success"){
     				 	   $("#operate_result_info").removeClass("operate_fail")
     				 	   $("#operate_result_info").addClass("operate_success");
     				 	   $("#operate_result_info").html("密码已重置！！");
     				 	   showResult();
     				 	   //alert("密码已重置！");
     				 	}else if(result=="noSelect"){
     				 		$("#operate_result_info").html("请至少选择一个用户！！");
     				 		showResult();
     				 		//alert("请至少选择一个用户！！");
     				  	  }
     				    } 
           	          }) 
            	    }
           	//  $("#form2").submit()
                //document.getElementById("operate_result_info").style.display = "block";
               } 
            //删除
            /* function deleteAdmin() {
                var r = window.confirm("确定要删除此管理员吗？");
                document.getElementById("operate_result_info").style.display = "block";
            } */
            //全选
             function selectAdmins(inputObj) {
                var inputArray = document.getElementById("datalist").getElementsByTagName("input");
                for (var i = 1; i < inputArray.length; i++) {
                    if (inputArray[i].type == "checkbox") {
                        inputArray[i].checked = inputObj.checked;
                       
                    }
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
            <form  id="form" method="post" action="${pageContext.request.contextPath}/admin/adminInfo.do">
                <!--查询-->
                <div class="search_add">
                    <div>
                                                     权限：
                        <select id="selModules" name="authority" class="select_search">
                            <option>全部</option>
                            <option>角色管理</option>
                            <option>管理员管理</option>
                            <option>资费管理</option>
                            <option>账务管理</option>
                            <option>业务管理</option>
                            <option>账单管理</option>
                            <option>报表管理</option>
                        </select>
                    </div>
                    <div>姓名：<input type="text" id="name" name="name" value= "${returnName}"  class="text_search width200" /></div> 
                    <div><input type="button" id="search" value="搜索" class="btn_search" /></div>
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd()" />
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/addAdmin.do';" />
                </div>
                <!--删除和密码重置的操作提示-->
                <div id="operate_result_info" class="operate_fail">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    <span>删除管理员成功！！</span>
                </div> 
                </form>
                <form id="form2" >
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="th_select_all">
                                <input type="checkbox" onclick="selectAdmins(this);" />
                                <span>全选</span>
                            </th>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th>登录名</th>
                            <th>电话</th>
                            <th>电子邮件</th>
                            <th>创建日期</th>
                            <th class="width100">拥有权限</th>
                            <th></th>
                        </tr>      
                        <c:forEach items="${fpage}"  var="resultLists" varStatus="status">                
                        <tr>
                            <td><input id="restPsw" type="checkbox" name="restPsw"  value="${resultLists.a_id}"/></td>
                            <td>${resultLists.a_id}</td>
                            <td>${resultLists.a_name}</td>
                            <td>${resultLists.a_username}</td>
                            <td>${resultLists.a_phone}</td>
                            <td>${resultLists.a_email}</td>
                            <td>${resultLists.a_createtime}</td>
                            <td>
                                <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">管理员权限...</a>
                                <!--浮动的详细信息-->
                                <div class="detail_info">
                                  ${resultLists.a_authority}
                                </div>
                            </td>
                            <td class="td_modi">
                                <input type="button" id="d1" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/admin/updateAdminView.do?a_id=${resultLists.a_id}';" />
                                <input type="button" id="d2" value="删除" class="btn_delete" onclick="deleteAdmin(${resultLists.a_id})" />
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
        	      <%--若当前页为第一页只能进行下一页操作 ，当前页码大于1可以进行上一页操作 --%>
				<c:choose>
				<c:when test= "${currPage >1 && currPage < allPage}">
				 <a href = "${pageContext.request.contextPath}/admin/page.do?currPage=1">首页 </a>
				 <a href = "${pageContext.request.contextPath}/admin/page.do?currPage=${currPage-1}">上一页</a>
				 <a href = "${pageContext.request.contextPath}/admin/page.do?currPage=${currPage+1}">下一页</a>
				 <a href = "${pageContext.request.contextPath}/admin/page.do?currPage=${allPage}"> 尾页</a>
				 </c:when>
				 <c:when test = "${currPage==1}">
				 <a href = "#" >首页 </a>
				 <a href = "#">上一页</a>
				 <a href = "${pageContext.request.contextPath}/admin/page.do?currPage=${currPage+1}">下一页</a>
				 <a href = "${pageContext.request.contextPath}/admin/page.do?currPage=${allPage}"> 尾页</a>
				 </c:when>
				 <c:when test = "${currPage==allPage}">
				 <a href = "${pageContext.request.contextPath}/admin/page.do?currPage=1" >首页 </a>
				 <a href = "${pageContext.request.contextPath}/admin/page.do?currPage=${currPage-1}">上一页</a>
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
