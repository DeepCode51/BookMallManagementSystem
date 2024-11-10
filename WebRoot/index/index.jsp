<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书店首页</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<!-- 精品推荐 -->
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>精品推荐</div>

		<s:iterator var="special" value="specialList">
		
			<div class="feat_prod_box">
				<div class="prod_img">
					<a href="detail.action?bookid=${id}"><img src="../${cover}" class="thumb_big"/></a>
				</div>
				<div class="prod_det_box">
					<div class="box_top"></div>
					<div class="box_center">
						<span class="special_icon"><img src="images/special_icon.gif"></span>
						<div class="prod_title">
							<a href="detail.action?bookid=${id}">${name}</a>
						</div>
						<p class="details"><s:property value="intro.substring(0,(intro.length()>70?70:intro.length()))+'...'"/></p>
						<a href="detail.action?bookid=${id}" class="more">- 图书详情 -</a>
						<div class="clear"></div>
					</div>
					<div class="box_bottom"></div>
				</div>
				<div class="clear"></div>
			</div>		
		
		</s:iterator>
		

		<!-- 最新出版 -->
		<div class="title"><span class="title_icon"><img src="images/bullet2.gif"/></span>最新出版</div>
		
		<div class="new_products">
		
			<s:iterator var="special" value="newList">
				<div class="new_prod_box"> 
					<a href="detail.action?bookid=${id}">${name}</a>
					<div class="new_prod_bg">
						<span class="new_icon"><img src="images/new_icon.gif"/></span>
						<a href="detail.action?bookid=${id}"><img src="../${cover}" class="thumb" border="0" /></a> 
					</div>
				</div>
			</s:iterator>
		
		</div>
		
		<div class="clear"></div>
	
	</div>
   
   	<s:action name="/book/index!right" executeResult="true"/>
   
	<div class="clear"></div>
	
</div>

<jsp:include page="footer.jsp"/>

</div>

</body>
</html>