<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;font-weight: bolder;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_slist a{font-weight: bold; color: gold;}

#table{
	border:1px solid #eee;
	width:100%;
	margin: 0px auto;
	border-left: none;
	border-right: none;
}
#table tr{border-bottom: 1px solid #eee;}
#table th{line-height: 40px;font-size: 15px;text-align:center;border-bottom:1px solid #eee;border-bottom:1px solid #eee;background: lightgray;}
#table td{text-align: center;}
#table td:not(:last-child){border-right: 1px solid #eee;}
#table button{background: #F39C12;border: none;padding:5px 10px;border-radius: 5px;font-weight: bold;}
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
		    	<div  class="c_list"><a>장바구니</a></div>
		    </div>
		    <!-- 장바구니가 비어있을 때 -->
		    <c:if test="${empty sList }">
		    <div class="no_items_all">
		    	<div>상품이 없습니다.</div>
		    </div>
		    </c:if>
		    <!-- 장바구니가 비어있지않을때  -->
		    <c:if test="${!empty sList }">
			<div style="margin-top: 30px;">
			<table id="table">
			<tr>
				<th style="width:50%;text-align:center;">상품정보</th>
				<th style="width:15%;text-align:center;" class="">판매자</th>
				<th style="width:15%;text-align:center;" class="">상품 금액</th>
				<th style="width:10%;text-align:center;" class="">수량</th>
				<th style="width:10%;text-align:center;" class="">주문</th>
			</tr>
			<c:forEach var="sh" items="${sList}">
			<c:set var="rf2" value="${ sh.renamefilename }"/>
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
			<tr>
				<td>
					<div style="display: flex; justify-content:flex-start;">
					<a style="margin: 20px 20px;"><img width="120" height="120" src="${contextPath }/resources/buploadFiles/${ str2 }"></a>
					<div style="display: flex; flex-direction: column; align-content: space-around; margin: auto 5px; width: 100%;">
					<span>${sh.ftitle}</span>
					<hr style="width: 100%;">
					<span>${sh.oname }</span>
					</div>
					</div>
				</td>
				<td>${sh.nickName }</td>
				<td>${sh.price * sh.tcount}원</td>
				<td>${sh.tcount}개</td>
				<td>
				<div class="buyWrap">
				<c:url var="buy" value="purchase1First.pu">
					<c:param name="fNo" value="${sh.fno}"></c:param>
					<c:param name="ocode" value="${sh.tcount}"></c:param>
					<c:param name="oNo" value="${sh.ono }"></c:param>
				</c:url>
				<a href="${ buy}">
				<button class="buyBtn">주문하기</button>
				</a>
				</div>
				<br>
				<div class="deleteWrap">
				<button class="deleteBtn">삭제하기</button>
				<input type="hidden" value="${sh.tno}" name="tno" class="tno">
				</div>
				</td>
			</tr>
			</c:forEach>
			</table>
			</div>
			<!-- 페이징 영역 -->
				<div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
		      <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					< &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="myslist.mg">
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
						<c:url var="pagination" value="myslist.mg">
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
					<c:url var="after" value="myslist.mg">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"> > </a>
				</c:if>
			
			</div>
			</c:if>
		 </div>
	</div>
   </section>
   <script>
   		$(function(){
   			$('.deleteWrap').click(function(){
   				var bool = confirm('정말로 삭제하시겠습니까?');
   				var tno = $(this).find('.tno').val();
   				if(bool){
   					console.log(tno);
   					$.ajax({
   						url:'sListdelete.mg',
   						data:{tno:tno},
   						success:function(data){
   							console.log(data);
   							if(data == 'true'){
   							alert('삭제되었습니다.');
   							location.reload();
   							}
   						}
   					});
   				}
   			});
   		});
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>