<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 좋아요</title>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/mypage_like.css">
</head>
<style>
#host{font-weight: bold;}
#host a{color: gold;}
.fa-bookmark{color: red;}
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
	    	<div id="meet" class="c_list"><a href="mylike.mg">버블</a></div>
	    	<div id="host" class="c_list"><a href="mylikehost.mg">호스트</a></div>
	    </div>
	    <!-- 좋아요 없을 때 목록 -->
	    <c:if test="${empty hList }">
		    <div id="no_like">
			    <div id="img_wrap">
			     <img src="<%=request.getContextPath()%>/resources/img/smile.png" id="smile"/>
			     </div>
			     <div>아직 좋아한 호스트가 없어요.</div>
			     <div>관심있는 호스트의 하트를 눌러주세요!</div>
		    </div>
	    </c:if>
		 <!-- 있을때 -->   
		 <c:if test="${!empty hList }">
		 <div class="host_all">
		 	<div class="host_list">
		 	<c:forEach var="ho" items="${hList }">
		 	<c:url var="hodetail" value="hostProfile.ho">
		 		<c:param name="hostId" value="${ho.host_id }"/>
		 	</c:url>
		 		<div class="per_host">
			 		<a class="host_info" href="${hodetail}">
			 			<div class="h_div">
			 				<span class="h_img">
			 					<div>
			 						<c:choose>
							         	<c:when test="${ fn:contains(ho.profile, 'http')}">
							         		<img src="${ho.profile}" class="h_pro" />
							         	</c:when>
							         	<c:otherwise>
							         		<img src="${contextPath }/resources/proFiles/${ho.profile}" class="h_pro"/>
							         	</c:otherwise>
			         				</c:choose>
			 					</div>
			 				</span>
			 				<div class="info_wrap">
			 					<div class="h_name">${ho.nickname }</div>
			 					<br>
			 					<div>
			 					개설 
			 					${ho.lcount}
			 					<span>|</span>
			 					좋아요
			 					${ho.fcount}
			 					</div>
			 				</div>
			 			</div>
			 		</a>
					<div class="likebtn">
					<i class="fas fa-bookmark"></i>
					<input type="hidden" value="${ho.host_id}" class="lhostId">
					</div>
			 	</div>
			 	</c:forEach>
		 	</div>
		 	<div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
		      <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					< &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="mylikehost.mg">
						<c:param name="page2" value="${ pi.currentPage - 1 }"/>
						<c:param name="fno" value="${fno }"/>
					</c:url>
					<a href="${ before }"> < </a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="gold" size="4"><b>[${ p }]</b></font>&nbsp;
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="mylikehost.mg">
							<c:param name="page2" value="${ p }"/>
							<c:param name="fno" value="${fno }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="mylikehost.mg">
						<c:param name="page2" value="${ pi.currentPage + 1 }"/>
						<c:param name="fno" value="${fno }"/>
					</c:url> 
					<a href="${ after }"> > </a>
				</c:if>
			
			</div>
		 </div>
		 </c:if>
		</div>
	</div>
<!-- 	</div> -->
   </section>
   <script type="text/javascript">
   $(function(){
	   $('.likebtn').click(function(){
			 var mark = $(this).find('.fa-bookmark');
			 var hostId = $(this).find('.lhostId').val();	
			 var userId = "${sessionScope.loginUser.id}";
			 
			  $.ajax({
					url:'hostLike.ho',
					data:{hostId:hostId,userId:userId},
					success:function(data){
					console.log(data);
					if(data == "delete"){
						mark.css('color','#eee');
					}else{
						mark.css('color','red');
					}
					}
				 }) ;
			 
		  	}); 
   });
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>