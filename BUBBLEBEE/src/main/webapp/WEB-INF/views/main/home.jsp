<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUBBLEBEE</title>
</head>
<style>
/* 슬라이드 css*/
#slide {
	min-height: 300px;
	text-align: center;
}
#slide>img {
	width: 80%;
	height: 400px;
	text-align: center;
	border-radius: 20px;
	height: 500px;
}
#next {
	width: 50px;
	height: 50px;
	display: inline-block;
}
#prev {
	width: 50px;
	height: 50px;
	display: inline-block;
}
.btn-direction {
	border: none;
	background: none;
	/*    display: inline-block; */
}
/* 슬라이드css끝 */

/* 인기 있는 카테고리 css */
.tpopular{
	margin: 0 auto;
	text-align: center;
	/* width: 80%; */
}
#tpopular1{
	width: 80%;
}
#tpopular2{
	width: 100%
}
.c_popular {
	width: 110px;
    height: 110px;
    border-radius: 80px;
    /* margin-right: 35px;
    margin-left: 10px; */
}
.c_label{
    font-size: 15px;
    width: 110px;
    margin-right: 35px;
    margin-left: 10px;
    text-align: center;
}

/* 매거진 */
.m_post{
	margin-right: 18px;
	width: 100%;
    height: 250px;
}
.m_postLast{
	width: 100%;
    height: 250px;
    border-radius: 10px;
}
.m_box{
	width: 100%;
    height: 100%;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(238, 238, 238);
    border-image: initial;
    border-radius: 5px;
    overflow: hidden;
}
.m_title {
    display: flex;
    line-height: 12px;
    background-color: white;
    font-size: 12px;
    flex-flow: column nowrap;
    padding: 20px;
    border-radius: inherit;
}
.m_total{
	display: flex;
    min-height: 1px;
}
.m_middle{
	margin-right: 10px;
    width: 0px;
    -webkit-box-flex: 1;
    flex-grow: 1;
    cursor: pointer;
}
.m_middleLast{
    width: 0px;
    -webkit-box-flex: 1;
    flex-grow: 1;
    cursor: pointer;
}
.m_bigTitle{
	margin-bottom: 10px;
    height: 29px;
    line-height: normal;
    font-size: 20px;
    font-weight: bold;
    width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

/* 지금 뜨는 모임 CSS */
.moim{
	display: flex;
    min-height: 1px;
}
.moim > *{
	margin-right: 10px;
    width: calc(25% - 7.5px);
    margin-bottom: 31px;
}
.moim_total{
	display: flex;
    background-color: white;
    min-height: 1px;
    flex-flow: column nowrap;
}
.moim_each{
	overflow: hidden;
}
.moim_l_location{
	height: 10px;
    color: white;
    font-size: 10px;
    font-weight: 500;
    line-height: 10px;
    text-shadow: rgba(0, 0, 0, 0.3) 0px 0px 10px;
    margin: 2px 0px 0px 2px;
}
.moim_heart{
	width: 24px;
    height: 24px;
    line-height: normal;
    background-color: transparent;
    text-align: center;
    cursor: pointer;
    font-size: 14px;
    padding: 0px;
    border-radius: 5px;
}
.moim_small_title{
	margin-top: 14px;
    font-size: 12px;
    height: 14px;
    text-overflow: ellipsis;
    line-height: 14px;
    color: rgb(155, 155, 155);
    overflow: hidden;
}
.moim_title{
	margin-top: 10px;
    height: auto;
    max-height: 40px;
    line-height: 20px;
    font-size: 14px;
    word-break: keep-all;
    overflow-wrap: break-word;
    font-weight: 500;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
.moim_price{
	margin-top: 14px;
    line-height: 14px;
    height: 14px;
}
.moim_score{
	margin-top: 14px;
	font-size: 11px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(187, 187, 187);
}
.moim_img{
	position: relative;
    -webkit-box-flex: 0;
    flex-grow: 0;
    flex-shrink: 0;
    flex-basis: auto;
    min-height: 1px;
    background-color: rgb(0, 0, 0);
    border-radius: 5px;
    width: 100%
}
.heart_div{
	position: absolute;
    right: 0px;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    z-index: 1;
    padding: 10px;
}
.heart_button{
	width: 24px;
    height: 24px;
    line-height: normal;
    background-color: transparent;
    text-align: center;
    cursor: pointer;
    font-size: 14px;
    padding: 0px;
    border: none;
}
</style>
<script>
 window.onload = function(){
		$.ajax({
		url : 'option.do',
	});
	};
</script>
<body>
	<header id="header">
	  <c:import url="../layout/header.jsp"/>
   	</header>

	<section style="padding-top: 115px; padding-left: 20%; width: 78%;" id="section">
		<!-- 슬라이드 -->
		<div id="slide">
			<button class="btn-direction">
				<img id="prev" src="${contextPath }/resources/img/prev.png">
			</button>
		   <img class="slides" id="slide1" src="${contextPath }/resources/img/ybee.png">
		   <img class="slides" id="slide2" src="${contextPath }/resources/img/banner1.PNG">
		   <img class="slides" id="slide3" src="${contextPath }/resources/img/banner2.PNG">
		   <img class="slides" id="slide4" src="${contextPath }/resources/img/banner3.PNG">
		   <button class="btn-direction"><img id="next" src="${contextPath }/resources/img/next.png"></button>
		   <script>
		   $(document).ready(function(){
			    $('#slide4').hide();
			    $('#slide3').hide();
				$('#slide2').hide();
	
				var currentSlide = 1;
				$('#next').click(function() {
					if (currentSlide == 1) {
						$('#slide1').hide();
						$('#slide2').fadeIn(800);
						currentSlide = 2;
					} else if (currentSlide == 2) {
						$('#slide2').hide();
						$('#slide3').fadeIn(800);
						currentSlide = 3;
					} else if (currentSlide == 3) {
						$('#slide3').hide();
						$('#slide4').fadeIn(800);
						currentSlide = 4;
					} else if (currentSlide == 4) {
						$('#slide4').hide();
						$('#slide1').fadeIn(800);
						currentSlide = 1;
					}
				});
	
				$('#prev').click(function() {
					if (currentSlide == 1) {
						$('#slide1').hide();
						$('#slide4').fadeIn(800);
						currentSlide = 4;
					} else if (currentSlide == 2) {
						$('#slide2').hide();
						$('#slide1').fadeIn(800);
						currentSlide = 1;
					} else if (currentSlide == 3) {
						$('#slide3').hide();
						$('#slide2').fadeIn(800);
						currentSlide = 2;
					} else if (currentSlide == 4) {
						$('#slide4').hide();
						$('#slide3').fadeIn(800);
						currentSlide = 3;
					}
				});
				 
				setInterval(function(){
					if (currentSlide == 1) {
						$('#slide1').hide();
						$('#slide2').fadeIn(800);
						currentSlide = 2;
					} else if (currentSlide == 2) {
						$('#slide2').hide();
						$('#slide3').fadeIn(800);
						currentSlide = 3;
					} else if (currentSlide == 3) {
						$('#slide3').hide();
						$('#slide4').fadeIn(800);
						currentSlide = 4;
					} else if (currentSlide == 4) {
						$('#slide4').hide();
						$('#slide1').fadeIn(800);
						currentSlide = 1;
					}
		        }, 5000);
				
		   });
		   </script>
	   </div> 
	   <br>
	   <br>
	   
	   <!-- 인기있는 카테고리 -->
	   <div id="popular">
	   		<p style="font-weight: bold; font-size: 20px;">카테고리</p><br>
	   		<table class="tpopular" id="tpopular1">
	   			<tr>
		   			<td><a href="list.bo?cate=party"><img id="firstCg" class="c_popular" src="${contextPath }/resources/img/토크.jpg"/><br>토크/파티</a></td>
	   				<td><a href="list.bo?cate=like"><img id="secondCg" class="c_popular" src="${contextPath }/resources/img/취미.jpg"/><br>취향</a></td>
	   				<td><a href="list.bo?cate=study"><img id="thirdCg" class="c_popular" src="${contextPath }/resources/img/스터디.jpg" /><br>스터디</a></td>
	   				<td><a href="list.bo?cate=event"><img id="fourthCg" class="c_popular" src="${contextPath }/resources/img/이벤트.jpg" /><br>이벤트/공간</a></td>
	   			</tr>
			</table><br><br>
			<table class="tpopular" id="tpopular2">	
				<tr>
					<td><a href="list.bo?cate=diy"><img id="fifthCg" class="c_popular"  src="${contextPath }/resources/img/공예.jpg" /><br>공예/DIY</a></td>
					<td><a href="list.bo?cate=cook"><img id="sixthCg" class="c_popular"  src="${contextPath }/resources/img/요리.jpg" /><br>요리</a></td>
					<td><a href="list.bo?cate=sport"><img id="seventhCg" class="c_popular" src="${contextPath }/resources/img/스포츠.jpg" /><br>스포츠</a></td>
					<td><a href="list.bo?cate=learn"><img id="eightthCg" class="c_popular" src="${contextPath }/resources/img/취업.jpg" /><br>어학/취업</a></td>
					<td><a href="list.bo?cate=sell"><img id="ninthCg" class="c_popular" src="${contextPath }/resources/img/작품.jpg" /><br>작품</a></td>
				</tr>
	   		</table><br><br>
	   </div>
	   <br>
	   <br>
	   
	   <!-- 가까운 모임 -->
	   <div>
	   		<label style="font-weight: bold; font-size: 20px;">내 주변 모임</label>
	   		<br><br>
	   		<div id="map" style="width:100%; height: 350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be0b8d3e154f1e2bf1a278bd7fbf3d2a&libraries=services"></script>
	   </div>
	   
	   <br>
	   <br>
	   <br>
	   
	   <c:set var="mList" value="${ mList }" />
	   <c:set var="cList" value="${ cList }" />
	   
	   <!-- 지금 뜨는 모임 -->
	   <div>
	   	<label style="font-weight: bold; font-size: 20px;">지금 뜨는 모임</label>
	   	<a href="upMoimList.do"><label style="float: right; padding-right: 5px; cursor: pointer;">전체보기</label></a>
	   	<br><br>
	   	<div class="moim">
	   		<c:forEach items="${ mList }" var="ml">
	   		<c:set var="rf2" value="${ ml.renameFileName }"/>
                     <% 
                     	String rf2 = (String)pageContext.getAttribute("rf2");
                     	String str2 = null;
                     	if(!rf2.contains(",")) {
                     		str2 = rf2;
                     	} else {
                     		int idx2 = rf2.indexOf(",");
                			str2 = rf2.substring(0, idx2);
                     	}
            			
            			pageContext.setAttribute("str2", str2);
                     %> 
	   		<div class="moim_total">
	   			<a href="detail.bo?fno=${ ml.fno }">
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/buploadFiles/${ str2 }" />
						</div>
	   					<div class="moim_small_title">${ ml.small_title }</div>
	   					<div class="moim_title">${ ml.ftitle }</div>
	   					<div class="moim_price">
	   						<span>${ ml.price }</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>${ ml.avgrv }</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		</c:forEach>
	   	</div>
	   </div>
	   <br>
	   <br>
	   <br>
	   <!-- 지금 뜨는 클래스 -->
	   <div>
	   	<label style="font-weight: bold; font-size: 20px;">지금 뜨는 클래스</label>
	   	<a href="upClassList.do"><label style="float: right; padding-right: 5px; cursor: pointer;" >전체보기</label></a>
	   	<br><br>
	   	<div class="moim">
	   		<c:forEach items="${ cList }" var="cl">
	   		<c:set var="rf3" value="${ cl.renameFileName }"/>
                     <% 
                     	String rf3 = (String)pageContext.getAttribute("rf3");
                     	String str3 = null;
                     	if(!rf3.contains(",")) {
                     		str3 = rf3;
                     	} else {
                     		int idx2 = rf3.indexOf(",");
                			str3 = rf3.substring(0, idx2);
                     	}
            			
            			pageContext.setAttribute("str3", str3);
                     %> 
	   		<div class="moim_total">
	   			<a href="detail.bo?fno=${ cl.fno }">
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/buploadFiles/${ str3 }" />
						</div>
	   					<div class="moim_small_title">${ cl.small_title }</div>
	   					<div class="moim_title">${ cl.ftitle }</div>
	   					<div class="moim_price">
	   						<span>${ cl.price }</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>${ cl.avgrv }</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		</c:forEach>
	   	</div>
	   </div>
	   
<!-- 	   <button onclick="location.href='test.do'">버튼</button> -->
	</section>
	
	<script>
			$(function(){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨 
			    }; 
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
			        // 마커와 인포윈도우를 표시합니다
			        displayMarker(locPosition, message);
			            
			      });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    
			    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
			        message = 'geolocation을 사용할수 없어요..'
			    displayMarker(locPosition, message);
			}
			
			// 지도에 마커와 인포윈도우를 표시하는 함수입니다
			function displayMarker(locPosition, message) {
			
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({  
			        map: map, 
			        position: locPosition
			    }); 
			    
			    // 지도 중심좌표를 접속위치로 변경합니다
			    map.setCenter(locPosition); 
			    markMap(map);
			}
		})    
	</script>
		
		<script>
			function markMap(map){
				console.log(map);
				$.ajax({
					url: 'location.do',
					dataType: 'json',
					success: function(data){
						console.log(data);
						// 마커를 표시할 위치와 title 객체 배열입니다
						var positions = [];
						var loc;
						/* console.log(data.list);
						console.log(data.list.length); */
						for(var i = 0; i < data.list.length; i++){
							loc = 
							{
								title: data.list[i].fno + "/" + data.list[i].cat,
								fno: data.list[i].fno,
								latlng: new kakao.maps.LatLng(data.list[i].lat, data.list[i].lon)
							}
							positions.push(loc);
						}
						
						console.log(positions);
						
						for(var i in positions){
							console.log("positions[i] : " + positions[i]);
						}
						
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						
						var fno;
						
						for (var i = 0; i < positions.length; i ++) {
						    
						    // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new kakao.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
						    
						    var str = positions[i].title;
						    var category = str.substring(str.lastIndexOf("/")+1);
						    var tt = "";
						    
						    switch(category){
				        	case "party" : tt = "토크/파티"; break;
				        	case "like" : tt = "취향"; break;
				        	case "study" : tt =  "스터디"; break;
				        	case "event" : tt =  "이벤트/공간"; break;
				        	case "diy" : tt = "공예/DIY"; break;
				        	case "cook" : tt = "요리"; break;
				        	case "sport" : tt = "스포츠"; break;
				        	case "learn" : tt = "어학/취업"; break;
				        	case "sell" : tt = "작품"; break;
						    }
						    
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng, // 마커를 표시할 위치
						        title : tt, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
						    });
						    
						    fno = str.substring(0,str.lastIndexOf("/"));
						}
						
						// 마커에 클릭이벤트를 등록합니다
						if(data.list.length != 0){
							kakao.maps.event.addListener(marker, 'click', function() {
							      // 마커 위에 인포윈도우를 표시합니다
							    console.log("fno" + fno);
							    location.href="detail.do?fno="+fno;
							});
						}
					}
				})
			};
		</script>
	   
	<footer id="footer" style="padding-top: 115px;">
		<%@ include file = "../layout/footer.jsp" %>
	</footer>
   
</body>
</html>