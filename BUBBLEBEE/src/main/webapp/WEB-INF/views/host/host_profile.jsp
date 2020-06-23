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
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
		      		<div id="likebtn"><i class="fas fa-bookmark"></i></div>
		      	</div>
		      	<div id="intro2">
		      	<span id="intro2_text">개설 ${pi.listCount} | 후기 24 | 좋아요 ${ likeCount }</span>
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
	    	<div>
	    	
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
   });
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>