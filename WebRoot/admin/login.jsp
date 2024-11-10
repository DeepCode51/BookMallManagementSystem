<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录后台管理</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow: hidden;
}
.STYLE3 {
	color: #528311;
	font-size: 12px;
}
.STYLE4 {
	color: #42870a;
	font-size: 12px;
}
-->
</style>

</head>

<body>
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		<tr><td bgcolor="#e5f6cf">&nbsp;</td></tr>
		<tr>
			<td height="608" background="images/login_03.gif">
				<table width="862" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr><td height="266" background="images/login_04.gif">&nbsp;</td></tr>
					<tr><td height="95">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="424" height="95" background="images/login_06.gif">&nbsp;</td>
						   	<td width="183" background="images/login_07.gif">
						   	
						   	
						<form action="admin!login.action" method="post" id="form_login">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="21%" height="30"><div align="center"><span class="STYLE3">用户</span></div></td>
									<td width="79%" height="30"><input type="text" name="admin.username" value="1" style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;"></td>
								</tr>
								<tr>
									<td height="30"><div align="center"><span class="STYLE3">密码</span></div></td>
									<td height="30"><input type="password" name="admin.password" value="1" style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;"></td>
								</tr>
								<tr>
									<td height="30">&nbsp;</td>
									<td height="30"><img src="images/dl.gif" width="81" height="22" border="0" usemap="#Map"></td>
								</tr>
							</table>
						</form>
		
		
							</td>
							<td width="255" background="images/login_08.gif">&nbsp;</td>
						</tr>
					</table></td>
					</tr>
					<tr><td height="247" valign="top" background="images/login_09.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr><td width="22%" height="30">&nbsp;</td>
								<td width="30%">&nbsp;</td>
								<td width="26%"><font color="red" size="2"><s:actionerror/></font></td>
								<td width="22%">&nbsp;</td>
							</tr></table></td></tr>
				</table></td>
		</tr>
		<tr><td bgcolor="#a2d962">&nbsp;</td></tr>
	</table>

	<map name="Map">
		<area shape="rect" coords="3,3,36,19" href="javascript:document.getElementById('form_login').submit();">
		<area shape="rect" coords="40,3,78,18" href="">
	</map>
</body>
</html>
