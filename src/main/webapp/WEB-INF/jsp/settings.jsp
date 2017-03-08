<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
<title>设置</title>
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
				<table class="table table-striped table-hover table-condensed">
						<thead>
							<tr>
								<th>类别</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody >
							<tr>
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
</html>