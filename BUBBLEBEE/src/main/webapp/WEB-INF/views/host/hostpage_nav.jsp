<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>
.menu{display:flex; border-top: 1px solid lightgray;border-bottom:1px solid lightgray;border-left: 1px solid lightgray;padding: 10px;}
.menu:hover{
	cursor:pointer;
	background: #F39C12;
	transition: background-color 0.4s ease 0s;
}
.tab{display: none;border-left: 1px solid lightgray;}
.title{flex-grow: 1; font-size: 18px;font-weight: bolder;margin-left: 10px;}
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
			<div><img src="${contextPath}/resources/img/enroll.png" width="20px" height="20px"></div>
				<div class="title"><a href="binsert.bo">등록하기</a></div>
			</div>
		<div>			
			<div id="moim" class="menu">
			<div><img src="${contextPath}/resources/img/moim.png" width="20px" height="20px"></div>
				<div class="title">모임관리</div>
				<div><img id="showLayers1" class="showLayers" src="${contextPath }/resources/img/up.png"  width="15" /></div>
			</div>
				<div id="mtab" class="tab">
					<div class="line">내 모임</div>
					<div class="line">일정 관리</div>
				</div>
		</div>
			<div id="class" class="menu">
			<div><img src="${contextPath}/resources/img/class.png" width="20px" height="20px"></div>
				<div class="title">클래스관리</div>
				<div><img id="showLayers2" class="showLayers" src="${contextPath }/resources/img/up.png"  width="15" /></div>
			</div>
				<div id="ctab" class="tab">
					<div class="line">내 클래스</div>
					<div class="line">일정 관리</div>
					
				</div>
			<div id="account" class="menu">
			<div><img src="${contextPath}/resources/img/money.png" width="20px" height="20px"></div>
				<div class="title">
				정산조회
				</div>
				<div><img id="showLayers3" class="showLayers" src="${contextPath }/resources/img/up.png"  width="15" /></div>
			</div>
				<div id="atab" class="tab">
					<div class="line">정산요청</div>
					<div class="line">정산완료 </div>
				</div>
			<div id="profile" class="menu">
			<div><img src="${contextPath}/resources/img/moim.png" width="20px" height="20px"></div>
			 <div class="title">프로필수정</div>
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
				
				$('#account').click(function(){
					$('#atab').slideToggle(200);
					 $('#showLayers3').toggleClass('rotate');
				});
				
// 				$('#showLayers').click(function() {
// 				     $('#showLayers').toggleClass('rotate');
// 				});
				$('.')
			  });
			</script>
	   </nav>
</body>
</html>