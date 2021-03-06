<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../admin/display/top.jsp"%>
<%@include file="./../common/common.jsp"%>

<script type="text/javascript">
	function videoInsert(){
		location.href="adminInsertVideo.category" ;
	}
	
	function goUpdate(num,pn){
		location.href="updateVideo.category?num="+num+"&pageNumber="+pn;
	}
	function goDelete(num,pn){
		 var result = confirm("삭제하시겠습니까 ?");
	        
	        if(result)
	        {
	        	location.href="deletevideo.category?num="+num+"&pageNumber="+pn;
	        alert("삭제되었습니다")
	        }
	        else
	        {
	        	alert("삭제 취소")
	        }
		
	}
</script>
<style>
#container {
	height: 600px;
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
		<h2 style="color: #0080FF; font-weight: bold;">게시물 리스트</h2>
		<form action="videoList.category" method="get">
			<select name="whatColumn">
				<option value="">전체 검색</option>
				<option value="num">번호</option>
				<option value="title">제목</option>
			</select> <input type="text" name="keyword">
			 <input type="submit" class="btn btn-primary" value="검색">
			<div align="right">
				<input type="button" class="btn btn-primary" value="게시물추가"
					onClick="videoInsert()">
			</div>
		</form>
		<table border="1" align="center" width="600" class="table">
			<thead class="table-light">

				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>카테고리</th>
					<th>시청제한</th>
					<th>이미지</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>
			<tbody>
				<c:if test="${empty lists }">
					<tr>
						<td colspan="7">데이터가 존재하지 않습니다</td>
					</tr>
				</c:if>
				<c:forEach var="video" items="${lists }">

					<tr>
						<td>${video.num }</td>
						<td><a
							href="detailvideo.category?num=${video.num }&pageNumber=${pageInfo.pageNumber}">${video.title }</a></td>
						<td>${video.category }</td>
						<td>${video.grade }</td>
						<td><img src="resources/images/poster/${video.image }"
							width="25px;" height="25px;"></td>
						<td><input type="button" value="수정" class="btn btn-primary"
							onClick="goUpdate(${video.num },${pageInfo.pageNumber})"></td>
						<td><input type="button" value="삭제" class="btn btn-primary"
							onClick="goDelete(${video.num },${pageInfo.pageNumber})"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${pageInfo.pagingHtml }
	</div>
</div>