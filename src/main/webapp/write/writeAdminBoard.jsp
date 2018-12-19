<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"	charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

<script type="text/javascript">

var oEditors = [];
$(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
      	elPlaceHolder: "smarteditor",
      	sSkinURI: "./smarteditor/SmartEditor2Skin.html",
      	htParams : {
          	// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
          	bUseToolbar : true,             
          	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
          	bUseVerticalResizer : true,     
          	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
          	bUseModeChanger : true,
          	fOnBeforeUnload : function(){
         	}
      	},
		fCreator: "createSEditor2",
      	fOnAppLoad : function(){
          	//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			/* $("iframe").css("width","100%").css("height","600px"); */
			oEditors.getById["smarteditor"].exec("PASTE_HTML", ["여기에 내용을 써주세요."]);
		}
	});
	
	//전송버튼
	$("#savebutton").click(function(){
		//id가 smarteditor인 textarea에 에디터에서 대입
		oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		//폼 submit
		$("#frm").submit();
	});
	
}); 
  

function pasteHTML(filepath){
	/* var sHTML = '<img src=${pageContext.request.contextPath}/upload/'+id+'/'+filepath+' width="265px" id="img'+count+'">';  */
	var sHTML = '<img src="<%=request.getContextPath()%>/upload/'+filepath+'" width="50px">';
	/* var sHTML = '<img src="C:/kyj/FinalProject/eclipse/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FootPrint/upload/'+filepath+'" width="50px">'; */
	oEditors.getById["smarteditor"].exec("PASTE_HTML", [sHTML]);
}

</script>


</head>


<body>
<%@include file="../nav_v2.jsp"%>

<div>
<h1> writeAdminBoard</h1>
<form action="write.do" method="post" name="frm" id="frm">
						<input type="hidden" name="cityName" value="">
						<!--  enctype="multipart/form-data" -->
						<!-- <input type="hidden" name="command" value="write"> -->
						<table border="1" align="center" width="90%"
							style="table-layout: fixed; margin-top: 20px">
							<tr>
								<th style="width: 100px;">Location</th>
								<td style="width: 500px;"><input type="text" name="location" id="location"
									required="required" style="width: 99%;"
									placeholder="자세한 위치를 작성해주세요."></td>
							</tr>
							<tr>
								<th style="width: 100px;">Travel period</th>
								<td style="width: 500px;"><input type="text" name="travelPeriod" id="travelPeriod"
									required="required" style="width: 99%;"
									placeholder="여행 기간을 기록해주세요."></td>
							</tr>
							<tr>
								<td colspan="2"><textarea id="smarteditor" rows="30" cols="40" name="smarteditor" style="width: 99%;"></textarea></td>
							</tr>
						</table>
		
						<table width="100%" style="margin-top: 10px">
							<tr>
								<span>
									<td align="left"><input type="button" value="취소"></td>
								</span>
								<span>
									<td align="right"><input type="submit" id="savebutton"
										value="작성"></td>
								</span>
							</tr>
						</table>
					</form>
					</div>

</body>
</html>