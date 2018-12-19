<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>menubar</title>

<link rel="stylesheet" type="text/css" href="./css/menubar_v2.css">
<script type="text/javascript" src="./js/menubar_v2.js"></script>
</head>
<body>
	<nav class="navbar navbar-defalt navbar-fixed-top">
		<div id="header" style="margin: 0 auto 0 auto">
			<div class="container" style="padding: 0 ;">
				<div class="navbar-header" style="margin-top: 3px; padding: 0">
					<button type="button" class="navbar-toggle" id="menuSpan"
						data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="main.do">
						<img src="${pageContext.request.contextPath}/img/logo_white.png"
							width="100" height="90" alt="logo" style="margin: 0">
					</a>
				</div>
				<!-- navbar-header -->

				<div class="collapse navbar-collapse navbar-right" style="margin-top: 25px">
					<ul class="nav navbar-nav" id="myNavbar">
						<li class="active">
							<a href="main.do" id="homeImg" style="padding-top: 10px">
								<img src="${pageContext.request.contextPath}/img/home.png" width="30" alt="home">
							</a>
						</li>
						<li data-target="#"><a href="#">Share World</a></li>
						<li data-target="#"><a href="TipBoard.do">Tip</a></li>
						<li data-target="#"><a href="NoticeBoard.do">공지사항</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<span class="glyphicon glyphicon-user text-success"
								style="color: white; font-weight: bold;">
								<span class="caret" style="margin-left: 0px"></span>
							</span>
							</a>
							<c:choose>
								<c:when test="${vo == null}">
									<ul class="dropdown-menu" style="margin-top: 20px">
										<li><a href="login_ani.jsp">
											<span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;로그인
										</a></li>
										<li><a href="register_ani.jsp">
											<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;회원가입
										</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<ul class="dropdown-menu" style="margin-top: 20px">
										<li><a href="marker.do" id="globeImg">
											<span class="glyphicon glyphicon-globe"></span>&nbsp;&nbsp;My World
										</a></li>
										<li><a href="register.jsp">
											<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;회원정보 수정
										</a></li>
										<li><a href="logout.do">
											<span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;로그아웃
										</a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>

				</div>
				<!-- myNavbar -->
			</div>
			<!-- container -->
		</div>
		<!-- header -->
	</nav>
	<div style="height: 120px"></div>
</body>
</html>