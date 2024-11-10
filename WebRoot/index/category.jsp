<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书分类</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>图书分类</div>

		<div class="new_products">
		
			<s:iterator var="book" value="bookList">
			
				<div class="new_prod_box"> <a href="details.htm">${name}</a>
					<div class="new_prod_bg">
						<s:if test="special==true"><span class="new_icon"><img src="images/special_icon.gif"/></span></s:if>
						<s:if test="news==true"><span class="new_icon"><img src="images/new_icon.gif"/></span></s:if>
						<s:if test="sale==true"><span class="new_icon"><img src="images/promo_icon.gif"/></span></s:if>
						<a href="detail.action?bookid=${id}"><img src="../${cover}" class="thumb" border="0" /></a>
					</div>
				</div>
				
			</s:iterator>
			
			
			<!-- 分页 -->
			${pageTool}
			
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