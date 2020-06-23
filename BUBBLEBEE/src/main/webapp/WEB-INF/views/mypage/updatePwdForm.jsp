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
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;justify-content: center;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_modify a{font-weight: bold; color: gold;}
#c_body input[type=password]{width: 300px;height: 34px;border: none;border-bottom:1px solid #eee; margin-bottom: 10px;}
#Btn{width: 300px;height: 50px;}
#pwd_all{text-align: center;display:flex;flex-direction: column;}
#pwd_title{font-size: 20px;font-weight: bolder;margin-bottom: 37px;}
#pwd_submit{margin: 20px 0;}
#Btn{background: #F39C12; border:none;outline: none;border-radius: 5px;color: white;}
#Btn:disabled{background: #adb5bd;}
.pwdTest {
    width: 100%;
    font-size: 12px;
    color: rgb(255, 102, 102);
    text-align: left;
    padding-left: 321px;
    height: 11px;
}
.inputBox {
    height: 100%;
    line-height: 12px;
    font-size: 14px;
    padding: 16px 0px;
    outline: none;
    border-style: none;
  	border-bottom:  1px solid rgb(238, 238, 238);
}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
<!--    <div id="main"> -->
     <header>
     <c:import url="../layout/mypage_header.jsp"/> 
     </header>
   	<hr id="main_hr">
    <div id="content">
	 	<nav>
	   		<c:import url="../layout/mypage_nav.jsp"/> 
	   </nav>
	    <div id="c_body">
		    <form action="memberPwdupdate.me" method="post" id="pwdUpdateForm">
		    	<div id="pwd_all" style="height: 372px">
		    		<div id="pwd_title">비밀번호 수정</div>
			    	<div id="pwd_wrap" style="height: 194px;">
			    		<input style="margin-bottom: 34px;" class="inputBox" type="password" id="pwd" name="pwd" placeholder="현재 비밀번호를 입력하세요"><br>
			    		<div style="height: 77px;"><input class="inputBox" type="password" id="newpwd" name="newpwd" placeholder="새로운 비밀번호를 입력하세요"><br>
			    		<div class="pwdTest" id="pwdWarn">비밀번호는 영문, 숫자, 특수문자 각 1가지 이상의 조합으로<br> 8자 이상 이어야 합니다</div></div>
			    		<input class="inputBox" type="password" id="newpwd1" name="newpwd1" placeholder="새 비밀번호 확인"><br>
			    		<div class="pwdTest" id="pwdChkWarn">비밀번호가 일치하지 않습니다.</div>
			    	</div>
		    		<div id="pwd_submit"><button type="button" id="Btn" disabled>변경하기</button></div>
			    </div>
		    </form>
		 </div>
	</div>
   </section>
   <script>
   $('.pwdTest').hide();
   $('#newpwd').keyup(function(){
		var pwd = $('#newpwd').val();
		var pwdChk = $('#newpwd1').val();
		var regExp = new RegExp("^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,20}$");

		if(pwd == ''){
			$('#pwdWarn').hide();
		} else if(pwd.match(regExp) == null){
			$('#pwdWarn').show();
		} else {
			$('#pwdWarn').hide();
		}
		
		if(pwdChk != ''){
			if(pwd != pwdChk){
				$('#pwdChkWarn').show();
			} else{
				$('#pwdChkWarn').hide();
			}
		}
	})
	$('#newpwd1').keyup(function(){
			var pwd = $('#newpwd').val();
			var pwdChk = $('#newpwd1').val();
			
			if(pwd != pwdChk){
				$('#pwdChkWarn').show();
			} else{
				$('#pwdChkWarn').hide();
			}
	})
	
	$('input').keyup(function(){
		var prePwd = $('#pwd').val().trim();
		var pwd = $('#newpwd').val().trim();
		var pwdChk = $('#newpwd1').val().trim();
		if(prePwd != '' && pwd != '' && pwdChk != ''
			&& $('.pwdTest')[0].style.display == 'none' && $('.pwdTest')[1].style.display == 'none'){
			$('#Btn').attr('disabled', false);
		} else{
			$('#Btn').attr('disabled', true);
		}
	})
	
	$('#Btn').click(function(){
		var prePwd = $('#pwd').val().trim();
		 $.ajax({
    		url : 'prePwdCheck.me',
    		data : {id : '${loginUser.id}', pwd : prePwd},
    		success : function(data){
    			if(data == 'fail'){
    	  	         $('#pwd').focus();
    	  	         alert("비밀번호를 확인해주세요.");
    			} else{
    				$('#pwdUpdateForm').submit();
    			}
    			
    		}
   		  })
	})
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>