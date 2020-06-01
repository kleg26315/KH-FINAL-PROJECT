<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>참여 모임/클래스</title>
</head>
<style>
section hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_class a{font-weight: bold; color: gold;}
#participate a{font-weight: bold; color: gold;}
.like_all{
	margin-top: 30px;
}
.like{
	display: flex;
    min-height: 1px;
}
.like > *{
	margin-right: 10px;
    width: calc(25% - 7.5px);
    margin-bottom: 31px;
}
.like_total{
	display: flex;
    background-color: white;
    min-height: 1px;
    flex-flow: column nowrap;
}
.like_each{
	overflow: hidden;
}
.like_post{
}
.like_location{
}
.like_l_location{
	height: 10px;
    color: white;
    font-size: 10px;
    font-weight: 500;
    line-height: 10px;
    text-shadow: rgba(0, 0, 0, 0.3) 0px 0px 10px;
    margin: 2px 0px 0px 2px;
}
.like_heart{
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
.like_small_title{
	margin-top: 14px;
    font-size: 12px;
    height: 14px;
    text-overflow: ellipsis;
    line-height: 14px;
    color: rgb(155, 155, 155);
    overflow: hidden;
}
.like_title{
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
.like_price{
	margin-top: 14px;
    line-height: 14px;
    height: 14px;
}
.like_score{
	margin-top: 14px;
	font-size: 11px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(187, 187, 187);
}
.like_img{
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
		    	<div id="reserved" class="c_list"><a href="">예약 내역</a></div>
		    	<div id="participate" class="c_list"><a href="">이전 참여 내역</a></div>
		    </div>
		    
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
			  <div>페이징</div> 
		 </div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>