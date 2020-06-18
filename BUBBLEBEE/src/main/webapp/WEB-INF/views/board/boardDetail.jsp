<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BUBLEBEE</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/boardDetail1.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/boardDetail3.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&displ ay=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	var j = $.noConflict(true); // $.noConflict(true) 를 사용해서 $ -> 변수로 선언한 j로 바꾸니 해결!
	j(document).ready(function() {
		var main = j('.bxslider').bxSlider({
			mode : 'fade',
			auto : true, //자동으로 슬라이드 
			controls : true, //좌우 화살표   
			autoControls : true, //stop,play 
			pager : true, //페이징 
			pause : 3000,
			autoDelay : 0,
			slideWidth : 500,
			speed : 300,
			stopAutoOnclick : true
		});

		j(".bx-stop").click(function() { // 중지버튼 눌렀을때 
			main.stopAuto();
			j(".bx-stop").hide();
			j(".bx-start").show();
			return false;
		});

		j(".bx-start").click(function() { //시작버튼 눌렀을때 
			main.startAuto();
			j(".bx-start").hide();
			j(".bx-stop").show();
			return false;
		});

		j(".bx-start").hide(); //onload시 시작버튼 숨김. 
	});
</script>
</head>
<style>
#header {
	position: fixed;
	width: 100%;
}

