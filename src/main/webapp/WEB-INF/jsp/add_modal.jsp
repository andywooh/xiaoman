<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 模态框 -->
<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
		<div>
			<br/>
			<div class='col-sm-6'>
	            <div class="form-group">
	                <div class='input-group date' id='datetimepicker1'>
	                    <input id="add_date" name="occurDate" type='text' class="form-control" placeholder="日期" />
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
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th>明细</th>
						<th>金额</th>
						<th>类别</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody id="add_table">
					<c:forEach var="i" begin="1" end="5">
						<tr class="mark">
							<td><input name="note" type="text" class="form-control" placeholder="明细" aria-describedby="sizing-addon2"></td>
							<td><input name="amount" type="text" class="form-control" placeholder="金额" aria-describedby="sizing-addon2"></td>
							<td>
								<select name="catetory.catetoryId" class="form-control"></select>
							</td>
							<td><input type="button" onclick="deletePanel(this)" value="-" /></td>
						</tr>
					</c:forEach>
					<tr id="addPanel">
						<td colspan="5" align="right">
							<div>
								<button onclick="addPanel()" type="button" class="btn btn-info btn-sm">
							    	<span class="glyphicon glyphicon-plus"></span>
								</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>					
		</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button onclick="addConsumptionDetail()" type="submit" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
</div>