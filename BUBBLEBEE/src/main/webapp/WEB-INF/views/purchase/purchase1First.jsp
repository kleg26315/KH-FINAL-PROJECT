<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
				<c:forEach var = "pu" items = "${plist }" varStatus = "status">	
				<div style = "float:left; width : 100%;">
					<hr id = "submitFormSectionMainDH" style = "margin-top : 20px;">
				</div>
				<div class = "mPhoto">
					<img class="logoImg" src="../resources/images/4.jpg" name = "rImg">
				</div>
				<div class = "mProfile">
					<div class = "mProfileT1">
						<input class = "mProfileT11" name = "rIntro"  value = "${ pu.small_title }" readonly>
						<input type = "text" style = "display : none" value = "${ pu.fno }" name = "fno">	
					</div>
					<div class = "mProfileT2">
						<input class = "mProfileT21" name = "rTitle" value = "${ pu.ftitle }" readonly >
					</div>
					<div class = "mProfileT3">
						<input class = "mProfileT31" id = "PT31" name = "rCost" readonly >
					</div>
				</div>
			
			
				<div style = "float:left; width : 100%;">
					<hr id = "submitFormSectionMainDH">
				</div>
				<div class = "mOption">
					<c:forEach var = "pu2" items = "${pslist }" varStatus = "status">
						<!-- input -->
						<input type = "text" style = "display : none;" id = "P1" value = "${pu2.price }">
						<script>
							var p1 = $("#P1").val();
							$("#PT31").val(p1 + " 원");	
						</script>
						<!-- input -->
						<div class = "mOptionO">
							<h3 class = "mOptionO1">선택한 옵션</h3>
							<input name = "oname" class = "mOptionO2" name = "rTitleDetail" value = "${ pu2.oname }" readonly>
							<input name = "ono" style = "display : none" value = "${pu2.ono }" >
						</div>
						<div class = "mOptionP">
							<h3 class = "mOptionP1">수량</h3>	
							<input name = "ocount"class = "mOptionP2" name = "rCount" value = "${ pu2.ocount }" readonly id = "OP2">개
						</div>
						<div class = "mOptionS">
							<h3 class = "mOptionS1">옵션합계</h3>
							<h3 class = "mOptionS2" style = "float : right;">
								<input id = "TC1" name = "rACost" type = "text" value = "${ pu2.price * pu2.ocount }"readonly>원
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
					<input class = "mInfoHI" id = "IH1" type = "text"  value = "100000" readonly/>
					<h3 class = "mInfoH1" style = "margin-top : 12px;">
						<input class = "mInfoH1I" id = "IH1I1" type = "text" placeholder = "사용 마일리지 " maxlength = "8" style = "border : 1px solid gray; text-align : right; margin-right : 24px; outline : none; border-radius : 2px 2px;"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
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
		
	<script>
	$(".mInputQ").on("keyup", function(){
		var iqi2 = $("#IQI2").val();
		var iqi21 = $("#IQI21").val();
		var iqi22 = $("#IQI22").val();
		
		$("#GADD").val(iqi2 + " " + iqi21 + iqi22);
		
		console.log($("#GADD").val());
	});
	
	$('#FBDI1').on('click', function(){
		
		var fbdi2 = $("#FBDI2").val();
		
		if($("#IQI1").val() == 0){
			alert("수신자를 입력해주세요!");
			
			$("#IQI1").focus();
			
		}else if(($("#IQI2").val() == 0)||($("#IQI21").val() == 0)||($("#IQI22").val() == 0)){
			alert("배송지를 입력해주세요!");
			
			$("#IQI2").focus();
		}else{
			if(fbdi2 == 0){
				$('form[name=doubleTarget]').attr('action', 'purchaseConfirm.pu');
				$('form[name=doubleTarget]').submit();	
				
			}else{
				$('form[name=doubleTarget]').attr('action', 'kakaoPay.pu');
				$('form[name=doubleTarget]').submit();
			}
		}
	})
	
	
	//variable
	var tc1 = $("#TC1").val();
	var ih1 = Number($("#IH1").val());
	var ih1ih = Number($("#IH1I1").val());
	
	var totalC = tc1 - ih1ih;
	
	//onload
	$("#BIC3").text(tc1);
	
	// 종합계산
	var costCarculate = function(){
		var tc1 = Number($("#TC1").val());
		var ih1 = Number($("#IH1").val());
		var ih1ih = Number($("#IH1I1").val());
		var bic3 = $("#BIC3").text();
		var bic1 = $("#BIC1").text();
		
		var totalC = tc1 - ih1ih;
		
		
		
		if($("#FCC1").is(":checked") == true){
			if((ih1ih < tc1)&&(ih1ih <= ih1)){
				$("#IH1I1").css("color", "black");
				$("#BIC3").text(totalC);
				$("#BIC1").text(ih1ih);
				$("#FBDI3").val(ih1ih);
				$("#FBDI1").val(totalC + "원 결제하기");
				$("#FBDI1").css("color", "black");
				$("#FBDI1").attr('disabled', false);
				$("#FBDI2").val(totalC);
			}else if((ih1ih > ih1)&&(ih1ih <= tc1)){
				alert("님의 마일리지 사용한도는" + ih1 + "입니다.");
				$("#BIC1").text(ih1);
				$("#FBDI3").val(ih1);
				$("#BIC3").text(tc1 - ih1);
				$("#IH1I1").val(ih1);
				$("#FBDI1").val(tc1 - ih1 + "원 결제하기");
				$("#FBDI2").val(tc1 - ih1);
			}else if((ih1ih == tc1)&&(ih1ih <= ih1)){
				$("#FBDI1").attr('disabled', false);
				$("#IH1I1").val(tc1);
				$("#BIC1").text(tc1);
				$("#FBDI3").val(tc1);
				$("#BIC3").text("0");	
				$("#FBDI1").val("결제하기");
				$("#FBDI2").val("0");
			}else if((ih1ih >= tc1)&&(ih1ih <= ih1)){
				alert("최대금액은" + tc1 + "원 까지 설정하실 수 있습니다.");
				$("#FBDI1").attr('disabled', false);
				$("#IH1I1").val(tc1);
				$("#BIC1").text(tc1);
				$("#FBDI3").val(tc1);
				$("#BIC3").text("0");	
				$("#FBDI1").val("결제하기");
				$("#FBDI2").val("0");
			}else{
				$("#IH1I1").val("");
				$("#BIC3").text(tc1);
				$("#BIC1").text("0");
				$("#FBDI3").val(0);
				$("#FBDI1").val(tc1 + "원 결제하기");
				$("#FBDI1").css("color", "black");
				$("#FBDI1").attr('disabled', false);
				$("#FBDI2").val(tc1);
			}
		}else{
			$("#FBDI1").attr('disabled', true);
			$("#FBDI1").val("약관에 동의해 주세요");
			if((ih1ih < tc1)&&(ih1ih <= ih1)){
				$("#BIC1").text(ih1ih);
				$("#FBDI3").val(ih1ih);
				$("#BIC3").text(totalC);
			}else if((ih1ih > ih1)&&(ih1ih <= tc1)){
				alert("님의 마일리지 사용한도는" + ih1 + "입니다.");
				$("#BIC1").text(ih1);
				$("#FBDI3").val(ih1);
				$("#BIC3").text(tc1 - ih1);
				$("#IH1I1").val(ih1);
			}else if((ih1ih == tc1)&&(ih1ih <= ih1)){
				$("#IH1I1").val(tc1);
				$("#BIC1").text(tc1);
				$("#FBDI3").val(tc1);
				$("#BIC3").text("0");	
			}else if((ih1ih >= tc1)&&(ih1ih <= ih1)){
				alert("최대금액은" + tc1 + "원 까지 설정하실 수 있습니다.");
				$("#IH1I1").val(tc1);
				$("#BIC1").text(tc1);
				$("#FBDI3").val(tc1);
				$("#BIC3").text("0");
			}else{
				$("#IH1I1").val("");
				$("#BIC3").text(tc1);
				$("#BIC1").text("0");
				$("#FBDI3").val(0);
			}
		}
	}
	$(function(){
		$("#FBDI1").attr("disabled", true);
		
		$("#IH1B1").on("click", function(){
			var ih1 = $("#IH1").val();
			$("#IH1I1").val(ih1);
			costCarculate();
		})
		
		$("#FCC1").on("change", function(){
			costCarculate();
		});
		
		
		$(function(){
			costCarculate();
		});
		
		//keyup function
		$("#IH1I1").on("keydown",function(){
			costCarculate();
		})
		
		$("#IH1I1").on("keyup",function(){
			costCarculate();
		})	
	})
	
		
	</script>
	
	<script>
					var p1 = $("#P1").val();
					var op2 = $("#OP2").val();
					var du = p1 * op2;
					console.log($("#PRICEE"));
					$("#PRICEE").val(du + "원");
					console.log(du);
				</script>
</body>
</html>