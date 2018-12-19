<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <META HTTP-EQUIV="refresh" CONTENT="10"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href = "https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel = "stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 그래프 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<title>Main</title>

<script type="text/javascript"> 
	//Load google charts 그래프시작
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawChartList);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
				['Task', '환율'],
				
				<c:forEach items="${getList}" var="getList">
					['${getList.wDate}', ${getList.exchange}],
				</c:forEach>
			]);


			// Optional; add a title and set the width and height of the chart
			var options = {'title':'Exchange Rate', 'width':600, 'height':400};
		
			// Display the chart inside the <div> element with id="piechart"
			var chart = new google.visualization.LineChart(document.getElementById('Exchangechart'));
			chart.draw(data, options);
		}	//그래프 끝

	 	function drawChartList(list) {
			var size = list.length;
	
			var arr = [['Task','환율']];
			for(var i=0;i<size;i++){
				var temp = [list[i].wDate, list[i].exchange];
				arr.push(temp);
			}
			alert(arr);
			var data = google.visualization.arrayToDataTable(arr);
			// Optional; add a title and set the width and height of the chart
			var options = {'title':'Exchange Rate', 'width':600, 'height':400};
		
			// Display the chart inside the <div> element with id="piechart"
			var chart = new google.visualization.LineChart(document.getElementById('Exchangechart'));
			chart.draw(data, options);
		}	//그래프 끝	
 
	

	/* 셀렉트박스2 옵션 이미지넣기  */
	$(document).ready(function(){
		$("#selectBox").select2({
			width: "210px",
			templateResult: formatState
		});	//select2
		
		refreshcurr();
		setInterval(refreshcurr, 100000);
				
		checkTime();
	});	//ready
    
	/* 셀렉트박스2 옵션 이미지넣기  */
	function formatState (state) {
		if (!state.id)	return state.text;
		var $state = $(
			'<span><img sytle="display:inline-block;" width="30" height="22" src="img/'+state.element.value.toLowerCase()+'.PNG"/>&nbsp;&nbsp;&nbsp;' + state.text+'</span>'
		);
		return $state;
	}
  
	var a=0; var b=0; var c=0; var d=0; var e=0; var f=0; var g=0; var h=0; var i=0; var j=0; var k=0; var l=0;
	var m=0; var n=0; var o=0; var p=0; var q=0; var r=0; var s=0; var t=0; var u=0;
	
	var aa=0; var bb=0; var cc=0; var dd=0; var ee=0; var ff=0; var gg=0; var hh=0; var ii=0; var jj=0; var kk=0; var ll=0;
	var mm=0; var nn=0; var oo=0; var pp=0; var qq=0; var rr=0; var ss=0; var tt=0; var uu=0;
	
	var rateList = new Array();
	var countryList = new Array();
	
	var count = 0;
   
