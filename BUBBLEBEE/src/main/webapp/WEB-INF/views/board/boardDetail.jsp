<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BUBLEBEE</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/boardDetail1.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/boardDetail3.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/boardBonjour.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&displ ay=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script src = "<%=request.getContextPath()%>/resources/js/boardDetail/BDhansol1.js"></script>
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
	
	<section style="float : left; width : 78%; margin-left : 6%; margin-top : 78px;">
		<div id="detailMainForm1" class="detailMainForm">
			<h2>
			<c:if test="${ b.ftype == 1}">
				모임
			</c:if>
			<c:if test="${ b.ftype == 2 }">
				클래스
			</c:if>
			<c:if test="${ b.ftype == 3 }">
				작품
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
			   		<c:choose>
		         	<c:when test="${ fn:contains(host.member.profile,'http')}">
		         		<img id="profile" class="hashTagHostImageContent" style="border-radius: 100%;" src="${host.member.profile}" />
		         	</c:when>
					<c:otherwise>
						<img id="profile" class="hashTagHostImageContent" style="border-radius: 100%;" src="${contextPath}/resources/proFiles/${host.member.profile}" />
					</c:otherwise>
		        	 </c:choose>
		   		</div>	
					<!-- 호스트명 -->
					<div class="hashTagHostName">${ host.member.nickName }</div>
					<!-- 해당 호스트가 개설한 클래스개수 | 좋아요 수  -->
