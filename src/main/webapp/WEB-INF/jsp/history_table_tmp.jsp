<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<script src="/static/js/pagination.js"></script> 
</head>
<%-- <div class="">
	<table>
		<tbody>
			<tr class="label label-info">
				<td>当月总计：</td>
				<td id=""><fmt:formatNumber value="${totalAmount}" /></td>
			</tr>
		</tbody>
	</table>
</div>	 --%>	
<table id="data_table" class="table table-striped table-hover table-condensed">
	<thead>
		<tr>
			<th>日期</th><th>明细</th><th>金额</th><th>类别</th><th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${result}" var="c">
			<tr class="">
				<%-- <td >${c.id}</td> --%>
				<td>${c.occurDate}</td>
				<td>${c.note}</td>
				<td><fmt:formatNumber value="${c.amount}" /></td>
				<td>${c.category.categoryName}</td>
 				<td>
					<a href="#" class="btn btn-warning btn-sm"  data-toggle="modal" data-target="#edit_modal" onclick="toEdit(${c.id}, ${c.category.categoryId})">
						<span class="glyphicon glyphicon-edit"></span> 
					</a>   						
					<a href="#" class="btn btn-danger btn-sm"  onclick="confirmDel(${c.id})">
						<span class="glyphicon glyphicon-trash"></span>
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="pagination" style="text-align:center;" pagination="pagination_new" pagenumber="${page.currentPage}" totalpage="${page.totalPage}" ></div>

</br>
<div class="bs-example-bg-classes">
	<p class="bg-success">统计</p>
</div>

<table id="" class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th>类别</th>
				<th>总计</th>
			</tr>
		</thead>
		<tbody >
                 	<c:forEach items="${statistics}" var="c">
				<tr class="">
					<td>${c.categoryName}</td>
					<td><fmt:formatNumber value="${c.amount}" /></td>
				</tr>
			</c:forEach>
		</tbody>
</table>

<script type="text/javascript">
	function paginationClick(pagination_id){  
		var month = $("#month").val();	
	    var toPage = $('#'+pagination_id+'').attr('pagenumber');  
	    var totalPage = $('#'+pagination_id+'').attr('totalpage');  
	    //console.log('zmy通用分页测试：当前id：'+pagination_id+' , pagenumber:'+pagenumber+' , totalpage:'+totalpage);
		var url = "/history/consumption-details?toPage=" + toPage + "&month=" + month;
		var keyWord = $("#keyWord_tmp").val();
		if (keyWord != null) {
			url = url + "&keyWord=" + keyWord;
		}
		
			$("#data_table").load(url, function(response,status,xhr) {
				// alert(response);  //callback function
		});        
	    
	}

</script>
