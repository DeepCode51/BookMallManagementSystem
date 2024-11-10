<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="js/jqueryui/css/jquery-ui-1.10.2.css" />
<script src="js/jqueryui/js/jquery-1.9.1.js"></script>
<script src="js/jqueryui/js/jquery-ui-1.10.2.js"></script>
<script src="js/jqueryui/js/datepicker-zh-CN.js"></script>
<script>
$(function() {
	// 初始化日期插件
	$( "#datepicker" ).datepicker({
		//showButtonPanel: true,//显示按钮栏
		//showOtherMonths: true,//显示其他月份
		//changeMonth: true,//显示月份菜单
		//changeYear: true,//显示年份菜单
		//numberOfMonths: 3,//显示月份数量
		//showOn: "button",//显示按钮
		//buttonImage: "jqueryui/css/images/calendar.gif",//图片地址
		//buttonImageOnly: true,//是否按钮只显示为图片
		//minDate: -3,//开始日期(当天为0)
		//maxDate: "+1Y +1M +1D",//今天之后的天数
	});
	$( "#datepicker" ).datepicker( "option", "zh-CN");
	$( "#datepicker" ).datepicker('setDate', new Date());	//设置初始日期
});
 </script>
</head>
<body>

	<form action="admin!bookAdd.action" method="post" enctype="multipart/form-data">

		封面：<input type="file" name="photo" size="12"/><br>
		书名：<input type="text" name="book.name"/><br>
		价格：<input type="text" name="book.price"/><br>
		介绍：<input type="text" name="book.intro"/><br>
		作者：<input type="text" name="book.auther"/><br>
		出版社：<input type="text" name="book.press"/><br>
		出版日期：<input type="text" id="datepicker" name="book.pubdate"/><br>
		图书分类:  <select name="book.category.id">
							<s:iterator value="categoryList">
								<option value="<s:property value="id"/>"><s:property value="name"/></option>
							</s:iterator>
					   </select><br>
		<input type="submit" value="添加"/>
		
	</form><s:actionerror/>
	
</body>
</html>
