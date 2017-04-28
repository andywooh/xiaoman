<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table id="data_table_tmp" class="table table-striped table-hover table-condensed">
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
					<a href="#" class="btn btn-danger btn-sm"  onclick="delItem(${c.id})">
						<span class="glyphicon glyphicon-trash"></span>
      					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>