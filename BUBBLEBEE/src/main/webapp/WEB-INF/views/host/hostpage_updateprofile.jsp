<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 정보</title>
     
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/host_updateprofile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
   		  <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
         
</head>
<style>
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
.c_body{flex-grow: 2;margin-left: 20px;width: 900px;background: #eee;padding: 20px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}
.host_all{background: white; padding: 10px;}
#ac_name{width: 150px; height: 40px;}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
    <div id="content">
	 	<nav style="height: 100%; width: 220px;">
	 		 <c:import url="../layout/hostpage_nav.jsp"/> 
	 	</nav>
	    <div class="c_body">
	    <div class="host_header">호스트 정보</div>
		   <div class="host_all"> 
		   		<div class="host_info_all">
		   				<div class="host_photo_wrap">
		   					<div class="h_title" id="h_profile">프로필 사진</div>
		   					<div class="proimg_con">
		    					<form id="fileForm" method="post" enctype="multipart/form-data">
									<div class="h_title" id="h_img_center">
										<c:choose>
							         	<c:when test="${ fn:contains(sessionScope.loginUser.profile, 'http')}">
							         		<img id="profile" class="profile_img" style="width: 120px; height: 120px; border-radius: 100%;" src="${sessionScope.loginUser.profile}" />
							         	</c:when>
										<c:otherwise>
											<img id="profile" class="profile_img" style="width: 120px; height: 120px; border-radius: 100%;" src="${contextPath}/resources/proFiles/${sessionScope.loginUser.profile}" />
										</c:otherwise>
							         </c:choose>
									</div>
									<input type="file" id="fileUpload" name="profile" />
									<input type="text" id="fileName" readonly="readonly" value="${sessionScope.loginUser.profile }">
									<button class="imgbutton" type="button">파일 선택</button>
								</form>
							</div>
		   				</div>
		   				
		   				<form class="infoForm" action="hUpdateProfile.ho">
		   				<input type="hidden" value="${sessionScope.loginUser.id}" name="id">
		   				<div class="host_phone_wrap">
		   					<div class="h_title" id="h_phone">휴대폰 번호 <span>*</span></div>
		   					<div>
		   					<input type="text" name="phone" value="${host.member.phone } ">
		   					<div class="p_text">대원들에게 안내되는 공개 연락처입니다.</div>
		   					</div>
		   				</div>
		   				<div class="host_name_wrap">
		   					<div class="h_title" id="h_name">이름 <span>*</span></div>
		   					<input type="text" name="userName" value="${host.member.userName }" readonly="readonly">
		   				</div>
		   				<div class="host_nickname_wrap">
		   					<div class="h_title" id="h_nickname">닉네임 </div>
		   					<div>
		   						<input type="text" name="nickName" value="${host.member.nickName }">
		   						<div class="nick_text">대원들에게 보여지는 닉네임입니다. <br>미입력시 실명을 사용합니다.</div>
		   					</div>
		   				</div>
		   				<div class="host_email_wrap">
		   					<div class="h_title" id="h_email">이메일 <span>*</span></div>
		   					<div>
		   					<input type="text" name="email" placeholder="bubblebee@example.com" value="${host.member.email }">
		   					<div class="e_text">버블비 운영 관련 공지 및 수정 요청 등 중요 알림을 위해 <br>실제 사용하시는 이메일 주소를 입력해주시길 바랍니다.</div>
		   					</div>
		   				</div>
		   				<div class="host_intro_wrap">
		   					<div class="h_title" id="h_intro">소개<span>*</span></div>
		   					<div class="h_intro_text">
		   					<div class="i_text">대원들에게 신뢰감을 줄 수 있도록, 호스트님의 전문성을 전달할 수 있는 소개글을 작성해주세요 :)<br>
		   					* 호스트님의 경력, 보유 자격증, 수상 이력, 언론 활동 등을 추가로 기재하시면 대원들의 신뢰를 얻을 수 있으며, 구매 결정에 도움을 줄 수 있습니다. 
		   					</div>
		   					<div class="i_warn">* 개인 연락처(전화번호, 카카오톡 ID, 개인 SNS 주소, 홈페이지 등)는 입력할 수 없습니다.</div>
		   					</div>
		   					<textarea name="introduction" class="h_textarea" placeholder="간단한 소개와 약력을 입력해 주세요.">${host.introduction }</textarea>
		   				</div>
		   				<div class="host_fees_wrap">
		   					<div class="h_title">수수료</div>
		   					<div class="h_fees">20.0%</div>
		   				</div>
		   				<div class="host_account_wrap">
		   					<div class="h_title" id="h_ac">입금 계좌 <span>*</span></div>
						   	<div class="p_content">
							<select class="input2" id="ac_bname" name="ac_bname">
								<option value="no">은행선택</option>
								<option value="KB국민">KB국민</option>
								<option value="NH농협">NH농협</option>
								<option value="신한">신한</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="우리">우리</option>
								<option value="하나">하나</option>
								<option value="IBK기업">IBK기업</option>
							</select>
							<input type="text" name="ac_name" placeholder="예금주명" class="input2" id="ac_name" value="${host.ac_name }">
							<input type="text" name="ac_no" placeholder="-를 빼고 숫자만 입력해주세요" class="input1" id="ac_no" value="${host.ac_no}">
						   	</div>
		   				</div>
			   			<div class="host_btn">
			   				<input type="button" value="이전" id="cancle">
			   				<input type="submit" value="저장" id="submit">
			   			</div>
		   				</form>
		   		</div>
		   </div>
		 </div>
	</div>
   </section>
   <script>
   	$(function(){
   		// 은행 체크하기
   		$('select[id="ac_bname"]').find('option:contains("${host.ac_bname}")').attr("selected",true);
   		
	   //파일첨부하기
   		$('.imgbutton').on('click',function(){
   			$('#fileUpload').click();
   		});
   		
   		$('#fileUpload').change(function(e){
   			document.getElementById('fileName').value=document.getElementById('fileUpload').files[0].name;

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
   		
   		// 이전으로 돌아가기
   		$('#cancle').click(function(){
				var bool = confirm('이전으로 돌아가시겠습니까?');
				if(bool){
					location.href="javascript:history.back();";	
		}
		});
   		
   		// 계좌번호, 전화번호 숫자 입력 제한
   		$('#ac_no, input[name=phone]').keyup(function(event){
   				regexp=/[^0-9]/gi;
   				v = $(this).val();
   				if(regexp.test(v)){
   					alert('숫자만 입력가능 합니다.');
   					$(this).val(v.replace(regexp, ''));
   				}
   			});
   		
   		// 저장 버튼 눌렀을때 필수 입력 항목이 비어있는지 검사
   		$('#submit').click(function(){
   			var email = $('input[name=email]'); // 이메일
   			var nick = $('input[name=nickName]');
   			var intro = $('.h_textarea'); // 호스트 소개
   			var ac_bname =$('select[name=ac_bname]'); // 은행이름
   			var ac_name = $('input[name=ac_name]'); // 예금주명
   			var ac_no = $('input[name=ac_no]'); // 계좌번호
   			
   			if(email.val() == "" || email.val().trim() == ""){
   				alert('이메일은 필수항목입니다.');
   				email.focus();
   				return false;
   			}
   			if(!email.val().includes('@')){
   				alert('올바른 이메일 형식이 아닙니다.');
   				email.focus();
   				return false;
   			}
   			if(intro.val() == "" || intro.val().trim() ==""){
   				alert('소개는 필수항목입니다.');
   				intro.focus();
   				return false;
   			}
   			if(ac_bname.val() == "no"){
   				alert('은행을 선택해주세요.');
   				ac_bname.focus();
   				return false;
   			}
   			if(ac_name.val() == "" || ac_name.val().trim() == ""){
   				alert('예금주명은 필수항목입니다.');
   				ac_name.focus();
   				return false;
   			}
   			if(ac_no.val() ==""){
   				alert('계좌번호는 필수항목입니다.');
   				ac_no.focus();
   				return false;
   			}
   			if(nick.val() == "" || nick.val().trim() ==""){
   				nick.val($('input[name=userName]').val());
   				alert(nick.val());
   			}
   			
   		});
   		
   	});
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>