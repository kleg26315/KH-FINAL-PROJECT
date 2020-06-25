<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 프로필 페이지</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/host_qna_write.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>

</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
      <form action="hostQnAenroll.ho" method="post">
      <input type="hidden" name="ref_fid" value="${fno}">
      <input type="hidden" name="user_id" value="${loginUser.id }">
      <input type="hidden" name="hostId" value="${hostId }">
	      <div id="all_wrap">
				<div id="qna_all">
					<div id="qna_wrap">
							<div id="qna_text">문의하기</div>
							<div id="sec_wrap">
							<input type="checkbox" id="secret" name="secret_yn" value="checked"><label for="secret" id="scheckbox"></label><div id="s_text">비밀글</div>
							</div>
					</div>
					<hr>
					<div id="write_all">
						<textarea placeholder="문의하실때는 개인 연락처를 남기거나 요청할 수 없으며,&#13;&#10;연락처를 포함한 문의/답변은 동의없이 삭제될 수 있습니다. &#13;&#10;결제, 환불, 마일리지 관련 문의는 고객센터로 문의해주세요." name="qcontent"></textarea>
					</div>
					<div id="enrollBtn_wrap">
						<button id="enrollBtn" class="notext" disabled>등록하기</button>
					</div>
				</div>
	      </div>
	    </form>
   </section>
   <script>
    $(function(){
    	$('textarea').focus(function(){
    		var textarea = $('textarea').val();
    		if(textarea.length != 0 || $.trim(textarea) != 0){
    			$('#enrollBtn').addClass('text').attr('disabled',false);
    		}else{
				$('#enrollBtn').removeClass('text').attr('disabled',true);
    		}
    	});
    	$('textarea').blur(function(){
    		var textarea1 = $('textarea').val();
    		if(textarea1.length != 0 || $.trim(textarea1) != 0){
    			$('#enrollBtn').addClass('text').attr('disabled',false);
    		}else{
    			$('#enrollBtn').removeClass('text').attr('disabled',true);
    		}
    	});
    	$('textarea').keyup(function(){
    		var textarea1 = $('textarea').val();
    		if(textarea1.length != 0 || $.trim(textarea1) != 0){
    			$('#enrollBtn').addClass('text').attr('disabled',false);
    		}else{
    			$('#enrollBtn').removeClass('text').attr('disabled',true);
    		}
    	});
    	$('#enrollBtn').click(function(){
    		var bool = confirm('문의를 등록하시겠습니까?');
    		if(!bool){
    			return false;
    		}
    	});
    	$('#s_text').click(function(){
    		$('input:checkbox').prop('checked',function(){
    			return !$(this).prop('checked');
    		})
    	});
    });
   </script>
   <footer id="footer">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>