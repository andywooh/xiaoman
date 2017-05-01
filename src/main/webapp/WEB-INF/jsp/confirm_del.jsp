<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 确认删除模态框 -->  
<div class="modal fade" id="confirmDel">  
	<div class="modal-dialog">  
		<div class="modal-content message_align">  
			<div class="modal-header">  
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
	        	<h4 class="modal-title">提示</h4>
			</div>  
			<div class="modal-body">  
				<p>确认删除？</p>  
			</div>  
			<div class="modal-footer">  
				<input type="hidden" id="itemId"/>  
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
				<a onclick="delItem()" class="btn btn-danger" data-dismiss="modal">确定</a>  
			</div>  
		</div>
	</div>
</div>