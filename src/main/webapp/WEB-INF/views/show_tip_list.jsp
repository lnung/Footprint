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
<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
   function checkLogin(){
      if(${sessionScope.login==null}){
         alert("로그인 후 이용가능합니다.");
         location.href="login.jsp";
      }
      else
         location.href="write.jsp";
   }
</script>
<style type="text/css">
#memberTipBoard {
	width: 1200px;
	margin: 0px auto 0px auto;
	/* padding-top:120px; */
}

#adminTipBoard {
	width: 1200px;
	margin: 0px auto 0px auto;
	/* padding-top:120px; */
}
</style>
</head>
<body>
	<c:set var="adminpb" value="${adminTipBoardListVO.pagingBean}"></c:set>
	<c:set var="memberpb" value="${memberTipBoardListVO.pagingBean}"></c:set>

	<%@include file="../../nav_v2.jsp"%>
	<div style="width: 1100px; margin: 20px auto 0 auto">
		<div id="adminTipBoard" class="contents">
			<h3>관리자가 알려주는 TIP</h3>
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
					<c:forEach items="${adminTipBoardListVO.list}" var="adminvo">
						<tr>
							<td>${adminvo.no}</td>
							<td><a href="#">${adminvo.title}</a></td>
							<td>${adminvo.member.id}</td>
							<td>${adminvo.wDate}</td>
							<td>${adminvo.count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<hr />

			<c:if test="">
				<a class="btn btn-default pull-right" href="#"
					onclick="checkLogin()">글쓰기</a>
			</c:if>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${adminpb.previousPageGroup}">
						<a href="TipBoard.do?ApageNo=${adminpb.startPageOfPageGroup-1}">
							<img src="img/left_arrow_btn.gif">
						</a>
					</c:if>

					<c:forEach var="i" begin="${adminpb.startPageOfPageGroup}"
						end="${adminpb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${adminpb.nowPage!=i}">
								<a href="TipBoard.do?ApageNo=${i}&&MpageNo=${memberpb.nowPage}">${i}</a>
							</c:when>
							<c:otherwise>
								${i}
							</c:otherwise>
						</c:choose>&nbsp;
					</c:forEach>

					<c:if test="${adminTipBoardListVO.pagingBean.nextPageGroup}">
						<a
							href="TipBoard.do?ApageNo=${adminTipBoardListVO.pagingBean.endPageOfPageGroup+1}">
							<img src="img/right_arrow_btn.gif">
						</a>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<div style="width: 1100px; margin: 20px auto 0 auto">
		<div id="memberTipBoard" class="contents">
			<h3>직접 경험한 꿀팁</h3>
			<br>
			<table class="table table-hover table-striped">
				<colgroup>
					<col width="80">
					<col width="*">
					<col width="120">
					<col width="100">
					<col width="100">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberTipBoardListVO.list}" var="membervo">
						<tr>
							<td>${membervo.no}</td>
							<td><a href="#">${membervo.title}</a></td>
							<td>${membervo.member.id}</td>
							<td>${membervo.wDate}</td>
							<td>${membervo.count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr />

			<a class="btn btn-default pull-right" href="#" onclick="checkLogin()">글쓰기</a>
			<div class="text-center">
				<ul class="pagination">

					<c:if test="${memberpb.previousPageGroup}">
						<a href="TipBoard.do?MpageNo=${memberpb.startPageOfPageGroup-1}">
							<img src="img/left_arrow_btn.gif">
						</a>
					</c:if>

					<c:forEach var="i" begin="${memberpb.startPageOfPageGroup}"
						end="${memberpb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${memberpb.nowPage!=i}">
								<a href="TipBoard.do?MpageNo=${i}&&ApageNo=${adminpb.nowPage}">${i}</a>
							</c:when>
							<c:otherwise>
								${i}
							</c:otherwise>
						</c:choose>&nbsp;
					</c:forEach>

					<c:if test="${memberTipBoardListVO.pagingBean.nextPageGroup}">
						<a
							href="TipBoard.do?MpageNo=${memberTipBoardListVO.pagingBean.endPageOfPageGroup+1}">
							<img src="img/right_arrow_btn.gif">
						</a>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<%@include file="../../footer.jsp"%>
</body>
</html>