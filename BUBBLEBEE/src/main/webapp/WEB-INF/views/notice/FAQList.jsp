<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel = "stylesheet"  href= "resources/css/FAQViewCss.css" type = "text/css">
</head>
<body>
	<header id="header">
	     <c:import url="../layout/header.jsp"/>
	</header> 

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
			<h1 style="font-weight: bold;">FAQ</h1>
			<form class="faq_search"> 
				<img class="faq_search_img" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Ccircle cx='11' cy='11' r='6' stroke='%23000' stroke-width='2'/%3E %3Cpath stroke='%23000' stroke-width='2' d='M15 15l4.95 4.95'/%3E %3C/g%3E %3C/svg%3E" width="24px" height="24px">
				<input type="text" placeholder="키워드를 입력하세요" value="">
			</form>
			<div class="faqCategory">
				<span class="pick faqAjax" id="1">전체</span>
				<span class="rest faqAjax" id="2">이용안내</span>
				<span class="rest faqAjax" id="3">회원정보</span>
				<span class="rest faqAjax" id="4">결제/환불</span>
				<span class="rest faqAjax" id="5">쿠폰/에너지</span>
				<span class="rest faqAjax" id="6">호스트신청</span>
				<span class="rest faqAjax" id="7">기타</span>
			</div>
			<script>
				$('.faqAjax').click(function(e){
					var number = e.currentTarget.id;
					$('.pick').removeClass('pick').addClass('rest');
					$(this).removeClass('rest').addClass('pick');
					$.ajax({
						url : 'faqFilter.no',
						data : {number: number},
						success: function(data){
							if(data.length == 0){
								console.log("없음");
								$faq_list = $('.faq_list');
								$faq_list.html('');
								
								var $zeroBox = $('<div class="zeroBox">');
								var $zero = $('<div class="zero">');
								var $img = $("<img>");
								$img.attr("src", "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='80' height='80' viewBox='0 0 80 80'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h80v80H0z'/%3E %3Cg transform='translate(10 10)'%3E %3Ccircle cx='26.2' cy='26.2' r='24.6' fill-rule='nonzero' stroke='%23DDD' stroke-width='2'/%3E %3Cpath fill='%23DDD' d='M19.8 24.6a1.6 1.6 0 1 1 0-3.2 1.6 1.6 0 0 1 0 3.2zm12.8 0a1.6 1.6 0 1 1 0-3.2 1.6 1.6 0 0 1 0 3.2z'/%3E %3Cpath stroke='%23DDD' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M23 29.4c2.133-2.133 4.267-2.133 6.4 0'/%3E %3Cpath fill-rule='nonzero' stroke='%23DDD' stroke-width='2' d='M43.8 43.8l14.708 14.708'/%3E %3C/g%3E %3C/g%3E %3C/svg%3E");
								var $zeroText = $('<div class="zeroText">').text("검색 결과가 없어요");
								
								$zero.append($img);
								$zero.append($zeroText);
								
								$zeroBox.append($zero);
								
								$faq_list.append($zeroBox);
							} else{
								$faq_list = $('.faq_list');
								$faq_list.html('');
								
								var $faq_ul = $("<ul class='faq_ul'>");
								for(var i in data){
									console.log(data[i].btitle);
									var $li = $('<li>');
									var $ntitle = $('<div class="ntitle">');
									var $titleBox = $("<div class='titleBox'>").text(data[i].btitle);
									var $ncontent = $("<div class='ncontent' style='display:none'>").html(data[i].bcontent);
									
									$ntitle.append($titleBox);
									$ntitle.append($ncontent);
									$li.append($ntitle);
									
									$faq_ul.append($li);
									
									$faq_list.append($faq_ul);
								}
							}
					 		$(function(){
					 			$('.titleBox').click(function(){
					 				$(this).parent().children('.ncontent').slideToggle(1);
					 			})
					 		});
						}
					})
				})
			</script>
			
			<div class="faq_list">
				<c:if test="${empty list}">
						<div class="zeroBox">
							<div class="zero">
								<img class="" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='80' height='80' viewBox='0 0 80 80'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h80v80H0z'/%3E %3Cg transform='translate(10 10)'%3E %3Ccircle cx='26.2' cy='26.2' r='24.6' fill-rule='nonzero' stroke='%23DDD' stroke-width='2'/%3E %3Cpath fill='%23DDD' d='M19.8 24.6a1.6 1.6 0 1 1 0-3.2 1.6 1.6 0 0 1 0 3.2zm12.8 0a1.6 1.6 0 1 1 0-3.2 1.6 1.6 0 0 1 0 3.2z'/%3E %3Cpath stroke='%23DDD' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M23 29.4c2.133-2.133 4.267-2.133 6.4 0'/%3E %3Cpath fill-rule='nonzero' stroke='%23DDD' stroke-width='2' d='M43.8 43.8l14.708 14.708'/%3E %3C/g%3E %3C/g%3E %3C/svg%3E">
								<div class="zeroText">검색 결과가 없어요</div>
							</div>
						</div>
				</c:if>
				
				<c:if test="${not empty list}">
					<ul class="faq_ul">
						<c:forEach var="n" items="${ list }">
							<li>
								<div class="ntitle">
									<div class="titleBox">${n.btitle }</div>
									<div class="ncontent" style="display:none">${n.bcontent } 
										<c:if test="${ sessionScope.loginUser.id eq 'admin@admin.admin'}">
											<br><br>
											<span id="delB">삭제</span>&nbsp;&nbsp;<span id="updB">수정</span>
										</c:if>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					
					<script>
				 		$(function(){
				 			$('.titleBox').click(function(){
				 				$(this).parent().children('.ncontent').slideToggle(1);
				 			})
				 		});
					</script>
					
					<footer class="footPage">
						<div class="text-center">
				           	<ul class="pagination">
				           		<c:if test="${ pi.currentPage <= 1 }">
				           			<!-- <li><a class="disable">&lt;</a></li> -->
				           			<li class="disabled"><a>&lt;</a></li>
				           		</c:if>
				           		<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="FAQList.no">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<li><a href="${ before }">&lt;</a></li>
								</c:if>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<li class="active"><a>${ p }</a></li>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="FAQList.no">
											<c:param name="page" value="${ p }"/>
										</c:url>
										<li><a href="${ pagination }">${ p }</a> &nbsp;</li>
									</c:if>
								</c:forEach>
								
				           		<c:if test="${ pi.currentPage >= pi.maxPage }">
									<li class="disabled"><a>&gt;</a></li>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="after" value="FAQList.no">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
									</c:url> 
									<li><a href="${ after }">&gt;</a></li>
								</c:if>
				           	</ul>
				    	</div>
					</footer>
				</c:if>
			</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
</body>
</html>