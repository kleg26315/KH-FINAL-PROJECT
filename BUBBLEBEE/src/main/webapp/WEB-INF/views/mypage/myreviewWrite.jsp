<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<form name="rinsert" action="reviewInsert.mg" id="form" method="POST">
          		<input name="ref_fid" type="hidden" value="${review.ref_fid }">
          		<input name="ono" type="hidden" value="${review.ono }">
<!-- 				 <input type="checkbox" id="rvsecret" name="rvsecret" value="Y"><label id="scr">비밀로 리뷰쓰기</label><br> -->
				<label id="rvlb">[ ${ review.category } ] ${ review.ftitle } / ${ review.odeadline } 참여</label><br>
				 
	             <div id="starimg">
		             <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star1" class="star">
					 <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star2" class="star">
					 <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star3" class="star">
					 <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star4" class="star">
					 <img src="<%=request.getContextPath()%>/resources/img/star.png" width="35px" height='35px' id="star5" class="star">
			     </div>
				 <!-- 평점 넘기기 -->
				 <input type="hidden" id="grade" name="grade">
	             <br clear="all"><br>
	             <textarea id="qcontent" name="qcontent" rows="15" cols="" style="overflow-y:scroll; width: 100%; resize: none;"></textarea><br>
	             <div id="btnbox">
		             <button class="agreeBtn" type="button" id="cancel" onclick="history.go(-1)">취소</button>&nbsp;&nbsp;
		             <button class="agreeBtn" id="save" type="submit">작성</button>
	             </div>
	             
	             <script>
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