<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
<title>明细</title>
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
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header" >
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					 	<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					 </button> 
					 <a class="navbar-brand" href="#">当月</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="#">历史</a>
						</li>
						<li>
							 <a href="#">统计</a>
						</li>
						<li>
							 <a href="#">统计</a>
						</li>						
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">其它<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>

			<div class="row clearfix">
				<div class="col-md-6 column">
					<form role="form" class="form-inline">
						<div class="form-group">
							 <input type="text" class="form-control" id="exampleInputEmail1" placeholder="关键词"/>
						</div>
						<div class="form-group">
						        <div class='col-sm-12'>
						            <div class="form-group">
						                <div class='input-group date' id='datetimepicker1'>
						                    <input type='text' class="form-control" placeholder="月份" />
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
						                   format: 'MM/YYYY'
						                });
						            });
						        </script>
						</div>
						<button type="submit" class="btn btn-success glyphicon glyphicon-search">查询</button>
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
									<a href="#" class="btn btn-info btn-sm">
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
									<a href="#" class="btn btn-info btn-sm">
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
									<a href="#" class="btn btn-info btn-sm">
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
		
				<!-- 数据录入 -->
				<div class="col-md-6 column">
					<div>
						<input type="text" class="form-control" placeholder="日期" aria-describedby="sizing-addon5">
						<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2">
						<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2">
						<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2">				
					</div>
					<br/>
					<div>
						<table class="table table-striped table-hover table-condensed">
							<thead>
								<tr>
									<th>日期</th>
									<th>明细</th>
									<th>金额</th>
									<th>类别</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody >
								<tr>
									<td><input type="text" class="form-control" placeholder="日期" aria-describedby="sizing-addon2"></td>
									<td><input type="text" class="form-control" placeholder="明细" aria-describedby="sizing-addon2"></td>
									<td><input type="text" class="form-control" placeholder="金额" aria-describedby="sizing-addon2"></td>
									<td><input type="text" class="form-control" placeholder="类别" aria-describedby="sizing-addon2"></td>
									<td><input type="button" onclick="deletePanel(this)" value="-" /></td>
								</tr>
								<tr id="addPanel">
									<td colspan="5" align="right"><input type="button" onclick="addPanel(this)" value="+" /></td>
								</tr>
							<tbody>
						</table>					
					</div>
				</div>
				<script type="text/javascript">
					function addPanel(){
						var html = "<tr>"+
						"<td><input type=\"text\" class=\"form-control\" placeholder=\"日期\" aria-describedby=\"sizing-addon2\"></td>"+
						"<td><input type=\"text\" class=\"form-control\" placeholder=\"明细\" aria-describedby=\"sizing-addon2\"></td>"+
						"<td><input type=\"text\" class=\"form-control\" placeholder=\"金额\" aria-describedby=\"sizing-addon2\"></td>"+
						"<td><input type=\"text\" class=\"form-control\" placeholder=\"类别\" aria-describedby=\"sizing-addon2\"></td>"+
						"<td><input type=\"button\" onclick=\"deletePanel(this)\" value=\"-\" /></td>"+
						"</tr>;";
						$("#addPanel").before(html);
					}
					function deletePanel(target){
						$(target).parents("tr").remove();
					}
				</script>
			</div>
		</div>
	</div>
</div>
</html>



