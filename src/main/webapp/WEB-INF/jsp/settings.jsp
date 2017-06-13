<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>设置</title>
<link rel="shortcut icon" href="/static/icon/robot.jpg"/>
<script src="/webjars/jquery/2.1.1/jquery.min.js"></script> 
<script src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
<link type="text/css" href="/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
</head>
<div class="container" id="settings_page">
	<div class="row clearfix">
		<br/>
		<div class="col-md-12 column">
			<jsp:include page="nav.jsp"></jsp:include>
			<div class="text-right">
				<button id="tianjia" type="button" class="btn right btn-warning glyphicon glyphicon-plus" data-toggle="modal" data-target="#add_modal">添加</button>
			</div>
			<br/>
				<table id="settings_page_table" class="table table-striped table-hover table-condensed">
						<thead>
							<tr>
								<th>类别</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody >
	                    	<c:forEach items="${categories}" var="c">
								<tr class="">
									<td>${c.categoryName}</td>
									<td>
										<a class="btn btn-warning btn-sm"  data-toggle="modal" data-target="#edit_modal" onclick="toEdit(${c.id})">
											<span class="glyphicon glyphicon-edit"></span> 
			        					</a>   						
										<a class="btn btn-danger btn-sm" onclick="confirmDel(${c.id})">
											<span class="glyphicon glyphicon-trash"></span>
			        					</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
		</div>
	</div>
</div>
<div id="cid" style="display: none;"></div>
</html>

<jsp:include page="confirm_del.jsp"></jsp:include>
<jsp:include page="settings_edit_modal.jsp"></jsp:include>
<jsp:include page="settings_add_modal.jsp"></jsp:include>

<script type="text/javascript">

	// 确认删除？
	function confirmDel(id) {
		$("#cid").val(id);
		$('#confirmDel').modal();	
	}
	// 删除
	function delItem() {
		var c_id = $('#cid').val();  		

		$.ajax({
			type: "delete",
			url: "/sys-config/categories/" + c_id,
			//dataType: "json",
			//contentType: "application/json; charset=utf-8",
			success: function (result) {
				// 添加后刷新页面
		 		$("#settings_page_table").load("/sys-config?refresh=yes", function(response,status,xhr) {
				});
	  		},
			error: function (result) {
				alert("Failed to delete item.");
			}
		});		
	}
	
	// 添加记录
	function addCategory() {
		var _categoryName = $("#categoryName").val();
		var data = {categoryName:_categoryName};
		var data_str = JSON.stringify(data);
		$.ajax({
			type: "post",
			//dataType: "text", //预期服务器的返回类型
			contentType: "application/json; charset=utf-8", //
			url: "/sys-config/category",
			data: data_str,
			success: function (result) {
				if (result.info == "Invalid Input.") {
					alert("Invalid Input.")
				} else {
					// 刷新页面
			 		$("#settings_page_table").load("/sys-config?refresh=yes", function(response,status,xhr) {
					});
				}
	
			},
			error: function (result) {
				alert("Failed to add items.");
			}
		});
		clearAddModal();
		//$('#add_modal').modal('hide');
	}
	
	// 清空模态框中的数据
	function clearAddModal() {
		$("#categoryName").val('');
	}

	// 弹出编辑框
	function toEdit(id, categoryIdselected) {
		// 类别名称
		$.ajax({
			type: "GET",
			url: "/sys-config/category" + id,
			//dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (result) {
				$("#editCategoryName").val(categoryName);
	  		},
			error: function (result){
				alert("Failed");
			}
		});
	}
		


</script>