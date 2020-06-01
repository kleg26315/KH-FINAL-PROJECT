<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUBLEBEE</title>
    
    <link rel = "stylesheet"  href= "<%= request.getContextPath() %>/resources/css/borderDetail1.css" type = "text/css">
    <link rel = "stylesheet"  href= "<%= request.getContextPath() %>/resources/css/boardDetail3.css" type = "text/css">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
   <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
   
   <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
   <script
      src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
   <script> 
   var j = $.noConflict(true); // $.noConflict(true) 를 사용해서 $ -> 변수로 선언한 j로 바꾸니 해결!
   j(document).ready(function(){ 
       var main = j('.bxslider').bxSlider({ 
       mode: 'fade', 
       auto: true,   //자동으로 슬라이드 
       controls : true,   //좌우 화살표   
       autoControls: true,   //stop,play 
       pager:true,   //페이징 
       pause: 3000, 
       autoDelay: 0,   
       slideWidth: 500, 
       speed: 300, 
       stopAutoOnclick:true
   }); 
   
   j(".bx-stop").click(function(){   // 중지버튼 눌렀을때 
       main.stopAuto(); 
       j(".bx-stop").hide(); 
       j(".bx-start").show(); 
       return false; 
   }); 
   
   j(".bx-start").click(function(){   //시작버튼 눌렀을때 
       main.startAuto(); 
       j(".bx-start").hide(); 
       j(".bx-stop").show(); 
       return false; 
   }); 
   
   j(".bx-start").hide();   //onload시 시작버튼 숨김. 
   }); 
   </script>
   </head>
   <style>
   #header{
      position: fixed;
      width : 100%;
   }
   .navbar-nav>li{
      font-size: 20px;
   }
