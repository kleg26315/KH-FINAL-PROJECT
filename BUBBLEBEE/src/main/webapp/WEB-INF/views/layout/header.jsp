<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
.alarmRedCircle{
    position: absolute;
    width: 21px;
    height: 22px;
    box-shadow: 0 2px 4px 0 rgba(33,37,41,.24);
    top: 13px;
    right: 523px;
    z-index: 10;
    color: white;
    text-align: center;
    background: red; border-radius: 70%; border: 0px;
    cursor: pointer;
    display: none;
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
									<c:param name="cate" value="party"/>
								</c:url>
                                <li role="presentation"><a href="${ tp }">토크/파티</a></li>
                                
                                <c:url var="ts" value="list.bo">
									<c:param name="cate" value="like"/>
								</c:url>
                                <li role="presentation"><a href="${ ts }">취향</a></li>
                                
                                <c:url var="st" value="list.bo">
									<c:param name="cate" value="study"/>
								</c:url>
                                <li role="presentation"><a href="${ st }">스터디</a></li>
                                
                                <c:url var="ev" value="list.bo">
									<c:param name="cate" value="event"/>
								</c:url>
                                <li role="presentation"><a href="${ ev }">이벤트/공간</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">클래스 <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                            	<c:url var="di" value="list.bo">
									<c:param name="cate" value="diy"/>
								</c:url>
                                <li role="presentation"><a href="${ di }">공예/DIY</a></li>
                                
                                <c:url var="ck" value="list.bo">
									<c:param name="cate" value="cook"/>
								</c:url>
                                <li role="presentation"><a href="${ ck }">요리</a></li>
                                
                                <c:url var="sp" value="list.bo">
									<c:param name="cate" value="sport"/>
								</c:url>
                                <li role="presentation"><a href="${ sp }">스포츠</a></li>
                                
                                <c:url var="ln" value="list.bo">
									<c:param name="cate" value="learn"/>
								</c:url>
                                <li role="presentation"><a href="${ ln }">어학/취업</a></li>
                            </ul>
                        </li>
                        
                        <c:url var="wk" value="list.bo">
							<c:param name="cate" value="sell"/>
						</c:url>
                        <li role="presentation"><a href="${ wk }">작품</a></li>
                    </ul>
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
								onclick="location.href='account.ad'">관리자페이지</label></span>
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
							<span class="alarmRedCircle"></span>
							<!-- 장바구니 이미지 -->
					        <span class="icon icon_cover ">
					        	<img id="cart_img1" class="cart_img" style="width: 30px; height: 30px; cursor: pointer; margin-right: 1rem;" src="${ pageContext.servletContext.contextPath }/resources/img/cart.png" />
					        </span>
					        <span class="icon icon_cover is_active">
					        	<img id="cart_img2" class="cart_img" style="width: 30px; height: 30px; cursor: pointer; margin-right: 1rem;" src="${ pageContext.servletContext.contextPath }/resources/img/cart2.png" />
					        </span>
					        
					         <!-- 프사 이미지 -->
					         <c:choose>
					         	<c:when test="${ fn:contains(sessionScope.loginUser.profile, 'http')}">
					         		<img id="login" class="profile_img" style="width: 30px; height: 30px; border-radius: 50px; cursor: pointer;" src="${sessionScope.loginUser.profile}" />
					         	</c:when>
					         	<c:otherwise>
					         	<img id="login" class="profile_img" style="width: 30px; height: 30px; border-radius: 50px; cursor: pointer;" src="${contextPath }/resources/proFiles/${sessionScope.loginUser.profile}" />
					         	</c:otherwise>
					         </c:choose>
							
					        <!-- 알림 모달창 -->
					        <div class="message_modal_cover has_bubble nav-modal-cover">
								<div class="message-modal">
									<div class="header-content unchecked-cnt">읽지 않은 알림 <span class="num">0</span>개</div>
							    <div class="list-content">
							    	<div class="list_content2">
								    	<!-- 공지사항들 -->
										<!-- <div class="infd-message-cover "> checked 클래스추가하면 본걸로 체크
								  			<a href="#" class="infd-message-el">
											    <span class="title">[공지사항] [인프런 소식] 카테고리 정리, 할인 관리, 카드 디자인 변경</span>
											    <span class="date">14일 전</span>
								  			</a>
										</div> -->
									</div>
								</div>
				          		<div class="button-content"><a href="myalert.mg">더 많은 알람 보기</a></div>
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
								      <div class="tab_list" id="cart_div">
								      	<!-- 장바구니가 있을 때 추가해줌 -->
								      	<c:if test="${empty slist}">
								      		 <div class="no_result">결과 없음</div></div>
								      	</c:if>
								      	<c:if test="${not empty slist}">
								      		<c:forEach var="s" items="${ slist }">
								      			<a class="list_el" href="/course/스프링-데이터-JPA-실전">
												  <div class="thumb_content"><img src="https://cdn.inflearn.com/public/courses/324474/course_cover/58c8632c-7a6e-4c76-9893-d7fffa32faf2/kyh_JPA_Spring2%20%E1%84%87%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%206.png"></div>
												  <div class="item_content">
												    <p class="item_title">실전! 스프링 데이터 JPA</p>
												    <p class="item_price">₩88,000</p>
												  </div>
												</a>
								      		</c:forEach>
								      	</div>
								      	</c:if>
								    <div class="tab_list" id="wish_div">
								      	<!-- 장바구니가 있을 때 추가해줌 -->
								      	<c:if test="${empty hlist}">
								      		 <div class="no_result">결과 없음</div></div>
								      	</c:if>
								      	<c:if test="${not empty hlist}">
								      		<c:forEach var="h" items="${ hlist }">
								      			<a class="list_el" href="/course/스프링-데이터-JPA-실전">
												  <div class="thumb_content"><img src="https://cdn.inflearn.com/public/courses/324474/course_cover/58c8632c-7a6e-4c76-9893-d7fffa32faf2/kyh_JPA_Spring2%20%E1%84%87%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%206.png"></div>
												  <div class="item_content">
												    <p class="item_title">실전! 스프링 데이터 JPA</p>
												    <p class="item_price">₩88,000</p>
												  </div>
												</a>
								      		</c:forEach>
								      	</div>
								      	</c:if>
								    </div>
								    <div class="button_content">
								      <a id="go_cart" class="button tab_button active fw-bold space-inset-8 cart_link" href="myslist.mg" data-type="cart">장바구니로 이동</a>
								      <a id="go_wish" class="button tab_button fw-bold space-inset-8 wish_link" href="mylike.mg" data-type="wish">위시 리스트로 이동</a>
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
						           <c:choose>
						         	<c:when test="${ fn:contains(sessionScope.loginUser.profile, 'http')}">
						         		<img src="${sessionScope.loginUser.profile}" />
						         	</c:when>
						         	<c:otherwise>
						         		<img src="${contextPath }/resources/proFiles/${sessionScope.loginUser.profile}" />
						         	</c:otherwise>
					         	</c:choose>
						            <a href="updateInfoForm.mg">설정</a>
						          </div>
						        </div>
						        <div class="right_content">
						          <a href="updateInfoForm.mg"><span class="name">${sessionScope.loginUser.nickName}</span></a>
						          <c:if test="${ sessionScope.loginUser.host_yn eq 'N' }">
						          	<div class="policy">회원</div>
						          </c:if>
						          <c:if test="${ sessionScope.loginUser.host_yn eq 'Y' }">
						          	<div class="policy">호스트</div>
						          </c:if>
						        </div>
						      </div>
						      <div class="point_content">
						        <a href="mypoint.mg" class="mileage point_box">
						          <span class="title">마일리지</span>
						          <span class="content_modal"><span class="value">${sessionScope.point }</span>P</span>
						        </a>          
						      </div>
						    </div>
						    <div class="menu_content">
						      <div class="tab_content">
						      	<c:if test="${ sessionScope.loginUser.host_yn eq 'N' }">
						        	<span class="tab_menu active" data-id="0" style="font-weight: bold;">회원</span>
						        </c:if>
						        <c:if test="${ sessionScope.loginUser.host_yn eq 'Y' }">
						        	<span class="tab_menu active" data-id="0" style="font-weight: bold;">호스트</span>
						        </c:if>
						      </div>
						      <div class="list_content">
						        <div class="tab_list active" data-id="0">
								  <a href="mylike.mg" class="title">
							        <div class="list_el">
							        	<span class="name">좋아요 목록</span>
							        </div>
							      </a>
	   						      <a href="mypaid.mg" class="title">
							        <div class="list_el">
							        	<span class="name">결제 내역</span>
							        </div>
							      </a>
							      <c:if test="${ sessionScope.loginUser.host_yn eq 'N' }">
								  	  <a href="mymeet.mg" class="title">
								        <div class="list_el">
								        	<span class="name">신청한 모임관리</span>
								        </div>
								      </a>
							      </c:if>
							      <a href="myreview.mg" class="title">
							        <div class="list_el">
							        	<span class="name">후기</span>
							        </div>
							      </a>
							      <a href="mypoint.mg" class="title">
							        <div class="list_el">
							        	<span class="name">마일리지</span>
							        </div>
							      </a>
							      <c:if test="${ sessionScope.loginUser.host_yn eq 'N' }">
								      <a href="myslist.mg" class="title">
								        <div class="list_el">
								        	<span class="name">장바구니 목록</span>
								        </div>
								      </a>
							      </c:if>
							      <c:if test="${ sessionScope.loginUser.host_yn eq 'Y' }">
							      	<a href="myalert.mg" class="title">
								        <div class="list_el">
								        	<span class="name">모든 알림</span>
								        </div>
								      </a>
							      </c:if>
							      <a href="updateInfoForm.mg" class="title">
							        <div class="list_el">
							        	<span class="name">정보 수정</span>
							        </div>
							      </a>
							      <c:if test="${ sessionScope.loginUser.host_yn eq 'Y' }">
							      	<a href="hostpage.ho" class="title">
								        <div class="list_el">
								        	<span class="name">호스트 페이지</span>
								        </div>
								      </a>
							      </c:if>
								</div>
						      </div>
						    </div>
						    <div class="footer_content">
						      <span class="left_content">
						        <a href="logout.me" class="link">로그아웃</a>
						      </span>
						      <span class="right_content">
						        <!-- <a href="list.no" class="link">고객센터</a> -->
						        <a class="center_a link">고객센터</a>
						        <div class="center has_bubble" style="display:none;">
						        	<a href="list.no" class="link" style="margin-top: 2px; padding: 6px;">공지사항</a><br>
						        	<a href="FAQList.no" class="link" style="padding: 6px; margin-left: 13px;">FAQ</a><br>
						        </div>
						        </div>
						        <script>
						        	$('.center_a').click(function(){
						        		if($('.center')[0].style.display=='none'){
						        			$('.center').show();
						        		} else{
						        			$('.center').hide();
						        		}
						        	})
						        </script>
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
    <div class="search_div search_modal" style="opacity: 1; display: block;">
    	<div class="secret"></div>
    	<div class="search_box">
    		<div class="search_box2">
    			<section class="search_section" id="recent_section">
    				<header class="search_header">
    					<label class="search_word">최근 검색어</label>
    					<button type="button" class="eraser" font-size="12" color="#9b9b9b" id="recent_delete">지우기</button>
    				</header>
    				<div id="recent_search">
    					<!-- <button class="search_recent" width="100%" height="40px" font-size="12px" font-weight="500">전상면</button> -->
    				</div>
    			</section>
    			<section class="search_section2">
    				<header class="search_header">
    					<label class="search_word">인기 검색어</label>
    				</header>
    				<div class="search_hot">
    					<button class="search_hot2" height="34px" color="#3397ff" font-size="12px" font-weight="500">와인</button>
    					<button class="search_hot2" height="34px" color="#3397ff" font-size="12px" font-weight="500">서핑</button>
    					<button class="search_hot2" height="34px" color="#3397ff" font-size="12px" font-weight="500">댄스</button>
    					<button class="search_hot2" height="34px" color="#3397ff" font-size="12px" font-weight="500">스터디</button>
    					<button class="search_hot2" height="34px" color="#3397ff" font-size="12px" font-weight="500">공방</button>
    				</div>
    			</section>
    		</div>
    	</div>
    </div>
    <script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<%-- 	<script src = "<%=request.getContextPath()%>/resources/js/loginRequired.js?ver=1"></script> --%>
    <script>
    	/* 검색창 쿠키 */
    	
    	/* 쿠키 설정 */
    	function setCookie(cookie_name, value, days){
    		var exdate = new Date();
	   		exdate.setDate(exdate.getDate() + days);
	    	// 설정 일수만큼 현재시간에 만료값으로 지정
	
	    	var prevCookie = getCookie(cookie_name);
	    	var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	    	// 중복된 최근 검색이면 기존껀 삭제 후 가장 위로 올림 & 최대 5개 유지
	    	if(typeof prevCookie == 'undefined' || prevCookie == ''){
	    		document.cookie = cookie_name + '=' + value;
	    	} else {
	    		if(prevCookie.includes(value)){
		    		var strArray = prevCookie.split('/');
		    		var str = '';
		    		var same = 0;
		    		for(var i=0; i<strArray.length; i++){
		    			if(strArray[i] == value){
		    				strArray[i]='';
		    				same = i;
		    			}
		    		}
		    		for(var i=0; i<strArray.length; i++){
		    			if(i != same){
		    				str += strArray[i] + "/";
		    			}
		    		}
		    		
		    		var maxArray = (str+value).split('/');
		    		var max = '';
		    		for(var i=0; i<maxArray.length; i++){
		    			if(maxArray.length-5 <= i){
			    			if(maxArray.length-1 == i){
		    					max += maxArray[i];	
		    				} else{
		    					max += maxArray[i] + "/";
		    				}
		    			}
		    		}
		    		document.cookie = cookie_name + '='+ max;
	    		} else{
	    			var maxArray = (prevCookie+'/'+value).split('/');
    				var max = '';
		    		for(var i=0; i<maxArray.length; i++){
		    			if(maxArray.length-5 <= i){
		    				if(maxArray.length-1 == i){
		    					max += maxArray[i];	
		    				} else{
		    					max += maxArray[i] + "/";
		    				}
		    			}
		    		}
		    		document.cookie = cookie_name + '='+ max;
	    		}
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
    	
    	$('.input').keyup(function(key){
    		if(key.keyCode == 13){
    			var value = $('.input').val();
        		setCookie('search', value , 7);
				location.href = "find.bo?search=" + value;
    		}
    	});
    	
    	function recent(e){
    		var text = e.innerText;
    		setCookie('search', text , 7);
    		location.href = "find.bo?search=" + text;
    	}
    	
    	$('.search_hot2').click(function(e){
    		var text = e.currentTarget.innerText;
    		setCookie('search', text , 7);
    		location.href = "find.bo?search=" + text;
    		
    	})
    	
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
    	
    	 $('.secret').click(function(){
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
    				var $button = $('<button class="search_recent" width="100%" onclick="recent(this);" height="40px" font-size="12px" font-weight="500"></button>').text(records[records.length - i-1]); 
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
    	$('#wish_div').hide();
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
        		
        		$('.center').hide();
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
        		
        		$('.center').hide();
        	} else{
        		$('.cart_modal_cover').hide(); 
        		$('.icon_cover').show();
        		$('.is_active').hide();
        	}
        });
        
        $('.message_modal_cover').hide();
        $('.is_active_alarm').hide();
        $('.alarm_cover, .alarmRedCircle').click(function(e){
        	e.stopPropagation();
        	if($('.message_modal_cover')[0].style.display=='none'){
        		$('.message_modal_cover').show();
        		$('.alarm_cover').hide();
        		$('.is_active_alarm').show();
        		
        		$('.profile_modal_cover').hide();
        		
        		$('.cart_modal_cover').hide();
        		$('.icon_cover').show();
        		$('.is_active').hide();
        		
        		$('.center').hide();
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
        	
        	$('.center').hide();
        })

        $('#cart').click(function(e){
        	e.stopPropagation();
        	$('#go_cart').addClass('active');
        	$('#wish').removeClass('active');
        	$('#cart').addClass('active');
        	$('#go_wish').removeClass('active');
        	$('#go_wish').hide();
        	$('#wish_div').hide();
        	$('#go_cart').show();
        	$('#cart_div').show();
        })
        
        $('#wish').click(function(e){
        	e.stopPropagation();
        	$('#cart').removeClass('active');
        	$('#wish').addClass('active');
        	$('#go_cart').removeClass('active');
        	$('#go_wish').addClass('active');
        	$('#go_cart').hide();
        	$('#cart_div').hide();
        	$('#go_wish').show();
        	$('#wish_div').show();
        })
        
        $('.center_a').click(function(e){
        	e.stopPropagation();
        })
    </script>
    
    <!-- 알림 스크립트 -->
    <script>
    var socket = null;
	    var wsUri = "ws://"+location.host+"/bubblebee/count";
	    function send_message(){
	        websocket = new WebSocket(wsUri);
	        socket = websocket;
	        websocket.onopen = function(evt) {
	            onOpen(evt);
	            /* setTimeout(function(){
	        		send_message();
		        }, 1000); */
	        };
	        websocket.onmessage = function(evt) {
	            onMessage(evt);
	            websocket.close();
	        };
	        websocket.onerror = function(evt) {
	            onError(evt);
	        };
	    } 
	   
	    function onOpen(evt) 
	    {
			websocket.send("${loginUser.id}");
	    }
	
	    function onMessage(evt) {
	    	var realData = [];
	    	realData = evt.data.split('&');
	    	console.log(realData[1]);
	   		$('.num').text(realData[0]);	
	   		if(realData[0] != 0){
	   			$('.alarmRedCircle').show();
	   			$('.alarmRedCircle').text(realData[0]);
	   		} else{
	   			$('.alarmRedCircle').hide();
	   		}
			if(realData[1] != "[]"){
				var data = realData[1].substr(1, ( realData[1].length)-3 );
		   		var myArrayData1 =[];
		   		var myArrayData2 =[];
		   		myArrayData1 = data.split("/,");
		   		$listContent = $('.list_content2');
		   		$listContent.html('');
		   		for(var i in myArrayData1){
		   			myArrayData2 = myArrayData1[i].split(",");
		   			var aid = myArrayData2[0];
		   			var acontent = myArrayData2[1];
		   			var acreatedate = myArrayData2[2];
		   			var bno = myArrayData2[3];
		   			var check_yn = myArrayData2[4];
		   			
		   			if(check_yn =='N'){
		   				var $messageCover = $('<div class="infd-message-cover">');
		   				var $a = $('<a class="infd-message-el">');
			   			var $bno = $("<input name='bno' hidden>").val(bno);
			   			var $title = $('<span class="title">').text(acontent);
			   			var $date = $('<span class="date">').text(acreatedate);
			   			
			   			$a.append($bno);
			   			$a.append($title);
			   			$a.append($date);
			   			$messageCover.append($a);
			   			
			   			$listContent.append($messageCover);
		   			}
		   		}
		   		
	   			for(var i in myArrayData1){
		   			myArrayData2 = myArrayData1[i].split(",");
		   			var aid = myArrayData2[0];
		   			var acontent = myArrayData2[1];
		   			var acreatedate = myArrayData2[2];
		   			var bno = myArrayData2[3];
		   			var check_yn = myArrayData2[4];
		   			
		   			if(check_yn =='Y'){
		   				var $messageCover = $('<div class="infd-message-cover checked">');
		   				var $a = $('<a class="infd-message-el">');
			   			var $bno = $("<input name='bno' hidden>").val(bno);
			   			var $title = $('<span class="title">').text(acontent);
			   			var $date = $('<span class="date">').text(acreatedate);
			   			
			   			$a.append($bno);
			   			$a.append($title);
			   			$a.append($date);
			   			$messageCover.append($a);
			   			
			   			$listContent.append($messageCover);
		   			}
	   			}
		   	 	$('.infd-message-el').click(function(){
			    	var bno = $(this).children().eq(0).val();
					location.href = 'noticeSelect.no?bno='+ bno;
			    })
			}
	    }
	
	    function onError(evt) {
	    }
	    $(document).ready(function(){
	    	 send_message();
	    })
	    
    </script>
</body>
</html>