<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书搜索</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>图书搜索</div>
     
     	<s:iterator value="bookList">
     
			<div class="feat_prod_box">
				<div class="prod_img">
					<a href="detail.action?bookid=${id}">
						<img src="../${cover}" class="thumb_big" border="0"/>
					</a>
				</div>
				<div class="prod_det_box">
					<s:if test="special==true"><span class="special_icon"><img src="images/special_icon.gif"/></span></s:if>
					<s:if test="news==true"><span class="special_icon"><img src="images/new_icon.gif"/></span></s:if>
					<s:if test="sale==true"><span class="special_icon"><img src="images/promo_icon.gif"/></span></s:if>
					<div class="box_top"></div>
					<div class="box_center">
						<div class="prod_title"><a href="detail.action?bookid=${id}">${name}</a></div>
						<p class="details"><s:property value="intro.substring(0,(intro.length()>70?70:intro.length()))+'...'"/></p>
						<a href="detail.action?bookid=${id}" class="more">- 图书详情 -</a>
						<div class="clear"></div>
					</div>
					<div class="box_bottom"></div>
				</div>
				<div class="clear"></div>
			</div>
		
		</s:iterator>
     
	    <!-- 分页 -->
		${pageTool}
		
		<div class="clear"></div>
	
	</div>
   
   	<s:action name="/book/index!right" executeResult="true"/>
   
	<div class="clear"></div>
	
</div>

<jsp:include page="footer.jsp"/>

</div>

</body>
</html>