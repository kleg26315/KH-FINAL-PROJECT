<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버블비</title>
<link rel = "shortcut icon" href = "<%= request.getContextPath() %>/resources/images/꿀벌.png" type = "image/x-icon">
<link rel = "stylesheet"  href= "<%= request.getContextPath() %>/resources/css/purchase1First.css" type = "text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<style>
#header{
	position: fixed;
	width : 100%;
}
</style>
<body>
	<header id="header">
		<%@ include file = "../layout/header.jsp" %> 	
	</header>
	<form  id = "purchaseForm" name = "doubleTarget" method = "post">
		<div class = "main">
				<div class = "mFont">	
					결제
				</div>
				<c:forEach var = "plist" items = "${plist }" varStatus = "status">	
				<div style = "float:left; width : 100%;">
					<hr id = "submitFormSectionMainDH" style = "margin-top : 20px;">
				</div>
				<div class = "mPhoto">
					<!-- <img class="logoImg" src="../resources/images/4.jpg" name = "rImg"> -->
					 <img id="" width="100%" height="200" class="logoImg" src="${contextPath }/resources/buploadFiles/${ plist.renamefilename }" />
				</div>
				<div class = "mProfile">
					<div class = "mProfileT1">
						<input class = "mProfileT11" name = "rIntro"  value = "${ plist.small_title }" readonly>
						<input type = "text" style = "display : none" value = "${ plist.fno }" name = "fno">	
					</div>
					<div class = "mProfileT2">
						<input class = "mProfileT21" name = "rTitle" value = "${ plist.ftitle }" readonly >
					</div>
					<div class = "mProfileT3">
						<input class = "mProfileT31" id = "PT31" name = "rCost" readonly value = "${plist.price}원" >
					</div>
				</div>
			
			
				<div style = "float:left; width : 100%;">
					<hr id = "submitFormSectionMainDH">
				</div>
				<div class = "mOption">
					<c:forEach var = "pslist" items = "${pslist }" varStatus = "status">
						<!-- input -->
						<input type = "text" style = "display : none;" id = "P1" value = "${pslist.price }">
						<script>
							var p1 = $("#P1").val();
							$("#PT31").val(p1 + " 원");	
						</script>
						<!-- input -->
						<div class = "mOptionO">
							<h3 class = "mOptionO1">선택한 옵션</h3>
							<input name = "oname" class = "mOptionO2" name = "rTitleDetail" value = "${ pslist.oname }" readonly style = "text-align : right; margin-left : -132px;">
							<input name = "ono" style = "display : none" value = "${pslist.ono }" >
						</div>
						<div class = "mOptionP">
							<h3 class = "mOptionP1">수량</h3>	
							<h3 class = "mOptionS2" style = "float : right;">
								<input name = "ocode"class = "mOptionP2" name = "rCount" value = "${ ocode }" readonly id = "OP2" style = "margin-top : 0px; text-align : right;">개
							</h3>
						</div>
						<div class = "mOptionS">
							<h3 class = "mOptionS1">옵션합계</h3>
							<h3 class = "mOptionS2" style = "float : right;">
								<input id = "TC1" name = "rACost" type = "text" value = "${ pslist.price * ocode }"readonly style = "margin-left : -24px;">원
							</h3>
						</div>
					</c:forEach>
				</div>
					
				</c:forEach>
				
				<div style = "float:left; width : 100%;">
					<hr id = "submitFormSectionMainDH" style = "margin-top : 20px;">
				</div>
				
				
						
			
				<div class = "mInput">
					<h3 class = "mInputQ">
						받으실분 성함(필수)
					</h3>
					<h3 class = "mInputQ">
						<input name = "gname" class = "mInputQI" id = "IQI1" type = "text" placeholder = " 수신자를 입력해 주세요" name = "rName"  style = "border : 1px solid gray; font-size : 14pt; border-radius : 2px 2px; margin-top : 4px;">
					</h3>
				</div>
				<div class = "mInput">
					<h3 class = "mInputQ">
						배송 받을 주소(필수)
					</h3>
					<h3 class = "mInputQ">
						<input name = "gaddress1" class = "postcodify_postcode5 mInputQI" id = "IQI2" type = "text" placeholder = " 배송지를 입력해 주세요" name = "rAddress1" readonly style = "border : 1px solid gray; font-size : 14pt; border-radius : 2px 2px; margin-top : 4px;">
						<input name = "gaddress2" class = "postcodify_address mInputQI" id = "IQI21" type = "text" placeholder = " 기본주소" name = "rAddress2" style = "border : 1px solid gray; font-size : 14pt; border-radius : 2px 2px; margin-top : 4px;">
						<input name = "gaddress3" class = "postcodify_details mInputQI" id = "IQI22" type = "text" placeholder = " 상세주소" name = "rAddress3" style = "border : 1px solid gray; font-size : 14pt; border-radius : 2px 2px; margin-top : 4px;">
						<input name = "gaddress" style = "display : none" id = "GADD">
					</h3>
					<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
					<script>
						$(function() { $("#IQI2").postcodifyPopUp(); }); 
					</script>
				</div>
				<div class = "mInput" style = "margin-top : 80px;">
					<h3 class = "mInputQ">
						연락처(휴대전화)
					</h3>
					<h3 class = "mInputQ">
						<input name = "gphone" class = "mInputQI" id = "IQI3" type = "text" placeholder = "발송자 전화번호를 입력해 주세요" name = "rPhone"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style = "border : 1px solid gray; font-size : 14pt; border-radius : 2px 2px; margin-top : 4px;">
					</h3>
				</div>
				<div class = "mInput">
					<h3 class = "mInputQ">
						배송메세지
					</h3>
					<h3 class = "mInputQ">
						<input name = "gmsg" class = "mInputQI" id = "IQI4" type = "text" placeholder = "수신자에게 보낼 메세지를 적어주세요" name = "rMessage" style = "border : 1px solid gray; font-size : 14pt; border-radius : 2px 2px; margin-top : 4px;">
					</h3>
				</div>
				<div style = "float:left; width : 100%;">
					<hr id = "submitFormSectionMainDH" style = "width : 100%; margin-top : 20px;">
				</div>		
				<div class = "mInfo">
					<h3 class = "mInfoH">상품 금액</h3>
					<input style = "float : right; font-size : 16pt; margin-right : -14%; margin-top : 13px;  border:none; outline:none;" type = "text" id = "PRICEE" value="0" readonly/>
				</div>
				<div style = "float:left; width : 100%;">
					<hr id = "submitFormSectionMainDH" style = "width : 100%; margin-top : 20px;">
				</div>
				<div class = "mInfo">
					<h3 class = "mInfoH">마일리지</h3>
					<h3 class = "mInfoH" style = "color : gray; margin-left : 20px; font-weight : 200;">보유</h3>
