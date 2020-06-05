<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>navigation-with-button</title>
<link rel = "stylesheet"  href= "resources/css/noticeViewCss.css" type = "text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>    
</head>
<style>
	#header{ 
	   position: fixed;
	   width : 100%;
	   z-index: 100;
	}
</style>
<body>
	<header id="header">
	     <c:import url="../layout/header.jsp"/>
	</header> 

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
      <div class = "main2">

	<h2 id="noticeLabel">공지사항</h2>

			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">코로나 19 관련 프립 환불 및 운영 안내</td>
						<td>2020-05-19</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">내용내용 <br><br>
				<span id="updB"><a href="http://www.google.co.kr">수정</a></span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			

		<script>
 		$(function(){
 			$('.ntitle').mouseenter(function(){
				$(this).parent().css({'cursor':'pointer'});
 			}).mouseout(function(){
 				$(this).parent().css({'background':'none'});
 			}).click(function(){
 				var bid = $(this).parent().children().eq(0).text();
 				$(this).children('.ncontent').slideToggle(1);
 			})
 		});

		</script>
		
</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
   
</body>
</html>