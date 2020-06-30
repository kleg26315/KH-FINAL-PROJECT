<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style type="text/css">
html{
	background:#F7F8E0;
	height: 100%;
}
body {
	margin: 0;
	display: flex;
	flex-direction: column;
	height: 100%;
	justify-content: space-between;
	align-items: center;
}
.top{
	width:100%;
	height: 40px;
	margin-top: 30px;
}
.bottom{
	width:100%;
	height:40px; 
	margin-bottom: 30px;
}
.bee{
}
@font-face { font-family: 'CookieRunOTF-Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff'); font-weight: normal; font-style: normal; }
.text{font-family:'CookieRunOTF-Bold';font-size: 20px;font-size: 30px;}
.utext{font-family:'CookieRunOTF-Bold';font-size: 20px;}
#open{color:#F39C12;}
.btn{font-family:'CookieRunOTF-Bold'; border: none;background: none;outline: none;font-size: 18px;}
.btn:hover {
	cursor: pointer;
}
.btn_wrap{
	display: flex;
}
.left{margin-right: 20px;}
.right{margin-left: 20px;}
</style>
</head>
<body>
	<div class="top">
	<img src="${pageContext.request.contextPath}/resources/img/error1.png" width="100%" height="40px"/>
	</div>
	<div>
		<div class="text">버블비 오픈베타 서비스중!</div>
	</div>
	<div class="bee">
		<img src="${pageContext.request.contextPath}/resources/img/errorbee.png" height="500px" width="500px"/>
	</div>
	<div class="utext">
		<div style="text-align:center; ">현재 버블비 홈페이지가 <span id="open">오픈베타 서비스중</span>입니다.</div>
		<div style="text-align:center; ">홈페이지 사용시 일부 오류 및 장애가 있으니, 많은 양해 부탁드립니다.</div>
	</div>
	<div class="btn_wrap">
		<div class="left"><button id="gomain" class="btn">메인으로</button></div>
		<div class="right"><button id="goback" class="btn">이전으로</button></div>
	</div>
	<div class="bottom">
		<img src="${pageContext.request.contextPath}/resources/img/error1.png" width="100%" height="40px"/>
	</div>
</body>
<script>
	$(function(){
		$('#gomain').click(function(){
			location.href="home.do";
		});
		$('#goback').click(function(){
			location.href="history:back();";
		});
	});
</script>
</html>