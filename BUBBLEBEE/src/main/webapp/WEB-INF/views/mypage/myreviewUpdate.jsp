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
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#review a, #l_review a{font-weight: bold;color: gold;}
#review_all{margin-top: 30px;}
#review_wrap{display: flex;border: 1px solid #eee;padding:20px 10px;margin-bottom: 20px;}
.per_review{display: flex;width: 95%;}
.per_info{display: flex;flex-direction: column;margin:auto 10px;flex-grow: 1;font-size: 15px;}
.agreeBtn{border:none; border-radius:5px; font-weight:bold; width:80px; height:35px;font-size:15px; background-color: #f39c12;}
#btnbox{margin-left:83%;}

#title{float:left}
#rvsecret{width:15px; height: 15px;}
#scr{font-size:17px; font-weight: lighter; padding-left:5px;}
#rvlb{color:gray; font-size:17px; padding-bottom:10px;}

</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
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
			<form name="rupdate" action="reviewUpdate.mg" id="form" method="POST">
          		<input name="ref_fid" type="hidden" value="${review.ref_fid }">
          		<input name="qno" type="hidden" value="${review.qno }">
				<c:if test="${ review.category == 'party' }">
    				<label id="rvlb">[ 토크/파티 ] ${ review.ftitle } / ${ review.odeadline } 참여 </label><br>
    			</c:if>
    			<c:if test="${ review.category == 'like' }">
    				<label id="rvlb">[ 취향 ] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
    			</c:if>
    			<c:if test="${ review.category == 'study' }">
    				<label id="rvlb">[ 스터디 ] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
    			</c:if>
    			<c:if test="${ review.category == 'event' }">
    				<label id="rvlb">[ 이벤트/공간 ] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
    			</c:if>
    			<c:if test="${ review.category == 'diy' }">
    				<label id="rvlb">[ 공예/DIY ] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
    			</c:if>
    			<c:if test="${ review.category == 'cook' }">
    				<label id="rvlb">[ 요리 ] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
    			</c:if>
    			<c:if test="${ review.category == 'sport' }">
    				<label id="rvlb">[ 스포츠 ] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
    			</c:if>
    			<c:if test="${ review.category == 'learn' }">
    				<label id="rvlb">[ 어학/취업] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
    			</c:if>
    			<c:if test="${ review.category == 'sell' }">
    				<label id="rvlb">[ 작품 ] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
    			</c:if>
				 
	             <div id="starimg">
		             <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star1" class="star">
					 <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star2" class="star">
					 <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star3" class="star">
					 <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star4" class="star">
					 <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star5" class="star">
			     </div>
			     <label style="color:gray; font-size:17px; padding-top:10px;"> 작성일 : ${ review.q_modify_date }</label>
				 <!-- 평점 넘기기 -->
				 <input type="hidden" id="grade" name="grade">
				 <input type="hidden" id="exgrade" name="exgrade" value="${review.grade}">
	             <br clear="all"><br>
	             <textarea id="qcontent" name="qcontent" rows="15" cols="" style="overflow-y:scroll; width: 100%; resize: none;">${review.qcontent}</textarea><br>
	             
	             <div id="btnbox">
		             <button class="agreeBtn" type="button" id="cancel" onclick="history.go(-1)">취소</button>&nbsp;&nbsp;
		             <button class="agreeBtn" id="save" type="submit">수정</button>
	             </div>
	             
	             <script>
	             $(document).ready(function(){
	         		// 작성시 넣은점수 가져오기
	         		if(${review.grade} == 1) {
	         			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
		     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
		     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
		     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	         		} else if(${review.grade} == 2) {
	         			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
		     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
		     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	         		} else if(${review.grade} == 3) {
	         			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
		     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	         		} else if(${review.grade} == 4) {
	         			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	         		} else if(${review.grade} == 5) {
	         			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
		     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	         		}
	         		// 점수유지시 에러안나게!
	         		$('#grade').val(${review.grade});
	         		
	             });	
	             
	             $('#star1').click(function(){
	     			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#grade').val(1);
	     		});
	     		$('#star2').click(function(){
	     			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#grade').val(2);
	     		});
	     		$('#star3').click(function(){
	     			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#grade').val(3);
	     		});
	     		$('#star4').click(function(){
	     			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/star.png");
	     			$('#grade').val(4);
	     		});
	     		$('#star5').click(function(){
	     			$('#star1').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star2').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star3').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star4').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#star5').attr("src","<%=request.getContextPath()%>/resources/img/starfull.png");
	     			$('#grade').val(5);
	     		});
	     		
	     		$('#save').click(function(){
	     			
	     			if($('#grade').val().length==0) {
						alert('평점을 선택해주세요');
						return;
					} else if($('#qcontent').val().trim().length==0) {
			             alert("내용을 입력하세요.");
			             $('#qcontent').focus();
			             return;
					}     
	     			
	     		});
	             </script>
             </form>
          </div>
		    
		 </div>
	</div>
          
	</section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>