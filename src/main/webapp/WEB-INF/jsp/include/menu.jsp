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
   <script>
   $(function(){
		var id=$("#indexs").val();
		if(id=="index"){
			$("#index").removeClass("index_off");
			$("#index").addClass("index_on");
			$("#navi").css({"position":"absolute","bottom":"0","background-image":"url                                       (../images/index_navi_bg.png)"});
			$("#navi li").css("margin-top","10px");
		}else if(id=="admin"){
			$("#admin").removeClass("admin_off");
			$("#admin").addClass("admin_on");       		
		}else if(id=="account"){
			$("#account").removeClass("account_off");
			$("#account").addClass("account_on"); 
		}else if(id=="fee"){
			$("#fee").removeClass("fee_off");
			$("#fee").addClass("fee_on"); 
		}else if(id=="service"){
			$("#service").removeClass("service_off");
			$("#service").addClass("service_on"); 
		}else if(id=="userinfo"){
			$("#userinfo").removeClass("information_off");
			$("#userinfo").addClass("information_on"); 
		}else if(id=="pswmodi"){
			$("#pswmodi").removeClass("password_off");
			$("#pswmodi").addClass("password_on"); 
		}else if(id=="report"){
			$("#report").removeClass("password_off");
			$("#report").addClass("password_on"); 
		}else if(id=="bill"){
			$("#bill").removeClass("password_off");
			$("#bill").addClass("password_on"); 
		}
		
	});   
   /**********************************************************/
   </script>
	<!--导航区  -->
	   <div id="navi">  
           <ul id="menu">
               <li><a id="index" href="${pageContext.request.contextPath}/view/index.do" class="index_off"></a></li>
                <% Admin amenu = (Admin)session.getAttribute("adminInfo"); 
                   String menu = amenu.getA_authority();
                if(menu.indexOf("1")!=-1) {%>
<%--                <li><a href="${pageContext.request.contextPath}/view/role.do" class="role_off"></a></li>
 --%>      
                <%}if(menu.indexOf("2")!=-1) {%>
                
                <li><a id="admin"  href="${pageContext.request.contextPath}/admin/adminInfo.do"  class="admin_off"></a></li>
                <%} if(menu.indexOf("3")!=-1) {%>
                
                <li><a id="fee" href="${pageContext.request.contextPath}/cost/costInfo.do" class="fee_off"></a></li>
                <%} if(menu.indexOf("4")!=-1) {%>
                
                <li><a id="account" href="${pageContext.request.contextPath}/customer/searchAllInfo.do" class="account_off"></a></li>
                <%}if(menu.indexOf("5")!=-1) {%>
                
                <li><a id="service" href="${pageContext.request.contextPath}/business/searchCost.do" class="service_off"></a></li>
                <%} if(menu.indexOf("6")!=-1) {%>
                
                <li><a id="bill" href="${pageContext.request.contextPath}/view/bill.do" class="bill_off"></a></li>
                <%} if(menu.indexOf("7")!=-1) {%>
                <li><a id="report" href="${pageContext.request.contextPath}/view/report.do" class="report_off"></a></li>
                <%}%>
                <li><a id="userinfo" href="${pageContext.request.contextPath}/admin/userInfo.do" class="information_off"></a></li>
                <li><a id="pswmodi" href="${pageContext.request.contextPath}/view/changePsw.do" class="password_off"></a></li>
     
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