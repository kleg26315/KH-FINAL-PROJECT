<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 메인페이지</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
     <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
.c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

.main_all{display: flex;border: 1px solid lightgray;margin-bottom: 20px;}
.main_wrap{display: flex;margin: 10px 20px;width: 100%;}
#host_info{flex-grow: 2;margin: auto 0;}
#info_wrap{margin-left: 30px;flex-grow:2;}
.text{font-size: 30px;}
.result_wrap{width: 33%; text-align: center;display: flex;flex-direction: column;justify-content: center;}
.subtitle{font-size: 14px;color: gray;margin: 10px 0;}
.result{font-size: 20px;color: black;margin: 10px 0;font-weight: bolder;}

.sales_all{display: flex;flex-direction: column;justify-content: center;flex-grow: 1;}
.sales_wrap{text-align: center;padding:10px 0;display: flex;flex-direction: column;}

#pro_img{border-radius: 100%;}

.updatehost{align-self: flex-start;}
.updatehost:hover {
	cursor: pointer;
	color: #F39C12;
}
.host_support{display: flex;align-items: flex-start;padding: 32px;}
.support_img{margin-right: 32px;}
.s_info{margin-bottom: 20px;font-size: 13px;line-height: 20px;}
.s_text{font-family: 'Noto Sans KR', sans-serif;font-weight: bold;font-size: 20px;margin: 10px 0px 10px;}
.s_phone_wrap{display: flex;align-items: center;}
.kakaoBtn{border:1px solid #F39C12;border-radius:5px;background: none;color: #F39C12;padding: 10px 20px;outline: none;}
.phone_wrap{margin-left: 10px;}
.fa-circle{color:#F39C12;}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
    <div id="content">
	 	<nav style="height: 100%; width: 220px; border-right:1px solid gray;">
	 		 <c:import url="../layout/hostpage_nav.jsp"/> 
	 	</nav>
	    <div class="c_body">
		   <div class="main_all">
		   	<div class="main_wrap">
		   		<div>
		   		<c:choose>
	         	<c:when test="${ fn:contains(sessionScope.loginUser.profile, 'http')}">
	         		<img id="profile" class="profile_img" style="width: 120px; height: 120px; border-radius: 100%; cursor: pointer;" src="${sessionScope.loginUser.profile}" />
	         	</c:when>
				<c:otherwise>
					<img id="profile" class="profile_img" style="width: 120px; height: 120px; border-radius: 100%; cursor: pointer;" src="${contextPath}/resources/proFiles/${sessionScope.loginUser.profile}" />
				</c:otherwise>
	         </c:choose>
		   		</div>
		   		<div id="host_info">
		   			<div id="info_wrap">
			   			<div class="text">안녕하세요!</div>
			   			<div class="text">${loginUser.nickName } 호스트님</div>
			   		</div>
		   		</div>
		   		<div class="updatehost">회원 정보 수정</div>
		   	</div>
		   </div>
		   <div class="main_all" style="height: 180px;">
		   		<div class="result_wrap" style="border-right: 1px solid lightgray;">
		   			<div class="subtitle">남겨진 후기</div>
		   			<div class="result">0</div>
		   		</div>
		   		<div class="result_wrap">
		   			<div class="subtitle">평균 평점</div>
		   			<div class="result">0.0</div>
		   		</div>
		   		<div class="result_wrap" style="border-left:1px solid lightgray;">
		   			<div class="subtitle">Q&A 응답률</div>
		   			<div class="result">
		   			<c:if test="${empty qna}">
		   			0.0%
		   			</c:if>
		   			<c:if test="${!empty qna}">
		   			${qna}%
		   			</c:if>
		   			</div>
		   		</div>
		   </div>
		   
		   <div class="main_all">
				<div class="sales_all">
					<div class="sales_wrap" style="border-bottom: 1px solid lightgray;">
							<div class="">이번 달 매출액</div>
							<div class="">0원</div>
					</div>
					<div class="sales_wrap">
						<div class="">전체 매출액</div>
						<div class="">0원</div>
					</div>	
				</div>
		   </div>
		   <div class="main_all">
		   	<div class="host_support">
		   		<div class="support_img">
	   				<span class="fa-stack fa-lg" style="font-size: 70px;">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="far fa-comments fa-stack-1x fa-inverse"></i>
					</span>
		   		</div>
		   		<div class="support_wrap">
		   			<div class="s_info">
		   			<div class="s_text">호스트 지원 센터</div>
		   			<div class="s_time">운영 시간 11:00 ~ 18:00<br>점심 시간 13:00 ~ 14:00</div>
		   			</div>
		   			<div class="s_phone_wrap">
		   				<button class="kakaoBtn">카톡문의</button>
		   				<div class="phone_wrap">010-9078-3699</div>
		   			</div>
		   		</div>
		   	</div>
		   </div>
		 </div>
	</div>
   </section>
   <script>
   $(function(){
	   $('.updatehost').click(function(){
		  location.href="hostUpdateProfile.ho";
	   });
	   $('.kakaoBtn').click(function(){
// 		  location.href="http://pf.kakao.com/_RdFxkxb";
		  window.open('about:blank').location.href="http://pf.kakao.com/_RdFxkxb";
	   });
   });
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>