/* 	var to = new Date(); 
	to.setDate(to.getDate() - 1);
	
	var toyear = to.getFullYear();		//현재시간 중 4자리 연도
	
	var tomonth = to.getMonth() + 1;		//현재시간 중 달. 달은 0부터 시작하기 때문에 + 1 
	if((tomonth + "").length < 2){
		tomonth = "0" + tomonth;			//달의 숫자가 1자리면 앞에 0을 붙임.
	}
	
	var todate = to.getDate();			//현재 시간 중 날짜.
	if((todate + "").length < 2){
		todate = "0" + todate;      
	}

	var totoday = toyear + "" + tomonth + "" + todate+ "";
	
	var il = new Date(); 
	il.setDate(il.getDate() - 2);
	
	var ilyear = il.getFullYear();		//현재시간 중 4자리 연도
	
	var ilmonth = il.getMonth() + 1;		//현재시간 중 달. 달은 0부터 시작하기 때문에 + 1 
	if((ilmonth + "").length < 2){
		ilmonth = "0" + ilmonth;			//달의 숫자가 1자리면 앞에 0을 붙임.
	}
	
	var ildate = il.getDate();			//현재 시간 중 날짜.
	if((ildate + "").length < 2){
		ildate = "0" + ildate;      
	}

	var iltoday = ilyear + "" + ilmonth + "" + ildate+ ""; */
	
	var urlPath = url + today;			//최종경로

	var timeOut;
	function getTimeOut(){
		return timeOut;
	}

	var url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=oveve1w8JgWr1LjNC7Y1StpS277hj6lr&data=AP01&searchdate=";
	
	var hour;
	var minute;
	var currTime;
	var year;		//현재시간 중 4자리 연도
	var month;
	var date;
	
	var today = year + "" + month + "" + date+ "";
   //현재 시간 따오기.
	function getTime(){
		var now = new Date();
		timeOut = "17:18";				//시간 설정
		hour = now.getHours();
		minute = now.getMinutes();
		currTime = hour+ ":" + minute;
		//alert(currTime);
		year = now.getFullYear();
		month = now.getMonth() + 1;		//현재시간 중 달. 달은 0부터 시작하기 때문에 + 1
		date = now.getDate();			//현재 시간 중 날짜.
		 
		if((month + "").length < 2){
		    month = "0" + month;			//달의 숫자가 1자리면 앞에 0을 붙임.
		}

		if((date + "").length < 2){
		    date = "0" + date;      
		}

		if((hour + "").length < 2){
			hour = "0" + hour;      
		}    

		if((minute + "").length < 2){
			minute = "0" + minute;      
		}

		if(currTime==getTimeOut()){
			dbSave();	//디비에 저장하러간다.
		}
	}
   
	function dbSave(){
		location.href = "exchange.do?country=" + countryList + "&&exchange=" + rateList;
	}
   
	//50초간격으로 getTime()메소드를 호출
	function checkTime(){
		setInterval("getTime()", 40000);
	}
   
	function categoryChange(country) {
		var exchangeRate = document.getElementById("exchangeRate");
		//var exchangechart = document.getElementById("Exchangechart");
		
		var unit = document.getElementById("unit");
		$.ajax({ 
			url: "selectchart.do?country="+country.value,
			type: "get",
			success: function (data) {

				if(data.list[0].country == "아랍")	{unit.textContent = "디르함";		exchangeRate.textContent = a;}   
				else if(data.list[0].country == "호주")	{unit.textContent = "달러";		exchangeRate.textContent = b;}
				else if(data.list[0].country == "바레인")		{unit.textContent = "디나르";		exchangeRate.textContent = c;}
				else if(data.list[0].country == "캐나다")		{unit.textContent = "달러";		exchangeRate.textContent = d;}
				else if(data.list[0].country == "스위스")	{unit.textContent = "프랑";		exchangeRate.textContent = e;}
				else if(data.list[0].country == "중국")		{unit.textContent = "위안화";		exchangeRate.textContent = f;}
				else if(data.list[0].country == "덴마크")		{unit.textContent = "크로네";		exchangeRate.textContent = g;}
				else if(data.list[0].country == "유럽연합")	{unit.textContent = "유로";		exchangeRate.textContent = h;}
				else if(data.list[0].country == "영국")	{unit.textContent = "파운드";	exchangeRate.textContent = i;}
				else if(data.list[0].country == "홍콩")	{unit.textContent = "달러";		exchangeRate.textContent = j;}
				else if(data.list[0].country == "인도네시아")	{unit.textContent = "루피아";		exchangeRate.textContent = k;}
				else if(data.list[0].country == "일본")		{unit.textContent = "엔";		exchangeRate.textContent = l;}
				else if(data.list[0].country == "쿠웨이트")		{unit.textContent = "디나르";		exchangeRate.textContent = m;}
				else if(data.list[0].country == "말레이시아")	{unit.textContent = "링깃";		exchangeRate.textContent = n;}
				else if(data.list[0].country == "노르웨이")		{unit.textContent = "크로네";		exchangeRate.textContent = o;}
				else if(data.list[0].country == "뉴질랜드")	{unit.textContent = "달러";		exchangeRate.textContent = p;}
				else if(data.list[0].country == "사우디")	{unit.textContent = "리얄";		exchangeRate.textContent = q;}
				else if(data.list[0].country == "스웨덴")		{unit.textContent = "크로나";		exchangeRate.textContent = r;}
				else if(data.list[0].country == "싱가포르")	{unit.textContent = "달러";		exchangeRate.textContent = s;}
				else if(data.list[0].country == "태국")	{unit.textContent = "바트";		exchangeRate.textContent = t;}
				else if(data.list[0].country == "미국")		{unit.textContent = "달러";		exchangeRate.textContent = u;}
				else if(data.list[0].country == "선택")		{unit.textContent = "국가를 선택하세요";	exchangeRate.textContent = "국가를 선택하세요";}

				drawChartList(data.list);
			}
		});
	} 

