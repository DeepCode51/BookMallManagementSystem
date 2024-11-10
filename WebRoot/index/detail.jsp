<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/book.js"></script>
<title>图书详情</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>${book.name}</div>
		<div class="feat_prod_box_details">
			<div class="prod_img">
				<img src="../${book.cover}" class="thumb_big" border="0" />
			</div>
			<div class="prod_det_box">
				<div class="box_top"></div>
				<div class="box_center">
					<div class="prod_title">${book.name}</div>
					<p class="details"><s:property value="book.intro.substring(0,(intro.length()>70?70:intro.length()))+'...'"/></p>
					<div class="price"><strong>价格:</strong> <span class="red">$${book.price}</span></div>
					<div style="text-align: right;margin-right:11px;margin-top:-20px">
						<a href="javascript:void(0);" onclick="buy(${book.id})">
							<img src="images/button.png" width="150px"/>
						</a>
					</div>
					<div class="clear"></div>
				</div>
				<div class="box_bottom"></div>
			</div>
			<div class="clear"></div>
		</div>
		
		<div id="demo" class="demolayout">
		
			<ul id="demo-nav" class="demolayout">
				<li><a class="active">详细介绍</a></li>
				<!-- <li><a class="" href="javascript:alert('暂未实现');">相关推荐</a></li> -->
			</ul>
			<div class="tabs-container">
				<div style="display: block;" class="tab" id="tab1">
					<p class="more_details">${book.intro}</p>
					<ul class="list">
						<li><a href="">作者: ${book.auther}</a></li>
						<li><a href="">出版社: ${book.press}</a></li>
						<li><a href="">出版日期: ${book.pubdate}</a></li>
						<li><a href="">图片分类: ${book.category.name}</a></li>
					</ul>
				</div>
				<div style="display: none;" class="tab" id="tab2">
				<!-- 相关推荐 暂时不做
					<div class="new_prod_box"> <a href="details.htm">product name</a>
						<div class="new_prod_bg"> <a href="details.htm"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a> </div>
					</div>
					<div class="new_prod_box"> <a href="details.htm">product name</a>
						<div class="new_prod_bg"> <a href="details.htm"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a> </div>
					</div>
					<div class="new_prod_box"> <a href="details.htm">product name</a>
						<div class="new_prod_bg"> <a href="details.htm"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a> </div>
					</div>
					<div class="new_prod_box"> <a href="details.htm">product name</a>
						<div class="new_prod_bg"> <a href="details.htm"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a> </div>
					</div>
					<div class="clear"></div> -->
				</div>
			</div>
        
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