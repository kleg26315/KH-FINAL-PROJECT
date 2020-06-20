<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage_header</title>
<style type="text/css">
#main_header{
	margin-left: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
}
#profile_wrap{
	display: flex;
	justify-content: flex-start;
	flex-wrap: wrap;
}

#profile_wrap div{
	display: inline-block;
	vertical-align: middle;
}
#proimg{
	width:100px;
	height: 100px;
	flex-grow: 1;
}
#info_wrap{
	margin-left:20px;
	flex-grow: 10;
}
#info_wrap div{
	margin-bottom: 8px;
}
#name_d{
	display:inline;
	font-size: 30px;
	font-weight: 900;
	cursor: default;
}
#m_btn{
	border-color: lightgray;
	border-style: solid;
	border-width: 1px;
	border-radius:5px;
	padding: 5px 10px;
	margin-left: 5px;
	cursor: pointer;
}
#point_wrap{
	background:#F39C12;
	border-radius: 5px;
	padding:10px 20px;
	font-weight: bold;
	align-self:center;
	flex-grow: 1;
}
#point_con{
	line-height:20px;
	vertical-align: middle;
}
#point_wrap:hover,#inter_btn:hover{
	cursor: pointer;
}
#next{
	width: 8px;
	height: 8px;
}
#interest span{color:#F39C12;}


</style>
</head>
<body>
	<div id="main_header">
    	<div id="profile_wrap">
    		<div id="proimg_wrap">
	    		<div id="proimg_con">
		    		<form id="fileForm" method="post" enctype="multipart/form-data">
		    			<input type="file" id="fileUpload" name="profile" style="display:none" />
		    			<c:choose>
					         	<c:when test="${ fn:contains(sessionScope.loginUser.profile, 'http')}">
					         		<img id="profile" class="profile_img" style="width: 120px; height: 120px; border-radius: 100%; cursor: pointer;" src="${sessionScope.loginUser.profile}" />
					         	</c:when>
								<c:otherwise>
									<img id="profile" class="profile_img" style="width: 120px; height: 120px; border-radius: 100%; cursor: pointer;" src="${contextPath}/resources/proFiles/${sessionScope.loginUser.profile}" />
								</c:otherwise>
					         </c:choose>
					</form>
				</div>
			</div>
				<div id="info_wrap">
					<div id="name_d">${loginUser.nickName}</div>
					<div id="m_btn">설정</div>
					<br>
					<div id="interest">
						<c:choose>
						<c:when test="${loginUser.interest ne '-'}">
						<c:forTokens items="${loginUser.interest }" delims="," var="i">
						<span>#${i}</span>
						</c:forTokens>
						</c:when>
						<c:otherwise><span id="inter_btn">#관심사 설정하러가기</span></c:otherwise>
						</c:choose>
					</div>
					
					<br>
					<div id="login_means">
					<c:set var="way" value="${loginUser.id}"/>
						<c:choose>
							<c:when test="${fn:contains(way,'@')}">이메일 계정</c:when>
							<c:when test="${fn:length(way) == 10}">카카오톡 로그인 계정</c:when>
							<c:when test="${fn:length(way) == 8}">네이버 로그인 계정</c:when>
							<c:otherwise>이메일 계정</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="point_wrap">
					<div id="point_con">
						<div id="point_1">마일리지 <img src="<%=request.getContextPath()%>/resources/img/next.png" id="next"/></div>
						<br>
						<div>${sessionScope.point }</div>
					</div>
				</div>
    	</div>
    </div>
    <script type="text/javascript">		
		$(function(){
			// 정보수정
			$('#m_btn,#inter_btn').click(function(){
				location.href="updateInfoForm.mg";
			});
			// 마일리지 이동
			$('#point_wrap').click(function(){
				location.href="mypoint.mg";
			});
			
			
			// 사진 업로드 부분
			$('#profile').click(function(){
				$('#fileUpload').click();
			});
			
			$('#fileUpload').change(function(e){
				console.log('파일첨부됨');
				
				var formData = new FormData($('#fileForm')[0]);
				
				$.ajax({
					type:'post',
					enctype:'multipart/form-data',
					url:'uploadprofile.mg',
					data:formData,
					processData:false,
					contentType:false,
					success:function(data){
						if(data > 0){
							alert('프로필 변경 성공!');
							location.reload();
						}else{
							console.log('실패');
						}
					}
				});
			});
		});
	</script>
    
</body>
</html>