<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>navigation-with-button</title>
</head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
input.loginFBtnN {
	width: 325px;
	height: 55px;
	background-color: #2DB400;
	color: white;
	font-size: 12pt;
	border: none;
	background-image: url('resources/img/naver.png');
	background-repeat: no-repeat;
	background-position: 22px 14px;
}

input.loginFBtnK {
	width: 325px;
	height: 55px;
	background-color: #f9df00;
	font-size: 12pt;
	color: #3b1c1c;
	border: none;
	background-image: url('resources/img/kakao3.png');
	background-repeat: no-repeat;
	background-position: 22px 14px;
}

input.loginFBtn {
	width: 325px;
	height: 55px;
	background-color: black;
	font-size: 12pt;
	color: white;
	border: none;
}
</style>
<body>
	<header id="header">
      <c:import url="../layout/header.jsp"/>
   	</header>

	<section style="padding-top: 115px; padding-left: 20%; width: 78%; text-align: center;">
		<h3 style="font-weight: bold;">로그인</h3>
		<br>
		<br>
		
		<div>
			<a href="emailLoginView.me">
				<input type="button" class="loginFBtn" value="이메일 로그인">
			</a>
		</div>
		<br><br>
		<%
			String clientId = "dVAQqRoybJtaWsPJGo6d";//애플리케이션 클라이언트 아이디값";
			String redirectURI = URLEncoder.encode("http://localhost:8780/bubblebee/callback.me", "UTF-8");
			SecureRandom random = new SecureRandom();
			String state = new BigInteger(130, random).toString();
			String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			apiURL += "&client_id=" + clientId;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&state=" + state;
			session.setAttribute("state", state);
		%>
		<div>
			<a href="<%=apiURL%>">
				<input type="button" class="loginFBtnN" value="네이버 로그인">
			</a>
		</div>
		<br><br>
		<div>
			<!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=27cfa1d7725d616c3b4f7135fba99e8e&redirect_uri=http://localhost:8780/bubblebee/kakao.me&response_type=code"> -->
			<a id="login-form-btn" href="javascript:loginFormWithKakao()">
				<input type="button" class="loginFBtnK" value="카카오톡 로그인">
			</a>
		</div>
		
		<script type="text/javascript">
		  // input your appkey
		  Kakao.init('be0b8d3e154f1e2bf1a278bd7fbf3d2a')
		  function loginFormWithKakao() {
		    Kakao.Auth.loginForm({
		      success: function(authObj) {
		        /* alert(JSON.stringify(authObj)) */
		        $(function send(authObj){
		        	location.href="https://kauth.kakao.com/oauth/authorize?client_id=27cfa1d7725d616c3b4f7135fba99e8e&redirect_uri=http://localhost:8780/bubblebee/kakao.me&response_type=code";
		        });
		      },
		      fail: function(err) {
		        alert(JSON.stringify(err))
		      },
		    })
		  }
		</script>
		
		<br>
		<div>
			<a href="signUpView.me">
				<label style="color:black; cursor: pointer;">회원가입</label>
			</a>
		</div>
		
	</section>
	
	<footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
   
</body>

</html>