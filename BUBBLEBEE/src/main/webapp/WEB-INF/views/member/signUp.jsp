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
</style>
<body>
	<header id="header">
      <c:import url="../layout/header.jsp"/>
   	</header>

	<section style="padding-top: 115px; padding-left: 20%; width: 78%; text-align: center;">
		<h3 style="font-weight: bold; text-align: left; padding-left: 390px;">이메일로 회원가입</h3>
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
			<br>
			<div class="">
				<input class="inputBox" type="password" placeholder="비밀번호 확인" size="46" value="" name="passwordCheck">
			</div>
		</div>
		<br><br>

		<button class="loginBtn" type="submit">가입하기</button>
		</form>
		
		<p class="policy_text">
          가입하기를 클릭함으로써 <br>버블비의
          <a class="policy_link" href="/policy/terms-of-service" target="_blank" rel="noopener noreferrer">이용약관</a>,
          <a class="policy_link" href="/policy/privacy" target="_blank" rel="noopener noreferrer">개인정보취급방침</a>
          에 동의합니다.
        </p>
		
	</section>
	
	<footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
</body>
</html>