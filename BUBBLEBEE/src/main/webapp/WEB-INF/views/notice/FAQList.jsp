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
			<h1 style="font-weight: bold; cursor: pointer;" onclick="location.href='FAQList.no'">FAQ</h1>
			<form class="faq_search" id="faq_search" onsubmit="return false"> 
				<img class="faq_search_img" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Ccircle cx='11' cy='11' r='6' stroke='%23000' stroke-width='2'/%3E %3Cpath stroke='%23000' stroke-width='2' d='M15 15l4.95 4.95'/%3E %3C/g%3E %3C/svg%3E" width="24px" height="24px">
				<c:if test="${not empty faqSearch}">
					<input type="text" placeholder="키워드를 입력하세요" value="${ faqSearch }" id="faq_search_input" name="faqSearch">
				</c:if>
				<c:if test="${empty faqSearch}">
					<input type="text" placeholder="키워드를 입력하세요" value="" id="faq_search_input" name="faqSearch">
				</c:if>
				<c:if test="${not empty page}">
					<input type="text" hidden value="${page }">
				</c:if>
			</form>
			<script>
				$('#faq_search_input').keyup(function(key){
		    		if(key.keyCode == 13){
		    			var queryString = $("#faq_search").serialize() ;
		    			var faqSearch = $('#faq_search_input').val();
		    			$('.pick').removeClass('pick').addClass('rest');
						$('#1').removeClass('rest').addClass('pick');
		    			$.ajax({
		    				url : 'faqSearch.no',
		    				data : {faqSearch : faqSearch},
		    				success : function(data){
		    					$faqCategory = $('.faqCategory');
		    					
								if(data.list.length == 0){
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
									var sessionUId = "${ sessionScope.loginUser.id}";

									$faq_list = $('.faq_list');
									$faq_list.html('');
									var $faq_ul = $("<ul class='faq_ul'>");
									for(var i in data.list){
										var $li = $('<li>');
										var $ntitle = $('<div class="ntitle">');
										var $bno = $("<input name='bno' hidden>").val(data.list[i].bno);
										var $titleBox = $("<div class='titleBox'>").text(data.list[i].btitle);
										var $ncontent = $("<div class='ncontent' style='display:none'>").html(data.list[i].bcontent);
										
										if(sessionUId == 'admin@admin.admin'){
											$ncontent.append('<br><br>');
											var $delB = $("<span class='delB'>").text('삭제');
											$ncontent.append($delB);
											$ncontent.append('&nbsp;&nbsp;');
											var $updB = $("<span class='updB'>").text('수정');
											$ncontent.append($updB);
										}
										$ntitle.append($bno);
										$ntitle.append($titleBox);
										$ntitle.append($ncontent);
										$li.append($ntitle);
										
										$faq_ul.append($li);
										
										$faq_list.append($faq_ul);
									}
									
									var $footPage = $("<footer class='footPage'>");
									var $textcenter = $("<div class='text-center'>");
									var $pagination = $("<ul class='pagination'>");
									
									if(data.pi.currentPage <= 1){
										var $disabled = $("<li class='disabled'>");
										var $lt = $("<a>").text('<');
										
										$disabled.append($lt);
										$pagination.append($disabled);
									} else if(data.pi.currentPage > 1){
										var $li = $("<li>");
										var $before = $("<a>").text('<');
										/* $before.attr('href', 'FAQList.no?page='+(data.pi.currentPage-1) + "&number="+data.number); */
										$before.attr('href', 'FAQList.no?page='+(data.pi.currentPage-1) + "&faqSearch="+faqSearch);
										
										$li.append($before);
										$pagination.append($li);
									}
									
									for(var i=data.pi.startPage; i<=data.pi.endPage; i++){
										if(i==data.pi.currentPage){
											var $active = $("<li class='active'>");
											var $i = $("<a>").text(i);
											
											$active.append($i);
											$pagination.append($active);
										} else if(i!=data.pi.currentPage){
											var $li2 = $("<li>");
											var $pagination2 = $("<a>").text(i);
											$pagination2.attr('href', 'FAQList.no?page='+i + "&faqSearch="+faqSearch);
											
											$li2.append($pagination2);
											$pagination.append($li2);
										}
									}
									
									if(data.pi.currentPage >= data.pi.maxPage){
										var $disabled2 = $("<li class='disabled'>");
										var $gt = $("<a>").text('>');
										
										$disabled2.append($gt);
										$pagination.append($disabled2);
									} else if(data.pi.currentPage < data.pi.maxPage){
										var $li3 = $("<li>");
										var $after = $("<a>").text('>');
										$after.attr('href', 'FAQList.no?page='+(data.pi.currentPage+1) + "&faqSearch="+faqSearch);
										
										$li3.append($after);
										$pagination.append($li3);
									}
									
									$textcenter.append($pagination);
									$footPage.append($textcenter);
									
									$faq_list.append($footPage);
								}
						 		$(function(){
						 			$('.titleBox').click(function(){
						 				$(this).parent().children('.ncontent').slideToggle(1);
						 			})
						 		});
						 		
						 		$('.delB').click(function(){
						 			var bno = $(this).parent().parent().children().eq(0).val();
						 			var result = confirm('정말로 삭제하시겠습니까?');
						 			if(result){
						 				alert('삭제가 완료되었습니다.');
						 				location.href = 'deleteFAQ.no?bno='+ bno;
						 			} else{
						 				alert('삭제를 취소합니다.');
						 			}
						 		})
						 		
						 		$('.updB').click(function(){
						 			var bno = $(this).parent().parent().children().eq(0).val();
						 			var p = ${pi.currentPage};
					 				location.href = 'updateFAQForm.no?bno='+ bno;
					 			})
		    				}
		    			})
		    		}
		    	});
			</script>
			
			<script>
				$(document).ready(function(){
					// 파라미터가 담길 배열
				    var param = new Array();
				 
				    // 현재 페이지의 url
				    var url = decodeURIComponent(location.href);
				    // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
				    url = decodeURIComponent(url);
				 
				    var params;
				    // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
				    params = url.substring( url.indexOf('?')+1, url.length );
				    // 파라미터 구분자("&") 로 분리
				    params = params.split("&");
				 
				    // params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
				    var size = params.length;
				    var key, value;
				    for(var i=0 ; i < size ; i++) {
				        key = params[i].split("=")[0];
				        value = params[i].split("=")[1];
				 
				        param[key] = value;
				    }
				    
				    if(param.number != null){
					    document.getElementById(${number}).classList.add('pick');
					    document.getElementById(${number}).classList.remove('rest');
				    } else{
				    	$('#1').removeClass('rest').addClass('pick');
				    }
				})
			</script>
			<div class="faqCategory">
				<span class="rest faqAjax" id="1">전체</span>
				<span class="rest faqAjax" id="2">이용안내</span>
				<span class="rest faqAjax" id="3">회원정보</span>
				<span class="rest faqAjax" id="4">결제/환불</span>
				<span class="rest faqAjax" id="5">마일리지</span>
				<span class="rest faqAjax" id="6">호스트신청</span>
				<span class="rest faqAjax" id="7">기타</span>
			</div>
			<script>
				$('.faqAjax').click(function(e){
					$('#faq_search_input').val('');
					var number = e.currentTarget.id;
					$('.pick').removeClass('pick').addClass('rest');
					$(this).removeClass('rest').addClass('pick');
					$.ajax({
						url : 'faqFilter.no',
						data : {number: number},
						success: function(data){
							$faqCategory = $('.faqCategory');
							
							if(data.list.length == 0){
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
								var sessionUId = "${ sessionScope.loginUser.id}";

								$faq_list = $('.faq_list');
								$faq_list.html('');
								var $faq_ul = $("<ul class='faq_ul'>");
								for(var i in data.list){
									var $li = $('<li>');
									var $ntitle = $('<div class="ntitle">');
									var $bno = $("<input name='bno' hidden>").val(data.list[i].bno);
									var $titleBox = $("<div class='titleBox'>").text(data.list[i].btitle);
									var $ncontent = $("<div class='ncontent' style='display:none'>").html(data.list[i].bcontent);
									
									if(sessionUId == 'admin@admin.admin'){
										$ncontent.append('<br><br>');
										var $delB = $("<span class='delB'>").text('삭제');
										$ncontent.append($delB);
										$ncontent.append('&nbsp;&nbsp;');
										var $updB = $("<span class='updB'>").text('수정');
										$ncontent.append($updB);
									}
									$ntitle.append($bno);
									$ntitle.append($titleBox);
									$ntitle.append($ncontent);
									$li.append($ntitle);
									
									$faq_ul.append($li);
									
									$faq_list.append($faq_ul);
								}
								
								var $footPage = $("<footer class='footPage'>");
								var $textcenter = $("<div class='text-center'>");
								var $pagination = $("<ul class='pagination'>");
								
								if(data.pi.currentPage <= 1){
									var $disabled = $("<li class='disabled'>");
									var $lt = $("<a>").text('<');
									
									$disabled.append($lt);
									$pagination.append($disabled);
								} else if(data.pi.currentPage > 1){
									var $li = $("<li>");
									var $before = $("<a>").text('<');
									$before.attr('href', 'FAQList.no?page='+(data.pi.currentPage-1) + "&number="+data.number);
									
									$li.append($before);
									$pagination.append($li);
								}
								
								for(var i=data.pi.startPage; i<=data.pi.endPage; i++){
									if(i==data.pi.currentPage){
										var $active = $("<li class='active'>");
										var $i = $("<a>").text(i);
										
										$active.append($i);
										$pagination.append($active);
									} else if(i!=data.pi.currentPage){
										var $li2 = $("<li>");
										var $pagination2 = $("<a>").text(i);
										$pagination2.attr('href', 'FAQList.no?page='+i + "&number="+data.number);
										
										$li2.append($pagination2);
										$pagination.append($li2);
									}
								}
								
								if(data.pi.currentPage >= data.pi.maxPage){
									var $disabled2 = $("<li class='disabled'>");
									var $gt = $("<a>").text('>');
									
									$disabled2.append($gt);
									$pagination.append($disabled2);
								} else if(data.pi.currentPage < data.pi.maxPage){
									var $li3 = $("<li>");
									var $after = $("<a>").text('>');
									$after.attr('href', 'FAQList.no?page='+(data.pi.currentPage+1) + "&number="+data.number);
									
									$li3.append($after);
									$pagination.append($li3);
								}
								
								$textcenter.append($pagination);
								$footPage.append($textcenter);
								
								$faq_list.append($footPage);
							}
					 		$(function(){
					 			$('.titleBox').click(function(){
					 				$(this).parent().children('.ncontent').slideToggle(1);
					 			})
					 		});
					 		
					 		$('.delB').click(function(){
					 			var bno = $(this).parent().parent().children().eq(0).val();
					 			var result = confirm('정말로 삭제하시겠습니까?');
					 			if(result){
					 				alert('삭제가 완료되었습니다.');
					 				location.href = 'deleteFAQ.no?bno='+ bno;
					 			} else{
					 				alert('삭제를 취소합니다.');
					 			}
					 		})
					 		
					 		$('.updB').click(function(){
					 			var bno = $(this).parent().parent().children().eq(0).val();
					 			var p = ${pi.currentPage};
				 				location.href = 'updateFAQForm.no?bno='+ bno;
				 			})
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
									<input name="bno" hidden value="${n.bno }">
									<div class="titleBox">${n.btitle }</div>
									<div class="ncontent" style="display:none">${n.bcontent } 
										<c:if test="${ sessionScope.loginUser.id eq 'admin@admin.admin'}">
											<br><br>
											<span class="delB">삭제</span>&nbsp;&nbsp;<span class="updB">수정</span>
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
				 		
				 		$('.delB').click(function(){
				 			var bno = $(this).parent().parent().children().eq(0).val();
				 			console.log(bno);
				 			var result = confirm('정말로 삭제하시겠습니까?');
				 			if(result){
				 				alert('삭제가 완료되었습니다.');
				 				location.href = 'deleteFAQ.no?bno='+ bno;
				 			} else{
				 				alert('삭제를 취소합니다.');
				 			}
				 		})
				 		
				 		$('.updB').click(function(){
				 			var bno = $(this).parent().parent().children().eq(0).val();
			 				location.href = 'updateFAQForm.no?bno='+ bno;
				 		})
					</script>
					
					<footer class="footPage">
						<div class="text-center">
				           	<ul class="pagination">
				           		<c:if test="${ pi.currentPage <= 1 }">
				           			<li class="disabled"><a>&lt;</a></li>
				           		</c:if>
				           		<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="FAQList.no">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
										<c:if test="${not empty number}">
											<c:param name="number" value="${number}"/>
										</c:if>
										<c:if test="${not empty faqSearch}">
											<c:param name="faqSearch" value="${faqSearch}"/>
										</c:if>
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
											<c:if test="${not empty number}">
												<c:param name="number" value="${ number }"/>
											</c:if>
											<c:if test="${not empty faqSearch}">
												<c:param name="faqSearch" value="${faqSearch}"/>
											</c:if>
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
										<c:if test="${not empty number}">
											<c:param name="number" value="${number}"/>
										</c:if>
										<c:if test="${not empty faqSearch}">
											<c:param name="faqSearch" value="${faqSearch}"/>
										</c:if>
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