<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>历史</title>
<link rel="shortcut icon" href="/static/icon/robot.jpg"/>
<script src="/webjars/jquery/2.1.1/jquery.min.js"></script> 
<script src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
<link type="text/css" href="/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
</head>
<div class="container">
	<div class="row clearfix">
		<br/>
		<div class="col-md-12 column">
			<jsp:include page="nav.jsp"></jsp:include>

			<div class="row clearfix">
				<div class="col-md-12 column">
					<div role="form" class="form-inline">
						<div class="form-group">
							 <input id="keyWord" type="text" class="form-control" name="keyWord" placeholder="关键词"/>
						</div>
						<div class="form-group">
						        <div class='col-sm-12'>
						            <div class="form-group">
						                <div class='input-group date' id='datetimepicker1'>
						                    <input type='text' id="month" name="month" class="form-control" placeholder="月份" />
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
						            </div>
						        </div>
						        <script type="text/javascript">
						            $(function () {
						                $('#datetimepicker1').datetimepicker({
						                   locale:"zh-cn",
						                   viewMode: 'months',
						                   format: 'YYYY-MM'
						                });
						            });
						        </script>
						</div>
						<button onclick="getItemsByCondition()" type="submit" class="btn btn-success glyphicon glyphicon-search">查询</button>
					</div>
				
					<table id="data_table" class="table table-striped table-hover table-condensed">
						<thead>
							<tr>
								<th>日期</th>
								<th>明细</th>
								<th>金额</th>
								<th>类别</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody >
	                    	<c:forEach items="${result}" var="c">
								<tr class="">
									<%-- <td>${c.id}</td> --%>
									<td>${c.occurDate}</td>
									<td>${c.note}</td>
									<td>${c.amount}</td>
									<td>${c.category.categoryName}</td>
									<td>
										<a class="btn btn-warning btn-sm"  data-toggle="modal" data-target="#edit_modal" onclick="toEdit(${c.id}, ${c.category.categoryId})">
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
	</div>
</div>
</html>

<jsp:include page="confirm_del.jsp"></jsp:include>
<jsp:include page="edit_modal.jsp"></jsp:include>

<script type="text/javascript">

	// 根据keyword/month查询items
	function getItemsByCondition(){
		var keyWord = $("#keyWord").val();
		var month = $("#month").val();
 		$("#data_table").load("/history/consumption-details?keyWord=" + keyWord + "&month=" + month, function(response,status,xhr) {
 			// alert(response);  //callback function
		});
	}

	// 确认删除？
	function confirmDel(id) {
		$("#itemId").val(id);
		$('#confirmDel').modal();  	
	}
	// 删除
	function delItem() {
		var id = $('#itemId').val();  		
		var keyWord = $("#keyWord").val();
		var month = $("#month").val();		
		$.ajax({
			type: "delete",
			url: "/history/consumption-details/" + id,
			//dataType: "json",
			//contentType: "application/json; charset=utf-8",
			success: function (result) {
				// 添加后刷新页面
		 		$("#data_table").load("/history/consumption-details?keyWord=" + keyWord + "&month=" + month, function(response,status,xhr) {
				});
	  		},
			error: function (result){
				alert("Failed to delete item.");
			}
		});		
	}

	// 弹出编辑框
	function toEdit(id, categoryIdselected) {
		// 填充日期，明细，金额，
		$.ajax({
			type: "GET",
			url: "/history/consumption-details/" + id,
			//dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (result) {
				$("#edit_id").val(id);
				$("#edit_occurDate").val(result.occurDate);
				$("#edit_note").val(result.note);
				$("#edit_amount").val(result.amount);
				//$("#edit_catetoryName").empty().append("<option selected=\"selected\" value="+ result.category.categoryId +">"+ result.category.categoryName +"</option>");
	  		},
			error: function (result){
				alert("Failed");
			}
		});
		// 填充类别
		$.ajax({
			type: "GET",
			url: "/sys-config/categories",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (result) {
				$("#edit_catetoryName").empty();
				for (var one in result) {
					var categoryId = result[one].categoryId;
					var categoryName = result[one].categoryName;
					if (categoryIdselected == categoryId) {
						$("#edit_catetoryName").append("<option selected=\"selected\"  value="+categoryId+">"+categoryName+"</option>");
					} else {
						$("#edit_catetoryName").append("<option value="+categoryId+">"+categoryName+"</option>");
					}
				}
			},
			error: function (result){
				alert("Failed to get categories.");
			}
		});
	}
	
	// 保存修改
	function saveEdited() {
		var keyWord = $("#keyWord").val();
		var month = $("#month").val();				
		var data;
		var _id = $("#edit_id").val();
		var _occurDate = $("#edit_occurDate").val();
		var _note = $("#edit_note").val();
		var _amount = $("#edit_amount").val();
		var _categoryId = $("#edit_modal select").val();
		if ($.trim(_occurDate) != "" && $.trim(_note) != "" && $.trim(_amount) != "" && $.trim(_categoryId) != "") {
			data = {id:_id, occurDate:_occurDate, note:_note, amount:_amount, category:{categoryId:_categoryId}};
		}
		var data_str = JSON.stringify(data);		
		$.ajax({
			type: "PUT",
			url: "/history/consumption-details/" + _id,
			data: data_str,
			contentType: "application/json; charset=utf-8",
			success: function (result) {
				if (result == "INVALID") {
					alert("Invalid Input.")
				} else {
					// 刷新页面
			 		$("#data_table").load("/history/consumption-details?keyWord=" + keyWord + "&month=" + month, function(response,status,xhr) {
					});
				}
	  		},
			error: function (result) {
				alert("Failed to update item.");
			}
		});		
	}
</script>