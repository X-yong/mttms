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
            //删除
            function deleteAccount(c_id) {
                var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
				if(r){
                 $.ajax({
					url :'${pageContext.request.contextPath}/customer/deleteCustomer.do' ,
					data: {c_id:c_id} ,
					type: "post"  ,
					success:function(result){
						if(result=="success"){
							showResult();
						}else if(result=="nobusiness"){
							$("#save_result_info").html("账务账号删除成功，该账务账号暂时未开通任何业务！");
							showResult();
						}else	alert("删除失败！")
					}
				}) 
			   }
            }
            //开通或暂停        
            function setState(btnObj,c_id) {
            	var r = window.confirm("确定要开通或暂停此账务账号吗？");
            	  if (btnObj.className == "btn_pause"){
                      btnObj.className = "btn_start";
            	      window.location.href="${pageContext.request.contextPath}/customer/openOrStop.do?c_state=1&c_id="+c_id;
            	  }else{
                      btnObj.className = "btn_pause";
                   window.location.href="${pageContext.request.contextPath}/customer/openOrStop.do?c_state=0&c_id="+c_id; 
            	  }
              } 
          //提示信息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 2000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("operate_result_info");
                if (flag)
                    divResult.style.display = "block";
                else {
                    divResult.style.display = "none";
					window.location.href='${pageContext.request.contextPath}/customer/searchAllInfo.do';
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
         <!--删除等的操作提示-->
            <!--删除等的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                                                        删除成功，且已删除其下属的业务账号！
                </div>   

            <form action="${pageContext.request.contextPath}/customer/searchAllInfo.do" method="post">
                <!--查询-->
                <div class="search_add">  
                    <div>身份证：<input type="text"  class="text_search" value="${echo.c_idcard }" name="c_idcard" /></div>                            
                    <div>姓名：<input type="text" class="width70 text_search" value="${echo.c_name }" name="c_name" /></div>
                    <div>登录名：<input type="text" class="text_search" value="${echo.c_username }" name="c_username" /></div>
                    <div>
                        状态：
                        <select class="select_search" name="c_state">
                            <option value='3'>全部</option>
                            <option value='0'>开通</option>
                            <option value='1'>暂停</option>
                            <option value='2'>删除</option>
                        </select>
                    </div>
                    <div><input type="submit" value="搜索" class="btn_search" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/addCustomer.do';" />
                </div>  
               
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th>账号ID</th>
                        <th>姓名</th>
                        <th class="width150">身份证</th>
                        <th>登录名</th>
                        <th>状态</th>
                        <th class="width100">创建日期</th>
                        <th class="width150">上次登录时间</th>                                                        
                        <th class="width200"></th>
                    </tr>
                    <c:forEach items="${ aPage}" var="resultCustomerList" varStatus="status">
                    <tr>
                        <td>${resultCustomerList.c_id }</td>
                        <td><a href="${pageContext.request.contextPath}/customer/detailSelect.do?c_id=${resultCustomerList.c_id }">${resultCustomerList.c_name }</a></td>
                        <td>${resultCustomerList.c_idcard }</td>
                        <td>${resultCustomerList.c_username}</td>
                        <td>${resultCustomerList.c_state=='0'?'开通':resultCustomerList.c_state=='1'?'暂停':'删除'}</td>
                        <td>${resultCustomerList.c_createtime}</td>
                        <td>${resultCustomerList.c_onlinetime}</td>                            
                        <td class="td_modi">
                            <input type="button" value="暂停" id="${resultCustomerList.c_id }1" class="btn_pause" onclick="setState(this,${resultCustomerList.c_id});" />
                            <input type="button" value="修改" id="${resultCustomerList.c_id }2" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/customer/searchBycid.do?c_id=${resultCustomerList.c_id }';" />
                            <input type="button" value="删除" id="${resultCustomerList.c_id }3" class="btn_delete" onclick="deleteAccount(${resultCustomerList.c_id });" />
                        </td>
                    </tr>
                        <script>
                        var state =${resultCustomerList.c_state}
                           if( state=='2'){
                        	   $("#${resultCustomerList.c_id }1").hide()
                        	   $("#${resultCustomerList.c_id }2").hide()
                        	   $("#${resultCustomerList.c_id }3").hide()
                           }
                           if(state=='0'){
                        	   $("#${resultCustomerList.c_id }1").val("暂停")
                        	   $("#${resultCustomerList.c_id }1").addClass("btn_pause");
                           }
                           if(state=='1'){
                        	   $("#${resultCustomerList.c_id }1").val("开通")
                        	   $("#${resultCustomerList.c_id }1").addClass("btn_start");
                           }
                          
                        </script>
                    </c:forEach>
                </table>
                <p>业务说明：<br />
                1、创建则开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、暂停账务账号，同时暂停下属的所有业务账号；<br />                
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br />
                7、删除账务账号，同时删除下属的所有业务账号。</p>
                </div>                   
                <!--分页-->
                <div id="pages">
                   <%--若当前页为第一页只能进行下一页操作 ，当前页码大于1可以进行上一页操作 --%>
				<c:choose>
				<c:when test= "${currPage >1 && currPage < allPage}">
				 <a href = "${pageContext.request.contextPath}/customer/page.do?currPage=1">首页 </a>
				 <a href = "${pageContext.request.contextPath}/customer/page.do?currPage=${currPage-1}">上一页</a>
				 <a href = "${pageContext.request.contextPath}/customer/page.do?currPage=${currPage+1}">下一页</a>
				 <a href = "${pageContext.request.contextPath}/customer/page.do?currPage=${allPage}"> 尾页</a>
				 </c:when>
				 <c:when test = "${currPage==1}">
				 <a href = "#" >首页 </a>
				 <a href = "#">上一页</a>
				 <a href = "${pageContext.request.contextPath}/customer/page.do?currPage=${currPage+1}">下一页</a>
				 <a href = "${pageContext.request.contextPath}/customer/page.do?currPage=${allPage}"> 尾页</a>
				 </c:when>
				 <c:when test = "${currPage==allPage}">
				 <a href = "${pageContext.request.contextPath}/customer/page.do?currPage=1" >首页 </a>
				 <a href = "${pageContext.request.contextPath}/customer/page.do?currPage=${currPage-1}">上一页</a>
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
