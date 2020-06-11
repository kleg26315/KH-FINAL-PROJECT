<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 등록하기</title>
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
.title{font-weight: bolder; font-size:18px;width:100px;}

.intro_wrap{display: flex;flex-direction: column;}

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
#submit_wrap{
	margin-top: 30px;
	text-align: center;
	justify-content: center;
}
#submit_wrap input{width:200px;height: 40px;font-size: 15px;}
section input,select,textarea{border:1px solid #eee;outline-color:#F39C12;}
input[class=input1]{width:300px; height: 40px;padding: 0 10px;}
.input2{width:150px;height: 40px; padding: 0 10px;}

</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
    <div id="content">
	    <div id="c_body">
		    <form action="enrollHost.ho" method="post">
			   <div id="profile" class="c_list"><a>호스트 등록하기</a></div>
				  <div id="pro_all">
				  <!-- 아이디 -->
				  <input type="hidden" value="${loginUser.id }" name="id">
					  <div class="pro_wrap">
						   	<div class="title">이름 <span class="">*</span></div>
						   	<div class="p_content"><input type="text" name="userName" id="userName" class="input1"></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">닉네임</div>
						   	<div class="p_content"><input type="text" name="nickName" value="${loginUser.nickName }" id="nickName" class="input1" placeholder="닉네임 입력"></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">이메일 <span>*</span></div>
						   	<div class="p_content">
						   	<input type="email" name="email" value="${loginUser.email }" id="email" class="input1" placeholder="bubblebee@example">
						   	</div>
						   	<div>프립 운영 관련 공지 및 수정 요청 등 중요 알림을 위해 실제 사용하시는 이메일 주소를 입력해주시길 바랍니다.</div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">전화번호 <span>*</span></div>
						   	<div class="p_content"><input type="text" id="phone" value="${loginUser.phone }" name="phone" class="input1" placeholder="전화번호 입력"></div>
						   	<div>대원들에게 안내되는 공개 연락처 입니다.</div>
					  </div>
					  <div class="pro_wrap">
					  	<div class="intro_wrap">
						   	<div class="title">소개 <span>*</span></div>
						   	<div class="intro_text">
						   		<div>대원들에게 신뢰감을 줄 수 있도록, 호스트님의 전문성을 전달 할 수 있는 소개글을 작성해주세요 :)
						   		<br><br>
						   		* 호스트님의 경력, 보유 자격증, 수상 이력, 언론 활동 등을 추가로 기재하시면 대원들의 신뢰를 얻을 수 있으며, 구매 결정에 도움이 될 수 있습니다.
						   		</div>
						   		<div class="intro_warn">* 개인 연락처(전화번호,카카오톡  ID,개인 SNS 주소, 홈페이지 등)는 입력할 수 없습니다.</div>
						   	</div>
						   	<div>
						   	<div>
						   	<textarea rows="5" cols="150" style="resize: none;" name="introduction" id="introduction" placeholder="간단한 소개와 약력을 입력해 주세요." maxlength="500"></textarea>
						   	<span id="counter">0</span><span>/ 500</span>
						   </div>
						   </div>
						</div>
					  </div>
					  <div class="pro_wrap">
				  	 	<div class="title">수수료</div>
						<div>20.0%</div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">입금 계좌 <span>*</span></div>
						   	<div class="p_content">
							<select class="input2" id="ac_bname" name="ac_bname">
								<option value="no">은행선택</option>
								<option value="KB국민">KB국민</option>
								<option value="NH농협">NH농협</option>
								<option value="신한">신한</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="우리">우리</option>
								<option value="하나">하나</option>
								<option value="IBK기업">IBK기업</option>
							</select>
							<input type="text" name="ac_name" placeholder="예금주명" class="input2" id="ac_name">
							<input type="text" name="ac_no" placeholder="-를 빼고 숫자만 입력해주세요" class="input1" id="ac_no">
						   	</div>
					  </div>
						  <div id="submit_wrap">
						  	<input type="button" value="이전으로" id="cancle">
						  	<input type="submit" value="등록하기" id="submit">
						  </div>
				  </div>
			  </form>
		</div>
	</div>
   </section>
   <script>
   		$(function(){
   			// 이전으로 돌아가기
   			$('#cancle').click(function(){
   				var bool = confirm('이전으로 돌아가시겠습니까?');
   				if(bool){
   					location.href="javascript:history.back();";	
   				}
   			});
   			// 등록하기 버튼을 눌렀을 때 , 필수 입력 항목이 비어있는지 검사
   			$('#submit').click(function(){
   				var name = $('#userName').val(); // 이름
   				var email = $('#email').val(); // 이메일 
   				var phone = $('#phone').val(); // 전화번호
   				var intro = $('#introduction').val();// 소개
   				var selectbank = $('#ac_bname').val(); // 은행 선택
   				var bname = $('#ac_name').val(); // 예금주명
   				var account = $('#ac_no').val(); // 계좌번호
   				
   				
   				if(name.length == 0){
   					alert('이름은 필수 항목입니다.');
   					$('#userName').focus();
   					return false;
   				}
   				if(email.length == 0){
   					alert('이메일은 필수 항목입니다.');
   					$('#email').focus();
   					return false;
   				}
   				if(phone.length == 0){
   					alert('전화번호는 필수 항목입니다.');
   					$('#phone').focus();
   					return false;
   				}
   				if(intro.length == 0 || $.trim(intro) == ""){
   					alert('소개는 필수 항목입니다.');
   					$('#introduction').focus();
   					return false;
   				}
   				if(selectbank == 'no'){
   					alert('은행을 선택해주세요.');
   					$('#ac_bname').focus();
   					return false;
   				}
   				if(bname.length == 0){
   					alert('예금주명은 필수 입니다.')
   					$('#bname').val();
   					return false;
   				}
   				if(account.length == 0){
   					alert('계좌번호를 입력해주세요.');
   					$('#ac_no').focus();
   					return false;
   				}
   			});
   			//계좌번호 숫자 입력 제한
   			$('#ac_no').keyup(function(event){
   				regexp=/[^0-9]/gi;
   				v = $(this).val();
   				if(regexp.test(v)){
   					alert('숫자만 입력가능 합니다.');
   					$(this).val(v.replace(regexp, ''));
   				}
   			});
   			
   			
   			// 소개 500자 제한하기
   			$('#introduction').keyup(function(e){
   				var counter = $(this).val();
   				 $('#counter').html(counter.length);
   				if(counter.length > 500){
   					alert('소개는 500자까지 입력 가능합니다!');
   				 $('#counter').html(counter.length-1);
   				}
   				
   			});
   			
   			
   		});
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>