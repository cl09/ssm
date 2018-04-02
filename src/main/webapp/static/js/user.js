$(function(){
	//点击登录按钮弹出模态框
	$("#login_btn").click(function() {
		//清除表单数据
		rest_form("#loginModal form");
		//$("#empAddModal form")[0].reset();

		//弹出模态框
		$('#loginModal').modal({
			backdrop : "static"
		});
	});

	//点击注册按钮弹出模态框
	$("#reg_btn").click(function() {
		//清除表单数据
		rest_form("#regModal form");
		//$("#empAddModal form")[0].reset();

		//弹出模态框
		$('#regModal').modal({
			backdrop : "static"
		});
	});

	//清空表单样式及内容
	function rest_form(ele) {
		//清除表单数据
		$(ele)[0].reset();
		//清空表单样式
		//$(ele).find("*").removeClass("has-error has-success");
		//清空提示信息
		$(ele).find(".help-block").text("");
	}
});