<!-- 					<div class="hashTagHostLike">클래스 18 | 좋아요 1818</div> -->
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
<!-- 					<div class="hashTagHostImage2"> -->
<!-- 						<img class="hashTagHostImageContent" src=""> -->
<!-- 					</div> -->
<!-- 					<div class="hashTagHostName">석쵸니</div> -->
<!-- 					<div class="hashTagHostLike" style="height: 40px;">* * * * * -->
<!-- 						| 2018/8/18 8:18분 작성</div> -->
<!-- 					<div class="hashTagHostReviewComment">나는 그냥 창렬이랑 같이있는게 좋더라~</div> -->
<!-- 					<div class="hashTagHostReviewTitle"> -->
<!-- 						[실전] 창렬이형의 실전 제압 기술 <br> 폭행 체험 -->
<!-- 					</div> -->
<!-- 					<div class="hashTagHostReviewLike"> -->
<!-- 						<div class="hashTagHostReviewLikeIn">도움이 됐어요 (thu)</div> -->
<!-- 					</div> -->
<!-- 					<div class="hashTagHostReviewImage"> -->
<!-- 						<img class="hashTagHostImageContent" -->
<!-- 							src=""> -->
<!-- 					</div> -->
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
					<div class="hashTagLocationContent" id="map"></div>
					<div class="hashTagLocationInfo" id="address">${ b.location }</div>

					<div class="hashTagLocationPaste">
						<input type="hidden" id="ShareUrl">
						<input class="hashTagLocationPasteBtn" type="button" onclick="copyUrl();" value="주소 복사">
					</div>

					<div
						style="float: left; width: 100%; height: 20px; margin-top: -18px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagQuestion">자주 묻는 질문 <input class="hashTagQuestionBtn" id="TQB1" type="button" value="∨"></div>
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
					
					<form action="hostQnA.ho">
					<div class="hashTagEnquiry">
						문의하기 <input class="hashTagEnquiryBtn" type="submit" value="∨">
						<input type="hidden" name="fno" value="${b.fno }">
						<input type="hidden" value="${host.member.id }" name="hostId">
					</div>
					</form>
					
					<div
						style="float: left; width: 100%; height: 20px; margin-top: -10px;">
						<hr style="border: 0.5px solid lightgray">
					</div>

					<div class="hashTagRefund">
						환불 정책 <input class="hashTagRefundBtn" id="TRB1" type="button" value="∨">
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
		<form method = "post">
			<input type = "text" style = "display : none" value = "${b.fno }" name = "fNo">
			<div id="detailMainForm2" class="positionfixed detailMainForm">
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
							<div style = "margin-top : 2px;" id = "${ pu.ono }"> 
								<div style = "font-weight : 600; margin-left : 4%; margin-top : 16px;" id = "${ pu.ono }">
									${pu.oname }
								</div>
								<div style = "margin-left : 4%; width : 70%; float: left; margin-top : 16px; font-size : 10pt; color : rgb(85, 85, 85);" id = "${ pu.ono }">
									남은 수량 ${pu.ocount }개
								</div>
								<div style = "margin-left : 4%; width : 22%; float: left; margin-top : 16px; font-weight : 900;" id = "${ pu.ono }">
									${pu.price }원
								</div>
								<input id = "ONA${ pu.ono }" type = "text" style = "display : none" value = "${pu.oname }">
								<input id = "OCO${ pu.ono }" type = "text" style = "display : none" value = "${pu.ocount }" >
								<input id = "PRI${ pu.ono }" type = "text" style = "display : none" value = "${pu.price }" >
								<input id = "ONO${ pu.ono }" type = "text" style = "display : none" value = "${pu.ono }">
								<input id = "confirmONO" type = "text" style = "display : none;" name = "oNo">
							</div>
							<div style = "margin-top : 57px;">
								<hr>
							</div>
						</div>					
					</c:forEach>
					<div id = "CON" style = " float : left; width : 100%; height : 40px; height : 100px; border-radius : 4px 4px; border : 1px solid rgb(238, 238, 238);">
						
					</div>
				<br> 
				<c:if test = "${loginUser == null }">
					<div>
					<input class = "loginUserNull" id = "loginUserNull1" type="button" value = "장바구니에 담기" 
					style = "width : 310px; height: 40px; margin-top : 80%; background-color : rgb(249, 249, 249); border:none; border-radius : 2px 2px; outline : none;" >
					</div>
					<div style = "margin-top : 4px;">
					<input class = "loginUserNull" id = "loginUserNull2" type="button" value="참가하기" 
					style="width : 310px; height: 40px;  background-color: rgb(249, 249, 249); border: none; outline : none;" >
					</div>
				</c:if>
				
				<c:if test = "${loginUser != null }">
					<div>
					<input class = "loginUserNull2" id = "optionNull3" type="button" value = "장바구니에 담기" 
					style = "width : 310px; height: 40px; margin-top : 80%; background-color : rgb(249, 249, 249); border:none; border-radius : 2px 2px; outline : none;" >
					</div>
					<div style = "margin-top : 4px;">
					<input class = "loginUserNull2" id = "optionNull4" type="button" value="참가하기" 
					style="width : 310px; height: 40px;  background-color: rgb(249, 249, 249); border: none; outline : none;" >
					</div>
					<div>
					<input  class = "loginUserNull2" id = "comfirmNull3" type="submit" value = "장바구니에 담기" onclick="javascript: form.action='addslist.pu';"
					style = "width : 310px;; height: 40px; margin-top : 80%; background-color : #F39C12; color : white; border:none; border-radius : 2px 2px; outline : none;">
					</div>
					<div style = "margin-top : 4px;">
					<input  class = "loginUserNull2" id = "comfirmNull4" type="submit" value="참가하기" onclick="javascript: form.action='purchase1First.pu';"
					style="width : 310px; height: 40px;  background-color: #F39C12; border: none; color : white; outline : none;">
					</div>
				</c:if>
			</div>
		</form>
	</section>
	<section class = "bonjour">
		<header class = "bonjour1">
			<div class="recommendationIntroduce" style = "float : left; width : 58%; margin-left : 21%; height : 80px;" >
				<div style = "font-size : 16pt; font-weight : 600; float : left; width : 100%; margin-left : 0%; margin-top : 30px;">
				이런 버블은 어때요?
				</div>
			</div>
		</header>
		
		<div class="recommendation" style = "float : left; width : 60%; height : 260px; margin-top : 10px; margin-left : 20%;">
			<c:forEach items = "${blist}" var = "blist" >
			<div class = "recom" style = "cursor : pointer" id = "divcommit">
			<c:url var = "findFrip" value = "detail.bo">
				<c:param name = "fno" value = "${blist.fno }"/>
			</c:url>
			<a href = "${findFrip }" style = "color : black">
				<div class = "recomi">
					<img src = "${contextPath }/resources/buploadFiles/${ blist.renamefilename}" style = "width : 100%; height: 100%;"/>
				</div>
				<div class = "recoms">
					${blist.small_title }
				</div>
				<div class = "recomt" id = "recomt">
					[${fn:split(blist.location, " ")[1] }]
					
					${blist.ftitle }
				</div>
				<div class = "recomp">
					${blist.price }원
					<input type = "text" style = "display : none" value = "${blist.fno }" name = "fno">
				</div>
			</a>
			</div>
			
			</c:forEach>
		</div>
		<div class="blank"></div>
	</section>
	<!--  -->
<!-- 	<div style = "display : none"> -->
<!-- 		<input type = "text" style = "display : none"> -->
<!-- 	</div> -->

	
	<!--  -->
	<div style = "display : none">
		<input type = "text" style = "display : none">
	</div>
	<footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>		
	<script>
		$("#divcommit").on("click", function(){
			$('form[name=fripCommit]').submit();
		})
	</script>
	<script src = "<%=request.getContextPath()%>/resources/js/boardDetail/BDhansol2.js"></script>
	<script src = "<%=request.getContextPath()%>/resources/js/boardDetail/BDoption.js?ver=4"></script>
	<script src = "<%=request.getContextPath()%>/resources/js/boardDetail/BDkakaomap.js"></script>
	<script src = "<%=request.getContextPath()%>/resources/js/boardDetail/BDloginusernull.js?ver=7"></script>
	<script src = "<%=request.getContextPath()%>/resources/js/boardDetail/BDscroll.js?ver=6"></script>
</body>
</html>