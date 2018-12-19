<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'
	integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU'
	crossorigin='anonymous'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<style type="text/css">
#main-footer {
	background-color: #1f2225;
}

.footerContainer {
	position: relative;
	text-align: left;
	width: 80%;
	max-width: 1080px;
	margin: auto
}

#footer-widgets {
	padding: 30px 0;
}

.footer-widget {
	float: left;
	color: #fff;
}

#footer-bottom {
	box-shadow: 0 -1px 0 #000;
	border-top: 1px solid #303234;
	background: none;
	padding: 15px 0 5px;
}

#footer-bottom #footer-copyright {
	float: left;
	font-size: 11px;
	line-height: 1;
	color: #949799;
}

#footer-bottom #footer-copyright .bottom-nav {
	display: inline-block;
	padding: 5px 0 0;
}

.bottom-nav li {
	display: inline-block;
	font-size: 14px;
	font-weight: 600;
}

#footer-bottom #footer-copyright .bottom-nav a {
	font-size: 11px;
	color: #949799;
}

#footer-bottom a {
	transition: all .4s ease-in-out;
}

.et-social-icons a li {
	font-size: 24px;
	color: #949799;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.et-social-icons a li').hover(function() {
			$(this).css({
				'color' : '#95B3D7'
			}); //css
		}, function() {
			$(this).css({
				'color' : '#949799'
			});
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="main-footer">
		<div class="footerContainer">
			<div id="footer-widgets" class="clearfix">
				<div class="footer-widget" style="margin-right: 70px; width: 400px;">
					<div id="black-studio-tinymce-2"
						class="fwidget et_pb_widget widget_black_studio_tinymce">
						<h4 class="title">Footprint</h4>
						<hr style="border-top: dashed 1px #949799; margin-top: 15px;">
						<div class="textwidget">
							<p>
								<strong style="font-size: 17; color: #95B3D7">Footprint</strong>
								provides a web service that records and shares your travel
								experiences. We also provide advice for each country. I wish you
								always have a trip to your life.
							</p>
							<p style="color: #949799">
								<strong style="font-size: 17; color: #95B3D7">Footprint</strong>
								는 사용자가 다녀온 여행지를 기록하고 공유하는 웹 서비스를 제공합니다. 또한, 각 나라에 대한 조언도 함께
								제공합니다. 언제나 당신의 삶에 여행이 함께하길 기원합니다.
							</p>
						</div>
					</div>
					<!-- end .fwidget -->
				</div>
				<!-- end .footer-widget -->

				<div class="footer-widget" style="margin-right: 50px; width: 200px;">
					<div id="recent-posts-2"
						class="fwidget et_pb_widget widget_recent_entries">
						<h4 class="title">Our Contents</h4>
						<hr style="border-top: dashed 1px #949799; margin-top: 15px;">
						<ul>
							<li><a href="#" style="color: #fff">HOME</a></li>
							<br>
							<li><a href="#" style="color: #fff">Share World</a></li>
							<br>
							<li><a href="#" style="color: #fff">Tip</a></li>
							<br>
							<li><a href="#" style="color: #fff">공지사항</a></li>
							<br>
							<li><a href="#" style="color: #fff">My World</a></li>
						</ul>
					</div>
					<!-- end .fwidget -->
				</div>
				<!-- end .footer-widget -->
				<div class="footer-widget last" style="width: 320px;">
					<div id="black-studio-tinymce-4"
						class="fwidget et_pb_widget widget_black_studio_tinymce">
						<h4 class="title" style="padding-left: 10px">Contact Us</h4>
						<hr style="border-top: dashed 1px #949799; margin-top: 15px;">
						<div class="textwidget">
							<ul style="color: #949799;">
								<li style="color: #fff">Hyunho, Kim</li>
								<li class="fa fa-envelope-o"
									style="font-size: 14px; margin-left: 15px; margin-right: 10px;"></li>kimhh1994@naver.com
								<br>
								<br>
								<li style="color: #fff">Youbin, Ko</li>
								<li class="fa fa-envelope-o"
									style="font-size: 14px; margin-left: 15px; margin-right: 10px;"></li>rhqls94@naver.com
								<br>
								<br>
								<li style="color: #fff">Yongjin, Kim</li>
								<li class="fa fa-envelope-o"
									style="font-size: 14px; margin-left: 15px; margin-right: 10px;"></li>kswa34@naver.com
								<br>
								<br>
								<li style="color: #fff">Yunjoo, Lee</li>
								<li class="fa fa-envelope-o"
									style="font-size: 14px; margin-left: 15px; margin-right: 10px;"></li>amy951127@naver.com
							</ul>
						</div>
					</div>
					<!-- end .fwidget -->
				</div>
				<!-- end .footer-widget -->
			</div>
			<div id="footer-bottom">
				<div class="container clearfix">
					<div id="footer-copyright">
						<ul id="menu-footer-menu" class="bottom-nav"
							style="list-style: none;">
							<li id="menu-item-177"
								class="menu-item menu-item-type-post_type menu-item-object-page menu-item-177"><a
								href="#">Privacy Policy</a></li>
							<li id="menu-item-254"
								class="menu-item menu-item-type-custom menu-item-object-custom menu-item-254"
								style="margin-right: 5px"><a href="#">Contact</a></li>
						</ul>
						© 2018 Global Footprint Map
					</div>

					<ul class="et-social-icons" style="list-style: none">
						<a href="#"><li class="fa fa-facebook-square"
							style="margin-left: 20px"></li></a>
						<a href="#"><li class="fa fa-twitter"
							style="margin-left: 10px"></li></a>
						<a href="#"><li class='fab fa-google-plus-g'
							style='margin-left: 10px'></li></a>
						<a href="#"><li class='fa fa-comments'
							style='margin-left: 10px'></li></a>
					</ul>

				</div>
				<!-- .container -->
			</div>
		</div>
</body>
</html>