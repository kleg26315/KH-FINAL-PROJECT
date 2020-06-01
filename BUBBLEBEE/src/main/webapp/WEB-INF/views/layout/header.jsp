<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>navigation-with-button</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/Basic-Header.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/Header-Modal.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

</head>
<style>
*{
   font-family: 'Noto Sans KR', sans-serif;
}
#header{
   position: fixed;
   width : 100%;
   z-index: 9999;
}
.navbar-nav>li{
	font-size: 20px;
}
</style>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div style="box-shadow: 0 2px 4px 0 hsla(0,0%,80.8%,.5);">
        <nav class="navbar navbar-default navigation-clean-button" style="background-color: white; border-color: white; width: 1903px;">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="home.do" style="height: 55px; padding: 0px 0px; padding-left: 20px;">
                <img height="30px" width="30px" alt="메인" src="${ pageContext.servletContext.contextPath }/resources/img/main_resize.png">
                </a>
                    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                </div>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">모임 <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                            	<c:url var="tp" value="list.bo">
									<c:param name="cate" value="토크/파티"/>
								</c:url>
                                <li role="presentation"><a href="${ tp }">토크/파티</a></li>
                                
                                <c:url var="ts" value="list.bo">
									<c:param name="cate" value="취향"/>
								</c:url>
                                <li role="presentation"><a href="${ ts }">취향</a></li>
                                
                                <c:url var="st" value="list.bo">
									<c:param name="cate" value="스터디"/>
								</c:url>
                                <li role="presentation"><a href="${ st }">스터디</a></li>
                                
                                <c:url var="ev" value="list.bo">
									<c:param name="cate" value="이벤트/공간"/>
								</c:url>
                                <li role="presentation"><a href="${ ev }">이벤트/공간</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">클래스 <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                            	<c:url var="di" value="list.bo">
									<c:param name="cate" value="공예/DIY"/>
								</c:url>
                                <li role="presentation"><a href="${ di }">공예/DIY</a></li>
                                
                                <c:url var="ck" value="list.bo">
									<c:param name="cate" value="요리"/>
								</c:url>
                                <li role="presentation"><a href="${ ck }">요리</a></li>
                                
                                <c:url var="sp" value="list.bo">
									<c:param name="cate" value="스포츠"/>
								</c:url>
                                <li role="presentation"><a href="${ sp }">스포츠</a></li>
                                
                                <c:url var="ln" value="list.bo">
									<c:param name="cate" value="어학/취업"/>
								</c:url>
                                <li role="presentation"><a href="${ ln }">어학/취업</a></li>
                            </ul>
                        </li>
                        
                        <c:url var="wk" value="list.bo">
							<c:param name="cate" value="작품"/>
						</c:url>
                        <li role="presentation"><a href="${ wk }">작품</a></li>
                    </ul>
