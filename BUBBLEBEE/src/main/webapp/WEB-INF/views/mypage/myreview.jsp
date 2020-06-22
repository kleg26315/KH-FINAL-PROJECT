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

#review a, #l_review a{font-weight: bold;color: gold;}
#review_all{margin-top: 30px;}
#review_wrap{display: flex;border: 1px solid #eee;padding:20px 10px;margin-bottom: 20px;}
.per_review{display: flex;width: 95%;}
.per_info{display: flex;flex-direction: column;margin:auto 10px;flex-grow: 1;font-size: 15px;}
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
				    			<div>참가 신청일 : 2020-05-06</div>
				    			<div>[요리]신전 떡볶이 따라잡기</div>
				    			<div>참석 일자 :2020-05-16</div>
				    		</div>
		    			</div>
		    			<div class="write_btn" style="margin:auto 0; "><button onclick="location.href='reviewInsertForm.mg'">후기 작성</button></div>
		    		</div>
		    	</div>
<!-- 		    	<div id="review_wrap"> -->
<!-- 		    		<div class="per_review"> -->
<!-- 		    			<div class="per_img"> -->
<%-- 		    				<a style="margin: 20px 20px;"><img width="80" height="80"src="<%=request.getContextPath()%>/resources/img/main_resize.png"></a> --%>
<!-- 		    			</div> -->
<!-- 		    			<div class="per_info"> -->
<!-- 		    				<div> -->
<!-- 				    			<div>참가 신청일 : 2020-05-06</div> -->
<!-- 				    			<div>[요리]신전 떡볶이 따라잡기</div> -->
<!-- 				    			<div>참석 일자 :2020-05-16</div> -->
<!-- 				    		</div> -->
<!-- 		    			</div> -->
<!-- 		    			<div class="write_btn" style="margin:auto 0; "><button>후기 작성</button></div> -->
<!-- 		    		</div> -->
<!-- 		    	</div> -->
		    </div>
		 </div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>