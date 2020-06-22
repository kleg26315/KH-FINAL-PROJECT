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
    padding: 16px 0px;
    outline: none;
    border-style: none;
  	border-bottom:  1px solid rgb(238, 238, 238);
}
.inputBox:focus {
    height: 100%;
    line-height: 12px;
    font-size: 14px;
    padding: 16px 0px;
    outline: none;
    border-style: none;
  	border-bottom:  1px solid #f1e018;
}
.loginBtn{
	border: none;
    width: 325px;
    height: 45px;
    background: #f1e018;
    color: #fff;
}
.policy_text {
    margin-top: 4px;
    font-size: 12px;
    color: #454545;
    padding-left: 45px;
    text-align: left;
    padding-left: 395px;
}
.policy_link{
	cursor: pointer;
    color: #d8c80b;
    font-weight: bold;
}
.inputCannot {
    height: 100%;
    line-height: 12px;
    font-size: 14px;
    padding: 16px 0px;
    outline: none;
    border-style: none;
    border-bottom: 1px solid rgb(255, 102, 102);
}
.pwdTest {
    width: 100%;
    height: 11px;
    font-size: 12px;
    color: rgb(255, 102, 102);
    text-align: left;
    padding-left: 394px;
}
#xId{
	position: absolute;
    top: 213px;
    right: 815px;
    width: 16px;
    height: 16px;
    cursor: pointer;
}
#xPwdChk{
	position: absolute;
    top: 380px;
    right: 815px;
    width: 16px;
    height: 16px;
    cursor: pointer;
}
#xPwd {
	position: absolute;
    top: 295px;
    right: 815px;
    width: 16px;
    height: 16px;
    cursor: pointer;
}
.toast {
    visibility: hidden; 
    position: fixed; 
    bottom: 310px; 
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
		<h3 style="font-weight: bold; text-align: left; padding-left: 390px;">이메일로 회원가입</h3>
		<br>
		<form class="" action="minsert.me" method="post" id="signUpForm">
		<div class="" style="height: 224px;">
			<div class="">
				<input class="inputBox" id="idBox" type="email" placeholder="이메일 입력" size="46" value="" name="id">
				<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Ccircle cx='8' cy='8' r='8' fill='%23BBB'/%3E %3Cpath fill='%23FFF' d='M7.823 7.116l2.475-2.475 1.06 1.06-2.474 2.476 2.298 2.298-1.06 1.06-2.299-2.298-2.121 2.122-1.06-1.06 2.12-2.122-2.298-2.298 1.061-1.061 2.298 2.298z'/%3E %3C/g%3E %3C/svg%3E" id="xId" class="deleteAll">
			</div>
			<br>
			<div class="" style="height: 60px;">
				<input class="inputBox" id="pwdBox" type="password" placeholder="비밀번호 입력" size="46" value="" name="pwd">
				<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Ccircle cx='8' cy='8' r='8' fill='%23BBB'/%3E %3Cpath fill='%23FFF' d='M7.823 7.116l2.475-2.475 1.06 1.06-2.474 2.476 2.298 2.298-1.06 1.06-2.299-2.298-2.121 2.122-1.06-1.06 2.12-2.122-2.298-2.298 1.061-1.061 2.298 2.298z'/%3E %3C/g%3E %3C/svg%3E" id="xPwd" class="deleteAll">
				<div class="pwdTest" id="pwdWarn">비밀번호는 영문, 숫자, 특수문자 각 1가지 이상의 조합으로<br> 8자 이상 이어야 합니다</div>
			</div>
			<br>
			<div class="" style="padding-top: 16px;">
				<input class="inputBox" id="pwdChkBox" type="password" placeholder="비밀번호 확인" size="46" value="" name="pwd2">
				<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Ccircle cx='8' cy='8' r='8' fill='%23BBB'/%3E %3Cpath fill='%23FFF' d='M7.823 7.116l2.475-2.475 1.06 1.06-2.474 2.476 2.298 2.298-1.06 1.06-2.299-2.298-2.121 2.122-1.06-1.06 2.12-2.122-2.298-2.298 1.061-1.061 2.298 2.298z'/%3E %3C/g%3E %3C/svg%3E" id="xPwdChk" class="deleteAll">
				<div class="pwdTest" id="pwdChkWarn">비밀번호가 일치하지 않습니다.</div>
			</div>
		</div>
		<br><br>
		
		<button class="loginBtn" type="button" onclick="validate();">가입하기</button>
		</form>
		
		<p class="policy_text">
          가입하기를 클릭함으로써 <br>버블비의
          <a class="policy_link" href="/policy/terms-of-service" target="_blank" rel="noopener noreferrer">이용약관</a>,
          <a class="policy_link" href="/policy/privacy" target="_blank" rel="noopener noreferrer">개인정보취급방침</a>
          에 동의합니다.
        </p>
		
		<div class="toast" id="idToast">이메일을 입력해주세요.</div>
		<div class="toast" id="idFormToast">이메일형식(@) 으로 입력해주세요.</div>
		<div class="toast" id="pwdToast">비밀번호를 확인해주세요.</div>
		<div class="toast" id="pwdChkToast">비밀번호 확인을 확인해주세요.</div>
		<div class="toast" id="idSameToast">이미 사용중인 이메일입니다.</div>
	</section>
	
	<script>
		$('.pwdTest').hide();
		$('#xId').hide();
		$('#xPwd').hide();
		$('#xPwdChk').hide();
		$('#idBox').keyup(function(){
			var id = $('#idBox').val();
			if(id != ''){
				$('#xId').show();
			} else if(id ==''){
				$('#xId').hide();
			}
		})
		$('#pwdChkBox').keyup(function(){
			var pwd = $('#pwdBox').val();
			var pwdChk = $('#pwdChkBox').val();
			if(pwdChk != ''){
				$('#xPwdChk').show();				
			} else if(pwdChk ==''){
				$('#xPwdChk').hide();
			}
			
			if(pwd != pwdChk){
				$('#pwdChkBox').addClass('inputCannot');
				$('#pwdChkBox').removeClass('inputBox');
				$('#pwdChkWarn').show();
			} else{
				$('#pwdChkBox').removeClass('inputCannot');
				$('#pwdChkBox').addClass('inputBox');
				$('#pwdChkWarn').hide();
			}
		})
		$('#pwdBox').keyup(function(){
			var pwd = $('#pwdBox').val();
			var regExp = new RegExp("^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,20}$");
			
			if(pwd !=''){
				$('#xPwd').show();
			}
			if(pwd == ''){
				$('#pwdWarn').hide();
				$('#xPwd').hide();
				$('#pwdBox').removeClass('inputCannot');
				$('#pwdBox').addClass('inputBox');
			} else if(pwd.match(regExp) == null){
				$('#pwdBox').addClass('inputCannot');
				$('#pwdBox').removeClass('inputBox');
				$('#pwdWarn').show();
			} else {
				$('#pwdBox').removeClass('inputCannot');
				$('#pwdBox').addClass('inputBox');
				$('#pwdWarn').hide();
			}
		})
		
		$('.deleteAll').click(function(){
			$(this).parent().children().eq(0).val('');
			$(this).parent().children().eq(1).hide();
			if($(this).parent().children().eq(0)[0].id == 'pwdBox'){
				$('#pwdBox').removeClass('inputCannot');
				$('#pwdBox').addClass('inputBox');
				$('#pwdWarn').hide();
				
				if($('#pwdBox').val() != $('#pwdChkBox').val()){
					$('#pwdChkBox').addClass('inputCannot');
					$('#pwdChkBox').removeClass('inputBox');
					$('#pwdChkWarn').show();
				} else{
					$('#pwdChkBox').removeClass('inputCannot');
					$('#pwdChkBox').addClass('inputBox');
					$('#pwdChkWarn').hide();
				}
			} else if($(this).parent().children().eq(0)[0].id == 'pwdChkBox'){
				$('#pwdChkBox').removeClass('inputCannot');
				$('#pwdChkBox').addClass('inputBox');
				$('#pwdChkWarn').hide();
			}
		})
	</script>
	<script>
		var toast = $('.toast');
		var idToast = $('#idToast');
		var pwdToast = $('#pwdToast');
		var pwdChkToast = $('#pwdChkToast');
		var idSameToast = $('#idSameToast');
		var idFormToast = $('#idFormToast');
		  
	    var isToastShown = false;
	
	    function validate(){
	  	  var id = $('#idBox').val().trim();
	  	  var pwd = $('#pwdBox').val().trim();
	  	  var pwdChk = $('#pwdChkBox').val().trim();
		      
	  	  if(id == ""){
		          if (isToastShown) return; 
		          isToastShown = true;
		          idToast.addClass('show');
		          setTimeout(function () {
		              idToast.removeClass('show');
		              isToastShown = false;
		          }, 2700);
	  		  return false;
	  	  } else if(!id.includes('@')){
	  		  if (isToastShown) return;  
		          isToastShown = true;
		          idFormToast.addClass('show'); 
		          setTimeout(function () {
		              idFormToast.removeClass('show');
		              isToastShown = false;
		          }, 2700);
		          $('#idBox').focus();
	  		  return false;
	  	  } else if(pwd == ""){
	  		  if (isToastShown) return;  
		          isToastShown = true;
		          pwdToast.addClass('show'); 
		          setTimeout(function () {
		              pwdToast.removeClass('show');
		              isToastShown = false;
		          }, 2700);
		          $('#pwdBox').focus();
	  		  return false;
	  	  } else if(pwdChk ==""){
		  		if (isToastShown) return;  
		          isToastShown = true;
		          pwdChkToast.addClass('show'); 
		          setTimeout(function () {
		        	  pwdChkToast.removeClass('show');
		              isToastShown = false;
		          }, 2700);
		          $('#pwdChkBox').focus();
			 	 return false;
	  	  } else if($('#pwdBox').hasClass('inputCannot')){
		  		if (isToastShown) return;  
		          isToastShown = true;
		          pwdToast.addClass('show'); 
		          setTimeout(function () {
		              pwdToast.removeClass('show');
		              isToastShown = false;
		          }, 2700);
		          $('#pwdBox').focus();
			  return false;
	  	  } else if($('#pwdChkBox').hasClass('inputCannot')){
		  		if (isToastShown) return;  
		          isToastShown = true;
		          pwdChkToast.addClass('show'); 
		          setTimeout(function () {
		        	  pwdChkToast.removeClass('show');
		              isToastShown = false;
		          }, 2700);
		          $('#pwdChkBox').focus();
			  return false;
	  	  } else{
    		  $.ajax({
  	    		url : 'emailSameCheck.me',
  	    		data : {id : id},
  	    		success : function(data){
  	    			if(data == 'fail'){
  	    				if (isToastShown) return;
  	    	  	          isToastShown = true;
  	    	  	          idSameToast.addClass('show');
  	    	  	          setTimeout(function () {
  	    	  	        	  idSameToast.removeClass('show');
  	    	  	              isToastShown = false;
  	    	  	          }, 2700);
  	    	  	         $('#idBox').focus();
  	    			} else{
  	    				$('#signUpForm').submit();
  	    			}
  	    			
  	    		}
  	   		  })
	  	  }
  	    }
	</script>
	
	<footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
</body>
</html>