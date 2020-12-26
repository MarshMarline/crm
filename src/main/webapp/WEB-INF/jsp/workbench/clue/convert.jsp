﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String basePath = request.getScheme() + "://" +
request.getServerName() + ":" + request.getServerPort() +
request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>"/>
<meta charset="UTF-8">

<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>


<link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>

<script type="text/javascript">
	$(function(){
		$("#isCreateTransaction").click(function(){
			if(this.checked){
				$("#create-transaction2").show(200);
			}else{
				$("#create-transaction2").hide(200);
			}
			$("#flag").val($("#isCreateTransaction").prop("checked"));
		});

		$.ajax({
			type:'get',
			url:"workbench/clue/selectUserName.do",
			data:{"owner":"${clue.owner}"},
			success:function (res) {
				$("#show-owner").text(res)
			},
			error:errorfun
		});


         $("#serachActivities").click(function () {
			 $("#searchActivityModal").modal("show");
		 });

         $("#searchActivityModal").keydown(function (ev) {
			 if(ev.keyCode == 13){
				 $.ajax({
					 type:'get',
					 url:"workbench/clue/searchActivityName.do",
					 data:{"name":$("#getname").val()},
					 success:function (res) {
						 if(res != null && res != ""){
							 $("#shownull").text("");
							 var html = "";
							 $.each(res,function (i,n) {
								 html += '<tr>'
								 html += '<td><input type="radio" name="act" onclick="modalDismiss(\''+n.id+'\',\''+n.name+'\')"/></td>'
								 html += '<td>'+n.name+'</td>'
								 html += '<td>'+n.startDate+'</td>'
								 html += '<td>'+n.endDate+'</td>'
								 html += '<td>'+n.owner+'</td>'
								 html += '</tr>'
							 });
							 $("#activityTbody").html(html);
						 }else{
							 $("#shownull").text("null");
						 }
					 },
					 error:errorfun
				 });
				 return false;
			 }
		 });

		$(".time").datetimepicker({
			minView: "month",
			language:  'zh-CN',
			format: 'yyyy-mm-dd',
			autoclose: true,
			todayBtn: true,
			pickerPosition: "bottom-left"
		});

	});

	function errorfun() {
        alert("error");
    }

    function modalDismiss(id,name) {
        $("#searchActivityModal").modal("hide");
        $("#activity").val(name);
        $("#activityId").val(id);
    }
</script>

</head>
<body>
	
	<!-- 搜索市场活动的模态窗口 -->
	<div class="modal fade" id="searchActivityModal" role="dialog" >
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">搜索市场活动</h4>
				</div>
				<div class="modal-body">
					<div class="btn-group" style="position: relative; top: 18%; left: 8px;">
						<form class="form-inline" role="form">
						  <div class="form-group has-feedback">
						    <input type="text" class="form-control" style="width: 300px;" placeholder="请输入市场活动名称，支持模糊查询" id="getname">
						    <span class="glyphicon glyphicon-search form-control-feedback" id="shownull"></span>
						  </div>
						</form>
					</div>
					<table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
						<thead>
							<tr style="color: #B3B3B3;">
								<td></td>
								<td>名称</td>
								<td>开始日期</td>
								<td>结束日期</td>
								<td>所有者</td>
								<td></td>
							</tr>
						</thead>
						<tbody id="activityTbody">
							<%--<tr>
								<td><input type="radio" name="activity"/></td>
								<td>发传单</td>
								<td>2020-10-10</td>
								<td>2020-10-20</td>
								<td>zhangsan</td>
							</tr>
							<tr>
								<td><input type="radio" name="activity"/></td>
								<td>发传单</td>
								<td>2020-10-10</td>
								<td>2020-10-20</td>
								<td>zhangsan</td>
							</tr>--%>
						</tbody>
					</table>
				</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <%--因为是单选，所以我直接设置成选中就是确认了--%>
                    <%--<button type="button" class="btn btn-primary" id="selectActivityBtn">确认</button>--%>
				</div>
			</div>
		</div>
	</div>

	<form action="workbench/clue/convert.do" method="post">
	<div id="title" class="page-header" style="position: relative; left: 20px;">
		<h4>转换线索 <small>${clue.fullname}${clue.appellation}-${clue.company}</small></h4>
		<input type="hidden" name="clueId" value="${clue.id}">
	</div>
	<div id="create-customer" style="position: relative; left: 40px; height: 35px;">
		新建客户：${clue.company}
	</div>
	<div id="create-contact" style="position: relative; left: 40px; height: 35px;">
		新建联系人：${clue.fullname}${clue.appellation}
	</div>
	<div id="create-transaction1" style="position: relative; left: 40px; height: 35px; top: 25px;">
		<input type="checkbox" id="isCreateTransaction"/>
		为客户创建交易
	</div>
	<div id="create-transaction2" style="position: relative; left: 40px; top: 20px; width: 80%; background-color: #F7F7F7; display: none;" >
	
			<input type="hidden" name="flag" id="flag" value="false">
		  <div class="form-group" style="width: 400px; position: relative; left: 20px;">
		    <label for="amountOfMoney">金额</label>
		    <input type="text" class="form-control" id="amountOfMoney" name="money">
		  </div>
		  <div class="form-group" style="width: 400px;position: relative; left: 20px;">
		    <label for="tradeName">交易名称</label>
		    <input type="text" class="form-control" id="tradeName" value="" name="name">
		  </div>
		  <div class="form-group" style="width: 400px;position: relative; left: 20px;">
		    <label for="expectedClosingDate">预计成交日期</label>
		    <input type="text" class="form-control time" id="expectedClosingDate" name="expectedDate">
		  </div>
		  <div class="form-group" style="width: 400px;position: relative; left: 20px;">
		    <label for="stage">阶段</label>
		    <select id="stage"  class="form-control" name="stage">
		    	<c:forEach items="${stage}" var="s">
                    <option id="${s.id}">${s.value}</option>
                </c:forEach>
		    </select>
		  </div>
		  <div class="form-group" style="width: 400px;position: relative; left: 20px;">
		    <label for="activity">市场活动源&nbsp;&nbsp;<a href="javascript:void(0);" data-toggle="modal" style="text-decoration: none;" id="serachActivities"><span class="glyphicon glyphicon-search"></span></a></label>
		    <input type="text" class="form-control" id="activity" placeholder="点击上面搜索" readonly>
            <input type="hidden" id="activityId" name="activityId">
            <input type="hidden" name="createBy" value="${user.id}">
            <input type="hidden" name="source" value="${clue.source}">
            <input type="hidden" name="owner" value="${clue.owner}">
		  </div>

		
	</div>
	
	<div id="owner" style="position: relative; left: 40px; height: 35px; top: 50px;">
		记录的所有者：<br>
		<b id="show-owner">${clue.owner}</b>
	</div>
	<div id="operation" style="position: relative; left: 40px; height: 35px; top: 100px;">
		<input class="btn btn-primary" type="submit" value="转换">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="btn btn-default" type="button" value="取消" id="convertbtn">
	</div>
	</form>
</body>
</html>