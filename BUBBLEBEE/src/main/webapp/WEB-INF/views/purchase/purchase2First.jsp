<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버블비</title>
<link rel = "shortcut icon" href = "<%= request.getContextPath() %>/resources/images/꿀벌.png" type = "image/x-icon">
<link rel = "stylesheet"  href= "<%= request.getContextPath() %>/resources/css/dummy.css" type = "text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<style>
#header{
	position: fixed;
	width : 100%;
}
 *{
	outline : none;
}
</style>
<body>
	<header id="header">
		<%@ include file = "../layout/header.jsp" %> 	
	</header>
	<form id = "purchaseForm" name = "doubleTarget" method = "post" style = "float : left;width : 1903px; height : 937px; background-color : #F1F3F5; border-radius : 10px 10px;">
	<div style = "float : left; height : 40px; font-size : 12pt; color : rgb(60,30,0) ;margin-top : 100px; font-weight : 600; margin-left : 40px;">
		BUBBLEBEE PRODUCT
	</div>	
	<c:forEach var = "plist" items = "${plist }" varStatus = "status">
		<c:forEach var = "pslist" items = "${pslist }" varStatus = "status">
		<div style = " background-color : rgb(247, 230, 0); float : left; margin-top :195px; margin-left : 315px; height : 600px; width : 900px; box-shadow : 0px 0px 50px 10px rgba(0, 0, 0, 0.1); border-radius : 30px 30px;">
			<div style = "width : 30%; height : 100%; float : left; background-color : rgb(247, 230, 0); border-top-left-radius : 6px; border-bottom-left-radius : 6px; ">
				<img src ="${ pageContext.servletContext.contextPath }/resources/img/kakaopay.png" style = "width : 135px; height : 40px; margin-top : 70px; margin-left : 8px;">
				<div style = "color : rgb(60,30,0); width : 90%; margin-left :5%;">
					<div style = "border-top : 1px solid rgb(60,30,0); border-bottom : 1px solid rgb(60,30,0); margin-top : 14px;">
						<div style = "margin-top : 20px;">
							Amount :
						</div>
							<input id = "P1" type = "text" style = "color : rgb(60,30,0) ; border:none; background-color : rgb(247,230,0); margin-top : 6px; margin-bottom : 20px; font-size : 12pt; font-weight : 600;" value = "${pslist.price }원" readonly>
						</div>
					<div style = "border-bottom : 1px solid rgb(60,30,0); margin-top : 20px;">
						<div>
							Date :
						</div>
						<input type = "text" style = "color : rgb(60,30,0) ; border:none; background-color : rgb(247,230,0); margin-top : 6px;  margin-bottom : 20px; font-size : 12pt; font-weight : 600;" value = "${sysdate }" readonly>
					</div>
					<div style = "border-bottom : 1px solid rgb(60,30,0); margin-top : 20px;">
						<div>
							Product :
						</div>
						<input type = "text" style = "color : rgb(60,30,0) ; border:none; background-color : rgb(247,230,0); margin-bottom : 20px; margin-top : 6px; font-size : 12pt; font-weight : 600;" value = "${pslist.oname }" readonly>
						<input type = "text" style = "display : none" name = "ono" value = "${pslist.ono }"> 
					</div>
					<div style = " margin-top : 20px;">
						<div>
							Count :
						</div>
						<input id = "OP2" type = "text" style = "color : rgb(60,30,0) ; border:none; background-color : rgb(247,230,0); margin-bottom : 20px; margin-top : 6px; font-size : 12pt; font-weight : 600;" value = "${ocode }개" readonly id = "OP2">
					</div>
				</div>	
			</div>
			<div style = "width : 70%; height : 100%; float : left; background-color : white; border-top-right-radius : 6px; border-bottom-right-radius : 6px;">
				<div style = "width : 90%; margin-left : 5%;">
					<div style = "border-bottom : 1px solid gray; width : 100%; height : 120px;">
						<div style = "float : left; width : 50%; margin-top : 60px;">
							<img src = "${ pageContext.servletContext.contextPath }/resources/img/main_resize.png" style = "width : 60px; height : 60px; margin-top : -14px; margin-left : 6px;">
						</div>
						<div style = "float : left; width : 50%; margin-top : 60px;">
							<input type = "text" value = "${sysdate2 }" style = "text-align : right ; outline : none; border : none; color : lightgray; font-size : 14pt; font-weight : 600;margin-top : 20px;"readonly>
						</div>
					</div>
				</div>
				<div style = "border-bottom : 1px solid gray; width : 90%; height : 400px; margin-left : 5%;">
					<div>
						<input type = "text" style = "display : none" value = "${plist.fno }" name = "fno">
						<input type = "text" value = "${plist.ftitle }" name = "rTitle" style = "border: none; outline : none; font-size : 14pt; margin-left : 20px; margin-top : 20px;" readonly>
					</div>
					<div>
						<input type = "text" value = "Total : ${pslist.price * ocode }원" style = "border: none; outline : none; margin-left : 20px; margin-top : 4px; font-size : 12pt;" readonly>
					</div>	
					<div class = "mInputQ">
						<input type = "text" value = "안녕하세요 ${user_name }님," readonly style = "outline : none; border: none; margin-top :20px; margin-left : 20px; font-size : 14pt; font-weight : 600;">
						<input id = "IQI1" name = "gname" type = "text" placeholder = "받으실분 성함" style = "width : 90%; margin-left : 4%; background-color :  #F1F3F5; border : none; border-radius : 2px 2px; margin-top : 6px;">
						<input id = "IQI2" name = "gaddress1" class = "postcodify_postcode5 mInputQI" type = "text" placeholder = "배송지를 검색해 주세요" style = "width : 90%; margin-left : 4%; background-color :  #F1F3F5; border : none; border-radius : 2px 2px; margin-top : 2px;" readonly>
						<input id = "IQI21" name = "gaddress2" class = "postcodify_address mInputQI" type = "text" placeholder = "기본주소" style = "width : 90%; margin-left : 4%; background-color :  #F1F3F5; border : none; border-radius : 2px 2px;  margin-top : 2px;" readonly>
						<input id = "IQI22" name = "gaddress3" class = "postcodify_details mInputQI" type = "text" placeholder = "상세주소" style = "width : 90%; margin-left : 4%; background-color :  #F1F3F5; border : none; border-radius : 2px 2px;  margin-top : 2px;">
						<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
						<script>
							$(function() { $("#IQI2").postcodifyPopUp(); }); 
						</script>
						<input name = "gphone" id = "IQI3" type = "text" placeholder = "발송자 전화번호를 입력해 주세요" style = "width : 90%; margin-left : 4%; background-color :  #F1F3F5; border : none; border-radius : 2px 2px;  margin-top : 2px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						<input name = "gmsg" type = "text" placeholder = "수신자에게 보낼 메시지를 입력해 주세요" style = "width : 90%; margin-left : 4%; background-color :  #F1F3F5; border : none; border-radius : 2px 2px;  margin-top : 2px;">
						<input type = "text" value = "보유 마일리지 : " readonly style = "border : none; margin-left : 4%; margin-top : 10px; width : 100px;">
						<input type = "text"  value = "${pcost }포인트" readonly style = "border: none; width : 120px;">
						<input type = "text" id = "IH1" value = "${pcost }" readonly style = "display : none;">
						<input type = "text" id = "IH1I1" maxlength = "8" placeholder = "사용마일리지" style = "width : 212px; margin-left : 4px; background-color :  #F1F3F5; border : none; border-radius : 2px 2px;  margin-top : 2px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						<input type = "button" id = "IH1B1" value = "전체사용" style = "background-color : rgb(247,230,0); border: none; outline:none; border-radius : 2px 2px; font-size : 10pt;">
					 	<div style = "float : left; width : 90%; margin-left : 5%; margin-top : 20px; color : #868E96; ">
							거래가 진행되는 동안 <br>
							시간이 약간 걸릴 수 있습니다.
						</div>
					</div>
				</div>
				<div style = "width : 90%; margin-left : 5%; margin-top : 20px; color : rgb(60,30,0); font-weight : 600;">
					<input id = "FCC1" type = "checkbox"> 
					<input type = "text" value = "약관동의" readonly style = "border:none; margin-top : 6px;">
					<input id = "FBDI1"  type = "button" style = "float : right; background-color : rgb(247,230,0); border-radius : 2px 2px; border : none; font-size : 10pt; width : 140px; height : 40px;margin-top :0px; " value = "결제하기">
					<input id = "FBDI2" style = "display : none;" name = "totalPrice">
					<input id = "FBDI3" style = "display : none;" name = "discountPrice">
					<input name = "gaddress" style = "display : none" id = "GADD">
					<input id = "PRICEE" style = "display : none">
					<input id = "TC1" name = "rACost" type = "text" value = "${ pslist.price * ocode }" style = "display : none;">
					<input type = "text" class = "mBoxICost" id = "BIC3" style="display : none;">
					<input name = "presentPoint" type = "text"  value = "${pcost }" readonly style = "display : none;">
					<input  name = "rCount" type = "text" style = "display : none;" value = "${ocode }" >
					<input name = "ocode" type = "text" style = "display : none ;" value = "${ocode }" readonly >
				</div>
			</div>
		</div>
		</c:forEach>
		</c:forEach>
	</form>
	
	<script src = "<%=request.getContextPath()%>/resources/js/purchase1First/PFgh3.js?ver=5"></script>
	<script src = "<%=request.getContextPath()%>/resources/js/purchase1First/PFgh4.js?ver=3"></script>
	
</body>
</html>