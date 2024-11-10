<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<div class="header">

    <div class="logo">
	    <a href="index.action">
	    	<img src="images/logo.gif" border="0" /></a>
    </div>
    
    <div id="menu">
		<ul>
			<li <s:if test="flag==1">class="selected"</s:if>><a href="index.action">书店首页</a></li>
			<li <s:if test="flag==2">class="selected"</s:if>><a href="about.action">书店简介</a></li>
			<li <s:if test="flag==3">class="selected"</s:if>><a href="special.action">精品推荐</a></li>
			<li <s:if test="flag==4">class="selected"</s:if>><a href="new.action">最新出版</a></li>
			<li <s:if test="flag==5">class="selected"</s:if>><a href="sale.action">优惠促销</a></li>
			<s:if test="#session.username==null">
				<li <s:if test="flag==6">class="selected"</s:if>><a href="login.action">用户登陆</a></li>
				<li <s:if test="flag==7">class="selected"</s:if>><a href="register.action">用户注册</a></li>
				<li><a href="../admin/login.jsp" target="_blank">后台管理</a></li>
			</s:if>
			<s:else>
				<li><a href="order.action">我的订单(<s:property value="#session.username"/>)</a></li>
				<li><a href="user!logout.action">注销登录</a></li>
			</s:else>
			<li style="float: right; margin-right: 10px;">
				<form action="search.action" method="post" id="form_search">
					<input type="text" name="searchName" value="${searchName}" placeholder="输入图书名称" />
					<a href="javascript:void(0);" onclick="$('#form_search').submit()" style="float: right;margin-left:0">搜索</a>
				</form>
			</li>
		</ul>
    </div>
</div>

</body>
</html>