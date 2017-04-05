<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 模态框 -->
<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
	<form class="bs-example bs-example-form" role="form">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel1"></h4>
				</div>

				<div class="input-group" >
					<span class="input-group-addon">日期</span>
					<input type="text" class="form-control" value="${cd.occurDate}">
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-addon">明细</span>
					<input type="text" class="form-control" value="${cd.note}">
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-addon">金额</span>
					<input type="text" class="form-control" value="${cd.amount}">
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-addon">类别</span>
					<select name="catetoryId"  class="form-control" /></select>
				</div>

			   <div class="modal-footer">
				    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				    <button type="submit" class="btn btn-primary">保存</button>
			   </div>
			</div>
		</div>
	</form>
</div>