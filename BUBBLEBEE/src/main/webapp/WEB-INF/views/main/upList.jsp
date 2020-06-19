<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.moim{
	display: flex;
    min-height: 1px;
}
.moim > *{
	margin-right: 10px;
    width: calc(25% - 7.5px);
    margin-bottom: 31px;
}
.moim_total{
	display: flex;
    background-color: white;
    min-height: 1px;
    flex-flow: column nowrap;
}
.moim_each{
	overflow: hidden;
}
.moim_l_location{
	height: 10px;
    color: white;
    font-size: 10px;
    font-weight: 500;
    line-height: 10px;
    text-shadow: rgba(0, 0, 0, 0.3) 0px 0px 10px;
    margin: 2px 0px 0px 2px;
}
.moim_heart{
	width: 24px;
    height: 24px;
    line-height: normal;
    background-color: transparent;
    text-align: center;
    cursor: pointer;
    font-size: 14px;
    padding: 0px;
    border-radius: 5px;
}
.moim_small_title{
	margin-top: 14px;
    font-size: 12px;
    height: 14px;
    text-overflow: ellipsis;
    line-height: 14px;
    color: rgb(155, 155, 155);
    overflow: hidden;
}
.moim_title{
	margin-top: 10px;
    height: auto;
    max-height: 40px;
    line-height: 20px;
    font-size: 14px;
    word-break: keep-all;
    overflow-wrap: break-word;
    font-weight: 500;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
.moim_price{
	margin-top: 14px;
    line-height: 14px;
    height: 14px;
}
.moim_score{
	margin-top: 14px;
	font-size: 11px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(187, 187, 187);
}
.moim_img{
	position: relative;
    -webkit-box-flex: 0;
    flex-grow: 0;
    flex-shrink: 0;
    flex-basis: auto;
    min-height: 1px;
    background-color: rgb(0, 0, 0);
    border-radius: 5px;
    width: 100%
}
.heart_div{
	position: absolute;
    right: 0px;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    z-index: 1;
    padding: 10px;
}
.heart_button{
	width: 24px;
    height: 24px;
    line-height: normal;
    background-color: transparent;
    text-align: center;
    cursor: pointer;
    font-size: 14px;
    padding: 0px;
    border: none;
}
</style>
</head>
<body>
	<header id="header">
	  <c:import url="../layout/header.jsp"/>
	</header>
	
	<section style="padding-top: 115px; padding-left: 20%; width: 78%;" id="section">
		<div>
	   	<label style="font-weight: bold; font-size: 20px;">지금 뜨는 모임</label>
	   	<br><br>
	   	<c:set var="list" value="${ list }" />
	   	<div class="moim">
	   		<c:forEach items="${ list }" var="l">
	   		<div class="moim_total">
	   			<a href="detail.bo?fno=${ l.fno }">
	   				<div class="moim_each">
						<div class="moim_img">
							<div class="heart_div">
								<button class="heart_button" width="24px" height="24px">
								<img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
								</button>
							</div>
							<img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/main.png" />
						</div>
	   					<div class="moim_small_title">${ l.small_title }</div>
	   					<div class="moim_title">${ l.ftitle }</div>
	   					<div class="moim_price">
	   						<span>${ l.price }</span>
	   					</div>
	   					<div class="moim_score">
	   						<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
	   						<span>${ l.avgrv }</span>
	   					</div>
	   				</div>
	   			</a>
	   		</div>
	   		</c:forEach>
	   	</div>
	   </div>
	</section>
	
	<footer id="footer" style="padding-top: 115px;">
		<%@ include file = "../layout/footer.jsp" %>
	</footer>
</body>
</html>