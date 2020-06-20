<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
</head>
<style>
.inputBox {
    height: 100%;
    line-height: 12px;
    font-size: 14px;
    padding: 14px 0px;
    outline: none;
    border-style: none;
  	border-bottom:  1px solid rgb(238, 238, 238);
}

.loginBtn{
	border: none;
    width: 325px;
    height: 45px;
    background: #f1e018;
    color: #fff;
}
.toast {
    visibility: hidden; 
    position: fixed; 
    bottom: 380px; 
    left: 49%;          
    transform: translateX(-50%);  
    min-width: 100px;  
    border-radius: 25px;   
    background-color: #f1e018; 
    color: black; 
    padding: 15px 25px;   
}
.toast.show {
    visibility: visible;   
    animation: fade-in 700ms, fade-out 700ms 2000ms 
}
@keyframes fade-in {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
@keyframes fade-out {
    from {
        opacity: 1;
    }
    to {
        opacity: 0;
    }
}
</style>
<body>
	<header id="header">
      <c:import url="../layout/header.jsp"/>
   	</header>

	<section style="padding-top: 115px; padding-left: 20%; width: 78%; text-align: center;">
		<h3 style="font-weight: bold;">로그인</h3>
		<br>
		<form action="login.me" method="post" id="loginFormFF" onsubmit="return validate();">
			<div class="">
				<div class="">
					<input class="inputBox" type="email" placeholder="이메일 입력" size="46" value="" name="id" id="emailBox">
				</div>
				<br>
				<div class="">
					<input class="inputBox" type="password" placeholder="비밀번호 입력" size="46" value="" name="pwd" id="pwdBox">
				</div>
			</div>
			<br><br>
			<button class="loginBtn" type="submit" id="toastButton">로그인</button>
			<button class="loginBtn" type="button" id="toastButton">토스트 메시지 테스트용</button>
		</form>
		<br><br>
		<div>
			<a href="findPwdView.me">
				<label style="color:black; cursor: pointer; font-size: 12px;">비밀번호를 잊어버리셨나요?</label>
			</a>
		</div>
		
		<div class="toast" id="idToast">이메일을 입력해주세요.</div>
		<div class="toast" id="pwdToast">비밀번호를 입력해주세요.</div>
		<div class="toast" id="idPwdToast">이메일 및 비밀번호가 틀렸습니다.</div>
		
	</section>
	<script>
	  /* var toast = document.getElementById('toast');  // id가 toast인 요소 div */
	  var toast = $('.toast');
	  var idToast = $('#idToast');
	  var pwdToast = $('#pwdToast');
	  var idPwdToast = $('#idPwdToast');
	  
      var isToastShown = false;
      // id가 toastButton인 요소를 클릭하면 아래 함수가 호출됨
      function validate(){
    	  var email = $('#emailBox').val().trim();
    	  var pwd = $('#pwdBox').val().trim();
    	  console.log($('#emailBox').val().trim());
    	  if(email == ""){
  	          if (isToastShown) return;   // 토스트 메시지가 띄어져 있다면 함수를 끝냄
  	          isToastShown = true;
  	          idToast.addClass('show');    // show라는 클래스를 추가해서 토스트 메시지를 띄우는 애니메이션을 발동시킴
  	          setTimeout(function () {
  	              // 2700ms 후에 show 클래스를 제거함
  	              idToast.removeClass('show');
  	              isToastShown = false;
  	          }, 2700);
    		  return false;
    	  } else if(pwd == ""){
    		  if (isToastShown) return;   // 토스트 메시지가 띄어져 있다면 함수를 끝냄
  	          isToastShown = true;
  	          pwdToast.addClass('show');    // show라는 클래스를 추가해서 토스트 메시지를 띄우는 애니메이션을 발동시킴
  	          setTimeout(function () {
  	              // 2700ms 후에 show 클래스를 제거함
  	              pwdToast.removeClass('show');
  	              isToastShown = false;
  	          }, 2700);
    		  return false;
    	  }
    	  $.ajax({
    		url : 'loginCheck.me',
    		data : {email : email, pwd : pwd},
    		success : function(data){
    			if(data == '실패'){
    				if (isToastShown) return;   // 토스트 메시지가 띄어져 있다면 함수를 끝냄
    	  	          isToastShown = true;
    	  	          pwdToast.addClass('show');    // show라는 클래스를 추가해서 토스트 메시지를 띄우는 애니메이션을 발동시킴
    	  	          setTimeout(function () {
    	  	              // 2700ms 후에 show 클래스를 제거함
    	  	              pwdToast.removeClass('show');
    	  	              isToastShown = false;
    	  	          }, 2700);
    				return false;
    			} else{
    				return true;
    			}
    		}
    	  })
      }
      
	</script>
	<footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
   
</body>
</html>