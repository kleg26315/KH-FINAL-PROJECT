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
      <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/mypage_like.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
      <link rel = "stylesheet"  href= "resources/css/listAllViewCss.css" type = "text/css">
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
.fa-bookmark{color: #eee;font-size: 20px;}
.marked{
	color:red;
}
.hproimg{border-radius: 100%;}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
      <div id="all_wrap">
      	<div id="profile_all">
	      	<div id="profile_img">	
	      		<c:choose>
		         	<c:when test="${ fn:contains(host.member.profile, 'http')}">
		         		<img src="${host.member.profile}"  height="90px" width="90px" class="hproimg"/>
		         	</c:when>
		         	<c:otherwise>
		         		<img src="${contextPath }/resources/proFiles/${host.member.profile}" height="90px" width="90px" class="hproimg" />
		         	</c:otherwise>
    				</c:choose>
	      	</div>
	      	<div id="profile_intro">
	      		<div id="intro1">
		      		<span id="host_name">${host.member.nickName }</span>
		      		<div id="likebtn"><i class="fas fa-bookmark"></i></div>
		      	</div>
		      	<div id="intro2">
		      	<span id="intro2_text">개설 ${pi.listCount} | 좋아요 ${ likeCount }</span>
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
                        		<input type="hidden" value="${b.fno}" class="fno2">
                        	<c:if test="${!empty flist}">
                        		<c:set var="flag" value="false"/>
                        		<c:forEach var="fl" items="${flist }">
                        			<c:if test="${fl eq b.fno}">
                        				<img class="heart" width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
                        				<c:set var="flag" value="true"/>
                        			</c:if>
                        		</c:forEach>
                        		<c:if test="${flag == false}">
	                        	<img class="heart" width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        		</c:if>
                        	</c:if>
                        	<c:if test="${empty flist }">
                        		<img class="heart" width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        	</c:if>
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
      </div>
   </section>
   <script>
   $(function(){
	   var check = "${check}";
	   if(check == "1"){
		   $('.fa-bookmark').css('color','red');
	   }
	   
		  $('#moreBtn').click(function(){
			$('#host_intro').css('max-height','unset');
			$(this).css('display','none');
	 	 });
		  
	 	 $('#likebtn').click(function(){
		  var mark = $(this).find('.fa-bookmark');
		 var hostId = "${host.member.id}";	
		 var userId = "${sessionScope.loginUser.id}";
		 
		 if(userId == ""){
			 alert('로그인 후에 이용 가능 합니다');
			 return false;
		 }
		 
		  $.ajax({
				url:'hostLike.ho',
				data:{hostId:hostId,userId:userId },
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
	 	 $('#review').click(function(){
	 		var hostId = "${host.member.id}";
	 		location.href="hostReview.ho?hostId="+hostId;
	 	 });
	 	 
	 	 $('.heart_div').click(function(){
		 	 var uid ="${loginUser.id}";
	 		 var fno = $(this).find('.fno2').val();
	 		 var th = $(this).find('.heart');
	 		if(uid ==''){
       		 alert('로그인 후 이용해주세요');
       	 } else{
       		 $.ajax({
           		 url :'heart.bo',
           		 data : {uid:uid, fno:fno},
  	                 success : function(data){
  	                    if(data==1) {
  	                        th.prop("src","resources/img/채워진하트.png");
  	                    }
  	                    else{
  	                        th.prop("src","resources/img/빈하트.png");
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