<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow: hidden;
}
-->
</style>
<style>
.navPoint {
	COLOR: white;
	CURSOR: hand;
	FONT-FAMILY: Webdings;
	FONT-SIZE: 9pt
}
</style>
<script>
function switchSysBar(){ 
	var locate=location.href.replace('center.html','');
	var ssrc=document.all("img1").src.replace(locate,'');
	if (ssrc=="images/main_18.gif"){ 
		document.all("img1").src="images/main_18_1.gif";
		document.all("frmTitle").style.display="none";
	} 
	else{ 
		document.all("img1").src="images/main_18.gif";
		document.all("frmTitle").style.display="";
	} 
} 
</script>
</head>

<body>
	<input type="hidden" id="emp_input" value="${emp.type}"/>
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0" style="table-layout: fixed;">
		<tr>
			<td width="173" id="frmTitle" noWrap align="center" valign="top" height="100%">
				<iframe src="left.jsp" name="leftFrame" id="frame_left" height="500" width="180" frameborder="0" scrolling="no">
					浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
			</td>
			<td width="8" valign="middle" background="images/main_12.gif" onclick="switchSysBar()">
				<span class="navPoint"><img src="images/main_18.gif" name="img1" width="8" height="52" id="img1"></span>
			</td>
			<td align="center" valign="top">
				<iframe src="right.jsp" name="rightFrame" height="500" width="100%" frameborder="0">
					浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
			</td>
			<td width="4" align="center" valign="top" background="images/main_20.gif">
			</td>
		</tr>
	</table>
</body>
</html>