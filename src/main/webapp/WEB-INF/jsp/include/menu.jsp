<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.xy.entity.Admin" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/styles/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/styles/global_color.css" /> --%> 
<title>菜单栏</title>
</head>
<body>
	<!--导航区  -->
	   <div id="navi">  
           <ul id="menu">
               <li><a href="${pageContext.request.contextPath}/view/index.do" class="index_on"></a></li>
                <% Admin amenu = (Admin)session.getAttribute("adminInfo"); 
                   String menu = amenu.getA_authority();
                if(menu.indexOf("1")!=-1) {%>
<%--                <li><a href="${pageContext.request.contextPath}/view/role.do" class="role_off"></a></li>
 --%>      
                <%}if(menu.indexOf("2")!=-1) {%>
                
                <li><a href="${pageContext.request.contextPath}/admin/adminInfo.do"  class="admin_off"></a></li>
                <%} if(menu.indexOf("3")!=-1) {%>
                
                <li><a href="${pageContext.request.contextPath}/cost/costInfo.do" class="fee_off"></a></li>
                <%} if(menu.indexOf("4")!=-1) {%>
                
                <li><a href="${pageContext.request.contextPath}/customer/searchAllInfo.do" class="account_off"></a></li>
                <%}if(menu.indexOf("5")!=-1) {%>
                
                <li><a href="${pageContext.request.contextPath}/business/searchCost.do" class="service_off"></a></li>
                <%} if(menu.indexOf("6")!=-1) {%>
                
                <li><a href="${pageContext.request.contextPath}/view/bill.do" class="bill_off"></a></li>
                <%} if(menu.indexOf("7")!=-1) {%>
                <li><a href="${pageContext.request.contextPath}/view/report.do" class="report_off"></a></li>
                <%}%>
                <li><a href="${pageContext.request.contextPath}/admin/userInfo.do" class="information_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/changePsw.do" class="password_off"></a></li>
     
       <%--     <li><a href="${pageContext.request.contextPath}/view/index.do" class="index_off"></a></li>
		 		<li><a href="${pageContext.request.contextPath}/view/role.do" class="role_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/admin.do" class="admin_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/cost.do" class="fee_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/account.do" class="account_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/business.do" class="service_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/bill.do" class="bill_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/report.do" class="report_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/userInfo.do" class="information_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/changePsw.do" class="password_off"></a></li>  --%>
            </ul> 
        </div>
</body>
</html>