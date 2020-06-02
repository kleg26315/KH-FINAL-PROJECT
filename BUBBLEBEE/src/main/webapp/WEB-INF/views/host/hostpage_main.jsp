<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 메인페이지</title>
     <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
#content{display: flex;align-items: flex-start;height: 500px;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
.c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

.main_all{display: flex;border: 1px solid lightgray;margin-bottom: 20px;}
.main_wrap{display: flex;margin: 10px 20px;}
#host_info{flex-grow: 2;margin: auto 0;}
#info_wrap{margin-left: 30px;flex-grow:2;}
.text{font-size: 30px;}
.result_wrap{width: 33%; text-align: center;display: flex;flex-direction: column;justify-content: center;}
.subtitle{font-size: 14px;color: gray;margin: 10px 0;}
.result{font-size: 20px;color: black;margin: 10px 0;font-weight: bolder;}

.sales_all{display: flex;flex-direction: column;justify-content: center;flex-grow: 1;}
.sales_wrap{text-align: center;padding:10px 0;display: flex;flex-direction: column;}
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
		   		<div><img id="" width="100px" height="100px" src="${contextPath }/resources/img/users.png" /></div>
		   		<div id="host_info">
		   			<div id="info_wrap">
			   			<div class="text">안녕하세요!</div>
			   			<div class="text">봉추 호스트님</div>
			   		</div>
		   		</div>
		   	</div>
		   </div>
		   <div class="main_all" style="height: 180px;">
		   		<div class="result_wrap" style="border-right: 1px solid lightgray;">
		   			<div class="subtitle">남겨진 후기</div>
		   			<div class="result">3</div>
		   		</div>
		   		<div class="result_wrap">
		   			<div class="subtitle">평균 평점</div>
		   			<div class="result">3.4</div>
		   		</div>
		   		<div class="result_wrap" style="border-left:1px solid lightgray;">
		   			<div class="subtitle">Q&A 응답률</div>
		   			<div class="result">99%</div>
		   		</div>
		   </div>
		   
		   <div class="main_all">
				<div class="sales_all">
					<div class="sales_wrap" style="border-bottom: 1px solid lightgray;">
							<div class="">이번 달 매출액</div>
							<div class="">36,000원</div>
					</div>
					<div class="sales_wrap">
						<div class="">전체 매출액</div>
						<div class="">250,000원</div>
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