/* 	var viewchart = function() {
		location.href = "viewchart.do";
	} */
      
	var refreshcurr = function () { 
	
 		$.ajax({ 
			url: urlPath,
			type: "GET", 
			success: function (data) {
				//alert("오늘의 날짜 :: " + today);
				
				a = data[0].kftc_deal_bas_r + " ";	aa=data[0].cur_nm;			//아랍에미리트
				b = data[1].kftc_deal_bas_r + " ";	bb=data[1].cur_nm;			//호주
				c = data[2].kftc_deal_bas_r + " ";	cc=data[2].cur_nm;			//바레인
				d = data[3].kftc_deal_bas_r + " ";	dd=data[3].cur_nm;			//캐나다
				e = data[4].kftc_deal_bas_r + " ";	ee=data[4].cur_nm;			//스위스
				f = data[5].kftc_deal_bas_r + " ";	ff=data[5].cur_nm;			//중국
				g = data[6].kftc_deal_bas_r + " ";	gg=data[6].cur_nm;			//덴마크
				h = data[7].kftc_deal_bas_r + " ";	hh=data[7].cur_nm;			//유럽연합
				i = data[8].kftc_deal_bas_r + " ";	ii=data[8].cur_nm;			//영국
				j = data[9].kftc_deal_bas_r + " ";	jj=data[9].cur_nm;			//홍콩
				k = data[10].kftc_deal_bas_r + " ";	kk=data[10].cur_nm;			//인도네시아
				l = data[11].kftc_deal_bas_r + " ";	ll=data[11].cur_nm;			//일본
				m = data[13].kftc_deal_bas_r + " ";	mm=data[13].cur_nm;			//쿠웨이트
				n = data[14].kftc_deal_bas_r + " ";	nn=data[14].cur_nm;			//말레이시아
				o = data[15].kftc_deal_bas_r + " ";	oo=data[15].cur_nm;			//노르웨이
				p = data[16].kftc_deal_bas_r + " ";	pp=data[16].cur_nm;			//뉴질랜드
				q = data[17].kftc_deal_bas_r + " ";	qq=data[17].cur_nm;			//사우디
				r = data[18].kftc_deal_bas_r + " ";	rr=data[18].cur_nm;			//스웨덴
				s = data[19].kftc_deal_bas_r + " ";	ss=data[19].cur_nm;			//싱가포르
				t = data[20].kftc_deal_bas_r + " ";	tt=data[20].cur_nm;			//태국
				u = data[21].kftc_deal_bas_r + " ";	uu=data[21].cur_nm;			//미국
				                              
				countryList = [aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, ll, mm, nn, oo, pp, qq, rr, ss, tt, uu];
				rateList = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u];
				
			},
			error: function (request, status, error) { 
/* 				alert("오늘의 날짜 to :: " + totoday);
				alert("오늘의 날짜 il :: " + iltoday); */
				alert("URL 접속 실패");
				
				xShowAjaxError(request, status, error);           
			}
		}); 
	}; 
    
	/* 대한민국에서 입력할 때 */
	var calculate1 = function() { 
		var input = 1 * $('#money1').val();
		$('#money2').text(input);
		var uk = $('#exchangeRate').text();
		uk = 1 * removeCommas(uk);
		var price = input / uk * 100;
		$('#returnmoney1').val(price); 
		$('#returnmoney2').text(price); 
	};
	
    /* 다른 나라에서 입력할 때 */
	var uncalculate1 = function() { 
		var input = 1 * $('#returnmoney1').val();
		$('#returnmoney2').text(input);
		var uk = $('#exchangeRate').text(); 
		uk = 1 * removeCommas(uk);
		var price = input * uk / 100;
		$('#money1').val(price); 
		$('#money2').text(price); 
	}; 

	//콤마 찍기
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
   
	//콤마풀기
	function removeCommas(x) {
		if(!x || x.length == 0)
			return "";
		else
			return x.split(",").join("");
	}