</style>
<body>
   <header id="header" style = "z-index : 99999">
      <%@ include file = "../layout/header.jsp" %>   
      </header>

   <section style="padding-top: 115px; padding-left: 5%; width: 85%;">
      <div id="detailMainForm1" class="detailMainForm">
      <h2>소모임 상세보기</h2>
      <!-- 사진 슬라이드 보기 -->
      <div class="home__slider" style = "float : left; width : 100%;">
         <div class="bxslider" id="detailImages">
            <%for (int i = 1; i < 4; i++) {%>
               <div>
                  <img src="<%=request.getContextPath()%>/resources/images/<%=i%>.jpg" alt="그림<%=i%>" class="hospitalImage">
               </div>
            <%}%>
         </div>
      </div>
      <!-- 상세보기 -->
      <div class = "hashTag">
            <!-- 해시태그 내용들 -->
            <div class = "hashTagTag">
               #제압 #특강
            </div>
            <div class = "hashTagTitle">
               상대를 제압하는 법
            </div>
            <div class = "hashTagPrice">
               180,000원
            </div>
            <hr>
            <div>
               <div> 좋아요 누른 인원 + 명이 좋아한 모임</div>
               <div> 원하는 요일  날짜 </div>
               <div> 장소</div>
               <div> 첫 후기 남기고 1,000마일리지 받아가세요!</div>
            </div>
            <hr>
            <div>
               <div class = "hashTagHostTitle">
                  호스트
               </div> <!-- 호스트 -->
               <div class = "hashTagHostImage">
                  <img class = "hashTagHostImageContent" src = "<%=request.getContextPath()%>/resources/images/4.jpg">
               </div>   <!-- 호스트 프로필 -->
               <div class = "hashTagHostName">
                  창렬이형
               </div> <!-- 호스트명 -->
               <div class = "hashTagHostLike">
                  클래스 18 | 좋아요 1818
               </div> <!-- 해당 호스트가 개설한 클래스개수 | 좋아요 수  -->
               <div class = "hashTagHostInfo">
                  상대를 제압하는 기술, <br> 간단하지만 효과적이며,...
               </div> <!-- 호스트 소개 -->
               <div class = "hashTagHostInfoIn">
                  <input class = "hashTagHostInfoInBtn" type = "button" value = "호스트 프로필">
               </div> <!-- 호스트 프로필 보기 버튼 -->
               <div style = "float : left; width : 100%; height : 20px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div>    
               <div class = "hashTagHostReview">
                  호스트 후기
               </div>
               <div class = "hashTagHostImage2">
                  <img class = "hashTagHostImageContent" src = "<%=request.getContextPath()%>/resources/images/석천이형.png">
               </div>
               <div class = "hashTagHostName">
                  석쵸니
               </div> 
               <div class = "hashTagHostLike" style = "height : 40px; ">
                  * * * * * | 2018/8/18 8:18분 작성
               </div> 
               <div class = "hashTagHostReviewComment">
                  나는 그냥 창렬이랑 같이있는게 좋더라~
               </div>
               <div class = "hashTagHostReviewTitle">
                  [실전] 창렬이형의 실전 제압 기술 <br>
                  폭행 체험
               </div>
               <div class = "hashTagHostReviewLike">
                  <div class = "hashTagHostReviewLikeIn">
                     도움이 됐어요 (thumbsup)
                  </div>
               </div>
               <div class = "hashTagHostReviewImage">
                  <img class = "hashTagHostImageContent" src = "<%=request.getContextPath()%>/resources/images/석천과친구들.png">
               </div>   
               <div class ="hashTagHostReviewInfo">
                  <input class = "hashTagHostInfoInBtn" type = "button" value = "1818개 후기 모두 보기">
               </div>
               <div style = "float : left; width : 100%; height : 20px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div>    
               <div class = "hashTagIntoduce">
                  클래스 소개
               </div>
               <div class = "hashTagIntroduceContent">
                  클래스 내용
               </div>
               <div style = "float : left; width : 100%; height : 20px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div> 
               <div class = "hashTagContain">
                  포함 사항
               </div>
               <div class = "hashTagContainContent">
                  야구배트(알루미늄) <br>
                  합의금
               </div>
               <div style = "float : left; width : 100%; height : 20px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div> 
               <div class= "hashTagDetail">
                  세부 사항
               </div>
               <div class = "hashTagDetailContent">
                  약 18시간 &nbsp;&nbsp;&nbsp; 제압술 체험   
               </div>
               <div style = "float : left; width : 100%; height : 20px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div> 
               <div class = "hashTagNotice">
                  유의 사항
               </div>
               <div class = "hashTagNoticeContent">
                  버블비에서 구매하시지 않는 경우, 환불 거부, 서비스 불이행 등의 문제가 발생할 수 있습니다.
               </div>
               <div style = "float : left; width : 100%; height : 20px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div> 
               <div class = "hashTagApplyNotice">
                  신청 시 유의사항
               </div>
               <div class = "hashTagIntroduceContent">
                  유의사항 내용
               </div>
               <div style = "float : left; width : 100%; height : 20px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div> 
               <div class = "hashTagLocation">
                  진행 장소
               </div>
               <div class = "hashTagIntroduceContent">
                  지도 API
               </div>
               <div class = "hashTagLocationInfo">
                  이태원 킹클럽앞 200m 굴다리
               </div>
               <div class = "hashTagLocationPaste">
                  <input class = "hashTagLocationPasteBtn" type = "button" value = "주소 복사">
               </div>
               <div style = "float : left; width : 100%; height : 20px; margin-top : -18px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div> 
               <div class = "hashTagQuestion">
                  자주 묻는 질문
                  <input class = "hashTagQuestionBtn" id = "TQB1" type = "button" value = "V" >
               </div>
               <div class = "hashTagEnquiryContents">
                  Q 신청한 게시물은 어디서 확인하나요 ? <br> 
                  A 몰라용ㅋ <br>
                  Q ?? <br>
                  A 뭐가요ㅋㅋㅋ <br>
                  Q 뭐가요? <br>
                  A 뭐 시발ㅋㅋ <br>
                  Q 개새끼가 <br>
                  A 리폿 ㅅㄱ <br>
               </div>
               <div style = "float : left; width : 100%; height : 20px; margin-top : -18px;">
                  <hr style = "border : 0.5px solid lightgray">
               </div>
               <div class = "hashTagEnquiry">
                  문의하기
                  <input class = "hashTagEnquiryBtn" type = "button" value = ">" >
               </div>
               <div style = "float : left; width : 100%; height : 20px; margin-top : -10px; ">
                  <hr style = "border : 0.5px solid lightgray">
               </div>
               <div class = "hashTagRefund">
                  환불 정책
                  <input class = "hashTagRefundBtn" id = "TRB1" type = "button" value = "V" >
               </div>
               <div class = "hashTagRefundContents">
                  상품 구매 후 2주 이내 : 100% 환불 <br>
                  상품 구매 후 2주 후 : 환불 불가 <br><br>
                   [환불 신청 방법] <br>
                   1. 해당 상품을 결제한 계정으로 로그인 <br>
                   2. 내 장바구니  - 신청내역 <br>
                   3. 취소를 원하는 상품 클릭 - 취소 <br>
                   ※ 결제 수단에 따라 예금주, 은행명, 계좌번호 입력 <br>
               </div>
               <div style = "float : left; width : 100%; height : 20px; margin-top : -18px; ">
                  <hr style = "border : 0.5px solid lightgray">
               </div>
            </div>
         </div>
      </div>
      <div id="detailMainForm2" class="detailMainForm">
         <h3><b>옵션 선택</b></h3>
         <br>
         <select id="optionSelect" style = "outline : none;">
            <option selected>옵션1</option>
            <option>옵션2</option>
         </select>   
      </div>
      <div class = "recommendation">
         <div class = "recommendationIntroduce">
            이런 클래스는 어때요?
         </div>
         <div class = "recommendationContents">
            클래스 추천 목록
         </div>
      </div>
      <div class = "blank"></div>
   </section>
    <script>
    $(".hashTagEnquiryContents").hide();
    $(".hashTagRefundContents").hide();
    
    $("#TQB1").on("click", function(){
       $(".hashTagEnquiryContents").toggle();   
    });
    
    $("#TRB1").on("click", function(){
       $(".hashTagRefundContents").toggle();
    });
    </script>
   
</body>
</html>