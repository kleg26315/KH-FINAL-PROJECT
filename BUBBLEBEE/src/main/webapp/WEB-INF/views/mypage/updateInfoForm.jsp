<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String[] checked = new String[8]; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보 수정</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_modify a{font-weight: bold; color: gold;}
#profile{font-weight: bolder;}

#pro_all{margin:30px 0; display: flex; flex-direction: column;} 
.pro_wrap{display: flex;margin:20px 0;align-items: center;}
.title{font-weight: bolder; width:60px; }
.pro_wrap input{
	border: none;
}
.m_title{width:60px;}
.p_content{
	-webkit-box-flex: 1;
    flex-grow: 1;
    flex-shrink: 1;
	flex-basis: auto;
    padding-left: 30px;
    text-align: left;
    }
.inter_wrap{
	padding-bottom: 30px;
	margin-bottom: 20px;
	border-bottom: 1px solid #eee;
}
.inter_title{
	margin-bottom: 20px;
}

input[type=checkbox]{display:none;}
label{border: 1px solid #F39C12;background: none;outline: none; padding: 10px 20px;color:#F39C12; border-radius: 5px;margin-right: 10px;}

#submit_wrap{
	margin-top: 30px;
	text-align: center;
	justify-content: center;
}
#submit{background: #F39C12; border:none;outline: none;width:300px;height: 50px;color: white;border-radius: 5px;}
#updatePwdbtn{background: #F39C12; border:none;outline: none; width: 100px;height: 30px;border-radius: 5px;color: white;}
#c_body button:not(#updatePwdbtn){border:1px solid #F39C12;outline: none;}
input[type=checkbox]:checked + label{
	background:#F39C12;color:white;
}

.interest_wrap{display: flex;}
.interestBtn:hover {cursor: pointer;}

