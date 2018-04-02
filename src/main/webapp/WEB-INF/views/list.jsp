<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
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
							<li><a href="./main.jsp">首页</a></li>
						</ul>
						</nav>
					</div>
				</div>

				<div class="inner cover">
					<h1 class="cover-heading">SSM框架学习</h1>
					<p class="lead">用户列表.</p>
					<table class="table table-text" id="users_table">
						<thead>
							<tr>
								<th>系统ID</th>
								<th>用户名</th>
								<th>密码</th>
								<th>手机</th>
								<th><a class="a">操作</a></th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					<!-- 分页文字信息 -->
					<div class="col-xs-6" id="page_info_area"></div>
					<!-- 分页条信息 -->
					<div class="col-xs-6" id="page_nav_area"></div>
				</div>

				<div class="mastfoot">
					<div class="inner">
						<p>版权所有：cn.ltuz.</p>
					</div>
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
	var totalRecode, currentPage;

	//1、页面加载完成以后，直接去发送一个ajax请求，要到分页数据
	$(function() {
		to_page(1)
	});

	function to_page(pn) {
		$.ajax({
			url : "${APP_PATH}/users",
			data : "pn=" + pn,
			type : "GET",
			success : function(result) {
				console.log(result);
				//1、解析并显示员工数据
				build_users_table(result);
				//2、解析并显示分页数据
				build_page_info(result);
				//3、解析并显示分页条数据
				build_page_nav(result);
			}
		});
	}

	//构建用户数据表格
	function build_users_table(result) {
		//清空table表格
		$("#users_table tbody").empty();
		var users = result.extend.pageInfo.list;
		$.each(users,
				function(index, item) {

					var sysIdTd = $("<td></td>").append(item.id);
					var loginNameTd = $("<td></td>").append(item.loginName);
					var passwordTd = $("<td></td>").append(item.password);
					var phoneTd = $("<td></td>").append(item.phone);

					/* var delBtn = $("<button></button>").addClass(
							"btn btn-danger btn-sm delete_btn").append(
							$("<span></span>").addClass("glyphicon glyphicon-trash"))
							.append("删除"); */
					var delBtn = $("<a></a>").addClass("delete_btn a-tag")
							.append("删除");

					//为删除按钮添加一个自定义的属性，来表示当前员工id
					delBtn.attr("del-id", item.id);

					var btnTd = $("<td></td>").append(delBtn);

					$("<tr></tr>").append(sysIdTd).append(loginNameTd).append(
							passwordTd).append(phoneTd).append(btnTd).appendTo(
							"#users_table tbody");
				});
	}

	//解析显示分页信息
	function build_page_info(result) {

		$("#page_info_area").empty();

		$("#page_info_area").append(
				"当前" + result.extend.pageInfo.pageNum + "页，总"
						+ result.extend.pageInfo.pages + "页，总"
						+ result.extend.pageInfo.total + "条记录");
		totalRecode = result.extend.pageInfo.total;
		currentPage = result.extend.pageInfo.pageNum;
	}

	//解析显示分页条
	function build_page_nav(result) {

		$("#page_nav_area").empty();

		//page_nav_area
		var ul = $("<ul></ul>").addClass("pagination pagination-sm")

		var firstPageLi = $("<li></li>").append(
				$("<a></a>").append("首页").attr("href", "#"));

		var prePageLi = $("<li></li>").append(
				$("<a></a>").append("&laquo;").attr("href", "#"));

		if (result.extend.pageInfo.hasPreviousPage == false) {
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		} else {
			//为元素添加点击翻页事件
			firstPageLi.click(function() {
				to_page(1);
			});

			prePageLi.click(function() {
				to_page(result.extend.pageInfo.pageNum - 1);
			});
		}

		//添加首页和前一页的提示
		ul.append(firstPageLi).append(prePageLi);

		//遍历给ul中添加页码提示
		$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {

			var numLi = $("<li></li>").append(
					$("<a></a>").append(item).attr("href", "#"));
			if (result.extend.pageInfo.pageNum == item) {
				numLi.addClass("active");
			}
			numLi.click(function() {
				to_page(item);
			});
			ul.append(numLi);
		});

		var nextPageLi = $("<li></li>").append(
				$("<a></a>").append("&raquo;").attr("href", "#"));

		var lastPageLi = $("<li></li>").append(
				$("<a></a>").append("末页").attr("href", "#"));

		if (result.extend.pageInfo.hasNextPage == false) {
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		} else {
			//为元素添加点击翻页事件
			nextPageLi.click(function() {
				to_page(result.extend.pageInfo.pageNum + 1);
			});

			lastPageLi.click(function() {
				to_page(result.extend.pageInfo.pages);
			});
		}

		//添加下一页和末页的提示
		ul.append(nextPageLi).append(lastPageLi);

		//把ul加入到nav			
		var navEle = $("<nav></nav>").append(ul);

		navEle.appendTo("#page_nav_area")
	}

	//单个删除
	$(document).on("click", ".delete_btn", function() {

		//弹出是否确认删除对话框
		var loginName = $(this).parents("tr").find("td:eq(1)").text();
		var id = $(this).attr("del-id");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		if (confirm("确认删除[" + loginName + "]吗？")) {
			//确认，发送ajax请求删除
			$.ajax({
				url : "${APP_PATH}/user/" + id,
				type : "DELETE",
				success : function(result) {
					alert(result.msg);
					//回到本页
					to_page(currentPage);
				}
			});
		}
	});
</script>
</html>