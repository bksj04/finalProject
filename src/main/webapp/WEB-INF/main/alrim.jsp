<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<%@ include file="./../common/common.jsp" %>
<style>
	div{
		background-color: blue;
		color: white;
	}
</style>
<div>알림창</div>

<table align="center">


	<c:if test="${empty lists}">
		<tr align="center">
			 <td>
			알림이 없습니다.</td>
		</tr>
	</c:if>
	<tr>
	<th>NO</th>
	<th>제목</th>
	<th>작성자</th>
	<th>답변일</th>
	</tr>
	<c:forEach var="cqb" items="${lists}">
	<tr>
	<td></td>
	<td>${cqb.subject }</td>
	<td>${cqb.writer }</td>
	<td>${cqb.reg_date }</td>
	</tr>
	</c:forEach>


</table>