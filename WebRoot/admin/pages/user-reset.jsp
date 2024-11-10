<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="admin!userReset.action" method="post" >

		<input type="hidden" name="user.id" value="${user.id}"/>
		
		用户: ${user.username}<br>
		密码：<input type="text" name="user.password" value=""/>
		<br>
		<input type="submit" value="重置"/><s:actionerror/>
		
	</form>
	
</body>
</html>
