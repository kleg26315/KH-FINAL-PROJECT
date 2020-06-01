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
#host{font-weight: bold;}
#host a{color: gold;}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
<!--    <div id="main"> -->
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
<!-- 			     <div>아직 좋아한 호스트가 없어요.</div> -->
<!-- 			     <div>관심있는 호스트의 하트를 눌러주세요!</div> -->
<!-- 		    </div> -->
		 <!-- 있을때 -->   
		 <div class="host_all">
		 	<div class="host_list">
		 		<div class="per_host">
			 		<a class="host_info">
			 			<div class="h_div">
			 				<span class="h_img">
			 					<div>
			 						<img src="<%=request.getContextPath()%>/resources/img/nightsky.jpg" class="h_pro"/>
			 					</div>
			 				</span>
			 				<div class="info_wrap">
			 					<div class="h_name">호스트이름</div>
			 					<br>
			 					<div>
			 					개설 
			 					4
			 					<span>|</span>
			 					후기
			 					10
			 					<span>|</span>
			 					좋아요
			 					23
			 					</div>
			 				</div>
			 			</div>
			 		</a>
			 		<button class="bbbbtn">
					<img width='18' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
					</button>
			 	</div>
			 	<div class="per_host">
			 		<a class="host_info">
			 			<div class="h_div">
			 				<span class="h_img">
			 					<div>
			 						<img src="<%=request.getContextPath()%>/resources/img/nightsky.jpg" class="h_pro"/>
			 					</div>
			 				</span>
			 				<div class="info_wrap">
			 					<div class="h_name">호스트이름</div>
			 					<br>
			 					<div>
			 					개설 
			 					4
			 					<span>|</span>
			 					후기
			 					10
			 					<span>|</span>
			 					좋아요
			 					23
			 					</div>
			 				</div>
			 			</div>
			 		</a>
			 		<button class="bbbbtn">
					<img width='18' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
					</button>
			 	</div>
			 	<div class="per_host">
			 		<a class="host_info">
			 			<div class="h_div">
			 				<span class="h_img">
			 					<div>
			 						<img src="<%=request.getContextPath()%>/resources/img/nightsky.jpg" class="h_pro"/>
			 					</div>
			 				</span>
			 				<div class="info_wrap">
			 					<div class="h_name">호스트이름</div>
			 					<br>
			 					<div>
			 					개설 
			 					4
			 					<span>|</span>
			 					후기
			 					10
			 					<span>|</span>
			 					좋아요
			 					23
			 					</div>
			 				</div>
			 			</div>
			 		</a>
			 		<button class="bbbbtn">
					<img width='18' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
					</button>
			 	</div>
			 	<div class="per_host">
			 		<a class="host_info">
			 			<div class="h_div">
			 				<span class="h_img">
			 					<div>
			 						<img src="<%=request.getContextPath()%>/resources/img/nightsky.jpg" class="h_pro"/>
			 					</div>
			 				</span>
			 				<div class="info_wrap">
			 					<div class="h_name">호스트이름</div>
			 					<br>
			 					<div>
			 					개설 
			 					4
			 					<span>|</span>
			 					후기
			 					10
			 					<span>|</span>
			 					좋아요
			 					23
			 					</div>
			 				</div>
			 			</div>
			 		</a>
			 		<button class="bbbbtn">
					<img width='18' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
					</button>
			 	</div>
			 	<div class="per_host">
			 		<a class="host_info">
			 			<div class="h_div">
			 				<span class="h_img">
			 					<div>
			 						<img src="<%=request.getContextPath()%>/resources/img/nightsky.jpg" class="h_pro"/>
			 					</div>
			 				</span>
			 				<div class="info_wrap">
			 					<div class="h_name">호스트이름</div>
			 					<br>
			 					<div>
			 					개설 
			 					4
			 					<span>|</span>
			 					후기
			 					10
			 					<span>|</span>
			 					좋아요
			 					23
			 					</div>
			 				</div>
			 			</div>
			 		</a>
			 		<button class="bbbbtn">
					<img width='18' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
					</button>
			 	</div>
			 	<div class="per_host">
			 		<a class="host_info">
			 			<div class="h_div">
			 				<span class="h_img">
			 					<div>
			 						<img src="<%=request.getContextPath()%>/resources/img/nightsky.jpg" class="h_pro"/>
			 					</div>
			 				</span>
			 				<div class="info_wrap">
			 					<div class="h_name">호스트이름</div>
			 					<br>
			 					<div>
			 					개설 
			 					4
			 					<span>|</span>
			 					후기
			 					10
			 					<span>|</span>
			 					좋아요
			 					23
			 					</div>
			 				</div>
			 			</div>
			 		</a>
			 		<button class="bbbbtn">
					<img width='18' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
					</button>
			 	</div>
			 	<div class="per_host">
			 		<a class="host_info">
			 			<div class="h_div">
			 				<span class="h_img">
			 					<div>
			 						<img src="<%=request.getContextPath()%>/resources/img/nightsky.jpg" class="h_pro"/>
			 					</div>
			 				</span>
			 				<div class="info_wrap">
			 					<div class="h_name">호스트이름</div>
			 					<br>
			 					<div>
			 					개설 
			 					4
			 					<span>|</span>
			 					후기
			 					10
			 					<span>|</span>
			 					좋아요
			 					23
			 					</div>
			 				</div>
			 			</div>
			 		</a>
			 		<button class="bbbbtn">
					<img width='18' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
					</button>
			 	</div>
			 	
		 	</div>
		 	<div class="paging">페이징 버튼 추가 예정</div>
		 </div>
		</div>
	</div>
<!-- 	</div> -->
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>