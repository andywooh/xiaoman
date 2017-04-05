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
					<form role="form" class="form-inline">
						<div class="form-group">
							 <input type="text" class="form-control" id="exampleInputEmail1" placeholder="关键词"/>
						</div>
						
						<button type="submit" class="btn btn-success glyphicon glyphicon-search">查询</button>
						<button id="jiyibi" type="button"  class="btn btn-warning glyphicon glyphicon-plus" data-toggle="modal" data-target="#add_modal">记一笔</button>
					</form>
				
					<table class="table table-striped table-hover table-condensed">
						<thead>
							<tr>
								<th>日期</th><th>明细</th><th>金额</th><th>类别</th><th>操作</th>
							</tr>
						</thead>
						<tbody>
                    <c:forEach items="${result}" var="c">     
							<tr class="">
								<td>${c.occurDate}</td>
								<td>${c.note}</td>
								<td>${c.amount}</td>
								<td>${c.category.categoryName}</td>
								<td>
									<a href="#" class="btn btn-warning btn-sm"  data-toggle="modal" data-target="#edit_modal" onclick="toEdit(${c.id})">
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
		            for (var one in result)
		            {
		                var id = result[one].id;
		                var categoryName = result[one].categoryName;
		                $("table select:last").append("<option value="+id+">"+categoryName+"</option>");
		            }
		        },
		        error: function (result){
		        	alert("Failed to get categories.");
		        }
		      });
	}
	
	function deletePanel(target){
		$(target).parents("tr").remove();
	}

	$("#jiyibi").click(function () {
		
	      $.ajax({
		        type: "GET",
		        url: "/sys-config/categories",
		        dataType: "json",
		        contentType: "application/json; charset=utf-8",
		        success: function (result) {
		         //var data1 = JSON.stringify(result);  // Object --> String 
		            $("select").empty().append("<option>"+"-请选择-"+"</option>"); //empty()防止多次点击【记一笔】后，下拉框选项值重复
		            for (var one in result)
		            {
		                var id = result[one].id;
		                var categoryName = result[one].categoryName;
		                $("select").append("<option value="+id+">"+categoryName+"</option>");
		            }
		        },
		        error: function (result){
		        	alert("Failed to get categories.");
		        }
		      });
    });
	
	function toEdit(id) {
		alert(id); 
      $.ajax({
	        type: "GET",
	        url: "consumption-details/" + id,
	        //dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        success: function (result) {
	         //var data1 = JSON.stringify(result);  // Object --> String 
	        },
	        error: function (result){
	        	alert("Failed");
	        }
	      });
	}
</script>
