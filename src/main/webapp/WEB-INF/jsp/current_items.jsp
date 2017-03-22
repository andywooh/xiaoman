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
						<button id="jiyibi" type="button"  class="btn btn-warning glyphicon glyphicon-plus" data-toggle="modal" data-target="#myModal">记一笔</button>
					</form>
				
					<table class="table table-striped table-hover table-condensed">
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
							<tr>
								<td class="col-md-1">20170201</td>
								<td class="col-md-2">地铁</td>
								<td class="col-md-1">100</td>
								<td class="col-md-1">交通</td>
								<td class="col-md-2">
									<a href="#" class="btn btn-warning btn-sm">
										<span class="glyphicon glyphicon-edit"></span> 
		        					</a>   						
									<a href="#" class="btn btn-danger btn-sm">
										<span class="glyphicon glyphicon-trash"></span> 
		        					</a>
								</td>
							</tr>
							<tr class="success">
								<td>20170202</td>
								<td>晚饭</td>
								<td>100</td>
								<td>三餐</td>
								<td>
									<a href="#" class="btn btn-warning btn-sm">
										<span class="glyphicon glyphicon-edit"></span> 
		        					</a>   						
									<a href="#" class="btn btn-danger btn-sm">
										<span class="glyphicon glyphicon-trash"></span> 
		        					</a>
								</td>						
							</tr>
							<tr>
								<td>20170203</td>
								<td>地铁</td>
								<td>100</td>
								<td>交通</td>
								<td>
									<a href="#" class="btn btn-warning btn-sm">
										<span class="glyphicon glyphicon-edit"></span> 
		        					</a>   						
									<a href="#" class="btn btn-danger btn-sm">
										<span class="glyphicon glyphicon-trash"></span> 
		        					</a>
								</td>						
							</tr>					
						</tbody>
					</table>		
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form action="#">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
		<div>
			   <br/>
			<tr>
			   <td>
								<div class='col-sm-6'>
						            <div class="form-group">
						                <div class='input-group date' id='datetimepicker1'>
						                    <input type='text' class="form-control" placeholder="日期" />
						                    <span class="input-group-addon add-on">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
						            </div>
						        </div>
						        <script type="text/javascript">
						            $(function () {
						                $('#datetimepicker1').datetimepicker({
						                   locale:"zh-cn",
						                   format: 'YYYY-MM-DD'
						                });
						            });
						        </script>
				</td>
			</tr>
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th>明细</th>
						<th>金额</th>
						<th>类别</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody >
				<c:forEach var="i" begin="1" end="5"> 
					<tr>
						<td><input type="text" class="form-control" placeholder="明细" aria-describedby="sizing-addon2"></td>
						<td><input type="text" class="form-control" placeholder="金额" aria-describedby="sizing-addon2"></td>
						<td>
							<select class="form-control">
								<option>三餐</option>
								<option>交通</option>
							</select>
						</td>
						<td><input type="button" onclick="deletePanel(this)" value="-" /></td>
					</tr>
					</c:forEach>
					<tr id="addPanel">
						<td colspan="5" align="right">
							<div>
							    <button onclick="addPanel()" type="button" class="btn  btn-info btn-sm"><span class="glyphicon glyphicon-plus"></span></button>
							</div>
						</td>
					</tr>
				<tbody>
			</table>					
		</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="submmit" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
	</form>
</div>




</html>

<script type="text/javascript">
	function addPanel(){
		var html = "<tr>"+
		"<td><input type=\"text\" class=\"form-control\" placeholder=\"明细\" aria-describedby=\"sizing-addon2\"></td>"+
		"<td><input type=\"text\" class=\"form-control\" placeholder=\"金额\" aria-describedby=\"sizing-addon2\"></td>"+
		"<td><input type=\"text\" class=\"form-control\" placeholder=\"类别\" aria-describedby=\"sizing-addon2\"></td>"+
		"<td><input type=\"button\"  onclick=\"deletePanel(this)\"  value=\"-\"/></td>"+
		"</tr>";
		$("#addPanel").before(html);
	}
	
	function deletePanel(target){
		$(target).parents("tr").remove();
	}

	$(function (){
	$("#jiyibi").click(function () {
	      $.ajax({
	        type: "GET",
	        url: "/sys-config/categories",  /* 注意后面的名字对应CS的方法名称 */
	        //data: "{\"param1\":\"8888\",\"param2\":\"参数2\"}", /* 注意参数的格式和名称 */
	    //    dataType: "json", 
	        contentType: "application/json; charset=utf-8",
	        success: function (result) {
	         var data1 = jQuery.parseJSON('{\"1\":\"jiaotong\", \"2\":\"qita\"}');  /*这里是否解析要看后台返回的数据格式，如果不返回表名则无需要 parseJSON */
	          alert(data1);
	          
	        },
	        error: function (result){
	        	alert("error");
	        }
	      });
	    });      
	});
	
</script>