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

	<h1 id="noticeLabel" style="font-weight: bold;">공지사항</h1>
		<c:forEach var="n" items="${ list }">
			<div class="ntitle">
				<table style="width: 100%; cursor: pointer;" class="titleDate">
					<tr class="titlendate">
						<td>${n.btitle }</td>
						<td style="text-align: right;">${n.b_modify_date}</td>
					</tr>
				</table>
				<div class="ncontent" style="display:none">${n.bcontent } <br><br>
				<c:if test="${ sessionScope.loginUser.id eq 'admin@admin.admin'}">
					<span id="delB">삭제</span>&nbsp;&nbsp;<span id="updB">수정</span>
				</c:if>
				</div>
			</div>
		</c:forEach>

		<script>
	 		$(function(){
	 			$('.titleDate').mouseenter(function(){
	 			}).mouseout(function(){
	 			}).click(function(){
	 				$(this).parent().children('.ncontent').slideToggle(1);
	 			})
	 		});
		</script>
		
		<br><br>
		<div class="text-center">
           	<ul class="pagination">
           		<c:if test="${ pi.currentPage <= 1 }">
           			<!-- <li><a class="disable">&lt;</a></li> -->
           			<li class="disabled"><a>&lt;</a></li>
           		</c:if>
           		<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="list.no">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<li><a href="${ before }">&lt;</a></li>
				</c:if>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<li class="active"><a>${ p }</a></li>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="list.no">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<li><a href="${ pagination }">${ p }</a> &nbsp;</li>
					</c:if>
				</c:forEach>
				
           		<c:if test="${ pi.currentPage >= pi.maxPage }">
					<li class="disabled"><a>&gt;</a></li>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="list.no">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<li><a href="${ after }">&gt;</a></li>
				</c:if>
           	</ul>
         </div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
   
</body>
</html>