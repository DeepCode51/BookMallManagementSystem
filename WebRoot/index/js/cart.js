/**
 * 加入购物车
 */
function buy(bookid){
	$.post("buy.action", {bookid:bookid}, function(data){
		if(data=="ok"){
			location.reload();
		}else if(data=="login"){
			alert("请登录后购买!");
			location.href="login.jsp";
		}else{
			alert("请求失败!");
		}
	});
}
/**
 * 购物车减去
 */
function lessen(bookid){
	$.post("lessen.action", {bookid:bookid}, function(data){
		if(data=="ok"){
			location.reload();
		}else if(data=="login"){
			alert("请登录后操作!");
			location.href="login.jsp";
		}else{
			alert("请求失败!");
		}
	});
}
/**
 * 购物车删除
 */
function deletes(bookid){
	$.post("delete.action", {bookid:bookid}, function(data){
		if(data=="ok"){
			location.reload();
		}else if(data=="login"){
			alert("请登录后操作!");
			location.href="login.jsp";
		}else{
			alert("请求失败!");
		}
	});
}