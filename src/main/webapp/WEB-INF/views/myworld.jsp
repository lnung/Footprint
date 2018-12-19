<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Marker Clustering</title>

<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
   src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhGyJ-1eY-eZCjMoFO48yjiydWDJusttU&callback=initMap"></script>

<script type="text/javascript"
   src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"
   charset="utf-8"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/smarteditor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
   charset="utf-8"></script>

<style type="text/css">
#map {
   height: 100%;
}

html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}
</style>

<script type="text/javascript">
$(function() {
   $("#dialog").dialog({
      width: 800,
       height: 800,
      autoOpen : false,
      show : {
         effect : "blind",
         duration : 500
      },
      hide : {
         effect : "explode",
         duration : 500
      }
   });


});

</script>
</head>

<body>

   <c:choose>
      <c:when test="${vo != null}">

         <div id="map"
            style="width: 1500px; height: 750px; margin: 50px auto 0 auto"></div>
      
         <script type="text/javascript">
            var map;
            var markers;
            var worldName;
            var nationName;
            
            function initMap() {
               <c:choose>
                  <c:when test="${check == 0}">
                     map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 2.3,
                        center: {lat: 45.150, lng: -0.820}
                     });
                     markers = locationWorld.map(function(location) {
                        return new google.maps.Marker({
                           position: location,
                           map: map
                        });
                     });
                     var c = "world";
                     for (var i = 0; i < locationWorld.length; i++)
                        clickEvent(i, markers, c);
                  </c:when>
                  <c:otherwise>
                     Nation();
                  </c:otherwise>
               </c:choose>
               zoomcontroll(map, map.getZoom());
            }//initMap
            
            function Nation(){
               <c:choose>
                  <c:when test="${check == 1}">
                     map = new google.maps.Map(document.getElementById('map'), {
                        <c:choose>
                           <c:when test="${nationCoordinate.nation == '아시아'}">
                              zoom: 3.6,
                              center: {lat: ${nationCoordinate.xCoordinate-20}, lng: ${nationCoordinate.yCoordinate}}
                           </c:when>
                           <c:when test="${nationCoordinate.nation == '유럽'}">
                              zoom: 3.6,
                              center: {lat: ${nationCoordinate.xCoordinate+7}, lng: ${nationCoordinate.yCoordinate-10}}
                           </c:when>
                           <c:when test="${nationCoordinate.nation == '아프리카'}">
                              zoom: 3.6,
                              center: {lat: ${nationCoordinate.xCoordinate-18}, lng: ${nationCoordinate.yCoordinate}}
                           </c:when>
                           <c:otherwise>
                              zoom: 3.6,
                              center: {lat: ${nationCoordinate.xCoordinate}, lng: ${nationCoordinate.yCoordinate}}
                           </c:otherwise>
                        </c:choose>
                        
                     });
                     markers = locationNation.map(function(location) {
                        return new google.maps.Marker({
                           position: location,
                           map: map
                        });
                     });
                     var c = "nation";
                     for (var i = 0; i < locationNation.length; i++)
                        clickEvent(i, markers, c);
                  </c:when>
                  <c:otherwise>
                     City();
                  </c:otherwise>
               </c:choose>
               zoomcontroll(map, map.getZoom());
      
            }//Nation
            
            function City(){
            var icon = {
                url: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
                scaledSize: new google.maps.Size(40,42)
            }
               
               <c:if test="${check == 2}">

                  map = new google.maps.Map(document.getElementById('map'), {
                     zoom: 5,
                     center: {lat: ${cityCoordinate.xCoordinate}, lng: ${cityCoordinate.yCoordinate}}
                  });
                  markers = locationCity.map(function(location) {
                     var aa = new google.maps.Marker({
                           position: location,
                           map: map,
                           title: location.city

                     });

                  <c:forEach var="mc" items="${mcList}">
                     if (aa.getTitle() == '${mc}'){
                        aa.setIcon(icon);
                     }   
                  </c:forEach>
                  return aa;
                 });
                  for (var i = 0; i < locationCity.length; i++)
                     clickMarker(markers, i);
               </c:if>
               zoomcontroll(map, map.getZoom());
            }//City
            
            function zoomcontroll(map, orgZoom){
               map.addListener('zoom_changed', function() {
                  if(orgZoom == 3.6){
                     if(map.getZoom() == 3) {
                        location.href="marker.do";
                        initMap();
                     }
                  }
                      
                  else if(orgZoom == 5){
                     if(map.getZoom() == 4) {
                        location.href="markerNation.do?worldName=${worldName}";
                        Nation();
                     }
                  }
                      //else if(map.getZoom() == 4) Asia();
               });
            }//zoomcontroll
                  
            function clickEvent(i, markers, c) {
               google.maps.event.addListener(
                  markers[i], 
                  "click", 
                  function (e) {
                     if(c == "world"){
                         $( function() {
                            worldName = locationWorld[i].world;
                           location.href="markerNation.do?worldName="+worldName;
                           Nation();
                        });
                     }
                     else if(c == "nation"){
                        $( function() {
                           nationName = locationNation[i].nation;
                           location.href="markerCity.do?nationName="+nationName+"&&worldName=${worldName}&&id=${vo.id}";
                           City();
                        });
                     }
                  }
               );
            }//clickEvent
            
         function clickMarker(markers, i) {
             var markerCheck="fail";
            google.maps.event.addListener(    
               markers[i], 
                  "click", 
                  function (e) {
                     $( function() {   
                        /* var icon = { 
                               url: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
                        };
                           markers[i].setIcon(icon);
                        alert("post===="); */
                        var cityName = locationCity[i].city;
                           $( "#dialog" ).dialog("option", "title", "${worldName} > ${nationName} > " + cityName );
                           document.frm.cityName.value = cityName;
                           $( "#dialog" ).dialog("open");
                           oEditors.getById["smarteditor"].exec("CHANGE_EDITING_MODE", ["WYSIWYG"]);
                           oEditors.getById["smarteditor"].exec("RESET_TOOLBAR");
                                              
                           
                           if($('#dialog').dialog('isOpen')){
                              //$(".add").remove();
                              $.ajax({   
                              type: "get",
                              url: "memberBoardList.do?id="+$("#id").val()+"&&cityName="+locationCity[i].city,
                              
                                 success:function(data){
                                  if(data.mbList != null){
                                     $.each(data.mbList, function(index, mbList) {
                                        
                                         $("#dialog").append(
                                             "<div class='add' style='border-top: 1px dashed gray; padding-bottom:20px'>"+ 
                                                 "<table border='1' align='center' width='90%' style='table-layout: fixed; margin-top: 20px'>"+
                                                   "<tr>" +
                                                      "<th style='width: 100px;'>Location</th>"+
                                                      "<td style='width: 500px;' colspan='3'><input type='text' style='width: 99%;' readonly='readonly' value='"+mbList.location+"'></td>" +
                                                   "</tr>"+
                                                   "<tr>"+
                                                      "<span>"+
                                                         "<th style='width: 100px;'>Travel period</th>"+
                                                        "<td style='width: 200px;'><input type='text' style='width: 99%;' readonly='readonly' value='"+mbList.tripDate+"'></td>" +
                                                     "</span>"+
                                                     "<span>"+
                                                         "<th style='width: 100px;'>Write Date</th>"+
                                                        "<td style='width: 200px;'><input type='text' style='width: 99%;' readonly='readonly' value='"+mbList.wDate+"'></td>" +
                                                     "</span>"+
                                                  "</tr>"+
                                                  "<tr>" +
                                                     "<td colspan='4'>"+mbList.content+"</textarea></td>" +
                                                  "</tr>"+
                                                "</table>"+
                                             "</div>"
                                          );//append
                                         markers[i].setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png');
                                        
                                      });//each
                                  }//if
                                  else{
                                     alert("작성한 데이터가 없습니다.");
                                  }
                                },
                                error:function(data){
                                  alert("작성한 데이터가 없습니다.");
                                }
                             });
                              
                              //전송버튼
                            $("#savebutton").click(function(){
                               $(".add").remove();
                               
                               //id가 smarteditor인 textarea에 에디터에서 대입
                               oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
                               //폼 submit
                               var frm = $("#frm").serialize();
                               
                               $.ajax({   
                                  type: "get",
                                  url: "write.do",
                                  data: frm,
                                  dataType : "json", // serialize하면 json형태로 값을 보내줘야합니다.
                                     success:function(data){
                                        alert("작성완료");
                                      $.each(data.mbList, function(index, mbList) {
      
                                         $("#dialog").append(
                                               "<div class='add' style='border-top: 1px dashed gray'>"+ 
                                                "<table border='1' align='center' width='90%' style='table-layout: fixed; margin-top: 20px'>"+
                                                  "<tr>" +
                                                     "<th style='width: 100px;'>Location</th>"+
                                                     "<td style='width: 500px;' colspan='3'><input type='text' style='width: 99%;' readonly='readonly' value='"+mbList.location+"'></td>" +
                                                  "</tr>"+
                                                  "<tr>"+
                                                     "<span>"+
                                                        "<th style='width: 100px;'>Travel period</th>"+
                                                       "<td style='width: 200px;'><input type='text' style='width: 99%;' readonly='readonly' value='"+mbList.tripDate+"'></td>" +
                                                    "</span>"+
                                                    "<span>"+
                                                        "<th style='width: 100px;'>Write Date</th>"+
                                                       "<td style='width: 200px;'><input type='text' style='width: 99%;' readonly='readonly' value='"+mbList.wDate+"'></td>" +
                                                    "</span>"+
                                                 "</tr>"+
                                                 "<tr>" +
                                                    "<td colspan='4'>"+mbList.content+"</textarea></td>" +
                                                 "</tr>"+
                                               "</table>"+
                                               "</div>"
                                          );//append
                                         markers[i].setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png');
                                      });
                                    },
                                    error:function(data){
                                      alert("작성에 실패하셨습니다.");
                                    }
                                 });
                            });   
                            
                           }//if
      
                          $('#dialog').on('dialogclose',function(event){
      
                        $(".add").remove();
                           location.reload();
                        });
                           
                        
                  });
               }
            );
            }
            
             var locationWorld = [
                <c:forEach items="${worldList}" var="worldList">   
                  {lat: ${worldList.xCoordinate}, lng: ${worldList.yCoordinate}, world: "${worldList.world}"},
               </c:forEach>   
            ];
          
            var locationNation = [
               <c:forEach items="${nationList}" var="nationList">   
                  {lat: ${nationList.xCoordinate}, lng: ${nationList.yCoordinate}, nation: "${nationList.nation}"},
               </c:forEach>
            ];
            
            var locationCity = [
               <c:forEach items="${cityList}" var="cityList">   
                  {lat: ${cityList.xCoordinate}, lng: ${cityList.yCoordinate}, city: "${cityList.city}"},
               </c:forEach>
            ];
            
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
                  $("iframe").css("width","100%").css("height","600px");
                  oEditors.getById["smarteditor"].exec("PASTE_HTML", ["여기에 내용을 써주세요."]);
               }
            });
         });
      
         function pasteHTML(filepath){
            /* var sHTML = '<img src=${pageContext.request.contextPath}/upload/'+id+'/'+filepath+' width="265px" id="img'+count+'">'; */
            var sHTML = '<img src="<%=request.getContextPath()%>/upload/'+filepath+'" width="50px">';
            oEditors.getById["smarteditor"].exec("PASTE_HTML", [sHTML]);
         }
             
            /* //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
            function submitContents(elClickedObj) {
                // 에디터의 내용이 textarea에 적용된다.
                oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", [ ]);
             
                // 에디터의 내용에 대한 값 검증은 이곳에서
                // document.getElementById("textAreaContent").value를 이용해서 처리한다.
              
                try {
                    elClickedObj.form.submit();
                } catch(e) {
                 
                }
            } */
            
          </script>
      
         <div id="dialog">
            <div id="content">
               <form name="frm" id="frm">
                  <input type="hidden" name="cityName" value="">
                  <input type="hidden" name="id" id="id" value="${vo.id}">
      
                  <table border="1" align="center" width="90%"
                     style="table-layout: fixed; margin-top: 20px">
                     <tr>
                        <th style="width: 100px;">Location</th>
                        <td style="width: 500px;"><input type="text"
                           name="location" id="location" required="required"
                           style="width: 99%;" placeholder="자세한 위치를 작성해주세요."></td>
                     </tr>
                     <tr>
                        <th style="width: 100px;">Travel period</th>
                        <td style="width: 500px;"><input type="text"
                           name="travelPeriod" id="travelPeriod" required="required"
                           style="width: 99%;" placeholder="여행 기간을 기록해주세요."></td>
                     </tr>
                     <tr>
                        <td colspan="2"><textarea id="smarteditor" rows="30"
                              cols="40" name="smarteditor" style="width: 99%;"></textarea></td>
                     </tr>
                  </table>
               </form>
               <table width="100%" style="margin-top: 10px; margin-bottom: 10px">
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
            </div>
            <div class="add">
            </div>
         </div>
      </c:when>
      <c:otherwise>
         <script>
            $(function() {
               alert("로그인 후 이용 가능합니다.");
               location.href="${pageContext.request.contextPath}/login_ani.jsp";
            })
         </script>
      </c:otherwise>
   </c:choose>
</body>
</html>