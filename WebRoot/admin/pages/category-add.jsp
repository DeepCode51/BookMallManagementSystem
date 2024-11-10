<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="../admin!categoryAdd.action" method="post" >

	<table border="0" align="center">
		<thead>添加图书类别信息</thead>
		<!-- <tr> 
			<th>编号：</th>
			<td><input type="text" name="category.id"/></td>
		</tr> -->
		<tr> 
			<th>名称：</th>
			<td><input type="text" name="category.name"/></td>
		</tr>
		
		<tr><td colspan="2" align="center"> <input type="submit" value="添加"/></td></tr>
	
	
	</table>	
	</form>
	
	
	<s:actionerror/>
	
</body>
</html>
