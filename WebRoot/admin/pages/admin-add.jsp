<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="<%=request.getContextPath()%>/admin/admin!adminAdd.action" method="post" >

		用户：<input type="text" name="admin.username"/><br>
		密码：<input type="text" name="admin.password"/>
		
		<input type="submit" value="添加"/>
		
	</form>
	
	<s:actionerror/>
	
</body>
</html>
