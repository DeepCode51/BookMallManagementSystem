<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

<div class="right_content">
	
	<s:if test="#session.indent!=null">
		<div class="cart">
			<div class="title">
				<a href="cart.action"><img src="images/cart.gif" alt="购物车" title="购物车"/></a>
			</div>
			<div class="home_cart_content">
					<span>共<s:property value="#session.indent.amount"/>本 | 总价: $<s:property value="#session.indent.total"/></span>
			</div>
			<s:if test="#session.indent!=null">
				<a href="cart.action" class="view_cart">查看购物车</a> 
			</s:if>
		</div>
	</s:if>

	
	<div class="title"><span class="title_icon"><img src="images/bullet3.gif"/></span>书店简介</div>
	<div class="about">
		<p>
			<img src="images/about.gif" class="right" /> 
			书店连续三年获得了新闻出版署举办“讲信誉、重服务”单位的光荣称号。 
			2000年12月被辽宁省文化市场办授予首家“全国音像制品正版销售单位”。 
			书店不仅是出版发行部门开拓图书市场，开通货源渠道的驿站， 
			更是广大读者朋友读书、选书、购书的最佳场所，傲然矗立在图书领域， 
			成为东北乃至更广大地域走向知识经济新时代的桥梁和纽带。 
		</p>
	</div>
	
	
	<div class="right_box">
	
		<div class="title"><span class="title_icon"><img src="images/bullet4.gif"/></span>优惠促销</div>
		
		<s:iterator var="special" value="saleList">
			<div class="new_prod_box"> <a href="detail.action?bookid=${id}">${name}</a>
				<div class="new_prod_bg">
					<span class="new_icon"><img src="images/promo_icon.gif"/></span> 
					<a href="detail.action?bookid=${id}"><img src="../${cover}" class="thumb" border="0" /></a>
				</div>
			</div>
		</s:iterator>

	</div>


	<div class="right_box">
	
		<div class="title"><span class="title_icon"><img src="images/bullet5.gif"/></span>图书分类</div>
		<ul class="list">
			<s:iterator var="category" value="categoryList">
				<li><a href="category.action?category=<s:property value="id"/>"><s:property value="name"/></a></li>
			</s:iterator>
		</ul>
		
	</div>
</div>
    
</body>
</html>