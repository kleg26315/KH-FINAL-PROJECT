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
.c_popular {
	width: 110px;
    height: 110px;
    border-radius: 80px;
    margin-right: 35px;
    margin-left: 10px;
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
.moim_post{
}
.moim_location{
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
<body>
	<header id="header">
	  <c:import url="layout/header.jsp"/>
   	</header>

	<section style="padding-top: 115px; padding-left: 20%; width: 78%;" id="section">
		<!-- 슬라이드 -->
		<div id="slide">
			<button class="btn-direction">
				<img id="prev" src="${contextPath }/resources/img/prev.png">
			</button>
		   <img class="slides" id="slide1" src="${contextPath }/resources/img/cos-banner1.png">
		   <img class="slides" id="slide2" src="${contextPath }/resources/img/cos-banner3.png">
		   <img class="slides" id="slide3" src="${contextPath }/resources/img/cos-banner2.png">
		   <button class="btn-direction"><img id="next" src="${contextPath }/resources/img/next.png"></button>
		   <script>
			   $(function() {
					$('#slide3').hide();
					$('#slide2').hide();
		
					var currentSlide = 1;
					$('#next').click(function() {
						if (currentSlide == 1) {
							$('#slide1').hide();
							$('#slide2').fadeIn(300);
							currentSlide = 2;
						} else if (currentSlide == 2) {
							$('#slide2').hide();
							$('#slide3').fadeIn(300);
							currentSlide = 3;
						} else if (currentSlide == 3) {
							$('#slide3').hide();
							$('#slide1').fadeIn(300);
							currentSlide = 1;
						}
					});
		
					var currentSlide = 1;
					$('#prev').click(function() {
						if (currentSlide == 1) {
							$('#slide1').hide();
							$('#slide2').fadeIn(300);
							currentSlide = 2;
						} else if (currentSlide == 2) {
							$('#slide2').hide();
							$('#slide3').fadeIn(300);
							currentSlide = 3;
						} else if (currentSlide == 3) {
							$('#slide3').hide();
							$('#slide1').fadeIn(300);
							currentSlide = 1;
						}
					});
				});
		   </script>
	   </div>
	   <br>
	   <br>
	   
	   <!-- 인기있는 카테고리 -->
	   <div id="popular">
	   		<p style="font-weight: bold; font-size: 20px;">인기 있는 카테고리</p><br>
	   		
	   		<img id="firstCg" class="c_popular" src="${contextPath }/resources/img/cos-banner1.png" />
	   		<img id="secondCg" class="c_popular" src="${contextPath }/resources/img/cos-banner2.png" />
	   		<img id="thirdCg" class="c_popular" src="${contextPath }/resources/img/cos-banner3.png" />
	   		<img id="fourthCg" class="c_popular" src="${contextPath }/resources/img/cos-banner1.png" />
	   		<img id="fifthCg" class="c_popular"  src="${contextPath }/resources/img/cos-banner2.png" />
	   		<img id="sixthCg" class="c_popular"  src="${contextPath }/resources/img/cos-banner3.png" />
	   		<img id="seventhCg" class="c_popular" src="${contextPath }/resources/img/cos-banner1.png" />
	   		
	   		<br>
	   		<br>
	   		
	   		<div>
		   		<label class="c_label">베이킹</label>
		   		<label class="c_label">모임</label>
		   		<label class="c_label">아웃도어</label>
		   		<label class="c_label">스파</label>
		   		<label class="c_label">제주도</label>
		   		<label class="c_label">DIY</label>
		   		<label class="c_label">요가</label>
	   		</div>
	   </div>
	   <br>
	   <br>
	   
	   <!-- 매거진 -->
	   <div id="magazine">
	   		<label style="font-weight: bold; font-size: 20px;">매거진</label>
	   		<label style="float: right; padding-right: 5px;">전체보기</label>
	   		<br><br>
	   		<div class="m_total">
		   		<div class="m_middle">
			   		<a>
				   		<div class="m_box">
							<img id="" class="m_post" src="${contextPath }/resources/img/main.png" />
							<div class="m_title">
								<div class="m_bigTitle">이제 운동할 때 됐잖아</div>
								<div>[FripXDIVE] 특별한 스포츠 프립</div>
							</div>
						</div>
			   		</a>
	   			</div>
				<div class="m_middle">
			   		<a>
				   		<div class="m_box">
							<img id="" class="m_post" src="${contextPath }/resources/img/cos-banner1.png" />
							<div class="m_title">
								<div class="m_bigTitle">가족을 이해하는 가장 좋은 방법방법 방법 방법 방법</div>
								<div>[FripXDIVE] 특별한 스포츠 프립</div>
							</div>
						</div>
			   		</a>
	   			</div><div class="m_middleLast">
			   		<a>
				   		<div class="m_box">
							<img id="" class="m_post" src="${contextPath }/resources/img/cos-banner1.png" />
							<div class="m_title">
								<div class="m_bigTitle">이제 운동할 때 됐잖아</div>
								<div>[FripXDIVE] 특별한 스포츠 프립</div>
							</div>
						</div>
			   		</a>
	   			</div>
			</div>
	   </div>
	   <br>
	   <br>
	   <br>
	   <!-- 지금 뜨는 모임 -->
	   <div>
	   	<label style="font-weight: bold; font-size: 20px;">지금 뜨는 모임</label>
	   	<label style="float: right; padding-right: 5px;">전체보기</label>
	   	<br><br>
	   	<div class="moim">
	   		<div class="moim_total">
	   			<a>
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/main.png" />
						</div>
	   					<div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="moim_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		
	   		<div class="moim_total">
	   			<a>
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner1.png" />
						</div>
	   					<div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="moim_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		
	   		<div class="moim_total">
	   			<a>
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner2.png" />
						</div>
	   					<div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="moim_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		
	   		<div class="moim_total">
	   			<a>
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner3.png" />
						</div>
	   					<div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="moim_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   	</div>
	   </div>
	   <br>
	   <br>
	   <br>
	   <!-- 지금 뜨는 클래스 -->
	   <div>
	   	<label style="font-weight: bold; font-size: 20px;">지금 뜨는 클래스</label>
	   	<label style="float: right; padding-right: 5px;">전체보기</label>
	   	<br><br>
	   	<div class="moim">
	   		<div class="moim_total">
	   			<a>
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/main.png" />
						</div>
	   					<div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="moim_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		
	   		<div class="moim_total">
	   			<a>
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner1.png" />
						</div>
	   					<div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="moim_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		
	   		<div class="moim_total">
	   			<a>
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner2.png" />
						</div>
	   					<div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="moim_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		
	   		<div class="moim_total">
	   			<a>
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner3.png" />
						</div>
	   					<div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="moim_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   	</div>
	   </div>
	   
	</section>
	
	<footer id="footer" style="padding-top: 115px;">
		<%@ include file = "layout/footer.jsp" %>
	</footer>
   
</body>
</html>