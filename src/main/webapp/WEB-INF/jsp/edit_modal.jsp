<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 模态框 -->
<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form action="#" method="post">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
			   <br/>
			   
							<div class='col-sm-6'>
					            <div class="form-group">
					                <div class='input-group date' id='datetimepicker1'>
					                    <input name="date" type='text' class="form-control"/>
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
					        <br/>
		明细<input name="note" type="text"  aria-describedby="sizing-addon2"><br/>
		金额：<input name="amount" type="text" aria-describedby="sizing-addon2"><br/>
		类别<select name="catetoryId" /><br/>

	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="submmit" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
	</form>
</div>