.navbar-nav>li {
	font-size: 20px;
}
</style>
<body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27cfa1d7725d616c3b4f7135fba99e8e&libraries=services"></script>
	<header id="header" style="z-index: 99999">
		<%@ include file="../layout/header.jsp"%>
	</header>
	
	<section style="padding-top: 115px; padding-left: 5%; width: 85%;">
		<div id="detailMainForm1" class="detailMainForm">
			<h2>
			<c:if test="${ b.ftype == 1}">
				모임
			</c:if>
			<c:if test="${ b.ftype == 2 }">
				클래스
			</c:if>
			<c:if test="${ b.ftype == 3 }">
				클래스
			</c:if>
			상세보기</h2>
			<!-- 사진 슬라이드 보기 -->
			<div class="home__slider" style="float: left; width: 100%;">
				<div class="bxslider" id="detailImages">
				<c:set var="renameFileName" value="${ b.renameFileName }" />
					<!-- renameFileName : ${ renameFileName }  -->
					<c:set var="renameFileNameArr" value="${ renameFileName.split(',') }"/>
					<!-- ${ renameFileNameArr[1] }  -->
					<c:forEach var="i" begin="0" end="${fn:length(renameFileNameArr)-1}">
						<div id = "img" >
							<!-- <img src="<%=request.getContextPath() %>/src/main/webapp/resources\buploadFiles\${ renameFileNameArr[i] }" class="hospitalImage"> -->
							<!-- <img src="/Users/hansolkim/git/KH-FINAL-PROJECT/BUBBLEBEE/src/main/webapp/resources\buploadFiles\20200610165932(0).jpeg" class="hospitalImage"> -->
							<img src = "${contextPath }/resources/buploadFiles/${ renameFileNameArr[i] }"/>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 상세보기 -->
			<div class="hashTag">
				<!-- 해시태그 내용들 -->
				<div class="hashTagTag">${ b.small_title }</div>
				<div class="hashTagTitle">${ b.ftitle }</div>
				<div class="hashTagPrice">${ b.price } 원</div>
				<hr>
				<div>
					<div>좋아요 누른 인원 + 명이 좋아한 모임</div>
					<div>원하는 요일 날짜</div>
					<div>장소</div>
					<div>첫 후기 남기고 1,000마일리지 받아가세요!</div>
				</div>
				<hr>
				<div>
					<!-- 호스트 -->
					<div class="hashTagHostTitle">호스트</div>
					<!-- 호스트 프로필 -->
					<div class="hashTagHostImage">
						<img class="hashTagHostImageContent"
							src="${ host.member.profile }">
					</div>
					<!-- 호스트명 -->
					<div class="hashTagHostName">${ host.member.userName }</div>
					<!-- 해당 호스트가 개설한 클래스개수 | 좋아요 수  -->
					<div class="hashTagHostLike">클래스 18 | 좋아요 1818</div>
					<!-- 호스트 소개 -->
					<div class="hashTagHostInfo">${ host.introduction }</div>
					<!-- 호스트 프로필 보기 버튼 -->
					<form action="hostProfile.ho" method="post">
					<div class="hashTagHostInfoIn">
						<input class="hashTagHostInfoInBtn" type="submit" value="호스트 프로필">
						<input type="hidden" value="${host.member.id }" name="hostId">
					</div>
					</form>
					<div style="float: left; width: 100%; height: 20px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagHostReview">호스트 후기</div>
					<div class="hashTagHostImage2">
						<img class="hashTagHostImageContent" src="">
					</div>
					<div class="hashTagHostName">석쵸니</div>
					<div class="hashTagHostLike" style="height: 40px;">* * * * *
						| 2018/8/18 8:18분 작성</div>
					<div class="hashTagHostReviewComment">나는 그냥 창렬이랑 같이있는게 좋더라~</div>
					<div class="hashTagHostReviewTitle">
						[실전] 창렬이형의 실전 제압 기술 <br> 폭행 체험
					</div>
					<div class="hashTagHostReviewLike">
						<div class="hashTagHostReviewLikeIn">도움이 됐어요 (thu)</div>
					</div>
					<div class="hashTagHostReviewImage">
						<img class="hashTagHostImageContent"
							src="">
					</div>
					<form action="hostReview.ho" method="post">
					<div class="hashTagHostReviewInfo">
						<input class="hashTagHostInfoInBtn" type="submit"
							value="1818개 후기 모두 보기">
							<input type="hidden" value="${host.member.id }" name="hostId">
					</div>
					</form>
					<div style="float: left; width: 100%; height: 20px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagIntoduce">클래스 소개</div>
					<div class="hashTagIntroduceContent" style = "background-color : white;">${ b.introduce }</div>

					<div style="float: left; width: 100%; height: 20px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagContain">포함 사항</div>
					<div class="hashTagContainContent">${ b.fcontain }</div>

					<div style="float: left; width: 100%; height: 20px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagContain">불포함 사항</div>
					<div class="hashTagContainContent">${ b.fncontain }</div>

					<div style="float: left; width: 100%; height: 20px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagDetail">세부 사항</div>
					<div class="hashTagDetailContent">
						<c:set var="calArr" value="${ b.fcalendar.split('<br>') }"/>
						<c:set var="timeArr" value="${ calArr[0].split(',') }" />
						<c:set var="detailArr" value="${ calArr[1].split(',') }" />
						
						<c:forEach var="time" items="${ timeArr }" varStatus="times">
							${ time } 
							<c:forEach var="det" items="${ detailArr }" varStatus="dets">
								<c:if test="${ times.index eq dets.index }">
									&nbsp;&nbsp;${ det }<br>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
					
					<div style="float: left; width: 100%; height: 20px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagNotice">유의 사항</div>
					<div class="hashTagNoticeContent">${ b.fprecaution }</div>

					<div style="float: left; width: 100%; height: 20px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagLocation">진행 장소</div>
					<div class="hashTagIntroduceContent" id="map"></div>
					<div class="hashTagLocationInfo" id="address">${ b.location }</div>

					<div class="hashTagLocationPaste">
						<input type="hidden" id="ShareUrl">
						<input class="hashTagLocationPasteBtn" type="button" onclick="copyUrl();" value="주소 복사">
					</div>

					<div
						style="float: left; width: 100%; height: 20px; margin-top: -18px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagQuestion">자주 묻는 질문 <input class="hashTagQuestionBtn" id="TQB1" type="button" value="V"></div>
					<div class="hashTagEnquiryContents">
					<c:set var="splitArr" value="${ b.fminfo.split('<br>') }"/>
					<c:set var="questionArr" value="${ splitArr[0].split(',') }" />
					<c:set var="answerArr" value="${ splitArr[1].split(',') }" />
					
					<c:forEach var="ques" items="${ questionArr }" varStatus="que">
						${ ques } <br> 
						<c:forEach var="anss" items="${ answerArr }" varStatus="anw">
							<c:if test="${ que.index eq anw.index }">
								&nbsp;&nbsp;${ anss }<br>
							</c:if>
						</c:forEach>
					</c:forEach>
					</div>

					<div style="float: left; width: 100%; height: 20px; margin-top: -18px;">
						<hr style="border: 0.5px solid lightgray">
					</div>
					
					<form action="hostQnA.ho" method="post">
					<div class="hashTagEnquiry">
						문의하기 <input class="hashTagEnquiryBtn" type="submit" value=">">
						<input type="hidden" name="fno" value="${b.fno }">
						<input type="hidden" value="${host.member.id }" name="hostId">
					</div>
					</form>
					
					<div
						style="float: left; width: 100%; height: 20px; margin-top: -10px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagRefund">
						환불 정책 <input class="hashTagRefundBtn" id="TRB1" type="button" value="V">
					</div>

					<div class="hashTagRefundContents">
						상품 구매 후 2주 이내 : 100% 환불 <br> 상품 구매 후 2주 후 : 환불 불가 <br> <br>
						[환불 신청 방법] <br> 1. 해당 상품을 결제한 계정으로 로그인 <br> 2. 내 장바구니 -
						신청내역 <br> 3. 취소를 원하는 상품 클릭 - 취소 <br> ※ 결제 수단에 따라 예금주,
						은행명, 계좌번호 입력 <br>
					</div>

					<div
						style="float: left; width: 100%; height: 20px; margin-top: -18px;">
						<hr style="border: 0.5px solid lightgray">
					</div>
				</div>
			</div>
		</div>
		<form action = "purchase1First.pu" method = "post">
			<input type = "text" style = "display : none" value = "${b.fno }" name = "fNo">
			<div id="detailMainForm2" class="detailMainForm">
				<h3 style = "font-size : 16pt; font-weight : 600; margin-left : 1%;">
					옵션 선택
				</h3>
				<br> 
				
