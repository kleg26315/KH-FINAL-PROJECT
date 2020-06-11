<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String rName = request.getParameter("rName");
	String rAddress1 = request.getParameter("rAddress1");
	String rAddress2 = request.getParameter("rAddress2");
	String rAddress3 = request.getParameter("rAddress3");
	String rPhone = request.getParameter("rPhone");
	String totalPrice = request.getParameter("totalPrice");
	String rMessage = request.getParameter("rMessage");
	String rIntro = request.getParameter("rIntro");
	String rTitle = request.getParameter("rTitle");
	String rCost = request.getParameter("rCost");
	String rTitleDetail = request.getParameter("rTitleDetail");
	String rCount = request.getParameter("rCount");
	String rACost = request.getParameter("rACost");
	String discountPrice = request.getParameter("discountPrice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"  href= "<%= request.getContextPath() %>/resources/css/PurchaseConfirm.css" type = "text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<title>버블비</title>
<link rel = "shortcut icon" href = "<%= request.getContextPath() %>/resources/images/꿀벌.png" type = "image/x-icon">
<style>
#header{
	position: fixed;
	width : 100%;
}
</style>
</head>
<body>
	<header id="header">
		<%@ include file = "../layout/header.jsp" %> 	
		
	</header>
	<form id = "submitForm" >
		<section id = "submitFormSection">
			<div id = "submitFormSectionMain">
				<h3 id = "submitFormSectionMainH">
					결제가 완료되었습니다!
				</h3>
				<div class = "submitFormSectionMainD">
					<hr id = "submitFormSectionMainDH">
				</div>
				<div id = "submitFormSectionMainProduct">
					<img id = "submitFormSectionMainImg" src = "">
					<input class = "submitFormSectionMainProductInput" type = "text" readonly value = "<%=rIntro%>">
					<input class = "submitFormSectionMainProductInput" type = "text" style = "font-weight : 600;" readonly value = "<%=rTitle%>">
					<input class = "submitFormSectionMainProductInput" type = "text" readonly value = "<%=rCost%>">
				</div>
				<div class = "submitFormSectionMainD" style = "margin-top : 20px;">
					<hr id = "submitFormSectionMainDH">
				</div>
				<div class = "submitFormSectionMainD" style = "margin-top : -30px;">
					<input class = "submitFormSectionMainIntro" type = "text" value = "선택옵션" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%= rTitleDetail %>" readonly>
				</div>
				<div class = "submitFormSectionMainD">
					<input class = "submitFormSectionMainIntro" type = "text" value = "수량" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%= rCount %>" readonly>
				</div>
				<div class = "submitFormSectionMainD">
					<input class = "submitFormSectionMainIntro" type = "text" value = "옵션합계" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%= rACost %> 원" readonly>
				</div>
				<div class = "submitFormSectionMainD">
					<input class = "submitFormSectionMainIntro" type = "text" value = "할인금액" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%= discountPrice %> 원" readonly>
				</div>
				<div class = "submitFormSectionMainD">
					<input class = "submitFormSectionMainIntro" type = "text" value = "최종금액" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%= totalPrice %> 원" readonly>
				</div>
				<div class = "submitFormSectionMainD" style = "margin-top : 60px;">
					<hr id = "submitFormSectionMainDH">
				</div>
				<div class = "submitFormSectionMainD" style = "margin-top : -20px;">
					<input class = "submitFormSectionMainIntro" type = "text" value = "수신자명" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%=rName %>" readonly>
				</div>
				<div class = "submitFormSectionMainD" style = "margin-top : 40px;" >
					<input class = "submitFormSectionMainIntro" type = "text" value = "전화번호" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%=rPhone %>" readonly>
				</div>
				<div class = "submitFormSectionMainD">
					<input class = "submitFormSectionMainIntro" type = "text" value = "결제 금액" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%=totalPrice %> 원" readonly>
				</div>
				<div class = "submitFormSectionMainD">
					<input class = "submitFormSectionMainIntro" type = "text" value = "메세지" readonly>
					<input class = "submitFormSectionMainData" type = "text" value = "<%=rMessage%>" readonly>
				</div>
				<div class = "submitFormSectionMainD" style = "margin-top : 60px;">
					<hr id = "submitFormSectionMainDH">
				</div>
				<div class = "submitFormSectionMainD" style = "margin-top : -40px;">
					<input class = "submitFormSectionMainIntro" type = "text" value = "도로명주소"readonly style = "margin-top : 10px;">
					<input class = "submitFormSectionMainData" type = "text" value = "<%=rAddress1 %>"readonly style = "width : 90%; margin-top : 10px;">
					<input class = "submitFormSectionMainIntro" type = "text" value = "기본주소"readonly style = "margin-top : 40px;">
					<input class = "submitFormSectionMainData" type = "text" value = "<%=rAddress2 %>"readonly style = "width : 90%; margin-top : 40px;">
					<input class = "submitFormSectionMainIntro" type = "text" value = "상세주소"readonly style = "margin-top : 40px;">
					<input class = "submitFormSectionMainData" type = "text" value = "<%=rAddress3 %>"readonly style = "width : 90%; margin-top : 40px;">
				</div>
				<div>
					<input  class = "submitBtn" type = "submit" value = "장바구니로 돌아가기" >
				</div>
			</div>
		</section>
	</form>
</body>
</html>