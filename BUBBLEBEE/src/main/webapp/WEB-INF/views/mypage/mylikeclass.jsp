<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 좋아요</title>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/mypage_like.css">
</head>
<style>
#class{font-weight: bold;}
#class a{color: gold;}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
     <header>
     <c:import url="../layout/mypage_header.jsp"/> 
     </header>
    <hr>
    <div id="content">
	    <nav>
	    	 <c:import url="../layout/mypage_nav.jsp"/> 
	    </nav>
	    <div id="c_body">
	    <div id="content_list">
	    	<div id="meet" class="c_list"><a href="mylike.mg">모임</a></div>
	    	<div id="class" class="c_list"><a href="mylikeclass.mg"">클래스</a></div>
	    	<div id="host" class="c_list"><a href="mylikehost.mg">호스트</a></div>
	    </div>
	    <!-- 좋아요 없을 때 목록 -->
<!-- 		    <div id="no_like"> -->
<!-- 			    <div id="img_wrap"> -->
<%-- 			     <img src="<%=request.getContextPath()%>/resources/img/smile.png" id="smile"/> --%>
<!-- 			     </div> -->
<!-- 			     <div>아직 좋아한 클래스가 없어요.</div> -->
<!-- 			     <div>관심있는 클래스의 하트를 눌러주세요!</div> -->
<!-- 		    </div> -->
		 <!-- 있을때 -->   
		<div class="like_all">
	   	<div class="like">
	   		<div class="like_total">
	   			<a>
	   				<div class="like_each">
						<div class="like_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/main.png" />
						</div>
	   					<div class="like_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
	   					<div class="like_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
	   					<div class="like_price">
	   						<span>14,000원</span>
	   					</div>
	   					<div class="like_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   	</div>
	   </div> 
		</div>
	</div>
	<div style="text-align: center;">페이징 버튼 추가 예정</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>