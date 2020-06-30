<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
.menu{display:flex; border-top: 1px solid lightgray;border-bottom:1px solid lightgray;border-left: 1px solid lightgray;padding: 10px;}
.menu:hover{
	cursor:pointer;
	background: #F39C12;
	transition: background-color 0.4s ease 0s;
}
.tab{display: none;border-left: 1px solid lightgray;}
.htitle{flex-grow: 1; font-size: 18px;font-weight: bolder;margin-left: 10px;}
.line{line-height: 30px;font-weight: bold;padding: 5px 10px;font-size: 15px;}
.line:hover {
	cursor:pointer;
	background: #F39C12;
}
.showLayers {
				     transition: transform 0.3s;
				}

				.rotate {
				     -webkit-transform: rotate(180deg);
				     -moz-transform: rotate(180deg);
				     -o-transform: rotate(180deg);
				     -ms-transform: rotate(180deg);
				     transform: rotate(180deg);
				}
</style>
</head>
<body>
	<nav>
		<div id="enroll" class="menu">
			<div style="font-size: 20px;"><img src="${contextPath}/resources/img/enroll.png" width="20px" height="20px"></div>
				<div class="htitle" id="insertBoard">등록하기</div>
			</div>
		<div>			
			<div id="moim" class="menu">
			<div><img src="${contextPath}/resources/img/moim.png" width="20px" height="20px"></div>
				<div class="htitle">버블관리</div>
				<div><img id="showLayers1" class="showLayers" src="${contextPath }/resources/img/up.png"  width="15" /></div>
			</div>
				<div id="mtab" class="tab">
					<div id="mymoim" class="line">내 모임</div>
					<div id="myclass" class="line">내 클래스</div>
					<div id="myproduct" class="line">내 작품</div>
				</div>
		</div>
				
			<div id="account" class="menu">
			<div><img src="${contextPath}/resources/img/money.png" width="20px" height="20px"></div>
				<div class="htitle">
				정산조회
				</div>
				<div><img id="showLayers3" class="showLayers" src="${contextPath }/resources/img/up.png"  width="15" /></div>
			</div>
				<div id="atab" class="tab">
					<div id="reaccount" class="line">정산요청</div>
					<div id="comaccount" class="line">정산완료 </div>
				</div>
			<div id="profile" class="menu">
			<div><img src="${contextPath}/resources/img/modify.png" width="20px" height="20px"></div>
			 <div class="htitle" id="hupdateprofile">프로필수정</div>
			</div>
			<div id="gomain_wrap" class="menu">
			 <div class="htitle" id="gomain">메인으로</div>
			</div>
			<script type="text/javascript">
			  $( document ).ready(function() {
				$('#moim').click(function(){
					$('#mtab').slideToggle(200);					
					 $('#showLayers1').toggleClass('rotate');
				});
				
				$('#class').click(function(){
					$('#ctab').slideToggle(200);
					 $('#showLayers2').toggleClass('rotate');
				});
				
				$('#product').click(function(){
					$('#ptab').slideToggle(200);
					 $('#showLayers2-1').toggleClass('rotate');
				});
				
				$('#account').click(function(){
					$('#atab').slideToggle(200);
					 $('#showLayers3').toggleClass('rotate');
				});

				$('#insertBoard').click(function(){
					location.href="binsertForm.bo";
				})
				
				$('#hupdateprofile').click(function(){
					location.href="hostUpdateProfile.ho";
				});
				
				// 내 모임 
				$('#mymoim').click(function(){
					location.href="hostBoardAll.ho?ftype=1";
				});
				
				// 내 클래스
				$('#myclass').click(function(){
					location.href="hostBoardAll.ho?ftype=2";
				});
				
				$('#myproduct').click(function(){
					location.href="hostBoardAll.ho?ftype=3";
				});
				
				// 정산요청
				$('#reaccount').click(function(){
					location.href="hostAccount.ho"
				});
				//메인으로 돌아가기
				$('#gomain').click(function(){
					location.href="updateInfoForm.mg";
				})
				
			  });
			</script>
	   </nav>
</body>
</html>