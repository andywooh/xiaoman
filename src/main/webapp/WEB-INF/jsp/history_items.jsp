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
			<jsp:include page="nav.jsp"></jsp:include>

			<div class="row clearfix">
				<div class="col-md-12 column">
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
						                   format: 'YYYY-MM'
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
									<a href="#" class="btn btn-warning btn-sm">
										<span class="glyphicon glyphicon-edit"></span> 
		        					</a>   						
									<a href="#" class="btn btn-danger btn-sm">
										<span class="glyphicon glyphicon-trash"></span> 
		        					</a>
								</td>
							</tr>
							<tr>
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
</html>