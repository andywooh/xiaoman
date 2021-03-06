<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>

	.bs-example-bg-classes p {
	    padding: 10px;
	    font-size: 20px;
	}

	.bs-example-bg-classes1 p {
	    padding: 7px;
	    font-size: 15px;
	}	

</style>

<html>

<head>
<title>小满</title>
<link rel="shortcut icon" href="/static/icon/robot.jpg"/>
<script src="/webjars/jquery/2.1.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/webjars/bootstrap-paginator/1.0.2/src/bootstrap-paginator.js"></script>
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
					<div role="form" class="form-inline">
						<div class="form-group">
							 <input id="keyWord" type="text" name="keyWord" class="form-control" id="exampleInputEmail1" placeholder="关键词"/>
						</div>
						<button onclick="currentItemsByKeyword()" type="submit" class="btn btn-success glyphicon glyphicon-search">查询</button>
						<button id="jiyibi" type="button"  class="btn btn-warning glyphicon glyphicon-plus" data-toggle="modal" data-target="#add_modal">记一笔</button>

					</div>
					<br id="data_table_below table-hover table-condensed"/>
					<div id="data_table">
						
						<div class="bs-example-bg-classes1">
							<p class="bg-success">目前总计：<fmt:formatNumber value="${totalAmount}" pattern=""/></p>
						</div>	

						<br/>				
						<table id="" class="table table-striped table-hover table-condensed">
							<thead>
								<tr>
									<th>日期</th><th>明细</th><th>金额</th><th>类别</th><th>操作</th>
								</tr>
							</thead>
							<tbody>
		                    	<c:forEach items="${result}" var="c">
									<tr class="">
										<%-- <td>${c.id}</td> --%>
										<td>${c.occurDate}</td>
										<td>${c.note}</td>
										<td><fmt:formatNumber value="${c.amount}" /></td>
										
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
	
						<ul class="pagination">
							<c:forEach var="i" begin="1" end="${page.totalPage}">
								<li><a href="#" onclick="toPage(${i})">${i}</a></li>
							</c:forEach>
						</ul>
						
						<br/>
						
						<div class="bs-example-bg-classes">
							<p class="bg-success">当月统计</p>
						</div>
						
						<table id="" class="table table-striped table-hover table-condensed">
								<thead>
									<tr>
										<th>类别</th>
										<th>总计</th>
									</tr>
								</thead>
								<tbody >
			                    	<c:forEach items="${currentStatistics}" var="c">
										<tr class="">
											<td>${c.categoryName}</td>
											<td><fmt:formatNumber value="${c.amount}" /></td>
										</tr>
									</c:forEach>
								</tbody>
						</table>						
					</div>
				</div>
				<!-- 图表区域 -->
				<div class="col-md-6 column">
				
					<div>
						<img width="80%" src="/static/image/template.jpg"/>
					</div>
					<br/>
				</div>
				
			</div>
		</div>
	</div>
</div>

<jsp:include page="add_modal.jsp"></jsp:include>
<jsp:include page="edit_modal.jsp"></jsp:include>
<jsp:include page="confirm_del.jsp"></jsp:include>


<div id="keyWord_tmp" style="display: none;"></div>

</html>

<script type="text/javascript">
	
	// 记一笔 添加一行
	function addPanel(){
		var html = "<tr class=\"mark\">" +
		"<td><input name=\"note\" type=\"text\" class=\"form-control\" placeholder=\"明细\" aria-describedby=\"sizing-addon2\"></td>"+
		"<td><input name=\"amount\" type=\"text\" class=\"form-control\" placeholder=\"金额\" aria-describedby=\"sizing-addon2\"></td>"+
		"<td><select name=\"catetory.catetoryId\" type=\"text\" class=\"form-control\" aria-describedby=\"sizing-addon2\"></td>"+
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
						var id = result[one].categoryId;
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
			url: "/current/consumption-details/" + id,
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
			url: "/current/consumption-details/" + _id,
			data: data_str,
			contentType: "application/json; charset=utf-8",
			success: function (result) {
				if (result == "INVALID") {
					alert("Invalid Input.")
				} else {
					// 刷新页面
			 		$("#data_table").load("/current/consumption-details?toFirstPage=yes", function(response,status,xhr) {
					});
				}
	  		},
			error: function (result) {
				alert("Failed to update item.");
			}
		});		
	}

	// 根据keyword查询item
//	function currentItemsByKeyword(id){
//		var keyWord = $("#keyWord").val();
// 		$("#data_table").load("/current/consumption-details?keyWord=" + keyWord, function(response,status,xhr) {
// 			// alert(response);  //callback function
//		});
//	}

	// 翻页
	function toPage(toPage){
		var url = "/current/consumption-details?toPage=" + toPage;
		var keyWord = $("#keyWord_tmp").val();
		if (keyWord != null) {
			url = url + "&keyWord=" + keyWord;
		}
		
 		$("#data_table").load(url, function(response,status,xhr) {
 			// alert(response);  //callback function
		});
	}
	// 根据keyword查询item
	function currentItemsByKeyword(){
		var keyWord = $("#keyWord").val();
		$("#keyWord_tmp").val(keyWord); // 每次查询后，将ketWord暂存，再给翻页使用。防止出现在搜索框任意输入keyWord，但没点击搜素时，再点击翻页会把keyWord带上
 		$("#data_table").load("/current/consumption-details?keyWord=" + keyWord, function(response,status,xhr) {
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
		var data_str = JSON.stringify(data);
		console.log(data_str);
		$.ajax({
			type: "post",
			//dataType: "text", //预期服务器的返回类型
			contentType: "application/json; charset=utf-8", //
			url: "/current/consumption-details",
			data: data_str,
			success: function (result) {
				if (result.info == "Invalid Input.") {
					alert("Invalid Input.")
				} else {
					// 刷新页面
			 		$("#data_table").load("/current/consumption-details?toFirstPage=yes", function(response,status,xhr) {
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

	// 构造JSON数据
	function buidJSON(){
		var _occurDate = $("#add_date").val();
		var docs = $("#add_table").children(":not(:last-child)"); // 去掉添加按钮的那一行
		var datas = [];
		
		$(".mark").each(function() { // class选择器
			var _note = $(this).find("input[name=note]").val();
			var _amount = $(this).find("input[name=amount]").val();
			var _categoryId = $(this).find("select").val();
			if ($.trim(_occurDate) != "" && $.trim(_note) != "" && $.trim(_amount) != "" && $.trim(_categoryId) != "-请选择-") {
				var data = {occurDate:_occurDate, note:_note, amount:_amount, category:{categoryId:_categoryId}};
				datas.push(data);
			}
		});
		//console.log((JSON.stringify(datas)));
		return datas;		
	}

	// 清空模态框中的数据
	function clearAddModal() {
		$("#add_date").val('');
	    $("#add_table").find("input[name=note]").val('');
	    $("#add_table").find("input[name=amount]").val('');
	}

	// 确认删除？
	function confirmDel(id) {
		$("#itemId").val(id);
		$('#confirmDel').modal();  	
	}
	// 删除
	function delItem() {
		var id = $('#itemId').val();  		
		
		$.ajax({
			type: "delete",
			url: "/current/consumption-details/" + id,
			//dataType: "json",
			//contentType: "application/json; charset=utf-8",
			success: function (result) {
				// 添加后刷新页面
		 		$("#data_table").load("/current/consumption-details?toFirstPage=yes", function(response,status,xhr) {
				});
	  		},
			error: function (result){
				alert("Failed to delete item.");
			}
		});		
	}
	
</script>
