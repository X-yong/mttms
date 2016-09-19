<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.xy.entity.Admin" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
	     <% Admin admin =(Admin)session.getAttribute("adminInfo"); %>
		<img src="<%=request.getContextPath()%>/images/logo.png" alt="logo" class="left" />
		<img src="<%=request.getContextPath()+admin.getA_photo()%>" alt="photo"/>
			当前用户 : <a href="${pageContext.request.contextPath}/admin/userInfo.do"><%=admin.getA_name() %></a>  &nbsp;&nbsp;
		 <a href="${pageContext.request.contextPath}/view/exit.do">[退出]</a>
	</div>
</body>
</html>