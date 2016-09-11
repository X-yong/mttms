<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.xy.entity.Admin" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" /> 
        <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.0.0.js"></script>
    </head>
    <body class="index">
        <!--导航区域开始-->
		 <div id="index_navi">  
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
                
                <li><a href="${pageContext.request.contextPath}/business/searchCost.do.do" class="service_off"></a></li>
                <%} if(menu.indexOf("6")!=-1) {%>
                
                <li><a href="${pageContext.request.contextPath}/view/bill.do" class="bill_off"></a></li>
                <%} if(menu.indexOf("7")!=-1) {%>
                <li><a href="${pageContext.request.contextPath}/view/report.do" class="report_off"></a></li>
                <%}%>
                <li><a href="${pageContext.request.contextPath}/admin/userInfo.do" class="information_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/view/changePsw.do" class="password_off"></a></li>
                
        <!--导航区域结束-->
        
    </body>
</html>
