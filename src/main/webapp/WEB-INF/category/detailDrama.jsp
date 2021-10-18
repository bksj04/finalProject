<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
<%@include file="../display/top.jsp" %>
<style type="text/css">
#detailVideoWrapper{
 display: flex;
}
#detailVideo{
	margin: 0 auto;
	text-align: center;
	width:400px;
}
.poster {
	width: 100%;
	height: 300px;
}
.poster_img {
	width: 200px;
	height: 300px;
	margin: auto;
}
.infor {
	background: #fff;
	padding: 17px;
	border: 1px solid #c4c4c4;
	width:100%;
}

.infor>h3 {
	color: #333;
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 20px;
}

.infor>h3>span {
	width: 29px;
	height: 29px;
	display: inline-block;
	margin-top: 9px;
}
.icon_img {
	width: 50px;
	height: 50px;
}

#tContent {
	display: none;
}
</style>
<script type="text/javascript">
	function openCloseToc() {
	    if(document.getElementById('tContent').style.display === 'block') {
	      document.getElementById('tContent').style.display = 'none';
	      document.getElementById('toggle').textContent = '더보기';
	    } else {
	      document.getElementById('tContent').style.display = 'block';
	      document.getElementById('toggle').textContent = '숨기기';
	    }
	  }
</script>
<div id="detailVideoWrapper">
	<div id="detailVideo">
	<div class="poster">
		<figure>
			<img src="resources/images/poster/${db.image}" class="poster_img"/>
		</figure>
	</div>
	<div class="infor">
		<div class="infor_title">
				${db.title }
		</div>
		<div>
					<a
				href="play.video?video_num=${db.num}&member_id=${loginInfo.id}&video_image=${db.image}"><button
					name="view" class="btn btn-primary">시청하기</button></a> &nbsp;&nbsp;&nbsp;
					
			<c:set var="flag" value="false"/>
			<c:forEach var="jjim" items="${mjlists }">
			<c:if test="${jjim.video_num == db.num }">
			<c:set var="flag" value="true"/>
			</c:if>
			</c:forEach>
			<c:if test="${flag == 'true' }">
			<a href="deletejjim.member?video_num=${db.num}&member_id=${loginInfo.id}"><button class="btn btn-outline-danger active">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  <path
								d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
</svg>
					</button></a>
			</c:if>
			<c:if test="${flag == 'false' }">
				<a href="insertjjim.member?video_num=${db.num}&member_id=${loginInfo.id}">
					<button class="btn btn-outline-danger">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  <path
								d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
</svg>
					</button>
				</a>
			</c:if>
		</div>
		<div>${db.genre } ${db.runningT }분 ${db.grade }세 </div>
		<div>
			<hr>
			<span id="toggle" onclick="openCloseToc()">더보기</span>
			<div id="tContent">
				<div class="infor_sub" >
				<br>
					장르 : ${db.genre }
					<br><br>
					출연배우 : ${db.actor }
					<br><br>
					줄거리 : ${db.content } 
					
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<hr>

<div>
	<div class="usaGenre">
		비슷한 드라마 
	</div>
		<c:forEach var="glist" items="${dlists }">
		<div style="display: inline-block;">
			<div class="else">
				<figure>
					<c:forEach var="clist" items="${clists }">
						<c:if test="${glist.vnum eq clist.num}">
							<img src="resources/images/poster/${clist.image}"
								class="poster_img" />
						</c:if>
					</c:forEach>
				</figure>
				<h4>
					<span class="icon all ir_pm"> <c:if
							test="${glist.grade eq '18' }">
							<img src="resources/images/icon/18.svg" class="icon_img">
						</c:if> <c:if test="${glist.grade eq '15' }">
							<img src="resources/images/icon/15.svg" class="icon_img">
						</c:if> <c:if test="${glist.grade eq '12' }">
							<img src="resources/images/icon/12.svg" class="icon_img">
						</c:if> <c:if test="${glist.grade eq 'all' }">
							<img src="resources/images/icon/all.svg" class="icon_img">
						</c:if>
					</span> <strong>${glist.title }</strong>
				</h4>
			</div>
		</div>
	</c:forEach>
</div>

<%@include file="../display/bottom.jsp" %>