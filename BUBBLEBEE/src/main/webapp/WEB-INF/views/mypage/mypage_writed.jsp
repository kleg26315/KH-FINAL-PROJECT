<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#writed a, #l_review a{font-weight: bold;color: gold;}
#review_all{margin-top: 30px;}
#review_wrap{display: flex;border: 1px solid #eee;padding:20px 10px;margin-bottom: 20px;}
.per_review{display: flex;width: 95%;}
.per_info{display: flex;flex-direction: column;margin:auto 10px;flex-grow: 1;}
.per_img{margin: auto 0;}
textarea{resize: none;border: none;}
.info{margin-bottom:8px; }
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
   	<hr id="main_hr">
    <div id="content">
	 	<nav>
	   		<c:import url="../layout/mypage_nav.jsp"/> 
	   </nav>
	    <div id="c_body">
		    <div id="content_list">
		   		<div id="review" class="c_list"><a>후기</a></div>
		    	<div id="writed" class="c_list"><a>작성 완료 후기</a></div>
		    </div>
		    <div id="review_all">
		    	<div id="review_wrap">
		    		<div class="per_review">
		    			<div class="per_img">
		    				<a style="margin: 20px 20px;"><img width="80" height="80"src="<%=request.getContextPath()%>/resources/img/main_resize.png"></a>
		    			</div>
		    			<div class="per_info">
		    				<div>
				    			<div class="info">참가 신청일 : 2020-05-06</div>
				    			<div class="info">[요리]신전 떡볶이 따라잡기</div>
				    			<div class="info">
				    			정말 신전 떡볶이 같았어요 짭짭쓰~~
				    			<br>
				    			근데 저는 신불떡볶이가 더 맛있어요
				    			</div>
				    			<div class="like_score">
				    			<span>별점</span>
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
				    		</div>
		    			</div>
		    			<div class="write_btn" style="margin:auto 0; "><button>후기 삭제</button></div>
		    		</div>
		    	</div>
		    	<div id="review_wrap">
		    		<div class="per_review">
		    			<div class="per_img">
		    				<a style="margin: 20px 20px;"><img width="80" height="80"src="<%=request.getContextPath()%>/resources/img/main_resize.png"></a>
		    			</div>
		    			<div class="per_info">
		    				<div>
				    			<div class="info">참가 신청일 : 2020-05-06</div>
				    			<div class="info">[요리]신전 떡볶이 따라잡기</div>
				    			<div class="info">
				    			정말 신전 떡볶이 같았어요 짭짭쓰~~
				    			<br>
				    			근데 저는 신불떡볶이가 더 맛있어요
				    			</div>
				    			<div class="like_score">
				    			<span>별점</span>
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>4.90</span>
	   					</div>
				    		</div>
		    			</div>
		    			<div class="write_btn" style="margin:auto 0; "><button>후기 삭제</button></div>
		    		</div>
		    	</div>
		    </div>
		 </div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>