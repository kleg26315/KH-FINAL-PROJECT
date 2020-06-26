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
     <link rel = "stylesheet"  href= "resources/css/listAllViewCss.css" type = "text/css">
</head>
<style>
#meet a{font-weight: bold; color: gold;}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
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
	    <c:if test="${empty bList }">
		    <div id="no_like">
			    <div id="img_wrap">
			     <img src="<%=request.getContextPath()%>/resources/img/smile.png" id="smile"/>
			     </div>
			     <div>아직 좋아한 모임이 없어요.</div>
			     <div>관심있는 모임의 하트를 눌러주세요!</div>
		    </div>
	    </c:if>
		 <!-- 있을때 -->   
		<c:if test="${!empty bList }">
		<div class="like_all">
	   	<div class="like">
	   		<c:forEach var="b" items="${ bList }" varStatus="status">
            <div class="moim_total">
            <c:url var="bdetail" value="detail.bo">
            	<c:param name="fno" value="${ b.fno }"/>
            	<c:param name="page" value="${ pi.currentPage }"/>
            </c:url>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
					   <button class="heart_button" width="24px" height="24px" value="${ b.fno }">
                        	<img class="heart" width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
                        </button>
                     </div>
                     <c:set var="rf2" value="${ b.renameFileName }"/>
                     <% 
                     	String rf2 = (String)pageContext.getAttribute("rf2");
                     	String str2 = null;
                     	if(!rf2.contains(",")) {
                     		str2 = rf2;
                     	} else {
                     		int idx2 = rf2.indexOf(",");
                			str2 = rf2.substring(0, idx2);
                     	}
            			
            			pageContext.setAttribute("str2", str2);
                     %> 
                     
                     <a href="${ bdetail }">
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/buploadFiles/${ str2 }" />
                  </div>
                     <div class="moim_small_title">${ b.small_title }</div>
                     <div class="moim_title">${ b.ftitle }</div>
                     <div class="moim_price">
                        <span>${ b.price }원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>
                        	<c:if test="${b.rcount ne 0}">
                        		<c:set var="d" value="${ b.rsum / b.rcount }"/>
                        		<%
                        		java.text.DecimalFormat df = new java.text.DecimalFormat("0.00");
                        		double dNum =(double)pageContext.getAttribute("d");
                        		String grade = df.format(dNum);
                        		%>
                        		<%= grade %>               		                    
                        	</c:if>
                        	<c:if test="${b.rcount eq 0}">
                        		0.00
                        	</c:if>
                        </span>
                     </div>
                  </div>
               </a>
            </div>
            </c:forEach>
	   	</div>
	   	  <div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
	      <!-- [이전] -->
			<c:if test="${ pi.currentPage <= 1 }">
				< &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="mylike.mg">
					<c:param name="page" value="${ pi.currentPage - 1 }"/>
					<c:param name="cate" value="${ cate }"/>
				</c:url>
				<a href="${ before }"> <</a> &nbsp;
			</c:if>
			
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="gold" size="4"><b>[${ p }]</b></font>&nbsp;
				</c:if>
				
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="mylike.mg">
						<c:param name="page" value="${ p }"/>
						<c:param name="cate" value="${ cate }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			
			<!-- [다음] -->
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				>
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="mylike.mg">
					<c:param name="page" value="${ pi.currentPage + 1 }"/>
					<c:param name="cate" value="${ cate }"/>
				</c:url> 
				<a href="${ after }"> > </a>
			</c:if>
		
		</div>
	   </div> 
	   </c:if>
		</div>
	</div>
<!-- 	<div style="text-align: center;">페이징 버튼 추가 예정</div> -->
   </section>
     <script>
        $(function(){
        	var uid = "${sessionScope.loginUser.id}";
         	
            $(".heart_button").click(function(){
           	 var bid = $(this).val();
           	 var th = $(this).find('.heart');
           	 
           	 if(uid ==''){
           		 alert('로그인 후 이용해주세요');
           	 } else{
           		 $.ajax({
               		 url :'heart.bo',
               		 data : {uid:uid, fno:bid},
      	                 success : function(data){
      	                    if(data==1) {
      	                        $(th).prop("src","resources/img/채워진하트.png");
      	                    }
      	                    else{
      	                        $(th).prop("src","resources/img/빈하트.png");
      	                    }
      	                } 
               		 
               	 }); 
           	 }
           	
            });
        });
            </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>