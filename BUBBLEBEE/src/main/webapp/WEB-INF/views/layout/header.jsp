<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>navigation-with-button</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/Basic-Header.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

</head>
<style>
*{
   font-family: 'Noto Sans KR', sans-serif;
}
#header{
   position: fixed;
   width : 100%;
}
.navbar-nav>li{
	font-size: 20px;
}
.input{
	border-radius: 3px;
    box-shadow: none;
    background: #ececec;
    color: #5f5f5f;
    border: 1px solid transparent;
    margin-right: 20px;
}
</style>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div style="box-shadow: 0 2px 4px 0 hsla(0,0%,80.8%,.5);">
        <nav class="navbar navbar-default navigation-clean-button" style="background-color: white; border-color: white;">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="home.do" style="height: 55px; padding: 0px 0px; padding-left: 20px;">
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
                    <p class="navbar-text navbar-right actions" style="padding-right: 30px;">
				    <img class="sc-cmthru gbhGvn" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Ccircle cx='11' cy='11' r='5' stroke='%233397FF' stroke-width='2'/%3E %3Cpath stroke='%233397FF' stroke-width='2' d='M15 15l3.536 3.536'/%3E %3C/g%3E %3C/svg%3E" alt="">
                    <input type="text" class="input" placeholder="">
                    <a class="navbar-link login" href="loginView.me">로그인</a>
					<a class="btn btn-default action-button" role="button" href="#">회원가입</a>
					</p>
                </div>
            </div>
        </nav>
    </div>
    
</body>
</html>