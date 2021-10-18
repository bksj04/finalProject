<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
adminPaymentList.jsp<br><br>

<%@include file="../admin/display/top.jsp"%>
<%@include file="./../common/common.jsp"%>

<script type="text/javascript">
	function videoInsert(){
		location.href="adminInsertVideo.category" ;
	}
	
	function goUpdate(mnum,pn){
		
		location.href="updateOrder.voucher?mnum="+mnum+"&pageNumber="+pn;
	}
	
</script>
<style>
#container {
	height: 600px;
}

#memberList {
	text-align: center;
	height: 100%;
	border: 1px solid black;
	padding: 100px;
}

table {
	margin: auto;
	text-align: center;
}
</style>
<div class="row" id="container">
	<div class="col-lg-2">
		<%@include file="../admin/display/left.jsp"%>
	</div>
	<div id="videoList" class="col-lg-10" align="center">
		<h2 style="color: #0080FF; font-weight: bold;">상품 구매자 리스트</h2>
		<form action="videoList.member" method="get">
			<select name="whatColumn">
				<option value="">전체 검색</option>
				<option value="id">번호</option>
				<option value="name">제목</option>
			</select> <input type="text" name="keyword"> <input type="submit"
				value="검색">
			<div align="right">
				<input type="button" class="btn btn-primary" value="게시물추가"
					onClick="videoInsert()">
			</div>
		</form>
		<table border="1" align="center" width="600" class="table">
			<thead class="table-light">

				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>가입일</th>
					<th>전화번호</th>
					<th>상품 번호</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty mlists }">
					<tr>
						<td colspan="7">데이터가 존재하지 않습니다</td>
					</tr>
				</c:if>
				<c:forEach var="mlist" items="${mlists }">
					
					<tr>
						<td>${mlist.num }</td>
						<td>${mlist.id }</td>
						<td>${mlist.password }</td>
						<td>${mlist.name }</td>
						<td>${mlist.regdate }</td>
						<td>${mlist.tel1 } - ${mlist.tel2 } - ${mlist.tel3 }</td>
						<td>
							<c:forEach var="olist" items="${olists }">
								<c:if test="${mlist.num eq olist.mnum }">
									${olist.mnum }
								</c:if>
							</c:forEach>
						</td>
						<td><input type="button" value="수정" 
						onclick="goUpdate(${mlist.num },${pageInfo.pageNumber})""></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${pageInfo.pagingHtml }
	</div>
</div>

