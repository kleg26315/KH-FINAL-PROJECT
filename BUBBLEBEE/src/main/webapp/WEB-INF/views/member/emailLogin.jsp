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
</style>
<body>
	<header id="header">
      <c:import url="../layout/header.jsp"/>
   	</header>

	<section style="padding-top: 115px; padding-left: 20%; width: 78%; text-align: center;">
		<h3 style="font-weight: bold;">로그인</h3>
		<br>
		<form class="">
		<div class="">
			<div class="">
				<input class="inputBox" type="email" placeholder="이메일 입력" size="46" value="" name="email">
			</div>
			<br>
			<div class="">
				<input class="inputBox" type="password" placeholder="비밀번호 입력" size="46" value="" name="password">
			</div>
		</div>
		<br><br>
		<button class="loginBtn" type="submit">로그인</button>
		</form>
		<br>
		<div>
			<a href="findPwdView.me">
				<label style="color:black; cursor: pointer; font-size: 12px;">비밀번호를 잊어버리셨나요?</label>
			</a>
		</div>
		
		
	</section>
	
	<footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
   
</body>
</html>