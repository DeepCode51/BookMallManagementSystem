<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
<title>购物车</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>我的购物车</div>
		
		<div class="feat_prod_box_details">
		
			<s:if test="#session.indent != null">
			
				<table class="cart_table">
				
					<s:iterator value="#session.indent.itemList">
						<tr class="cart_title">
							<td>
								<a href="detail.action?bookid=${book.id}">
									<img src="../${book.cover}" class="thumb" border="0"/>
								</a>
							</td>
							<td>${book.name}</td>
							<td>${book.price}</td>
							<td>x ${amount}</td>
							<td>${total}</td>
							<td>
								<a href="javascript:buy(${book.id});">[添加]</a>
								<a href="javascript:lessen(${book.id});">[减少]</a>
								<a href="javascript:deletes(${book.id});">[删除]</a>
							</td>
						</tr>			
					</s:iterator>
					
	          		<tr>
			            <td colspan="4" class="cart_total"><span class="red">总价: </span></td>
			            <td><s:property value="#session.indent.total"/></td>
	          		</tr>
	        	</table><br>
	        	
	        	<form action="save.action" method="post" id="form_save_order">
	        		<table class="cart_table">
	        			<tr>
		        			<td><input type="text" name="indent.name" value="${indent.name}" placeholder="收货人姓名" style="width:100px"/></td>
			        		<td><input type="text" name="indent.phone" value="${indent.phone}" placeholder="收货人电话" style="width:100px"/></td>
			        		<td><input type="text" name="indent.address" value="${indent.address}" placeholder="收货地址" style="width:180px"/></td>
		        		</tr>
	        		</table>
	        		
	        		<a href="javascript:$('#form_save_order').submit();" class="checkout">提交订单</a> 
	        		
	        	</form>
	        	
			
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