< 					<input class = "mInfoHI" id = "IH1" type = "text"  value = "${ pcost.p_money }" readonly  name = "presentPoint"/> 
		
					<h3 class = "mInfoH1" style = "margin-top : 12px;">
						<input class = "mInfoH1I" id = "IH1I1" type = "text" placeholder = "사용 마일리지 " maxlength = "8" 
						style = "border : 1px solid gray; text-align : right; margin-right : 24px; outline : none; border-radius : 2px 2px;"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						<input class = "mInfoH1B" id = "IH1B1" type = "button" value = "전체 사용" style = "outline : none;">
					</h3>
				</div>
				<div style = "float:left; width : 100%;">
					<hr id = "submitFormSectionMainDH" style = "width : 100%; margin-top : 20px;">
				</div>
				<div class = "mBox">
					<div class = "mBoxI" id = "BI1">
						<h3 class = "mBoxIH">할인 금액</h3>
						<label class = "mBoxICost" id = "BIC2">원</label>
						<label class = "mBoxICost" id = "BIC1" style="width: 200px; text-align: right;"  >0</label>
					</div>
					<div class = "mBoxI" >
						<h3 class = "mBoxIH">최종 결제 금액</h3>
						<label class = "mBoxICost" id = "BIC4">원</label>
						<label class = "mBoxICost" id = "BIC3" style="width: 200px; text-align: right; "></label>
					</div>
				</div>
				<div class = "mFin">
					<div class = "mFinC">
						<input class = "mFinCC" id = "FCC1" type = "checkbox">
						<h3 class = "mFinCH">
							개인정보 제 3자 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.
						</h3>
					</div>
				</div>
				<div class = "mFinB">
					<div class = "mFinBD">
						<input class = "mFinBDI" id = "FBDI1" type = "button" style = "outline : none" value = "약관에 동의해 주세요" >
						<input id = "FBDI2" style = "display : none;" name = "totalPrice">
						<input id = "FBDI3" style = "display : none;" name = "discountPrice">
					</div>
				
				</div>
				
			
			</div>
			</form>
		
	<script src = "<%=request.getContextPath()%>/resources/js/purchase1First/PFgh1.js"></script>
	<script src = "<%=request.getContextPath()%>/resources/js/purchase1First/PFgh2.js"></script>
	<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src = "<%=request.getContextPath()%>/resources/js/loginRequired.js"></script>
</body>
</html>