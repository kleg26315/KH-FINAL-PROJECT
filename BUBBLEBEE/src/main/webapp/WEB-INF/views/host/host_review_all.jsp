<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 프로필 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/host_qna.css">
</head>
<style>
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
      <div id="all_wrap">
			<div id="qna_all">
				<div id="qna_wrap">
				<div id="qna_text">호스트 후기 ${pi.listCount }</div>
 				</div>
				<hr>
				<!-- 후기가 없을때 -->
				<c:if test="${empty arList }">
				<div id="no_all">
					<img src="${contextPath }/resources/img/review.png" width="80px" height="80px">
					<div id="no_text">남겨진 후기가 없어요</div>
				</div>
				</c:if>
				<!-- 후기가 있을때 -->
				<c:if test="${!empty arList }">
				<div id="openList">
				<div id="review_all">
				<div id="rlist_all">
				<c:forEach var="re" items="${arList }">
					<div class="rall">
						<div class="rprofile_all">
							<div class="r_img">
							<c:choose>
					         	<c:when test="${ fn:contains(re.profile, 'http')}">
					         		<img src="${re.profile}" />
					         	</c:when>
					         	<c:otherwise>
					         		<img src="${contextPath }/resources/proFiles/${re.profile}" />
					         	</c:otherwise>
	         				</c:choose>
							</div>
							<div class="rprofile_info">
								<div class="r_name">${re.nickName }</div>
								<div class="r_content">
									<div class="r_grade">
										<i class="fas fa-star one"></i>
										<i class="fas fa-star two"></i>
										<i class="fas fa-star three"></i>
										<i class="fas fa-star four"></i>
										<i class="fas fa-star five"></i>
									</div>
										<script>
					$(function(){
						var grade =${re.grade};
						console.log(grade);
						var one =$('.one');
						var two =$('.two');
						var three =$('.three');
						var four =$('.four');
						var five =$('.five');
						
						switch(grade){
						case 1: one.css('color','#F39C12');break;
						case 2:	
							one.css('color','#F39C12');
							two.css('color','#F39C12');
							break;
						case 3:
							one.css('color','#F39C12');
							two.css('color','#F39C12');
							three.css('color','#F39C12');
							break;
						case 4:
							one.css('color','#F39C12');
							two.css('color','#F39C12');
							three.css('color','#F39C12');
							four.css('color','#F39C12');
							break;
						case 5:
							one.css('color','#F39C12');
							two.css('color','#F39C12');
							three.css('color','#F39C12');
							four.css('color','#F39C12');
							five.css('color','#F39C12');
							break;
						}
					})
				</script>
									<div class="r_date">${re.q_create_date} 작성 </div>
								</div>
							</div>
						</div>
						<div class="rcontent_all">${re.qcontent }</div>
						<div class="rdetail_all">
							<input type="hidden" value="${re.fno}" class="fno">
							<span>${re.ftitle }</span>
							<br>
							<span>${re.oname}</span>
						</div>
					</div>
				</c:forEach>	
				
					<div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
		      <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					< &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="hostReview.ho">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }"> < </a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="gold" size="4"><b>[${ p }]</b></font>&nbsp;
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="hostReview.ho">
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
					<c:url var="after" value="hostReview.ho">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"> > </a>
				</c:if>
			
			</div>
				</div>
			</div>
	      </div>
			</c:if>
			</div>
      </div>
   </section>
   <script>
   $(function(){
	   $('.rdetail_all').click(function(){
		  var fno = $(this).find('.fno').val();
		  location.href="detail.bo?fno="+fno;
	   });
   });
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>