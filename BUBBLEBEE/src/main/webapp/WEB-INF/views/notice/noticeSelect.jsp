<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>navigation-with-button</title>
<link rel = "stylesheet"  href= "resources/css/noticeViewCss.css" type = "text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>    
</head>
<style>
	#header{ 
	   position: fixed;
	   width : 100%;
	   z-index: 100;
	}
</style>
<body>
	<header id="header">
	     <c:import url="../layout/header.jsp"/>
	</header> 

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
      <div class = "main2">

	<h1 id="noticeLabel" style="font-weight: bold; cursor: pointer;" onclick="location.href='list.no'">공지사항</h1>
			<div class="ntitle">
				<input name="bno" hidden value="${notice.bno }">
				<table style="width: 100%; cursor: pointer;" class="titleDate">
					<tr class="titlendate">
						<td>${notice.btitle }</td>
						<td style="text-align: right;">${notice.b_modify_date}</td>
					</tr>
				</table>
				<div class="ncontent" style="">${notice.bcontent } <br><br>
				<c:if test="${ sessionScope.loginUser.id eq 'admin@admin.admin'}">
					<span id="delB">삭제</span>&nbsp;&nbsp;<span id="updB">수정</span>
				</c:if>
				</div>
			</div>

		<script>
	 		/* $(function(){
	 			$('.titleDate').click(function(){
	 				$(this).parent().children('.ncontent').slideToggle(1);
	 			})
	 		}); */
	 		
	 		$('#delB').click(function(){
	 			var bno = $(this).parent().parent().children().eq(0).val();
	 			var result = confirm('정말로 삭제하시겠습니까?');
	 			if(result){
	 				alert('삭제가 완료되었습니다.');
	 				location.href = 'deleteNotice.no?bno='+ bno;
	 			} else{
	 				alert('삭제를 취소합니다.');
	 			}
	 		})
	 		
	 		$('#updB').click(function(){
	 			var bno = $(this).parent().parent().children().eq(0).val();
 				location.href = 'updateNoticeForm.no?bno='+ bno;
	 		})
	 		
	 		
		</script>
		
		<br><br>
		<div style="text-align: center;">
			<button type='button' class='btn btn-inverse' onclick="location.href='list.no'">더 많은 공지사항 보기</button>
		</div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
   
</body>
</html>