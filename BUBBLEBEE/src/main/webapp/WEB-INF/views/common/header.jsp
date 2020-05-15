<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>navigation-with-button</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/Basic-Header.css"> 
</head>
<style>
.navbar-nav>li{
	font-size: 20px;
}
</style>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div style="box-shadow: 0 2px 4px 0 hsla(0,0%,80.8%,.5);">
        <nav class="navbar navbar-default navigation-clean-button">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="#" style="height: 55px; padding: 0px 0px; padding-left: 20px;">
                <img height="30px" width="30px" alt="메인" src="${ pageContext.servletContext.contextPath }/resources/img/main_resize.png">
                </a>
                    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                </div>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">모임 <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li role="presentation"><a href="#">토크/파티</a></li>
                                <li role="presentation"><a href="#">취향</a></li>
                                <li role="presentation"><a href="#">스터디</a></li>
                                <li role="presentation"><a href="#">이벤트/공간</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">클래스 <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li role="presentation"><a href="#">공예/DIY</a></li>
                                <li role="presentation"><a href="#">요리</a></li>
                                <li role="presentation"><a href="#">스포츠</a></li>
                                <li role="presentation"><a href="#">어학/취업</a></li>
                            </ul>
                        </li>
                        <li role="presentation"><a href="#">작품</a></li>
                    </ul>
                    <p class="navbar-text navbar-right actions" style="padding-right: 50px;"><a class="navbar-link login" href="#">로그인</a> <a class="btn btn-default action-button" role="button" href="#">회원가입</a></p>
                </div>
            </div>
        </nav>
    </div>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>