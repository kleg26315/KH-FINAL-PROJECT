<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
button:not(#updatePwdbtn){background: green;border:1px solid #F39C12;outline: none;}
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
		    <form action="updateInfo.mg">
			   <div id="profile" class="c_list"><a>내 프로필</a></div>
				  <div id="pro_all">
					   <div class="pro_wrap">
						   	<div class="title">닉네임</div>
						   	<div class="p_content"><input type="text" value="희은" id="nickName" name="nickName"></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">전화번호</div>
						   	<div class="p_content"><input type="text" id="phone" value="01090783699" name="phone"></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">비밀번호</div>
						   	<div class="p_content"><button type="button" id="updatePwdbtn">변경하기</button></div>
					  </div>
					  <div class="pro_wrap">
						   <div class="title">관심사</div>
					  </div>
						  <div class="inter_wrap">
						<c:forTokens items="${loginUser.interest}" delims=",">
							<c:if test="f">
								
							</c:if>		
						</c:forTokens>
						  		<div class="inter_title">모임</div>  
						    	<div>
						    	<input type="checkbox" value="토크/파티" name="X" class="moim" id="talk">
						    	<label for="talk" class="moim">토크/파티</label>
						    	<input type="checkbox" value="취향" name="X" class="moim" id="taste">
						    	<label for="taste" class="moim">취향</label>
						    	<input type="checkbox" value="스터디" name="X" class="moim" id="study">
						    	<label for="study" class="moim">스터디</label>
						    	<input type="checkbox" value="이벤트/공간" name="X" class="moim" id="place">
						    	<label for="place" class="moim">이벤트/공간</label>
						    	</div>
						  </div>
						   <div class="inter_wrap">
						  		<div class="inter_title">클래스</div>  
						    	<div>
						    	<input type="checkbox" value="공예/DIY" name="X" class="moim" id="diy">
						    	<label for="diy" class="moim">공예/DIY</label>
						    	<input type="checkbox" value="요리" name="X" class="moim" id="cook">
						    	<label for="cook" class="moim">요리</label>
						    	<input type="checkbox" value="스포츠" name="X" class="moim" id="sport">
						    	<label for="sport" class="moim">스포츠</label>
						    	<input type="checkbox" value="어학/취업" name="X" class="moim" id="job">
						    	<label for="job" class="moim">어학/취업</label>
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
			  		// 관심사 선택
			  		$('.moim').click(function(){
			  			var n = $('.selected').length;
			  			if($(this).attr("class") == 'moim'){
			  				if(n<8){
			  				$(this).toggleClass("moim selected").css({'background':'#F39C12','color':'white'}).attr('name','interest');
			  				}else{
			  					alert('관심사는 4개까지 선택 가능합니다!');
			  					return false;
			  				}
			  			}else{
			  				$(this).toggleClass("moim selected").css({'background':'none','color':'#F39C12'}).attr('name','X');
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