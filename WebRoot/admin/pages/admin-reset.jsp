<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="admin!adminReset.action" method="post" >

		<input type="hidden" name="admin.id" value="${admin.id}"/>
		<input type="hidden" name="admin.username" value="${admin.username}"/>
		
		用户: ${admin.username}<br>
		密码：<input type="text" name="admin.password" value=""/>
		
		<input type="submit" value="重置"/><s:actionerror/>
		
	</form>
	
</body>
</html>
