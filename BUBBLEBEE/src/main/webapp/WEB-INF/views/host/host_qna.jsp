<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 프로필 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/host_qna.css">
</head>
<style>
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
						<form action="hostQnAwriteView.ho">
						<button id="qna_btn">문의하기</button>
						<input type="hidden" name="fno" value="${fno}">
						</form>
				</div>
				<hr>
				<!-- 문의가 없을때 -->
<!-- 				<div id="no_all"> -->
<!-- 					<div id="no_wrap"> -->
<!-- 						<div id="no_flex"> -->
<%-- 						<div id="no_img_wrap"><img src="${contextPath }/resources/img/review.png" width="80px" height="80px"></div> --%>
<!-- 						<div id="no_text"><div>문의 사항을 남겨주세요!</div></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- 문의가 있을때 -->
				<div id="openList">
			<div id="review_all">
				<div id="rlist_all">
				<c:forEach var="r" items="${rList }">
					<div class="rall">
						<div class="rprofile_all">
							<div class="r_img"><img src="${contextPath}/resources/img/users.png" width="45px" height="45px"></div>
							<div class="rprofile_info">
								<div class="r_name">${r.member.nickName}</div>
								<div class="r_content">
									<div class="r_date">${r.q_create_date } 작성  | 공개글</div>
								</div>
							</div>
						</div>
						<div class="rcontent_all">
						${r.qcontent }
						</div>
						<!-- 후기 답글 -->
						<div class="reply_all">
							<div class="reply_wrap">
								<div class="reply_profile">
									<div class="re_pro_wrap">
										<div class="re_img"><img src="${contextPath}/resources/img/users.png" width="40px" height="40px"></div>
										<div class="re_intro">
											<div class="re_name">호스트 이름</div>
											<div class="re_date">2020년 6월 11일 14:25 작성</div>
										</div>
									</div>
									<div class="re_content">안녕하세요 떡볶이 입니다 랄라라라랄라라라라라랄라랄ㄹ
										벌써 일요일이네 시간 무슨일이야 
										재밌었어요 감사합니다
										아니 근데 세상에 말이야 어?! 
										저도 내일 떡볶이 먹을꺼에요
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
					<div class="rall">
						<div class="rprofile_all">
							<div class="r_img">
								<span class="fa-stack fa-lg" style="font-size: 22.5px;">
									<i class="fas fa-circle fa-stack-2x"></i>
									<i class="fas fa-lock fa-stack-1x fa-inverse"></i>
								</span>
							</div>
							<div class="rprofile_info">
								<div class="r_name">전**</div>
								<div class="r_content">
									<div class="r_date">2020년 6월 10일 18:23 작성</div>
								</div>
							</div>
						</div>
						<div class="rcontent_all">비밀글 입니다.</div>
						<!-- 후기 답글 -->
						<div class="reply_all">
							<div class="reply_wrap">
								<div class="reply_profile">
									<div class="re_pro_wrap">
										<div class="re_img"><img src="${contextPath}/resources/img/users.png" width="40px" height="40px"></div>
										<div class="re_intro">
											<div class="re_name">호스트 이름</div>
											<div class="re_date">2020년 6월 11일 14:25 작성</div>
										</div>
									</div>
									<div class="re_content">비밀글 입니다.</div>
								</div>
							</div>
						</div>
					</div>
					<div id="pagingBtn">
						페이징 버튼 추가 예정
					</div>
				</div>
			</div>
	      </div>
			</div>
      </div>
   </section>
   <script>
   
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>