</script> 

<style type="text/css">

 	.carousel-inner img {   /* 이미지 크기 정하기 */
		width: 2000px; height: 600px; 
		max-width: 2000px;
		max-height: 600px;
		display: block;
		margin-left: auto;
		margin-right: auto;
	}
   
	#demo {               /* 캐러셀 영역 넓이 정하기 (왼쪽 오른쪽 오토는 센터)  */
		width: 1200px;
		height: 600px;
		margin-left: auto;
		margin-right: auto;
	}
   
	#board {

		margin-bottom: 30px;
	}

   
	#unit {
		margin-left:140px;
	}
	
	#secondrow {
		width:1200px;
		margin: 30px auto 0 auto;
	}
	
	#Exchangechart{
		margin-top: 10px;
		margin-left: -35px;
	}
	
	#center-box {
		margin-top: 30px;
		padding-left: 60px;
		padding-right: 0;
	}
	
	#rigth-box{
		margin-top: 60px;
		background: #aaaaaa;
	}

	.overlay {
		position: absolute;
		width: 100%;
		height: 100%;
		background: #000;
		opacity: 0.3;
		transition: all 0.2s ease-out;
	}
	
	.carousel-fade .carousel-inner .item {
		-webkit-transition-property: opacity;
		transition-property: opacity;
	}
	
	.carousel-fade .carousel-inner .item,
	.carousel-fade .carousel-inner .active.left,
	.carousel-fade .carousel-inner .active.right {
		opacity: 0;
	}
	
	.carousel-fade .carousel-inner .active,
	.carousel-fade .carousel-inner .next.left,
	.carousel-fade .carousel-inner .prev.right {
		opacity: 1;
	}
   
	.carousel-fade .carousel-inner .next,
	.carousel-fade .carousel-inner .prev,
	.carousel-fade .carousel-inner .active.left,
	.carousel-fade .carousel-inner .active.right {
		left: 0;
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
	}
	.carousel-fade .carousel-control {
		z-index: 2;
	}
   
	.carousel-indicators {
		margin: 0px;
		height: 0px;
	}

	.carousel-indicators ol {
		width: 100%;
	}
    
	.carousel-indicators li{
		height: 7px !important;
		border-radius: 3px !important; /* 둥근표시 */
		width: 1.5%;
	}  
    
	ol.carousel-indicators li.active {
		background: yellow;
	}  
     
	#moneybox{
		border: 1px solid;
		width: 210px;
		padding: 5px 0 5px 0;
	}
   
	#moneybox2{
		border: 1px solid;
		width:210px;
		padding: 10px 0 10px 0;
	}
   
	.ds_from_money {
		display: block;
		width: 192px;
		height: 25px;
		/* margin: 4px 0 0 6px; */
		border: 0;
		font-family: arial,Helvetica,AppleGothic,sans-serif;
		font-size: 15px;
		font-weight: bold;
		line-height: 20px;
		color: #000;
		text-align: right;
		vertical-align: top;
	}
	.recite {
		display: block;
		width: 192px;
		height: 25px;
		overflow: hidden;
		margin-right: 8px;
		padding: 0 0 5px 12px;
		text-align: right;
		font-size: 12px;
		font-family: '돋움',Dotum;
		color: #676767;
		line-height: 18px;
		white-space: nowrap;
	}

	#exchangeRate, #exchangeRateDiv{
		font-weight: bold ;
		font-style: italic;
		font-size: 14px;
		font-family: '돋움',Dotum;
		margin-top: 5px;
	}
    
	#imgbox{
		margin-left:88px;
		margin-top:10px;
		margin-bottom:10px;
	}

