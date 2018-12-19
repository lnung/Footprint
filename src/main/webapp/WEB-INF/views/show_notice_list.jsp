<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript">
   function checkLogin(){
      if(${sessionScope.login==null}){
         alert("로그인 후 이용가능합니다.");
         location.href="login.jsp";
      }
      else
         location.href="write.jsp";
   }
</script> -->
<style type="text/css">
#adminBoard {
	width: 1200px;
	margin: 0px auto 0px auto;
	/* padding-top:120px; */
}
</style>
</head>
<body>
	<%@include file="../../nav_v2.jsp"%>

	<div style="width: 1100px; margin: 20px auto 0 auto">
		<div id="adminBoard" class="contents">
			<h3>공지사항</h3>
			<br>
			<table class="table table-hover table-striped">
				<colgroup>
					<col width="80">
					<col width="*">
					<col width="120">
					<col width="120">
					<col width="100">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성 아이디</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${adminBoardListVO.list}" var="adminvo2">
						<tr>
							<td>${adminvo2.no}</td>
							<td><a href="#">${adminvo2.title}</a></td>
							<td>${adminvo2.member.id}</td>
							<td>${adminvo2.wDate}</td>
							<td>${adminvo2.count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<hr />


			<a class="btn btn-default pull-right" href="#" onclick="checkLogin()">글쓰기</a>
			<c:set var="noticepb" value="${adminBoardListVO.pagingBean}"></c:set>
			<div class="text-center">
				<ul class="pagination">

					<c:if test="${noticepb.previousPageGroupByNotice}">
						<a
							href="NoticeBoard.do?pageNo=${noticepb.startPageOfPageGroupByNotice-1}">
							<img src="img/left_arrow_btn.gif">
						</a>
					</c:if>

					<c:forEach var="i" begin="${noticepb.startPageOfPageGroupByNotice}"
						end="${noticepb.endPageOfPageGroupByNotice}">
						<c:choose>
							<c:when test="${adminpb.nowPage!=i}">
								<a
									href="NoticeBoard.do?pageNo=${i}&&MpageNo=${noticepb.nowPage}">${i}</a>
							</c:when>
							<c:otherwise>
								${i}
							</c:otherwise>
						</c:choose>&nbsp;
					</c:forEach>

					<c:if
						test="${adminTipBoardListVO.pagingBean.nextPageGroupByNotice}">
						<a
							href="NoticeBoard.do?pageNo=${adminTipBoardListVO.pagingBean.endPageOfPageGroupByNotice+1}">
							img src="img/right_arrow_btn.gif"> </a>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<%@include file="../../footer.jsp"%>
</body>
</html>