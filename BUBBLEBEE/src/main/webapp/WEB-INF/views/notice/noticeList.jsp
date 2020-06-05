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

			<c:forEach var="n" items="${ list }" varStatus="status">
			<div class="ntitle">
				<table>
					<tr class="titlendate">
						<td width="700px">${ n.btitle }</td>
						<td>${ n.b_create_date }</td>
					</tr>
				</table>
				<p class="ncontent" style="display:none">
					<span id="con">내용</span>
					<span id="updB">수정</span>&nbsp;&nbsp;<span id="delB">삭제</span>
				</p>
			</div>
			</c:forEach>
			
			 
			 <!-- 페이징 처리 -->
      
		      <div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
			      <!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						< &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="list.no">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }"> <</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="gold" size="4"><b>[${ p }]</b></font>&nbsp;
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="list.no">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="list.no">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }"> > </a>
					</c:if>
				
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
 				$('#con').html(${ n.bcontent});
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