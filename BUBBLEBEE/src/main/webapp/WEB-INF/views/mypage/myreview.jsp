<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px; font-weight:bold;}
/* .c_list a{color: black;} */
/* .c_list a:hover{text-decoration: none;color: black;cursor: pointer;} */

#review a, #l_review a{font-weight: bold;color: gold;}
#review_all{margin-top: 30px;}
#review_wrap{display: flex;border: 1px solid #eee;padding:20px 10px;margin-bottom: 20px;}
.per_review{display: flex;width: 95%;}
.per_info{display: flex;flex-direction: column;margin:auto 10px;flex-grow: 1;font-size: 15px;}
.paging {
    margin-top: 20px;
    text-align: center;
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
   	<hr id="main_hr">
    <div id="content">
	 	<nav>
	   		<c:import url="../layout/mypage_nav.jsp"/> 
	   </nav>
	    <div id="c_body">
		    <div id="content_list">
		   		<div id="review" class="c_list">후기</div>
<!-- 		    	<div id="writed" class="c_list"><a>작성 완료 후기</a></div> -->
		    </div>
		    <div id="review_all">
		    
		    	
		    	
		    	<c:if test="${empty list }">
		    		<div id="norv" style="margin-top:80px;">
			    		<img style="margin-left:50%" src="data:image/svg+xml,%3C?xml version='1.0' encoding='UTF-8'?%3E %3Csvg width='80px' height='80px' viewBox='0 0 80 80' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E %3C!-- Generator: Sketch 54.1 (76490) - https://sketchapp.com --%3E %3Ctitle%3E00 Icon/80px/review_empty%3C/title%3E %3Cdesc%3ECreated with Sketch.%3C/desc%3E %3Cg id='00-Icon/80px/review_empty' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E %3Crect id='Rectangle' fill-opacity='0' fill='%23FFFFFF' fill-rule='nonzero' x='0' y='0' width='80' height='80'%3E%3C/rect%3E %3Cpath d='M25,24.5 C24.448,24.5 24,24.052 24,23.5 C24,22.948 24.448,22.5 25,22.5 L55,22.5 C55.553,22.5 56,22.948 56,23.5 C56,24.052 55.553,24.5 55,24.5 L25,24.5 Z M37,42.5 C37.552,42.5 38,42.947 38,43.5 C38,44.053 37.552,44.5 37,44.5 L25,44.5 C24.448,44.5 24,44.053 24,43.5 C24,42.947 24.448,42.5 25,42.5 L37,42.5 Z M55.4551,52.0859 L77.3751,30.1659 L68.8901,21.6809 L46.9701,43.6019 L55.4551,52.0859 Z M47.8621,54.3939 L44.6621,51.1929 L43.8621,55.1929 L47.8621,54.3939 Z M45.1341,48.8359 L50.2201,53.9219 L53.7551,53.2149 L45.8411,45.3009 L45.1341,48.8359 Z M67.0001,65.9999 L67.0001,43.3689 L55.4551,54.9149 L44.2541,57.1549 C43.1711,57.3709 42.1171,56.6689 41.9001,55.5859 C41.8501,55.3269 41.8501,55.0609 41.9001,54.8019 L44.1411,43.6019 L53.2421,34.4999 L52.5991,34.4999 L25.0001,34.4999 C24.4481,34.4999 24.0001,34.0519 24.0001,33.4999 C24.0001,32.9479 24.4481,32.4999 25.0001,32.4999 L54.5991,32.4999 L55.0001,32.4999 C55.0711,32.4999 55.1351,32.5259 55.2011,32.5409 L67.0001,20.7419 L67.0001,20.0989 L67.0001,13.9999 C67.0001,12.3429 65.6571,10.9999 64.0001,10.9999 L16.0001,10.9999 C14.3431,10.9999 13.0001,12.3429 13.0001,13.9999 L13.0001,65.9999 C13.0001,67.6569 14.3431,68.9999 16.0001,68.9999 L64.0001,68.9999 C65.6571,68.9999 67.0001,67.6569 67.0001,65.9999 Z M78.7891,28.7519 C79.5701,29.5329 79.5701,30.7989 78.7891,31.5799 L69.0001,41.3689 L69.0001,65.9999 C69.0001,68.7619 66.7621,70.9999 64.0001,70.9999 L16.0001,70.9999 C13.2391,70.9999 11.0001,68.7619 11.0001,65.9999 L11.0001,13.9999 C11.0001,11.2389 13.2391,8.9999 16.0001,8.9999 L64.0001,8.9999 C66.7621,8.9999 69.0001,11.2389 69.0001,13.9999 L69.0001,18.8379 L69.0001,19.6909 C69.4751,19.7179 69.9411,19.9039 70.3041,20.2669 L78.7891,28.7519 Z' id='Combined-Shape' fill='%23DDDDDD'%3E%3C/path%3E %3C/g%3E %3C/svg%3E" class="Empty__Icon-sc-3dhj3x-1 mhEPn"><br>
			    		<label style="margin-left:47%; font-size:15px; color:gray;">작성한 후기가 없어요</label>
		    		</div>
		    	</c:if>
				
				<c:if test="${!empty list }">
				<c:forEach var="r" items="${ list }" varStatus="status">
				<c:set var="re" value="${ fn:split(r.renamefilename,',')[0] }"/>
				<c:set var="d1" value="${ fn:substring(r.bday,0,4) }"/>
				<c:set var="d2" value="${ fn:substring(r.bday,4,6) }"/>
				<c:set var="d3" value="${ fn:substring(r.bday,6,8) }"/>
		    	<div id="review_wrap">
		    		<div class="per_review">
		    			<div class="per_img">
		    				<a style="margin: 20px 20px;"><img width="80" height="80"src="${contextPath }/resources/buploadFiles/${ re }"></a>
		    			</div>
		    			<div class="per_info">
		    				<div>
				    			<div>참가 신청일 : ${d1}-${d2}-${d3}</div>
				    			<c:if test="${ r.category == 'party' }">
				    				<div>[ 토크/파티 ]${r.ftitle }</div>
				    			</c:if>
				    			<c:if test="${ r.category == 'like' }">
				    				<div>[ 취향 ]${r.ftitle }</div>
				    			</c:if>
				    			<c:if test="${ r.category == 'study' }">
				    				<div>[ 스터디 ]${r.ftitle }</div>
				    			</c:if>
				    			<c:if test="${ r.category == 'event' }">
				    				<div>[ 이벤트/공간 ]${r.ftitle }</div>
				    			</c:if>
				    			<c:if test="${ r.category == 'diy' }">
				    				<div>[ 공예/DIY ]${r.ftitle }</div>
				    			</c:if>
				    			<c:if test="${ r.category == 'cook' }">
				    				<div>[ 요리 ]${r.ftitle }</div>
				    			</c:if>
				    			<c:if test="${ r.category == 'sport' }">
				    				<div>[ 스포츠 ]${r.ftitle }</div>
				    			</c:if>
				    			<c:if test="${ r.category == 'learn' }">
				    				<div>[ 어학/취업 ]${r.ftitle }</div>
				    			</c:if>
				    			<c:if test="${ r.category == 'sell' }">
				    				<div>[ 작품 ]${r.ftitle }</div>
				    			</c:if>
				    			<div>참석 일자 :${ r.odeadline }</div>
				    		</div>
		    			</div>
		    			<c:url var="write" value="reviewInsertForm.mg">
							<c:param name="ref_fid" value="${r.ref_fid}"/>
							<c:param name="ono" value="${r.ono}"/>
							<c:param name="odeadline" value="${r.odeadline}"/>
							<c:param name="category" value="${r.category}"/>
							<c:param name="ftitle" value="${r.ftitle}"/>
						</c:url> 
						<c:if test="${r.qno eq 0}">
		    				<div class="write_btn" style="margin:auto 0;"><button style="font-weight:bold; padding:10px; border-radius:3px; border:1px solid black; background-color: gold;" onclick="location.href='${write}'">후기 작성</button></div>
		    			</c:if>
		    			<c:url var="rewrite" value="reviewUpdateForm.mg">
							<c:param name="qno" value="${r.qno}"/>
							<c:param name="ref_fid" value="${r.ref_fid}"/>
							<c:param name="odeadline" value="${r.odeadline}"/>
							<c:param name="category" value="${r.category}"/>
							<c:param name="ftitle" value="${r.ftitle}"/>
						</c:url>
		    			<c:if test="${r.qno ne 0}">
		    				<div class="update_btn" style="margin:auto 0;"><button style="padding:10px; border-radius:3px; border:1px solid black; background-color: lightgray;" onclick="location.href='${rewrite}'">후기 수정</button></div>
		    			</c:if>
		    			
		    			
		    		</div>
		    	</div>
		    	</c:forEach>
		    	
		    	<div class="paging">
		   		<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="mypoint.mg">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a>&nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="#F39C12" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="mypoint.mg">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a>&nbsp;&nbsp; 
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="mypoint.mg">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if> 
		    </div>
		    	</c:if>
		    </div>
		    
		    
		    
		 </div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>