/**
 * 加入购物车
 */
function buy(bookid){
	$.post("buy.action", {bookid:bookid}, function(data){
		if(data=="ok"){
			location.reload();
		}else if(data=="login"){
			location.href="login.action";
		}else{
			alert("请求失败!");
		}
	});
}