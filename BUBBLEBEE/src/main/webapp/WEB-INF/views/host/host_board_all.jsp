<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 클래스</title>
     <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}
.main_title{font-weight: bolder;font-size: 25px;}

/**/
.class_list{display: flex;justify-content: flex-start;margin: 10px 0;}
.list_text{width: 110px;font-size: 17px;padding: 15px 0;text-align: center;}
.list_text:hover{cursor: pointer;}
#ongoing{border-bottom: 1px solid #F39C12;color:#F39C12; }
/* 클래스 O */
.main_all{display:flex;flex-wrap: wrap;}
.class_all{display: flex;flex-direction: column;text-align: center;margin-right: 40px; margin-bottom: 30px;border: 1px solid #eee;}
.text_wrap{margin: 10px 0;}
.text{display:flex; margin: 10px 0;}
.img_wrap{margin:0 10px;}
.btn_wrap{display: flex;}
.button{flex-grow: 1;margin-top: 10px;height: 30px;}
.button button{width: 90%;height: 100%;border: none;background:#F39C12;border-radius: 5px;}

/* 클래스 X */
.no_result_all{margin: 60px 0;}
.no_result{text-align: center;}
.no_text{font-size: 15px; margin: 10px 0;}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
    <div id="content">
	 	<nav style="height: 100%; width: 200px; border-right:1px solid gray;">
	 		 <c:import url="../layout/hostpage_nav.jsp"/> 
	 	</nav>
	    <div id="c_body">
		    <div class="main_title">내 클래스</div>
			<div class="class_list">
				<div class="list_text" id="ongoing">진행중</div>
				<div class="list_text" id="wait">대기중</div>
				<div class="list_text" id="end">종료</div>
			</div>
			<!-- 모임/클래스/작품이 없는 경우 -->
		    <c:if test="${empty bList }">
		    <div class="no_result_all">
			    <div class="no_result">
			    	<div class="no_img">
			    	<c:choose>
			    		<c:when test="${ftype == 1 }">
			    		<img src="${contextPath}/resources/img/moimx.png" width="100" height="100">
			    		</c:when>
			    		<c:when test="${ftype == 2 }">
			    		<img src="${contextPath}/resources/img/classx.png" width="100" height="100">
			    		</c:when>
			    		<c:otherwise>
			    		<img src="${contextPath}/resources/img/giftx.png" width="100" height="100">
			    		</c:otherwise>
			    	</c:choose>
			    	</div>
			    	<div class="no_text">
			    	<c:choose>
			    		<c:when test="${ftype == 1 }">
			    		진행중인 모임이 없습니다.
			    		</c:when>
			    		<c:when test="${ftype == 2 }">
			    		진행중인 클래스가 없습니다.
			    		</c:when>
			    		<c:otherwise>
			    		판매중인 작품이 없습니다.
			    		</c:otherwise>
			    	</c:choose>
			    	</div>
			    </div>
		    </div>
		    </c:if>
			
			<!-- 모임/클래스/작품이 있는 경우 -->
			<c:if test="${!empty bList }">
			<div class="main_all">
				<c:forEach var="b" items="${bList}">
		    <!-- 진행중인 모임이 있을 때  -->
		    	<div class="class_all">
		    		<div><img src="${contextPath}/resources/img/nightsky.jpg" width="250px" height="200px"></div>
			    	<div class="text_wrap">
			    		<div>
			    			<div class="text">
			    				<div class="img_wrap"><img src="${contextPath}/resources/img/info.png" width="18px" height="18px" ></div>
			    				<div>${b.small_title }</div>
			    			</div>
			    			<div class="text">
			    				<div class="img_wrap"><img src="${contextPath}/resources/img/date.png" width="18px" height="18px" ></div>
			    				<div>2020/05/10(일) 오후 1시</div>
			    			</div>
			    			<div class="text">
			    				<div class="img_wrap"><img src="${contextPath}/resources/img/place.png" width="18px" height="18px" ></div>
			    				<div>
			    				${b.location}
			    				</div>
			    			</div>
			    			<div class="text">
			    				<div class="img_wrap"><img src="${contextPath}/resources/img/coin.png" width="18px" height="18px" ></div>
			    				<div>개인비용</div>
			    			</div>
			    		</div>
			    		<div class="btn_wrap">
			    			<div class="button" id="modifybtn"><input type="hidden" name="fno" value="${b.fno}"><button>수정</button></div>
			    			<div class="button" id="deletebtn"><button>삭제</button></div>
			    		</div>
			    	</div>
		    	</div>
				</c:forEach>
				<!-- 페이징 영역 -->
				<div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
		      <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					< &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="hostBoardAll.ho?ftype=${ftype}">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
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
						<c:url var="pagination" value="hostBoardAll.ho?ftype=${ftype}">
							<c:param name="page" value="${ p }"/>
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
					<c:url var="after" value="hostBoardAll.ho?ftype=${ftype}">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
						<c:param name="fno" value="${fno }"/>
					</c:url> 
					<a href="${ after }"> > </a>
				</c:if>
			
			</div>
		    </div>
			</c:if>
		 </div>
	</div>
	<script>
		$(function(){
			// 삭제
			$('#deletebtn').click(function(){
				var bool = window.confirm('정말 삭제하시겠습니까?');
				if(bool){
					window.alert('삭제');
				}else{
					window.alert('취소');	
				}
			});
			
			$('#modifybtn').click(function(){
				location.href="";
			})
		});
	</script>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>