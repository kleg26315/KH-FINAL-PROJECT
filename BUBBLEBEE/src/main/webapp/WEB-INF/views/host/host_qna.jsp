<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 프로필 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/host_qna.css">
</head>
<style>
#qna_hr{
	margin-top: 20px;
    margin-bottom: 0px;
    border: 0;
    border-top: 1px solid #eee;
}
.enrollBtn:disabled {
	cursor: not-allowed;
}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
      <div id="all_wrap">
			<div id="qna_all">
				<div id="qna_wrap">
						<div id="qna_text">문의하기</div>
						<c:if test="${host.member.id  ne sessionScope.loginUser.id}">
							<form action="hostQnAwriteView.ho">
<!-- 							<button id="qna_btn">문의하기</button> -->
							<input type="submit" id="qna_btn" value="문의하기" onsubmit="checked">
							<input type="hidden" id="userId" value="${sessionScope.loginUser.id }">
							<input type="hidden" name="fno" value="${fno}">
							<input type="hidden" name="hostId" value="${host.member.id }">
							</form>
						</c:if>
				</div>
		
				<hr id="qna_hr">
				
				<c:if test="${empty rList }">
<!-- 				문의가 없을때 -->
				<div id="no_all">
					<div id="no_wrap">
						<div id="no_flex">
						<div id="no_img_wrap"><img src="${contextPath }/resources/img/review.png" width="80px" height="80px"></div>
						<div id="no_text"><div>문의 사항을 남겨주세요!</div></div>
						</div>
					</div>
				</div>	
				</c:if>
				<!-- 문의가 있을때 -->
				<c:if test="${!empty rList }">
					<div id="openList">
						<div id="review_all">
							<div id="rlist_all">
								<c:forEach var="r" items="${rList }">
								<!-- 공개글일때 -->
									<c:if test="${ r.secret_yn eq 'N' }">
										<div class="rall">
											<div class="rprofile_all">
												<!-- 프로필 이미지 -->
												<div class="r_img">
												<c:choose>
										         	<c:when test="${ fn:contains(r.member.profile, 'http')}">
										         		<img src="${r.member.profile}" />
										         	</c:when>
										         	<c:otherwise>
										         		<img src="${contextPath }/resources/proFiles/${r.member.profile}" />
										         	</c:otherwise>
						         				</c:choose>
												</div>
												<!-- 문의글 작성 날짜/공개여부 -->
												<div class="rprofile_info">
													<div class="r_name">
														${r.member.nickName}
													</div>
													<div class="r_content">
														<div class="r_date">${r.q_create_date } 작성  | 공개글</div>
													</div>
												</div>
											</div>
											<div class="rcontent_all">${r.qcontent}</div>
											<c:if test="${r.user_id  eq sessionScope.loginUser.id}">
											<div class="r_delete"><span class="deleteBtn">삭제<input type="hidden" value="${r.qno}" id="qno" name="qno"></span>
											</div>
											</c:if>
											<c:set var="loopstop" value="false"/>
												<c:forEach var="sreno" items="${reList}" varStatus="vars">
												<c:if test="${ r.qno eq sreno.rno }">
													<div class="r_reList_all">
													<div class="r_hinfo_wrap">
														<div class="r_img">
														<c:choose>
												         	<c:when test="${ fn:contains(host.member.profile, 'http')}">
												         		<img src="${host.member.profile}" />
												         	</c:when>
												         	<c:otherwise>
												         		<img src="${contextPath }/resources/proFiles/${host.member.profile}" />
												         	</c:otherwise>
								         				</c:choose>
														</div>
														<div class="r_h_name_date">
															<div class="r_h_name">${host.member.nickName}</div>
															<div class="r_h_date"><span class="r_h_redate">${sreno.re_create_date } 작성</span> | 공개글</div>
														</div>
													</div>	
													<div class="r_reList_recontent">${sreno.recontent }</div>
													<c:set var="loopstop" value="true"/>
													</div>
												</c:if>	
												</c:forEach>
												<!-- 문의가 작성이 되지않았을때 -->
											<c:if test="${loopstop == false}">
												<c:if test="${host.member.id  eq sessionScope.loginUser.id}">
												<div class="r_reply">
													<span class="r_replyBtn">답변하기</span>
													<div class="replyEnrollForm">
														<div class="replyContentForm">
															<textarea placeholder="${r.member.nickName}님에게 답변달기" name="recontent" class="recontent"></textarea>
															<button class="enrollBtn">등록</button>
															<input type="hidden" id="reno" class="reno" name="reno" value="${r.qno}">
															<input type="hidden" id="rhost" class="rhost" value="${host.member.id}">
														</div>
													</div>
												</div>
											</c:if>
											</c:if>
										</div>
									</c:if>
								<!-- 비밀글 일때  -->
								<c:if test="${ r.secret_yn eq 'Y' }">
									<!-- 비밀글일 경우 글 작성자와 로그인 작성자가 같을때 -->
									<c:if test="${r.user_id  eq sessionScope.loginUser.id or host.member.id eq sessionScope.loginUser.id}">
										<div class="rall">
											<div class="rprofile_all">
												<!-- 프로필 이미지 -->
												<div class="r_img">
												<c:choose>
										         	<c:when test="${ fn:contains(r.member.profile, 'http')}">
										         		<img src="${r.member.profile}" />
										         	</c:when>
										         	<c:otherwise>
										         		<img src="${contextPath }/resources/proFiles/${r.member.profile}" />
										         	</c:otherwise>
						         				</c:choose>
												</div>
												<!-- 문의글 작성 날짜/공개여부 -->
												<div class="rprofile_info">
													<div class="r_name">
														${r.member.nickName}
													</div>
													<div class="r_content">
														<div class="r_date">${r.q_create_date } 작성  | 비밀글</div>
													</div>
												</div>
											</div>
											<div class="rcontent_all">${r.qcontent}</div>
											<c:if test="${r.user_id eq sessionScope.loginUser.id }">
											<div class="r_delete"><span class="deleteBtn">삭제<input type="hidden" value="${r.qno}" id="qno" name="qno"></span>
											</div>
											</c:if>
											
											<c:set var="loopstop" value="false"/>
												<c:forEach var="sreno" items="${reList}" varStatus="vars">
												<c:if test="${ r.qno eq sreno.rno }">
													<div class="r_reList_all">
													<div class="r_hinfo_wrap">
														<div class="r_img">
														<c:choose>
												         	<c:when test="${ fn:contains(host.member.profile, 'http')}">
												         		<img src="${host.member.profile}" />
												         	</c:when>
												         	<c:otherwise>
												         		<img src="${contextPath }/resources/proFiles/${host.member.profile}" />
												         	</c:otherwise>
								         				</c:choose>
														</div>
														<div class="r_h_name_date">
															<div class="r_h_name">${host.member.nickName}</div>
															<div class="r_h_date"><span class="r_h_redate">${sreno.re_create_date } 작성</span> | 비밀글</div>
														</div>
													</div>	
													<div class="r_reList_recontent">${sreno.recontent }</div>
													<c:set var="loopstop" value="true"/>
													</div>
												</c:if>	
												</c:forEach>
												<!-- 문의가 작성이 되지않았을때 -->
										<c:if test="${loopstop == false}">
											<c:if test="${host.member.id  eq sessionScope.loginUser.id}">
												<div class="r_reply">
													<span class="r_replyBtn">답변하기</span>
													<div class="replyEnrollForm">
														<div class="replyContentForm">
															<textarea placeholder="${r.member.nickName}님에게 답변달기" name="recontent" class="recontent"></textarea>
															<button class="enrollBtn">등록</button>
															<input type="hidden" id="reno" class="reno" name="reno" value="${r.qno}">
															<input type="hidden" id="rhost" class="rhost" value="${host.member.id}">
														</div>
													</div>
												</div>
											</c:if>
										</c:if>											
								</div>
							</c:if>
									<!-- 비밀글일 경우 로그인 유저와 글 작성자가 같지 않을때  -->
									<c:if test="${r.user_id  ne sessionScope.loginUser.id and host.member.id ne sessionScope.loginUser.id}">
										<div class="rall">
											<div class="rprofile_all">
												<!-- 프로필 이미지 -->
												<div class="r_img">
													<span class="fa-stack fa-lg" style="font-size: 22.5px;">
													<i class="fas fa-circle fa-stack-2x"></i>
													<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
													</span>
												</div>
												<!-- 문의글 작성 날짜/공개여부 -->
												<div class="rprofile_info">
													<div class="r_name">
														비공개
													</div>
													<div class="r_content">
														<div class="r_date">${r.q_create_date } 작성  | 비밀글</div>
													</div>
												</div>
											</div>
											<div class="rcontent_all">비밀글 입니다.</div>
											<c:set var="loopstop" value="false"/>
												<c:forEach var="sreno" items="${reList}" varStatus="vars">
												<c:if test="${ r.qno eq sreno.rno }">
												<div class="r_reList_all">
												<c:set var="loopstop" value="true"/>
													<div class="r_hinfo_wrap">
														<div class="r_img">
														<c:choose>
												         	<c:when test="${ fn:contains(host.member.profile, 'http')}">
												         		<img src="${host.member.profile}" />
												         	</c:when>
												         	<c:otherwise>
												         		<img src="${contextPath }/resources/proFiles/${host.member.profile}" />
												         	</c:otherwise>
								         				</c:choose>
														</div>
														<div class="r_h_name_date">
															<div class="r_h_name">${host.member.nickName}</div>
															<div class="r_h_date"><span class="r_h_redate">${sreno.re_create_date }</span> | 비밀글</div>
														</div>
													</div>	
													<div class="r_reList_recontent">비밀글 입니다.</div>
												</div>
												</c:if>	
												</c:forEach>
												<!-- 답변 없을때 -->
										</div>
									</c:if>
								</c:if>
								</c:forEach>
						</div>
			<div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
		      <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					< &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="hostQnA.ho">
						<c:param name="page2" value="${ pi.currentPage - 1 }"/>
						<c:param name="fno" value="${fno }"/>
					</c:url>
					<a href="${ before }"> < </a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="gold" size="4"><b>[${ p }]</b></font>&nbsp;
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="hostQnA.ho">
							<c:param name="page2" value="${ p }"/>
							<c:param name="fno" value="${fno }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="hostQnA.ho">
						<c:param name="page2" value="${ pi.currentPage + 1 }"/>
						<c:param name="fno" value="${fno }"/>
					</c:url> 
					<a href="${ after }"> > </a>
				</c:if>
			
			</div>
						</div>
					</div>	
				</c:if>
			</div>
		</div>
   </section>
   <script>
   		$(function(){
   			$('.deleteBtn').click(function(){
   				var bool = confirm('정말 삭제하시겠습니까?');
   				var qno = $(this).children('#qno').val();
   				if(bool){
   					$.ajax({
   						url:'deleteQnA.ho',
   						data:{qno:qno},
   						success:function(data){
   							location.reload();
   						}
   					});
   				}else{
   					return false;
   				}
   			});
   			
   			$('#qna_btn').click(function(){
   				var loginUser = $('#userId').val();
   				console.log(loginUser);
   				if(loginUser == ""){
   					alert('로그인 후에 이용가능합니다.');
   					return false;
   				}
   			});
   			
   			$('.r_replyBtn').click(function(){
				var div = $(this).next();
				var css = $(this).next().css('display');
				var textarea = div.find('.recontent');
				console.log(css);
				if(css == "block"){
					$(this).text('답변하기');
					var cbool = confirm('답변작성을 취소 하시겠습니까?\n작성중인 답변은 저장되지않습니다.');
					if(cbool){
						textarea.val('');
						div.hide();	
					}else{
						$(this).text('답변취소');	
					}
				}else{
					$(this).text('답변취소');
					div.show();
				}
				
   			});
   			
   			// 답변이 비어있는지 안비어있는지 검사
   			$('.recontent').focus(function(){
   	    		var textarea = $(this).val();
   	    		if(textarea.length != 0 || $.trim(textarea) != 0){
   	    			$(this).next('.enrollBtn').addClass('text').attr('disabled',false);
   	    		}else{
   	    			$(this).next('.enrollBtn').removeClass('text').attr('disabled',true);
   	    		}
   	    	});
   	    	$('.recontent').blur(function(){
   	    		var textarea1 = $(this).val();
   	    		if(textarea1.length != 0 || $.trim(textarea1) != 0){
   	    			$(this).next('.enrollBtn').addClass('text').attr('disabled',false);
   	    		}else{
   	    			$(this).next('.enrollBtn').removeClass('text').attr('disabled',true);
   	    		}
   	    	});
   	    	$('.recontent').keyup(function(){
   	    		var textarea1 = $(this).val();
   	    		if(textarea1.length != 0 || $.trim(textarea1) != 0){
   	    			$(this).next('.enrollBtn').addClass('text').attr('disabled',false);
   	    		}else{
   	    			$(this).next('.enrollBtn').removeClass('text').attr('disabled',true);
   	    		}
   	    	});
   			
   	    	// 답변 작성한 날짜 받아오는거
   	    	function getTodayType1(){
   	    		var date = new Date();
   	    		return date.getFullYear() + "-" + ("0" +(date.getMonth() + 1)).slice(-2) + "-" +("0"+date.getDate()).slice(-2);
   	    	}
   	    	
   			// 답변 등록
   			$('.enrollBtn').click(function(){
   				var reply = $(this).closest('.r_reply'); // 답글 달기 영역
   				var recontent = $(this).prev().val(); // 문의 내용
   				var rno = $(this).nextAll('.reno').val(); //문의 번호
   				var rhost = $(this).nextAll('.rhost').val(); // 작성자 : 호스트
   				var today = getTodayType1();
   				
   				
   				var reList = reply.next().children(); // 작성 완료 누를시 보여지는 댓글 영역
 				var Lcontent = reList.find('.r_reList_recontent'); // 답글 내용
   					$.ajax({
   						url:'enrollReply.ho',
   						data:{recontent:recontent,rno:rno,user_id:rhost},
   						dataType:'json',
   						complete:function(data){
   							console.log(data);
   							if(data != null){
   								reply.css('display','none');
   								reList.css('display','block');
   								Lcontent.text(recontent);
   								$('.r_h_redate').text(today);
   								location.reload();
   							}else{
   								console.log('실패');
   							}
   						}
   					});
   			});
   		});
   </script>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>