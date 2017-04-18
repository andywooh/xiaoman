<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>当月</title>
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
				<!-- 数据录入 -->
				<div class="col-md-6 column">
					<div>
						<img width="80%" src="/static/image/template.jpg"/>
					</div>
					<br/>
				</div>
				
				<div class="col-md-6 column">
					<div role="form" class="form-inline">
						<div class="form-group">
							 <input id="keyWord" type="text" name="keyWord" class="form-control" id="exampleInputEmail1" placeholder="关键词"/>
						</div>
						
						<button onclick="currentItemsByKeyword()" type="submit" class="btn btn-success glyphicon glyphicon-search">查询</button>
						<button id="jiyibi" type="button"  class="btn btn-warning glyphicon glyphicon-plus" data-toggle="modal" data-target="#add_modal">记一笔</button>
					</div>
					<br id="data_table_below"/>
					<table id="data_table" class="table table-striped table-hover table-condensed">
						<thead>
							<tr>
								<th></th><th>日期</th><th>明细</th><th>金额</th><th>类别</th><th>操作</th>
							</tr>
						</thead>
						<tbody>
	                    	<c:forEach items="${result}" var="c">
								<tr class="">
									<td >${c.id}</td>
									<td>${c.occurDate}</td>
									<td>${c.note}</td>
									<td>${c.amount}</td>
									<td>${c.category.categoryName}</td>
									<td>
										<a href="#" class="btn btn-warning btn-sm"  data-toggle="modal" data-target="#edit_modal" onclick="toEdit(${c.id}, ${c.category.categoryId})">
											<span class="glyphicon glyphicon-edit"></span> 
			        					</a>   						
										<a href="#" class="btn btn-danger btn-sm">
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

<jsp:include page="add_modal.jsp"></jsp:include>
<jsp:include page="edit_modal.jsp"></jsp:include>

</html>

<script type="text/javascript">
	
	// 记一笔 添加一行
	function addPanel(){
		var html = "<tr>"+
		"<td><input type=\"text\" class=\"form-control\" placeholder=\"明细\" aria-describedby=\"sizing-addon2\"></td>"+
		"<td><input type=\"text\" class=\"form-control\" placeholder=\"金额\" aria-describedby=\"sizing-addon2\"></td>"+
		"<td><select type=\"text\" class=\"form-control\" aria-describedby=\"sizing-addon2\"></td>"+
		"<td><input type=\"button\"  onclick=\"deletePanel(this)\"  value=\"-\"/></td>"+
		"</tr>";
		$("#addPanel").before(html);
			$.ajax({
				type: "GET",
				url: "/sys-config/categories",
				dataType: "json", 
				contentType: "application/json; charset=utf-8",
				success: function (result) {
					//var data1 = JSON.stringify(result);  // Object --> String 
					$("table select:last").empty().append("<option>"+"-请选择-"+"</option>"); //empty()防止多次点击【记一笔】后，下拉框选项值重复
					for (var one in result) {
						var id = result[one].id;
						var categoryName = result[one].categoryName;
						$("table select:last").append("<option value="+id+">"+categoryName+"</option>");
					}
				},
				error: function (result) {
					alert("Failed to get categories.");
				}
			});
		}
	
	// 记一笔  删除一行
	function deletePanel(target){
		$(target).parents("tr").remove();
	}
	
	// 获取种类 
	$("#jiyibi").click(function () {
		$.ajax({
			type: "GET",
			url: "/sys-config/categories",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (result) {
				//var data1 = JSON.stringify(result);  // Object --> String 
				$("select").empty().append("<option>"+"-请选择-"+"</option>");//empty()防止多次点击【记一笔】后，下拉框选项值重复
				for (var one in result) { // one是result数组（list）的下标
					var categoryId = result[one].categoryId;
					var categoryName = result[one].categoryName;
					$("select").append("<option value="+categoryId+">"+categoryName+"</option>");
				}
			},
			error: function (result){
				alert("Failed to get categories.");
			}
		});
	})

	// 弹出编辑框
	function toEdit(id, categoryIdselected) {
		// 填充日期，明细，金额，
		$.ajax({
			type: "GET",
			url: "/consumption-details/" + id,
			//dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (result) {
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
						$("#edit_catetoryName").append("<option  selected=\"selected\"  value="+categoryId+">"+categoryName+"</option>");
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

	// 根据keyword查询item
	function currentItemsByKeyword(){
		var keyWord = $("#keyWord").val();
 		$("#data_table").load("/current/items?keyWord=" + keyWord, function(response,status,xhr) {
 			// alert(response);  //callback function
		});
/*  		$.ajax({
			type: "GET",
			url: "/current/items?keyWord=" + keyWord,
			//dataType: "json",
			//contentType: "application/json; charset=utf-8",
			success: function (result) {
				$("#data_table").remove();
				$("#data_table_tmp").remove(); //防止多次查询，页面重复添加查询到的数据
				$("#data_table_below").after(result);
			},
			error: function (result){
				alert(result);
			}
		});	 */
	}
	
	// 添加记录
	function addConsumptionDetail() {
		var data = buidJSON();
		$.ajax({
			type: "post",
			url: "/consumption-details",
			data: data,
			success: function (result) {

			},
			error: function (result){
				alert(result);
			}
		});
		// 添加后刷新页面
 		$("#data_table").load("/current/items?keyWord=" + "", function(response,status,xhr) {
		});
	}

	// 构造JSON数据
	function buidJSON(){
		var ocurrDate = $("#add_date").val();
		var docs = $("#add_table").children(":not(:last-child)"); // 去掉添加按钮的那一行
		for (var i=0; i<docs.length; i++) {
			var data = $("#note") + $("#amount") + $("#catetory.catetoryId") + $("#note");
			alert(data);
		}
		
	}
</script>
