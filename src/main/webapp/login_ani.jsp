<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#bg {
	position: fixed;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 200%;
}

#bg img {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	min-width: 50%;
	min-height: 50%;
}
</style>
<style type="text/css">
#divTop {
	position: absolute;
	left: 0px;
	margin-top: 400px;
}

#divBottom {
	position: absolute;
	left: 0px;
	margin-top: 400px;
}

#hiddenDiv {
	margin: 0 auto 0 auto;
	margin-top: 230px;
}

* {
	box-sizing: border-box;
	font-family: 'Nunito', sans-serif;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	width: 100%;
}

#app {
	width: 100%;
	height: 100%;
	background-image: url(${pageContext.request.contextPath}/img/aa.png);
	background-repeat: no-repeat;
	background-size: contain;
	position: fixed;
	margin-top: 80px;
}

#app #login {
	align-items: center;
	display: flex;
	justify-content: center;
	width: 100%;
	height: 270px;
}

#app #login #description {
	background-color: #ffffff;
	width: 260px;
	padding: 30px;
	padding-right: 0;
	box-shadow: 0px 0px 30px 0px #666;
}

#app #login #description h1 {
	margin: 0;
	font-size: 1.5em;
	color: #050505;
}

#app #login #description p {
	margin: 0;
	font-size: 0.9em;
	color: #95a5a6;
	margin-top: 10px;
}

#app #login #form {
	background-color: #34495e;
	border-radius: 5px;
	box-shadow: 0px 0px 30px 0px #666;
	color: #ecf0f1;
	width: 360px;
	padding: 30px;
}

#app #login #form form {
	margin-bottom: 0;
}

#app #login #form label, input {
	outline: none;
	width: 100%;
}

#app #login #form label {
	color: #ecf0f1;
	font-size: 1.0em;
	font-weight: bold;
}

#app #login #form input {
	background-color: transparent;
	border-left: thin;
	border-right: thin;
	border-top: thin;
	border-bottom-color: #a5a5a5;
	color: #a5a5a5;
	font-size: 0.9em;
	margin-top: 5px;
	margin-bottom: 12px;
	padding-left: 5px;
	padding-bottom: 5px;
}

#app #login #form ::placeholder {
	color: #ecf0f1;
	opacity: 1;
}

#app #login #form button {
	background-color: #ecf0f1;
	cursor: pointer;
	border: none;
	padding: 10px;
	transition: background-color 0.2s ease-in-out;
	width: 80%;
	margin-left: 30px;
}

#app #login #form button:hover {
	background-color: #eeeeee;
}

.homebtn {
	color: #34495e;
	background: rgba(0, 0, 0, 0);
	border: solid 4px #34495e;
	border-radius: 5px;
}

.homebtn:hover, .homebtn.hover {
	border-color: #2A3B4D;
	color: #2A3B4D;
	border-radius: 5px;
}

.homebtn:active, .homebtn.active {
	border-color: #2A3B4D;
	color: #2A3B4D;
	border-radius: 5px;
	position: relative;
	top: 1px;
}

.loginbtn {
	color: #34495e;
	background: rgba(0, 0, 0, 0);
	border: solid 4px #34495e;
	border-radius: 5px;
}

.loginbtn:hover, .loginbtn.hover {
	border-color: #2A3B4D;
	color: #2A3B4D;
	border-radius: 5px;
}

.loginbtn:active, .loginbtn.active {
	border-color: #2A3B4D;
	color: #2A3B4D;
	border-radius: 5px;
	position: relative;
	top: 1px;
}
</style>
<script type="text/javascript">
	$(function() {
		setTimeout(function() {
			$('#hiddenDiv').hide();
		});

		$('#divTop').animate({
			top : '-300'
		}, 1000); //애니메이션 처럼(down과 right가 없다.)

		$('#divBottom').animate({
			top : '+250'
		}, 1000);

		setTimeout(function() {
			$('#hiddenDiv').show();
		}, 1200);
	});
</script>
<style type="text/css">
img {
	max-width: 100%;
	width: 600px;
	position: relative;
}


</style>
</head>
<body>
	<div id="app">
		<center>&nbsp;</center>
		

		<div id="divTop"
			style="width: 100%; height: 10px; background-color: rgb(149, 165, 166);"></div>

		<div id="divBottom"
			style="width: 100%; height: 10px; background-color: rgb(149, 165, 166);"></div>
		<div id="hiddenDiv">

			<div id="login">
				<div id="description">
					<h1>환영합니다!</h1>
					<p>Enjoy Your Life!</p>
				</div>
				<div id="form">
					<form action="login.do" method="post">
						<label for="id">아이디</label>
						<input type="text" id="id" name="id" autocomplete="off">
						
						<label for="password">비밀번호</label>&nbsp;
						<input type="password" id="password" name="password">

						<button type="submit" style="margin-top: 20px">로그인</button>
					</form>
				</div>

			</div>
			<div style="width: 600px; margin: 0 auto 0 auto;">
				<div style="float: right;">
					<button class="homebtn" style="margin-top: 10px" onclick="location.href='index.jsp'">
						<b>홈으로</b>
					</button>
					<button class="loginbtn" style="margin-top: 10px" onclick="location.href='register_ani.jsp'">
						<b>회원가입</b>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>