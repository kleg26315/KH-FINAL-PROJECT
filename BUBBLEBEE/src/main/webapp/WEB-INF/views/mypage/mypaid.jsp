<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 내역</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;font-weight: bolder;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_paid a{font-weight: bold; color: gold;}
#list_all{margin-top: 30px;}
/* 결제 정보 */
.paysimple:hover {
	cursor: pointer;
}

</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
<!--    <div id="main"> -->
     <header>
     <c:import url="../layout/mypage_header.jsp"/> 
     </header>
   	<hr id="main_hr">
    <div id="content">
	 	<nav>
	   		<c:import url="../layout/mypage_nav.jsp"/> 
	   </nav>
	    <div id="c_body">
		    <div id="content_list">
			    	<div class="c_list"><a>결제 내역</a></div>
			</div>
			<!-- 결제 내역이 없는 경우 -->
			<c:if test="${empty pList}">
				<div class="no_pList">
					<div>결제 내역이 없습니다.</div>
				</div>
			</c:if>
			<!-- 결제 내역이 있는 경우 -->
			<c:if test="${!empty pList }">
			<div id="list_all">
		     <table border="1" style="width:100%;">
		<tr>
			<th style="width:20%;text-align:center;">구매 날짜</th>
			<th style="width:40%;text-align:center;">상품정보</th>
			<th style="width:20%;text-align:center;">판매자</th>
			<th style="width:20%;text-align:center;">상품 금액</th>
		</tr>
		<c:forEach var="pl" items="${pList }">
		<c:set var="rf2" value="${ pl.renamefilename }"/>
                     <% 
                     	String rf2 = (String)pageContext.getAttribute("rf2");
                     	String str2 = null;
                     	if(!rf2.contains(",")) {
                     		str2 = rf2;
                     	} else {
                     		int idx2 = rf2.indexOf(",");
                			str2 = rf2.substring(0, idx2);
                     	}
            			
            			pageContext.setAttribute("str2", str2);
                     %> 
		<tr class="paysimple">
			<td style="text-align:center;">${pl.bdate}</td>
			<td>
				<div style="display: flex; justify-content:flex-start;">
				<a style="margin: 20px 20px;"><img width="80" height="80" src="${contextPath }/resources/buploadFiles/${ str2 }"></a>
				<div style="display: flex; flex-direction: column; align-content: space-around; margin: auto 5px; width: 100%;">
				<span>${pl.ftitle }</span>
				<hr style="width: 100%;">
				${pl.oname}
				</div>
				</div>
			</td>
			<td style="text-align:center;">${pl.nickname }</td>
			<td style="text-align:center;">${pl.price }원</td>
		</tr>
		<tr style="display: none;" class="paydetail">
			<td colspan="4">
				<table>
					<tr>
						<th colspan="2">배송 정보</th>
					</tr>
					<tr>
						<th>이름</th>
						<td>${pl.gname }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${pl.gphone }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${pl.address }</td>
					</tr>
					<tr>
						<th>배송 메세지</th>
						<td>${pl.gmsg }</td>
					</tr>
					<tr>
						<th colspan="2">결제 정보</th>
					</tr>
					<tr>
						<th>상품 금액</th>
						<td>${pl.price }</td>
					</tr>
					<tr>
						<th>할인</th>
						<td>${pl.price - pl.gpay }</td>
					</tr>
					<tr>
						<th>결제 금액</th>
						<td>${pl.gpay }</td>
					</tr>
				</table>				
			</td>
		</tr>
		</c:forEach>
		</table>
		<!-- 페이징 영역 -->
				<div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
		      <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					< &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="mypaid.mg">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }"> < </a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="gold" size="4"><b>[${ p }]</b></font>&nbsp;
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="mypaid.mg">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="mypaid.mg">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"> > </a>
				</c:if>
			
			</div>
		</div>
		</c:if>
		 </div>
	</div>
   </section>
   <script>
   	$(function(){
   		$('.paysimple').click(function(){
   			$(this).next().toggle();
   		});
   	});
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>