<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
#app{
	width: 100%;
	height: 100%;
	background-image: url(${pageContext.request.contextPath}/img/aa.png);
	background-repeat: no-repeat;
	background-size: contain;
	position: fixed;
	margin-top: 80px;
}
#divTop {
	position: absolute;
	left: 0px;
	margin-top: 220px;
}

#divBottom {
	position: absolute;
	left: 0px;
	margin-top: 480px;
}

form{
	margin-top: 20px;
}

span{
	width: 150px;
	height: 150px;
}

.glyphicon{
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<div id="app">
		<center>&nbsp;</center>
		<div id="divTop"
			style="width: 100%; height: 10px; background-color: rgb(149, 165, 166);">
			
			<div>

				<div class="col-sm-3">
					&nbsp;
				</div>
				<div class="col-sm-6">

					<img src="${pageContext.request.contextPath}/img/logo1.png"
						width="300" height="290" alt="logo" style="margin-left: 20px">
						
						<div style="float: right; margin-right: 200px; margin-top: 100px;">
							<div>
								<div>
									<span >
										<a href="main.do" id="homeImg">
											<img src="${pageContext.request.contextPath}/img/home.png" width="100" alt="home" style="padding-right: 20px">
										</a>
									</span>

									<span>
										<a href="login_ani.jsp" id="loginImg">
											<img src="${pageContext.request.contextPath}/img/login.JPG" width="100" alt="login"style="padding-right: 20px">
										</a>
									</span>
									<span>
										<a href="register_ani.jsp" id="registerImg">
											<img src="${pageContext.request.contextPath}/img/register.JPG" width="100" alt="register"style="padding-right: 20px">
										</a>
									</span>
								</div>

							</div>
						</div>

				</div>
				<div class="col-sm-3">
					&nbsp;
				</div>

			</div>

		</div>

		<div id="divBottom"
			style="width: 100%; height: 10px; background-color: rgb(149, 165, 166);">
			
			<form action="marker.do">
				<input type="submit" value="myWorld">
			</form>
		
	
			
			<form action="TipBoard.do">
				<input type="submit" value="tipBoard">
			</form>
			
			<form action="NoticeBoard.do">
				<input type="submit" value="noticeBoard">
			</form>
		
		</div>

	</div>
</body>
</html>