section input[type=text]{outline-color: #F39C12;height: 30px;}
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
		    <form action="updateInfo.mg" method="post">
			   <div id="profile" class="c_list"><a>내 프로필</a></div>
				  <div id="pro_all">
					   <div class="pro_wrap">
					   <!-- ID -->
					   <input type="hidden" name="id" value="${loginUser.id}">
					   <!-- 프로필 사진 -->
					   <input type="hidden" name="profile" value="${loginUser.profile }">
					   <!-- 호스트 여부 -->
					   <input type="hidden" name="host_yn" value="${loginUser.host_yn }">
						   	<div class="title">닉네임</div>
						   	<div class="p_content"><input type="text" value="${loginUser.nickName }" id="nickName" name="nickName"></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">전화번호</div>
						   	<div class="p_content"><input type="text" id="phone" value="${loginUser.phone }" name="phone" placeholder="전화번호를 입력해주세요"></div>
					  </div>
					  <c:out value=""></c:out>
					  <c:if test="${ fn:length(loginUser.id) > 10 }">
					  <div class="pro_wrap">
						   	<div class="title">비밀번호</div>
						   	<div class="p_content"><button type="button" id="updatePwdbtn">변경하기</button></div>
					  </div>
					  </c:if>
					  <div class="pro_wrap">
						   <div class="title">관심사</div>
					  </div>
						  <div class="inter_wrap">
						<c:forTokens items="${loginUser.interest}" delims="," var="f">
							<c:choose>
								<c:when test="${f eq '토크/파티'}">
									<% checked[0] = "checked"; %>
								</c:when>
								<c:when test="${f eq '취향'}">
									<% checked[1] = "checked"; %>
								</c:when>
								<c:when test="${f eq '스터디'}">
									<% checked[2] = "checked"; %>
								</c:when>
								<c:when test="${f eq '이벤트/공간'}">
									<% checked[3] = "checked"; %>
								</c:when>
								<c:when test="${f eq '공예/DIY'}">
									<% checked[4] = "checked"; %>
								</c:when>
								<c:when test="${f eq '요리'}">
									<% checked[5] = "checked"; %>
								</c:when>
								<c:when test="${f eq '스포츠'}">
									<% checked[6] = "checked"; %>
								</c:when>
								<c:when test="${f eq '어학/취업'}">
									<% checked[7] = "checked"; %>
								</c:when>
							</c:choose>		
						</c:forTokens>
						
						  		<div class="inter_title">모임</div>  
						    	<div class="interest_wrap">
							    	<div class="interestBtn">
							    		<input type="checkbox" value="토크/파티" name="interest" class="moim" <%= checked[0] %>>
							    		<label for="talk" class="mlabel" id="talk">토크/파티</label>	
							    	</div>
							    	<div class="interestBtn">
							    		<input type="checkbox" value="취향" name="interest" class="moim" <%= checked[1] %>>
							    		<label for="taste" class="mlabel" id="taste" >취향</label>
							    	</div>
							    	<div class="interestBtn">
							    		<input type="checkbox" value="스터디" name="interest" class="moim"  <%= checked[2] %>>
							    	<label for="study" class="mlabel" id="study">스터디</label>
							    	</div>
							    	<div class="interestBtn">
							    		<input type="checkbox" value="이벤트/공간" name="interest" class="moim" <%= checked[3] %> >
							    	<label for="place" class="mlabel" id="place">이벤트/공간</label>
							    	</div>
						    	</div>
						  </div>
						   <div class="inter_wrap">
						  		<div class="inter_title">클래스</div>  
						    	<div class="interest_wrap">
							    	<div class="interestBtn">
							    		<input type="checkbox" value="공예/DIY" name="interest" class="moim" <%= checked[4] %> >
							    	<label for="diy" class="mlabel" id="diy">공예/DIY</label>
							    	</div>
							    	<div class="interestBtn">
							    		<input type="checkbox" value="요리" name="interest" class="moim" <%= checked[5] %> >
							    	<label for="cook" class="mlabel" id="cook">요리</label>
							    	</div>
							    	<div class="interestBtn">
							    		<input type="checkbox" value="스포츠" name="interest" class="moim" <%= checked[6] %> >
							    	<label for="sport" class="mlabel" id="sport">스포츠</label>
							    	</div>
							    	<div class="interestBtn">
							    		<input type="checkbox" value="어학/취업" name="interest" class="moim" <%= checked[7] %> >
							    	<label for="job" class="mlabel" id="job">어학/취업</label>
							    	</div>
						    	</div>
						  </div>
						  <div id="submit_wrap">
						  	<input type="submit" value="저장하기" id="submit">
						  </div>
				  </div>
			  </form>
			  <script>
			  	$(function(){
			  		
			  		// 비밀번호 변경 폼으로 이동
			  		$('#updatePwdbtn').click(function(){
			  			location.href="updatePwdForm.mg";
			  		});
			  		// 관심사 선택(4개까지 선택가능)
			  		$('.interestBtn').click(function(){
			  			var check = $(this).children('.moim').is(':checked');
			  			var checked = $('input:checkbox[name=interest]:checked').length;
			  			console.log(checked);
			  			console.log(check);
			  			if(checked < 4) {
				  			if(check){
				  				 $(this).children('.moim').prop('checked',false);
				  			}else{
				  				 $(this).children('.moim').prop('checked',true);
				  			}
			  			}else{
			  				if(check == false){
			  					alert('관심사는 4개까지 선택가능합니다!');
				  				return false;	
			  				} else{
			  					 $(this).children('.moim').prop('checked',false);
			  				}
			  			}
			  		});
			  		
			  		$('#phone').keyup(function(event){
		   				regexp=/[^0-9]/gi;
		   				v = $(this).val();
		   				if(regexp.test(v)){
		   					alert('숫자만 입력가능 합니다.');
		   					$(this).val(v.replace(regexp, ''));
		   				}
		   			});
			  		
			  		
			  	});
			  </script>
		</div>
	</div>
   </section>
	   <script>
	   		
	   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>