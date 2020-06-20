<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마일리지</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;font-weight: bolder;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_point a{font-weight: bold; color: gold;}
#list_all{margin-top: 30px;}

/* 장바구니 */
#table{
	border:1px solid #eee;
	width:100%;
	margin: 0px auto;
	border-left: none;
	border-right: none;
}
#table td{line-height: 13px;font-size: 15px;font-weight: bold;padding: 18px 20px;}
#table th{line-height: 13px;font-size: 15px;font-weight: bolder;padding: 18px 20px;}
#table tr{border-bottom: 1px solid #eee;}
.paging{margin-top: 20px;text-align: center;}
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
				<div class="c_list"><a>마일리지</a></div>
			</div>
			
			<div id="list_all">
		    <table id="table">
		    	<tr>
		    		<th>발급 날짜</th>
		    		<th>마일리지</th>
		    		<th>내용</th>
		    	</tr>
		    	<c:forEach var="pe" items="${pList}">
		    		<tr>
		    		<td>${pe.p_date }</td>
		    		<td>${pe.p_money }</td>
		    		<td>${pe.p_content}</td>
		    		</tr>
		    	</c:forEach>
		    </table>
		    </div>
		    <div class="paging">
		   		<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="mypoint.mg">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a>&nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="#F39C12" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="mypoint.mg">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;&nbsp; 
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="mypoint.mg">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if> 
		    </div>
		    
		 </div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>