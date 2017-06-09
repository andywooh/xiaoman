<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 添加模态框 -->
<!-- <div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<form class="modal fade" id="add_modal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加类别</h4>
	      </div>
		<div>
			<br/>
			<table id="table" class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th>类别名称</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody id="add_table">
					<tr class="mark">
						<td><input id="categoryName" name="categoryName" type="text" class="form-control" placeholder="类别名称" aria-describedby="sizing-addon2"></td>
					</tr>
				</tbody>
			</table>					
		</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button onclick="addCategory()" type="submit" data-dismiss="modal" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
</form>
