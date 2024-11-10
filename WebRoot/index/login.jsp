<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif"/></span>用户登录</div>

		<div class="feat_prod_box_details">
		
			<div class="contact_form">
				<div class="form_subtitle">用户登录</div>
				<s:actionmessage/>
				<form action="user!login.action" method="post">
					<div class="form_row">
						<label class="contact"><strong>用户:</strong></label>
						<input type="text" name="user.username" class="contact_input" />
					</div>
					<div class="form_row">
						<label class="contact"><strong>密码:</strong></label>
						<input type="password" name="user.password" class="contact_input" />
					</div>
					<div class="form_row"></div>
					<div class="form_row">
						<input type="submit" class="register" value="登录" style="margin-right:10px"/>
						<a href="register.action" style="float:right;margin:8px">没有账户? 点击注册</a>
					</div>
				</form>
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