</style>
</head>
<body>

	<%@include file="../../nav_v2.jsp"%>
	<div id="demo" class="carousel slide carousel-fullscreen carousel-fade" data-ride="carousel">
	<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="img/img1.PNG" alt="China">
				<div class="overlay"></div>
			</div>
		
			<div class="item">
				<img src="img/img2.PNG" alt="Chicago">
				<div class="overlay"></div>
			</div>
		
			<div class="item">
				<img src="img/img3.PNG" alt="New York">
				<div class="overlay"></div>
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#demo" role="button" data-slide="prev" style="width: 50px;">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#demo" data-slide="next" role="button" style="width: 50px;">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div> <!-- demo -->

	<div id="secondrow" class="row">
		<div id="Exchangechart" class="col-sm-6"></div><!--그래프가 보여지는 공간임.-->
		<div id="center-box" class="col-sm-3"><!-- align="center" --><h4><b>환율정보</b></h4>
			<div>
				<img src="img/korea.PNG" alt="" width="30">
				<span style="font-size: 17px">대한민국</span>
				<div id="moneybox" style="margin-top: 5px;">
					<span>
						<input id="money1" class="ds_from_money" maxlength="15" type="text" style="ime-mode:disabled; margin-bottom: 3px" value="1" onblur="calculate1()" onkeyup="calculate1()">
					</span>
					<span id="money2" class="recite _recite" style="color:red; padding: 0">1 원</span>
				</div>
			</div>
    
			<div id="imgbox">
				<img src="img/same.png" alt="" style="width:30px;">
			</div>
			
			<div style="margin-bottom: 5px;">
				<select id="selectBox" name="nation" style="width:180px;" onchange="categoryChange(this)"  required="required">
					<option value="선택">선택</option>
					<option value="아랍에미리트">아랍에미리트 AED</option>
					<option value="호주">호주 AUD</option>
					<option value="바레인">바레인 BHD</option>
					<option value="캐나다">캐나다 CAD</option>
					<option value="스위스">스위스 CHF</option>
					<option value="중국">중국 CNH</option>
					<option value="덴마크">덴마크 DKK</option>
					<option value="유럽연합">유럽연합 EUR</option>
					<option value="영국">영국 GBP</option>
					<option value="홍콩">홍콩 HKD</option>
					<option value="인도네시아">인도네시아 IDR</option>
					<option value="일본">일본 JPY</option>
					<option value="쿠웨이트">쿠웨이트 KWD</option>
					<option value="말레이시아">말레이시아 MYR</option>
					<option value="노르웨이">노르웨이 NOK</option>
					<option value="뉴질랜드">뉴질랜드 NZD</option>
					<option value="사우디">사우디아라비아 SAR</option>
					<option value="스웨덴">스웨덴 SEK</option>
					<option value="싱가포르">싱가포르 SGD</option>
					<option value="태국">태국 THB</option>
					<option value="미국">미국 USD</option>
				</select>
			</div>
		
			<div id="moneybox2">
				<span>
					<input id="returnmoney1" class="ds_from_money" maxlength="15" type="text" style="ime-mode:disabled; margin-bottom: 3px" value="1" onblur="uncalculate1()" onkeyup="uncalculate1()">
				</span>
				<span id="returnmoney2" class="recite _recite" style="color:red; padding: 0">1 원</span><span id="unit">화폐 단위</span>
			</div>
     
			<div id="exchangeRateDiv"> 매매기준율: <span id="exchangeRate"></span></div>  
		</div><!-- center-box(환율) -->
  
		<div id="rigth-box" class="col-sm-2" style="padding: 0; margin-left: 80px;">
			<div>
				<p align="center" style="font-size:20px; padding-top: 5px">실시간 검색어 순위</p>
			</div>
			<div style="font-size:17px; padding-left: 10px; padding-bottom: 5px;">
				1. 영국<br>
				2. 스위스<br>
				3. 대한민국<br>
				4. 한국<br>
				5. 독도<br>
				6. 울릉도<br>
				7. 아아아<br>
				8. 오오오<br>
				9. 히히히<br>
				10. 히호
			</div>
		</div>
	</div>

	<div id="board">
	
		<!-- adminBoard -->	
		<div>
			<div style="width: 1100px; margin: 10px auto 0px auto">
				<div id="adminBoard" class="contents" style="padding-top: 30px;">
					<h3 style="padding: 20px 0 20px 5px; margin:0; background-color: #DDDDDD">공지사항</h3>
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
		           
					<hr/>
	
					<c:set var="noticepb" value="${adminBoardListVO.pagingBean}"></c:set>
					<div class="text-center">
						<ul class="pagination">
		
							<c:if test="${noticepb.previousPageGroupByNotice}">
								<a href="main.do?pageNo=${noticepb.startPageOfPageGroupByNotice-1}">
									<img src="img/left_arrow_btn.gif">
								</a>   
							</c:if>
		
							<c:forEach var="i" begin="${noticepb.startPageOfPageGroupByNotice}" 
								end="${noticepb.endPageOfPageGroupByNotice}">
								<c:choose>
									<c:when test="${adminpb.nowPage!=i}">
										<a href="main.do?pageNo=${i}&&MpageNo=${noticepb.nowPage}">${i}</a>
									</c:when>
									<c:otherwise>
										${i}
									</c:otherwise>
								</c:choose>&nbsp;
							</c:forEach>
		
							<c:if test="${adminTipBoardListVO.pagingBean.nextPageGroupByNotice}">
								<a href="main.do?pageNo=${adminTipBoardListVO.pagingBean.endPageOfPageGroupByNotice+1}">
									img src="img/right_arrow_btn.gif">
								</a>
							</c:if>
		    
						</ul>
					</div> 
				</div>
			</div>
		</div>
		<!-- adminBoard -->
		
		<c:set var="adminpb" value="${adminTipBoardListVO.pagingBean}"></c:set>
		<c:set var="memberpb" value="${memberTipBoardListVO.pagingBean}"></c:set>
		
		<!-- adminTipBoard -->
		<div>
			<div style="width: 1100px; margin: 10px auto 0px auto">
				<div id="adminTipBoard" class="contents" style="padding-top: 20px;">
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
					<hr/>
	           
					<c:if test="">
						<a class="btn btn-default pull-right" href="#" onclick="checkLogin()">글쓰기</a>
					</c:if>
					<div class="text-center">
						<ul class="pagination">
						
							<c:if test="${adminpb.previousPageGroup}">
								<a href="main.do?ApageNo=${adminpb.startPageOfPageGroup-1}">
									<img src="img/left_arrow_btn.gif">
								</a>   
							</c:if>
					
							<c:forEach var="i" begin="${adminpb.startPageOfPageGroup}" 
								end="${adminpb.endPageOfPageGroup}">
								<c:choose>
									<c:when test="${adminpb.nowPage!=i}">
										<a href="main.do?ApageNo=${i}&&MpageNo=${memberpb.nowPage}">${i}</a>
									</c:when>
									<c:otherwise>
										${i}
									</c:otherwise>
								</c:choose>&nbsp;
							</c:forEach>
						
							<c:if test="${adminTipBoardListVO.pagingBean.nextPageGroup}">
								<a href="main.do?ApageNo=${adminTipBoardListVO.pagingBean.endPageOfPageGroup+1}">
									<img src="img/right_arrow_btn.gif">
								</a>
							</c:if>
					
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- adminTipBoard -->
		
		<!-- memberTipBoard -->
		<div>
			<div style="width: 1100px; margin: 10px auto 0px auto">
				<div id="memberTipBoard" class="contents" style="padding-top: 20px;">
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
					<hr/>
		           
					<a class="btn btn-default pull-right" href="#" onclick="checkLogin()">글쓰기</a>
					<div class="text-center">
						<ul class="pagination">
		
							<c:if test="${memberpb.previousPageGroup}">
								<a href="main.do?MpageNo=${memberpb.startPageOfPageGroup-1}">
									<img src="img/left_arrow_btn.gif">
								</a>   
							</c:if>
		
							<c:forEach var="i" begin="${memberpb.startPageOfPageGroup}" 
								end="${memberpb.endPageOfPageGroup}">
								<c:choose>
									<c:when test="${memberpb.nowPage!=i}">
										<a href="main.do?MpageNo=${i}&&ApageNo=${adminpb.nowPage}">${i}</a>
									</c:when>
									<c:otherwise>
										${i}
									</c:otherwise>
								</c:choose>&nbsp;
							</c:forEach>
		
							<c:if test="${memberTipBoardListVO.pagingBean.nextPageGroup}">
								<a href="main.do?MpageNo=${memberTipBoardListVO.pagingBean.endPageOfPageGroup+1}">
									<img src="img/right_arrow_btn.gif">
								</a>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- memberTipBoard -->
		
	</div> 
	
	<div>
		<%@include file="../../footer.jsp"%>
	</div>

</body>
</html>
