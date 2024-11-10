<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
<title>我的订单</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>我的订单</div>
		
		<div class="feat_prod_box_details">
		
			<s:if test="indentList != null">
			
				<s:iterator value="indentList">
			
					<table class="cart_table">
					
						<tr>
		          			<td colspan="3">下单时间: <s:date name="systime" format="yyyy-MM-dd HH:mm:ss"/></td>
				            <td class="cart_total"><span class="red">总价: </span></td>
				            <td><s:property value="total"/></td>
		          		</tr>
					
						<s:iterator value="itemList">
							<tr class="cart_title">
								<td>
									<a href="detail.action?bookid=${book.id}">
										<img src="../${book.cover}" class="thumb" border="0"/>
									</a>
								</td>
								<td>${book.name}</td>
								<td>${book.price}</td>
								<td>${amount}</td>
								<td>${total}</td>
								<td>
 									<%-- <a href="delete.action?bookid=${book.id}">[删除22]</a> --%>
									<%-- <a href="javascript:deletes(${book.id});">[删除]</a> --%>
								</td>
							</tr>			
						</s:iterator>
						
		        	</table><br>
		        	
		        </s:iterator>
	        	
			</s:if>
			
			 <s:actionmessage/>
		
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