<!--                  <form action="#" id="searchForm"> -->
                    <c:if test="${ empty sessionScope.loginUser}">
                    	<p class="navbar-text navbar-right actions" style="padding-right: 29px; padding-top: 3px;">
                    </c:if>
                    <c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.id ne 'admin@admin.admin'}">
                    	<p class="navbar-text navbar-right actions" style="padding-right: 60px; padding-top: 3px;">
                    </c:if>
                    <c:if test="${ sessionScope.loginUser.id eq 'admin@admin.admin'}">
                    	<p class="navbar-text navbar-right actions" style="padding-right: 29px; padding-top: 3px;">
                    </c:if>
                    
				    <!-- 검색창 -->
				    <img class="" style="width: 24px; height: 24px; position: absolute; right: 786px; z-index: 10; top: 26px;" src="${ pageContext.servletContext.contextPath }/resources/img/search.png" alt="검색아이콘">
                    <input type="text" class="input" placeholder=""> 
                    
                    <!-- 비로그인 시 -->
                    <c:if test="${ empty sessionScope.loginUser }">
	                    <a class="navbar-link login" href="loginView.me">로그인</a>
						<a class="btn btn-default action-button" role="button" href="signUpView.me">회원가입</a>
					</c:if>
					
					<!-- 로그인 시 -->
					<c:if test="${ !empty sessionScope.loginUser }">
						<!-- 관리자 로그인 시 -->
						<c:if test="${ sessionScope.loginUser.id eq 'admin@admin.admin' }">
							<span id="" class="login" style="vertical-align: -webkit-baseline-middle;"><label
								onclick="location.href='logout.me'">로그아웃</label></span>
							<span id="" class="login" style="vertical-align: -webkit-baseline-middle;"><label
								onclick="location.href='adminPageView.ad'">관리자페이지</label></span>
						</c:if>
						
						<!-- 회원 로그인 시 -->
						<c:if test="${ sessionScope.loginUser.id ne 'admin@admin.admin' }">
							<!-- 알림 이미지 -->
							<span class="alarm alarm_cover ">
					        	<img id="alarm_img1" class="alarm_img" style="width: 30px; height: 30px; cursor: pointer; margin-right: 1rem;" src="${ pageContext.servletContext.contextPath }/resources/img/bell.png" />
					        </span>
					        <span class="alarm alarm_cover is_active_alarm">
					        	<img id="alarm_img2" class="alarm_img" style="width: 30px; height: 30px; cursor: pointer; margin-right: 1rem;" src="${ pageContext.servletContext.contextPath }/resources/img/bell2.png" />
					        </span>
							
							<!-- 장바구니 이미지 -->
					        <span class="icon icon_cover ">
					        	<img id="cart_img1" class="cart_img" style="width: 30px; height: 30px; cursor: pointer; margin-right: 1rem;" src="${ pageContext.servletContext.contextPath }/resources/img/cart.png" />
					        </span>
					        <span class="icon icon_cover is_active">
					        	<img id="cart_img2" class="cart_img" style="width: 30px; height: 30px; cursor: pointer; margin-right: 1rem;" src="${ pageContext.servletContext.contextPath }/resources/img/cart2.png" />
					        </span>
					        
					         <!-- 프사 이미지 -->
							<c:if test="${ fn:contains(sessionScope.loginUser.profile, 'http')}">
								<img id="login" class="profile_img" style="width: 30px; height: 30px; border-radius: 50px; cursor: pointer;" src="${sessionScope.loginUser.profile}" />
							</c:if>
		        <!-- </form> -->
					        <!-- 알림 모달창 -->
					        <div class="message_modal_cover has_bubble nav-modal-cover">
								<div class="message-modal">
									<!-- span 사이 2는 나중에 db에서 count로 가져오기 -->
									<div class="header-content unchecked-cnt">읽지 않은 알림 <span class="num">2</span>개</div>
							    <div class="list-content">
							    	<!-- 공지사항들 -->
									<div class="infd-message-cover ">
							  			<a href="#" class="infd-message-el">
										    <span class="title">[공지사항] [인프런 소식] 카테고리 정리, 할인 관리, 카드 디자인 변경</span>
										    <span class="date">14일 전</span>
							  			</a>
									</div>
									
									<div class="infd-message-cover ">  <!-- 여기에 읽으면 addClass('checked') 해주기 -->
									  <a href="#" class="infd-message-el">
									    <span class="title">[공지사항] [업데이트 소식] 4월 셋째주 - 알람 기능 오픈 📣</span>
									    <span class="date">1달 전</span>
									  </a>
									</div>
								</div>
				          		<div class="button-content"><a href="#">더 많은 알람 보기</a></div>
						        </div>
					        </div>
					        
					        <!-- 장바구니 모달창 -->
						    <div class="cart_modal_cover has_bubble nav-modal-cover">
								<div class="cart_modal">
								  <div class="tab_content top_content">
								    <span id="cart" class="tab_menu active" data-type="cart">장바구니</span>
								    <span id="wish" class="tab_menu" data-type="wish">위시리스트</span>
								  </div>
								  <div class="bottom_content">
								    <div class="list_content">
								      <div class="tab_list">
								      	<!-- 장바구니가 있을 때 추가해줌 -->
								      	<a class="list_el" href="/course/스프링-데이터-JPA-실전">
										  <div class="thumb_content"><img src="https://cdn.inflearn.com/public/courses/324474/course_cover/58c8632c-7a6e-4c76-9893-d7fffa32faf2/kyh_JPA_Spring2%20%E1%84%87%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%206.png"></div>
										  <div class="item_content">
										    <p class="item_title">실전! 스프링 데이터 JPA</p>
										    <p class="item_price">₩88,000</p>
										  </div>
										</a>
										<a class="list_el" href="/course/스프링-데이터-JPA-실전">
										  <div class="thumb_content"><img src="https://cdn.inflearn.com/public/courses/324474/course_cover/58c8632c-7a6e-4c76-9893-d7fffa32faf2/kyh_JPA_Spring2%20%E1%84%87%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%206.png"></div>
										  <div class="item_content">
										    <p class="item_title">더 자바, 애플리케이션을 테스트하는 다양한 방법</p>
										    <p class="item_price">₩88,000</p>
										  </div>
										</a>
										<a class="list_el" href="/course/스프링-데이터-JPA-실전">
										  <div class="thumb_content"><img src="https://cdn.inflearn.com/public/courses/324474/course_cover/58c8632c-7a6e-4c76-9893-d7fffa32faf2/kyh_JPA_Spring2%20%E1%84%87%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%206.png"></div>
										  <div class="item_content">
										    <p class="item_title">실전! 스프링 데이터 JPA</p>
										    <p class="item_price">₩88,000</p>
										  </div>
										</a>
										<a class="list_el" href="/course/스프링-데이터-JPA-실전">
										  <div class="thumb_content"><img src="https://cdn.inflearn.com/public/courses/324474/course_cover/58c8632c-7a6e-4c76-9893-d7fffa32faf2/kyh_JPA_Spring2%20%E1%84%87%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%206.png"></div>
										  <div class="item_content">
										    <p class="item_title">실전! 스프링 데이터 JPA</p>
										    <p class="item_price">₩88,000</p>
										  </div>
										</a>
								      <div class="no_result">결과 없음</div></div>
								    </div>
								    <div class="button_content">
								      <a id="go_cart" class="button tab_button active fw-bold space-inset-8 cart_link" href="#" data-type="cart">장바구니로 이동</a>
								      <a id="go_wish" class="button tab_button fw-bold space-inset-8 wish_link" href="#" data-type="wish">위시 리스트로 이동</a>
								    </div>
								  </div>
								</div>
							</div>
						    
							<!-- 프사 모달창 -->
							<div class="profile_modal_cover has_bubble nav-modal-cover"><div class="profile_modal">
						    <div class="close_content">
						      <span class="e_close_btn" data-type="close">
						        <span class="icon"><i class="fal fa-times"></i></span>
						      </span>
						      <a class="message-icon-cover" href="/messages">
						        <span class="icon"><i class="fal fa-bell"></i></span>
						        <span class="new-message-mark"></span>
						      </a>
						    </div>
						    <div class="info_content">
						      <div class="user_content">
						        <div class="left_content">
						          <div class="thumbnail" style="padding: 0px;">
						            <img src="${sessionScope.loginUser.profile}" alt="profile_img">
						            <a href="#">설정</a>
						          </div>
						        </div>
						        <div class="right_content">
						          <a href="updateInfoForm.mg"><span class="name">${sessionScope.loginUser.nickName}</span></a>
						          <div class="policy">회원</div>
						        </div>
						      </div>
						      <div class="point_content">
						        <a href="/my-points" class="mileage point_box">
						          <span class="title">마일리지</span>
						          <span class="content_modal"><span class="value">0</span>P</span>
						        </a>          
						      </div>
						    </div>
						    <div class="menu_content">
						      <div class="tab_content">
						        <span class="tab_menu active" data-id="0" style="font-weight: bold;">회원</span>
						      </div>
						      <div class="list_content">
						        <div class="tab_list active" data-id="0">
								  <a href="#" class="title">
							        <div class="list_el">
							        	<span class="name">좋아요 목록</span>
							        </div>
							      </a>
	   						      <a href="#" class="title">
							        <div class="list_el">
							        	<span class="name">결제 내역</span>
							        </div>
							      </a>
							  	  <a href="#" class="title">
							        <div class="list_el">
							        	<span class="name">신청한 모임관리</span>
							        </div>
							      </a>
							      <a href="#" class="title">
							        <div class="list_el">
							        	<span class="name">후기</span>
							        </div>
							      </a>
							      <a href="#" class="title">
							        <div class="list_el">
							        	<span class="name">마일리지</span>
							        </div>
							      </a>
							      <a href="#" class="title">
							        <div class="list_el">
							        	<span class="name">장바구니 목록</span>
							        </div>
							      </a>
							      <a href="#" class="title">
							        <div class="list_el">
							        	<span class="name">정보 수정</span>
							        </div>
							      </a>
								</div>
						      </div>
						    </div>
						    <div class="footer_content">
						      <span class="left_content">
						        <a href="logout.me" class="link">로그아웃</a>
						      </span>
						      <span class="right_content">
						        <a href="list.no" class="link">고객센터</a>
						      </span>
						    </div>
						  </div></div>
						</c:if>
						
						
						
					</c:if>
					</p>
                </div>
            </div>
        </nav>
    </div>
    <!-- 검색창 클릭시 나오는 div -->
    <div class="sc-cQFLBn jsQIBQ sc-gzVnrw bGFEwv search_modal" style="opacity: 1; display: block;">
    	<div class="sc-gojNiO grZaTa"></div>
    	<div class="sc-hXRMBi gdSctU">
    		<div class="sc-epnACN dTGVDR sc-elJkPf epzdvI">
    			<section class="sc-ibxdXY eHHfdL" id="recent_section">
    				<header class="sc-RefOD dzvleS">
    					<label class="sc-iQKALj iozWPr">최근 검색어</label>
    					<button type="button" class="sc-eTuwsz hUAMtM sc-iyvyFf gkEcoP" font-size="12" color="#9b9b9b" id="recent_delete">지우기</button>
    				</header>
    				<div id="recent_search">
    					<!-- <button class="sc-gwVKww bjXqly sc-VigVT jechLO" width="100%" height="40px" font-size="12px" font-weight="500">전상면</button> -->
    				</div>
    			</section>
    			<section class="sc-ibxdXY eHHfdL">
    				<header class="sc-RefOD dzvleS">
    					<label class="sc-iQKALj iozWPr">인기 검색어</label>
    				</header>
    				<div class="sc-bwCtUz edfQHX">
    					<button class="sc-hrWEMg cYhmRL sc-VigVT kSYzHo" height="34px" color="#3397ff" font-size="12px" font-weight="500">와인</button>
    					<button class="sc-hrWEMg cYhmRL sc-VigVT kSYzHo" height="34px" color="#3397ff" font-size="12px" font-weight="500">서핑</button>
    					<button class="sc-hrWEMg cYhmRL sc-VigVT kSYzHo" height="34px" color="#3397ff" font-size="12px" font-weight="500">댄스</button>
    					<button class="sc-hrWEMg cYhmRL sc-VigVT kSYzHo" height="34px" color="#3397ff" font-size="12px" font-weight="500">스터디</button>
    					<button class="sc-hrWEMg cYhmRL sc-VigVT kSYzHo" height="34px" color="#3397ff" font-size="12px" font-weight="500">공방</button>
    				</div>
    			</section>
    		</div>
    	</div>
    </div>
    <script>
    	/* 검색창 쿠키 */
    	
    	/* 쿠키 설정 */
    	function setCookie(cookie_name, value, days){
    		var exdate = new Date();
	   		exdate.setDate(exdate.getDate() + days);
	    	// 설정 일수만큼 현재시간에 만료값으로 지정
	
	    	var prevCookie = getCookie(cookie_name);
	    	var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	    	
	    	if(prevCookie == ''){
	    		document.cookie = cookie_name + '=' + value;
	    	} else{
	    		document.cookie = cookie_name + '=' + prevCookie + "/" + value;
	    	}
    	}
    	
    	/* 쿠키 얻기 */
    	function getCookie(cookie_name){
	 		 var x, y;
 			 var val = document.cookie.split(';');

 			 for (var i = 0; i < val.length; i++) {
 		   		x = val[i].substr(0, val[i].indexOf('='));
 		   		y = val[i].substr(val[i].indexOf('=') + 1);
 		   		x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
 		   		if (x == cookie_name) {
 		     		return unescape(y); // unescape로 디코딩 후 값 리턴
 		   		}
 		 	}
    	}

    	/* 쿠키 삭제 */
    	function deleteCookie(name) {
		 	document.cookie = name + '=';
		}
    	
    	/* form 태그 두개있을때 뒤에 나오는 form태그는 보이지 않는 에러가 나서 위 form태그를 없앰 */
    	/* $('#searchForm').submit(function(e){
    		var value = $('.input').val();
    		setCookie('search', value , 1);
    		console.log(getCookie('search'));
    	}) */
    	
    	$('.input').keyup(function(key){
    		if(key.keyCode == 13){
    			var value = $('.input').val();
        		setCookie('search', value , 7);
				location.href = "test.do?search=" + value;
        		//location.href = "#";
    		}
    	});
    	
    	/* 검색창 조작 자바스크립트 */
    	$('.search_modal').hide(); 
    	$('.input').focus(function(e){
    		e.stopPropagation();
        	if($('.search_modal')[0].style.display=='none'){
        		$('.search_modal').show();
        	} else{
        		$('.search_modal').hide();
        	}
    	})
    	
    	 $('.grZaTa').click(function(){
        	$('.search_modal').hide();
        })
        
        var record = getCookie('search');
        /* 최근 검색어 div */
        function recentSearch(record){
    		if(record=='' || record == null){
    			$('#recent_section').remove();
    		}
    		else{
    			$('#recent_search').html();
    			var records = record.split('/');
    			for(var i in records){
    				var $button = $('<button class="sc-gwVKww bjXqly sc-VigVT jechLO" width="100%" height="40px" font-size="12px" font-weight="500"></button>').text(records[records.length - i-1]); 
    				$('#recent_search').append($button);
    			}
    		}
    	}
        recentSearch(record);
        
        $('#recent_delete').click(function(){
        	deleteCookie('search');
        	var record = getCookie('search');
        	recentSearch(record);
        })
    </script>
    <script>
    	/* 모달창 조작 자바스크립트 */
    	
    	$('.profile_modal_cover').hide();
        $('.profile_img').click(function(e){
        	e.stopPropagation();
        	if($('.profile_modal_cover')[0].style.display=='none'){
        		$('.profile_modal_cover').show();
        		
        		$('.cart_modal_cover').hide(); 
        		$('.icon_cover').show();
        		$('.is_active').hide();
        		
        		$('.message_modal_cover').hide();
        		$('.alarm_cover').show();
        		$('.is_active_alarm').hide();
        	} else{
        		$('.profile_modal_cover').hide();        		
        	}
        });
        
        $('.cart_modal_cover').hide();
        $('#go_wish').hide();
        $('.is_active').hide();
        $('.icon_cover').click(function(e){
        	e.stopPropagation();
        	if($('.cart_modal_cover')[0].style.display=='none'){
        		$('.cart_modal_cover').show();
        		$('.icon_cover').hide();
        		$('.is_active').show();
        		
        		$('.profile_modal_cover').hide(); 
        		
        		$('.message_modal_cover').hide();
        		$('.alarm_cover').show();
        		$('.is_active_alarm').hide();
        	} else{
        		$('.cart_modal_cover').hide(); 
        		$('.icon_cover').show();
        		$('.is_active').hide();
        	}
        });
        
        $('.message_modal_cover').hide();
        $('.is_active_alarm').hide();
        $('.alarm_cover').click(function(e){
        	e.stopPropagation();
        	if($('.message_modal_cover')[0].style.display=='none'){
        		$('.message_modal_cover').show();
        		$('.alarm_cover').hide();
        		$('.is_active_alarm').show();
        		
        		$('.profile_modal_cover').hide();
        		
        		$('.cart_modal_cover').hide();
        		$('.icon_cover').show();
        		$('.is_active').hide();
        	} else{
        		$('.message_modal_cover').hide(); 
        		$('.alarm_cover').show();
        		$('.is_active_alarm').hide();
        	}
        });
        
        $(document).click(function(){
        	$('.profile_modal_cover').hide();
        	
        	$('.cart_modal_cover').hide();
        	$('.icon_cover').show();
        	$('.is_active').hide();
        	
        	$('.message_modal_cover').hide();
        	$('.alarm_cover').show();
        	$('.is_active_alarm').hide();
        })

        $('#cart').click(function(e){
        	e.stopPropagation();
        	$('#go_cart').addClass('active');
        	$('#wish').removeClass('active');
        	$('#cart').addClass('active');
        	$('#go_wish').removeClass('active');
        	$('#go_wish').hide();
        	$('#go_cart').show();
        })
        
        $('#wish').click(function(e){
        	e.stopPropagation();
        	$('#cart').removeClass('active');
        	$('#wish').addClass('active');
        	$('#go_cart').removeClass('active');
        	$('#go_wish').addClass('active');
        	$('#go_cart').hide();
        	$('#go_wish').show();
        })
    </script>
    
</body>
</html>