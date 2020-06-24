<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Footer with Button and Logo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/Footer-with-button-logo.css">
</head>

<body>
    <footer id="myFooter">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <h2 class="logo"><a href="home.do"><img src="${ pageContext.servletContext.contextPath }/resources/img/footerLogo.png"> </a></h2>
                </div>
                <div class="col-sm-2">
                    <h5>Get started</h5>
                    <ul>
                        <li><a href="home.do">Home</a></li>
                        <li><a href="signUpView.me">Sign up</a></li>
                    </ul>
                </div>
                <div class="col-sm-2">
                    <h5>Support</h5>
                    <ul>
                        <li><a href="list.no">FAQ</a></li>
                        <li><a href="javascript;" onclick="window.open('http://pf.kakao.com/_RdFxkxb', 'kT', 'width=500px, height=1000px, left=500px'); return false;">Help desk</a></li>
                    </ul>
                </div> 
                <div class="col-sm-2">
                    <h5 id="creator">Creator</h5>
                    <ul>
                        <li>
                        	<a onclick="window.open('about:blank').location.href='https://github.com/kleg26315'">김경섭</a>
                        	<a onclick="window.open('about:blank').location.href='https://github.com/SoulJ-K'" id="makeCenter">김솔지</a>
                        </li>
                        <li>
                        	<a onclick="window.open('about:blank').location.href='https://github.com/HansolKim-joy'">김한솔</a>
                        	<a onclick="window.open('about:blank').location.href='https://github.com/leehj00'" id="makeCenter">이화진</a>
                        </li>
                        <li>
                        	<a onclick="window.open('about:blank').location.href='https://github.com/jhAg047">전희은</a>
                        	<a onclick="window.open('about:blank').location.href='https://github.com/kuku2000213'" id="makeCenter">최규혁</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <button type="button" class="btn btn-default" onclick="window.open('http://pf.kakao.com/_RdFxkxb', 'kT', 'width=500px, height=1000px, left=500px'); return false;">Contact us</button>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <p>© 2020 Copyright Text </p>
        </div>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
