<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SSM框架</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/cover.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="${APP_PATH }/static/js/html5shiv.min.js"></script>
      <script src="${APP_PATH }/static/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div class="site-wrapper">

		<div class="site-wrapper-inner">

			<div class="cover-container">

				<div class="masthead clearfix">
					<div class="inner">
						<h3 class="masthead-brand">SSM框架</h3>
						<nav>
						<ul class="nav masthead-nav">
							<!-- <li>
								<button type="button" class="btn btn-default" id="login_btn">登
									录</button>
							</li>
							<li>
								<button type="button" class="btn btn-default" id="reg_btn">注册</button>
							</li> -->
							<li><a href="#" id="login_btn">登 录</a></li>
							<li><a href="#" id="reg_btn">注 册</a></li>
						</ul>
						</nav>
					</div>
				</div>

				<div class="inner cover">
					<h1 class="cover-heading">SSM框架学习</h1>
					<p class="lead">SSM框架-登录、注册、用户列表功能.</p>
				</div>

				<div class="mastfoot">
					<div class="inner">
						<p>版权所有：cn.ltuz.</p>
					</div>
				</div>

			</div>

		</div>

	</div>


	<!-- 登录模态框 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content modal-body">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">用户登录</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id ="info" action ="login">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" name="login_name" class="form-control"
									id="login_name_input" placeholder="用户名"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" name="password" class="form-control"
									id="login_password_input" placeholder="密码"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="modal_login_btn">登录</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 注册模态框 -->
	<div class="modal fade" id="regModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content modal-body">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">用户注册</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" name="loginName" class="form-control"
									id="reg_name_input" placeholder="用户名"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" name="password" class="form-control"
									id="reg_password_input" placeholder="密码"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">手机号码</label>
							<div class="col-sm-10">
								<input type="text" name="phone" class="form-control"
									id="reg_phone_input" placeholder="手机号码"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="modal_reg_btn">注册</button>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript"
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
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

	//用户登录
	$("#modal_login_btn").click(
					function() {
						//获取用户名
						var login_name = $("#login_name_input").val();
						//获取密码
						var password = $("#login_password_input").val();
						
						$("#info").submit();
/* 
						$.ajax({
									url : "${APP_PATH}/login/",
									data : "login_name=" + login_name
											+ "&password=" + password,
									type : "POST",
									success : function(result) {
										//console.log(result);
										//code=100：成功；code=200：失败
										//if (result.code == 200) {
										//	alert("登录失败！用户名或密码错误！");
										//} else {
											//console.log("8888888"+result);
											//alert("登录成功！");
											//window.location.href = "list.jsp";
										//}
									}
								}); */
					});

	//用户注册
	$("#modal_reg_btn")
			.click(
					function() {

						var data = $("#regModal form").serialize();
						//console.log($("#regModal form").serialize());
						$
								.ajax({
									url : "${APP_PATH}/reg",
									data : data,
									type : "POST",
									success : function(result) {
										if (result.code == 100) {
											//注册成功
											alert("注册成功！");
											//1、关闭模态框
											$('#regModal').modal('hide');

										} else {
											//显示失败信息
											//console.log(result);
											//有哪个字段的错误信息就显示哪个字段的
											if (undefined != result.extend.errorFields.loginName) {
												//显示用户名错误信息
												show_validate_msg(
														"#reg_name_input",
														"error",
														result.extend.errorFields.loginName);
											}
											if (undefined != result.extend.errorFields.password) {
												//显示密码错误信息
												show_validate_msg(
														"#reg_pasword_input",
														"error",
														result.extend.errorFields.password);
											}
										}
									}
								});
					});
	
</script>
</html>