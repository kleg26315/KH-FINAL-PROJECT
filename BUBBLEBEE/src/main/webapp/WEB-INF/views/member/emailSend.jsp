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
    height: 65px;
    background: #f1e018;
    color: #fff;
    border-radius: 8px;
}
</style>
<body>
	<header id="header">
      <c:import url="../layout/header.jsp"/>
   	</header>

	<section style="padding-top: 115px; padding-left: 20%; width: 78%; text-align: center;">
		<h3 style="font-weight: bold;">비밀번호 재설정</h3>
		<br><br>
		<b>입력하신 주소로 임시 비밀번호를 발급하여 메일을 발송했습니다.<br>
		      만약 이메일을 받지 못했다면 스팸함을 확인해 주시고,<br>
		      가입되지 않은 이메일인지 확인해 주시기 바랍니다.</b>
		<br><br><br><br>
		
		<button class="loginBtn" type="button" onclick="location.href='loginView.me'" id="emailSend">로그인</button>
		</form>
	</section>
	
	</script>
	<footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
   
</body>
</html>