<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>
<title>Insert title here</title>
<style type="text/css">
#divTop {
   position: absolute;
   left: 0px;
   margin-top: 420px;
}

#divBottom {
   position: absolute;
   left: 0px;
   margin-top: 420px;
}

#hiddenDiv {
   margin: 0 auto 0 auto;
   margin-top: 60px;
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

#app #register {
   align-items: center;
   display: flex;
   justify-content: center;
   width: 100%;
   height: 630px;
}

#app #register #description {
   background-color: #ffffff;
   width: 260px;
   padding: 30px;
   padding-right: 0;
   box-shadow: 0px 0px 30px 0px #666;
}

#app #register #description h1 {
   margin: 0;
   font-size: 1.5em;
   color: #050505;
}

#app #register #description p {
   margin: 0;
   font-size: 0.9em;
   color: #95a5a6;
   margin-top: 10px;
}

#app #register #form {
   background-color: #34495e;
   border-radius: 5px;
   box-shadow: 0px 0px 30px 0px #666;
   color: #ecf0f1;
   width: 360px;
   padding: 30px;
}

#app #register #form form {
   margin-bottom: 0;
}

#app #register #form label, input {
   outline: none;
   width: 100%;
}

#app #register #form label {
   color: #ecf0f1;
   font-size: 1.0em;
   font-weight: bold;
}

#app #register #form input {
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

#app #register #form ::placeholder {
   color: #ecf0f1;
   opacity: 1;
}

#app #register #form button {
   background-color: #ecf0f1;
   cursor: pointer;
   border: none;
   padding: 10px;
   transition: background-color 0.2s ease-in-out;
   width: 80%;
   margin-left: 30px;
}

#app #register #form button:hover {
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
   position:relative;
   top:1px;
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
   position:relative;
   top:1px;
}

</style>
<script type="text/javascript">
	$(function() {
		setTimeout(function() {
			$('#hiddenDiv').hide();
		});
		
		$('#divTop').animate({
			top : '-430'
		}, 1000); //애니메이션 처럼(down과 right가 없다.)
		
		$('#divBottom').animate({
			top : '+380'
		}, 1000);
		
		setTimeout(function() {
			$('#hiddenDiv').show();
		}, 1200);
	});

	var xhr;
	var id, idCheckView;

	function idCheck() {
		id = document.getElementById("id");
		idCheckView = document.getElementById("idCheckView");
		if (id.value.length < 5) {
		   idCheckView.innerHTML = "<font color='red'>아이디는 5글자 이상이어야 합니다.</font>";
		   return;
		}//if
		//id의 길이가 5자 이상일때만 ajax 요청을 들어간다...
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;
		xhr.open("get", "idcheck.do?id=" + id.value, true);
		xhr.send(null); //실질적인 요청이 이때 들어간다.
	}//idCheck

	function callback() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var jsonData = JSON.parse(xhr.responseText);
				if (jsonData.flag) { //해당 아이디가 있다.
					idCheckView.innerHTML = "<font color='red'>사용불가 아이디!!</font>";
				} else { //해당 아이디가 없다.
					idCheckView.innerHTML = "<font color='green'>사용가능 아이디!!</font>";
				}//else
			}//if
		}//if
	}//callback
</script>

<script>
	$(function() {
		$('#password').keyup(function() {
			$('font[name=check]').text('');
		});
		
		$('#password_confirmed').keyup(function() {
			if ($('#password').val() != $('#password_confirmed').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호가 틀렸습니다.").css('color', 'red');
			} else {
				$('font[check=name]').text('');
				$('font[name=check]').html("암호가 맞습니다.").css('color', 'green');
			}
		});
	});
</script>
<script>
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {

				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수


				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
					// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('addressApi').value = fullRoadAddr;
				document.getElementById('addressInput').value = data.jibunAddress;

				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					//예상되는 도로명 주소에 조합형 주소를 추가한다.
					var expRoadAddr = data.autoRoadAddress
					      + extraRoadAddr;
					document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
					      + expRoadAddr + ')';
					
				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
					      + expJibunAddr + ')';
					
				} else {
					document.getElementById('guide').innerHTML = '';
				}
			}
		}).open();
	}//sample4_execDaumPostcode
</script>
</head>
<body>
	<div id="app">
		<center>&nbsp;</center>
		<div id="divTop" style="width: 100%; height: 10px; background-color:  rgb(149, 165, 166);"></div>

		<div id="divBottom" style="width: 100%; height: 10px; background-color:  rgb(149, 165, 166);"></div>
		<div id="hiddenDiv">

			<div id="register">
				<div id="description">
					<h1>환영합니다!</h1>
					<p>Enjoy Your Life!</p>
				</div>
				<div id="form">
					<form class="ui form" action="register.do" method="post">
						<label for="id">아이디<span style="color: #FF0000"> *</span></label>
						<input type="text" required="required" name="id" id="id" autocomplete="off" onkeyup="idCheck()">
						<span id="idCheckView"></span><br>
						
						<label for="password">비밀번호<span style="color: #FF0000"> *</span></label>
						<input type="password" required="required" id="password" name="password">
						
						<label for="password_confirmed">비밀번호 확인
							<span style="color: #FF0000"> *</span>
						</label> 
						<input type="password" required="required" id="password_confirmed"
							name="password_confirmed"><br>
						<font name="check" size="3"></font><br>
						
						<label for="name">이름</label>
						<input type="text" name="name" autocomplete="off">
						
						<label for="birth">생년월일</label>
						<input type="text" name="birth" placeholder="ex) 881206" autocomplete="off">
						
						<label for="email">이메일</label>
						<input type="email" name="email">
						
						<label for="address">주소</label> 
				
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
						style="width: 150px; border: 1px solid white; margin-left: 15px; border-radius: 5px;"><br> 
						
						<input type="text" id="addressApi" name="addressApi" readonly="readonly" placeholder="도로명주소"> 
						<input type="text" id="addressInput" name="addressInput" placeholder="상세주소" style="width:200px;">
				
						<button type="submit" class="ui submit button" style="margin-top: 20px">회원가입</button>
					</form>
				</div>
				<!-- form -->
			</div>
			<div style="width: 600px; margin: 0 auto 0 auto;">
				<div style="float: right;">
					<button class="homebtn" style="margin-top: 35px" onclick="location.href='index.jsp'">
						<b>홈으로</b>
					</button>
					<button class="loginbtn" style="margin-top: 35px" onclick="location.href='login_ani.jsp'">
						<b>로그인</b>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>