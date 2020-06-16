<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 프로필 페이지</title>
      <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/mypage_like.css">
</head>
<style>
#all_wrap{margin:20px 90px;}
#profile_all{display: flex; align-items: center;margin-bottom: 20px;}
#profile_intro{margin-left:30px;flex-grow: 1;}
#host_name{font-size: 20px;font-weight: bolder;}
#intro1{display: flex;align-items: center;}
#likebtn{margin-left: 10px;}
#intro2{margin-top: 10px;}
#intro2_text{font-size: 15px;}
#host_intro{line-height: 25px;font-size: 15px;font-weight: bold;white-space: normal;white-space: pre-line;height: auto;max-height:115px;overflow: hidden;}
#selectBtn{padding-top: 30px;}
.sBtn{background: none;border: none;font-size: 23px;outline: none;padding: 0 0 26px;margin-right: 60px;}
#open{font-weight: bolder;}
#open::after{
	content: "";
    display: block;
    width: 7px;
    height: 7px;
    background-color: #F39C12;
    margin: 9px auto 0px;
    border-radius: 100%;
}
#moreBtn{color:#F39C12;}
#moreBtn:hover {cursor: pointer;}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
      <div id="all_wrap">
      	<div id="profile_all">
	      	<div id="profile_img">	
	      		<img src="${contextPath }/resources/img/users.png" width="90px" height="90px">
	      	</div>
	      	<div id="profile_intro">
	      		<div id="intro1">
		      		<span id="host_name">${host.member.nickName }</span>
		      		<div id="likebtn"><img src="${contextPath }/resources/img/채워진하트.png" width="25px" height="25px"></div>
		      	</div>
		      	<div id="intro2">
		      	<span id="intro2_text">개설 ${pi.listCount} | 후기 24 | 좋아요 46</span>
		      	</div>
	      	</div>
	      </div>	
	      <div id="host_intro">
	      		${host.introduction}
	      </div>
	      <span id="moreBtn">더보기</span>
	      <div id="selectBtn">
	      	<button id="open" class="sBtn">
	      	개설
	      	</button>
	      	<button id="review" class="sBtn">
	      	후기
	      	</button>
	      </div>
	      <div id="openList">
	      	<input type="hidden" value="${ sessionScope.loginUser.id}" id="uid">
        <c:set var="uid" value="${ sessionScope.loginUser.id}"/>
         
		<div id="hotmoim">
         <div class="moim">
         
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
                        <c:if test="${b.hid ne uid || empty uid}">
                        	<img class="heart" width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        </c:if>
                         <c:if test='${b.hid eq uid && !empty b.hid}'>
                        	<img class="heart" width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
                        </c:if>
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
            </div>
	   <c:forEach var="b" items="${bList}">
	   		${b. small_title}
	   		${b. ftitle}
	   	</c:forEach>
		   <div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
		      <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					< &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="allList.bo">
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
						<c:url var="pagination" value="allList.bo">
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
					<c:url var="after" value="allList.bo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"> > </a>
				</c:if>
			
			</div>
	   
	      </div>
      </div>
   </section>
   <script>
   $(function(){
	  $('#moreBtn').click(function(){
			$('#host_intro').css('max-height','unset');
			$(this).css('display','none');
	  });
   });
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>