<!-- 				<select id="optionSelect" style="outline: none;" name = "oNo"> -->
<%-- 					<c:forEach var = "pu" items = "${p }" varStatus = "index"> --%>
<%-- 						<option selected value = "${pu.ono }">${ pu.oname } ${pu.price}원       재고 : ${pu.ocount }개</option> --%>
<%-- 					</c:forEach> --%>
					
<!-- 				</select>  -->
					
						<hr style = "margin-top : 6px;">
						<div id = "DIV" style = "background-color : white; height : 80px; width : 100%; margin-top : -20px; cursor : pointer;"  >
							<input type = "button" value = "    기본 옵션                                                                         ∨" 
							style = "border : none; background-color : white; outline:none; width : 100%;  height: 40px; font-weight : 600; color : gray; margin-top : 20px;" readonly>
						</div>
						<hr style = "margin-top : 0px;">
						<c:forEach var = "pu" items = "${ p }" varStatus = "index">
						
						<div class = "CLK" style = "float : left; width : 100%; background-color : rgb(249, 249, 249); margin-top : -20px; height : 94px; cursor : pointer;" id = "${ pu.ono }" >
							<div style = "margin-top : 2px;">
								<div style = "font-weight : 600; margin-left : 4%; margin-top : 16px;">
									${pu.oname }
								</div>
								<div style = "margin-left : 4%; width : 70%; float: left; margin-top : 16px; font-size : 10pt; color : rgb(85, 85, 85);">
									남은 수량 ${pu.ocount }개
								</div>
								<div style = "margin-left : 4%; width : 22%; float: left; margin-top : 16px; font-weight : 900;">
									${pu.price }원
								</div>
								<input id = "ONA" type = "text" style = "display : none" value = "${pu.oname }">
								<input id = "OCO" type = "text" style = "display : none" value = "${pu.ocount }">
								<input id = "PRI" type = "text" style = "display : none" value = "${pu.price }">
								<input id = "ONO" type = "text" style = "display : none" value = "${ pu.ono }" name = "oNo">
							</div>
							<div style = "margin-top : 57px;">
								<hr>
							</div>
						</div>					
					</c:forEach>
					<div id = "CON" style = " float : left; width : 100%; height : 40px; height : 100px; border-radius : 4px 4px; border : 1px solid rgb(238, 238, 238);">
						
					</div>
				<br> 
				<div>
				<input type="submit" value = "장바구니에 담기" 
				style = "width : 310px;; height: 40px; margin-top : 100%; background-color : rgb(249, 249, 249); border:none; border-radius : 2px 2px; ">
				</div>
				<div style = "margin-top : 4px;">
				<input type="submit" value="참가하기" 
				style="width : 310px; height: 40px;  background-color: gold; border: none; ">
				</div>
			</div>
		</form>
		<div class="recommendation">
			<div class="recommendationIntroduce">이런 클래스는 어때요?</div>
			<div class="recommendationContents">클래스 추천 목록</div>
		</div>
		<div class="blank"></div>
	</section>
	
	<script>
		$(".hashTagEnquiryContents").hide();
		$(".hashTagRefundContents").hide();

		$("#TQB1").on("click", function() {
			$(".hashTagEnquiryContents").toggle();
		});

		$("#TRB1").on("click", function() {
			$(".hashTagRefundContents").toggle();
		});
		
		</script>
		
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 1
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소 따오기
			var addressArr = document.getElementById('address').innerHTML.trim().split("/");
			var address = addressArr[1];
			console.log(address);
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function(result, status) {
				
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);	
	
					// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords
						});
	
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
						getInfo();
				}
				
				function getInfo() {
				    // 지도의 현재 중심좌표를 얻어옵니다 
				    var center = map.getCenter(coords); 
				    
				    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
				    message += '경도 ' + center.getLng() + ' 이고 <br>';
				    
				    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
				    console.log(message);
				}
			});
		</script>
		
		<script>
	// 		var CONT = $('<div id = "CONT">');
			var CONT1 = $("<div>")
			var CONT2 = $("<div>")
			var CONT3 = $("<div>")
			var MID = $('<input type = "text" readonly style = "border:none; outline:none; height : 15px; width : 15px;" id ="MID" value = "1" name = "ocount">');
			var BTN1 = $('<div style = "width : 20px; height : 20px; border-radius : 10px 10px; border : 1px solid gray; cursor : pointer;" >')
			var BTN2 = $('<div style = "width : 20px; height : 20px; border-radius : 10px 10px; border : 1px solid gray; cursor : pointer;" >')
			var BTN1V = $('<div style = "float : left; cursor : pointer;" id = "MIN1">')
			var BTN2V = $('<div style = "float : left; cursor : pointer;" id = "ADD1">')
			
			var ona = $("#ONA").val();
			var oco = $("#OCO").val()*1;
			var pri = $("#PRI").val();
			var ono = $("#ONO").val();
			
			$(".CLK").hide();
			$("#CON").hide();
			
			$("#DIV").on("click", function(){
				$(".CLK").toggle();
			})
			
			$(".CLK").on("click", function(){
				$(".CLK").hide();
				$("#CON").show();
				
				MID.val(1);
				
				CONT1.text(ona);
				CONT1.css('font-weight', '600');
				CONT1.css('margin-left' , '4%');
				CONT1.css('margin-top', '16px');
				
				CONT2.text(pri + "원");
				CONT2.css('margin-left', '4%');
				CONT2.css('width', '70%');
				CONT2.css('float', 'left');
				CONT2.css('margin-top', '16px');
				CONT2.css('font-size', '14pt');
				CONT2.css('color', 'gold');
				CONT2.css('font-weight', '900');
				
				BTN1.css("margin-left" , "74%");
				BTN1.css("float", "left");
				BTN1.css("margin-top", "-20px");
				
				BTN1V.text(" -");
				BTN1V.css("font-size", "24pt");
				BTN1V.css("font-weight", "900");
				BTN1V.css("margin-top", "-15px");
				BTN1V.css("margin-left", "3.5px");
				
				BTN2.css("margin-left" , "90%");
				BTN2.css("float", "left");
				BTN2.css("margin-top", "-20px");
				
				BTN2V.text(" +");
				BTN2V.css("font-size", "16pt");
				BTN2V.css("font-weight", "900");
				BTN2V.css("margin-top", "-7px");
				BTN2V.css("margin-left", "3px");
				
				MID.css("margin-top" , "23px");
				MID.css("margin-left", "8.8%");
				
				BTN1.append(BTN1V);
				BTN2.append(BTN2V);
				
// 				CONT.append(CONT1, CONT2);
// 				$("#CON").append(CONT);

				$("#CON").append(CONT1, CONT2, BTN1, MID, BTN2);
				$("#ADD1").on("click", function(){
					var MIDVAL = $("#MID").val();
					console.log(MIDVAL);
					if($("#MID").val()*1 > 4 ){
						$("#MID").val(5);
					}else if( $("#MID").val()*1 >= oco){
						$("#MID").val(oco);
					}else{
						$("#MID").val(MIDVAL*1 + 1);
						CONT2.text(pri*(MIDVAL*1+1) + "원");
					}
				});
				
				$("#MIN1").on("click", function(){
					var MIDVAL = $("#MID").val();
					if($("#MID").val()*1 <= 1 ){
						$("#MID").val(1);
					}else{
						$("#MID").val(MIDVAL*1 - 1);
						CONT2.text(pri*(MIDVAL*1-1) + "원");
					}
				});
				
			})
		</script>
		
		<footer id="footer" style="padding-top: 115px;">
			<c:import url="../layout/footer.jsp"/>
		</footer>
</body>
</html>