<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 내역</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;font-weight: bolder;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_paid a{font-weight: bold; color: gold;}
#list_all{margin-top: 30px;}
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
			    	<div class="c_list"><a>결제 내역</a></div>
			</div>
			<div id="list_all">
		     <table border="1" style="width:100%;">
		<tr>
			<th style="width:20%;text-align:center;">구매 날짜</th>
			<th style="width:40%;text-align:center;">상품정보</th>
			<th style="width:20%;text-align:center;">판매자</th>
			<th style="width:20%;text-align:center;">상품 금액</th>
		</tr>
		<tr>
			<td style="text-align:center;">2020-05-26</td>
			<td>
				<div style="display: flex; justify-content:flex-start;">
				<a style="margin: 20px 20px;"><img width="80" height="80"src="<%=request.getContextPath()%>/resources/img/main_resize.png"></a>
				<div style="display: flex; flex-direction: column; align-content: space-around; margin: auto 5px; width: 100%;">
				<span>상품명</span>
				<hr style="width: 100%;">
				옵션
				</div>
				</div>
			</td>
			<td style="text-align:center;">전희은</td>
			<td style="text-align:center;">100,000</td>
		</tr>
		</table>
		</div>
		 </div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>