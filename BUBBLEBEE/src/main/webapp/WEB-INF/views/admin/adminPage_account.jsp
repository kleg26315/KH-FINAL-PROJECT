<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 좋아요</title>
</head>
<style>
section hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}
#ul_list{
   list-style: none; 
   padding:0;
   padding-right:20px;
   margin: 0;
   text-align: center;
   width: 170px;
}
#ul_ul_list{
   list-style: none; 
}
.nav_li{
    font-size: 24px;
    margin-bottom: 30px;
    font-weight: bold;
    text-align: left;
    margin-left: 32px;
}
.nav_sub_li{
	font-size: 15px;
    margin-bottom: 16px;
    font-weight: 700;
    text-align: left;
    margin-left: 10px;
}
.nav_sub_li a{
   cursor:pointer;
   color: black;
}
.nav_sub_li a:hover{
   text-decoration: none;
   color: gold;
}
.nav_li a{
   cursor:pointer;
   color: black;
}
.nav_li a:hover{
   text-decoration: none;
   color: gold;
}
#l_hostenroll{
    background: gold;
    padding: 5px 10px;
    border-radius: 5px;
} 
.agreeBtn{
	border: none;
    background: #f1e018;
    color: #fff;
    border-radius: 5px;
}
.detailTR{
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
     <c:import url="admin_header.jsp"/> 
     </header>
      <hr>
    <div id="content">
		<ul id="ul_list">
             <li id="l_class" class="nav_li"><a href="account.ad" style="color: gold">정산 관리</a></li>
             <li id="l_slist" class="nav_li"><a href="class.ad">클래스 승인</a></li>
             <li id="l_point" class="nav_li more"><a>공지글 관리</a></li>
             	<ul id="ul_ul_list" style="visibility: hidden;">
	             	<li id="l_like" class="nav_sub_li"><a href="noticeInsertView.ad">공지글 작성</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="list.no">공지글 목록</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="FAQInsertView.ad">FAQ 작성</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="FAQList.no">FAQ 목록</a></li>
             	</ul>
		</ul>
		<script>
			$(document).ready(function(){
			  $('#l_point').click(function(){
				if($('.more').hasClass('more')){
			       $('.more').addClass('closee').removeClass('more');
			       $('#ul_ul_list').css('visibility', 'visible');
			    }else if($('.closee').hasClass('closee')){
			       $('.closee').addClass('more').removeClass('closee');  
			       $('#ul_ul_list').css('visibility', 'hidden');
			    }
			  })
			})
		</script>
       <div id="c_body">
          <div id="content_list">
             <table id="table1" class="table table-hover" style="table-layout: fixed;">
             	<thead>
             	<tr>
             		<th style="display: none;">정산 요청 번호</th>
             		<th style="width: 11%">정산 요청일</th>
             		<th style="width: 17%">호스트</th>
             		<th style="width: 31%">클래스명</th>
             		<th style="width: 5%">참여</th>
             		<th style="text-align: right">매출</th>
             		<th style="text-align: right">실정산금액</th>
             		<th style="text-align: center;">승인</th>
             	</tr>
             	</thead>
             	<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="7" style="text-align: center;">검색 결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
					<tr style="display: none;">
						<td colspan="8" style="text-align: center;">현재 페이지</td>
					</tr>
					<c:forEach var="ac" items="${ list }">
						<!-- ★ 클릭 시 어떤 클래스인지 디테일 뷰로 넘어가게 하자 ★ -->
		            	<tr>
		            		<td style="display: none;">${ac.fno }</td>
		             		<td class="detailTR">${ac.bdate }</td>
		             		<td class="detailTR" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${ac.hostId }</td>
		             		<td class="detailTR" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${ac.ftitle}</td>
		             		<td class="detailTR">${ac.amount }</td>
		             		<td class="detailTR" style="text-align: right">&#8361;${ac.total }</td>
		             		<td class="detailTR" style="text-align: right">&#8361;${ac.cprice }</td>
		             		<td style="text-align: center;"><button class="agreeBtn">정산승인</button></td>
		             	</tr>
					</c:forEach>
	             	<tr style="display: none;">
						<td colspan="8">전체 페이지</td>
					</tr>
					<c:forEach var="acAll" items="${ AllList }">
		            	<tr style="display: none;">
		            		<td style="display: none;">${acAll.fno }</td>
		             		<td>${acAll.bdate }</td>
		             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${acAll.hostId }</td>
		             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${acAll.ftitle}</td>
		             		<td>${acAll.amount }</td>
		             		<td style="text-align: right">&#8361;${acAll.total }</td>
		             		<td style="text-align: right">&#8361;${acAll.cprice }</td>
		             		<td style="text-align: center;"><button class="agreeBtn">정산승인</button></td>
		             	</tr>
					</c:forEach>
				</c:if>
             	</tbody>
             </table>
             <iframe id="txtArea1" style="display:none"></iframe>
				
			<input type='button' class='btn btn-inverse' value='excel 다운' style='width:100px;height:36px;font-weight:bold; float:right;' onclick="ReportToExcelConverter()" />
			<br><br> 
            <div class="text-center">
           	<ul class="pagination">
           		<c:if test="${ pi.currentPage <= 1 }">
           			<!-- <li><a class="disable">&lt;</a></li> -->
           			<li class="disabled"><a>&lt;</a></li>
           		</c:if>
           		<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="account.ad">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<li><a href="${ before }">&lt;</a></li>
				</c:if>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<li class="active"><a>${ p }</a></li>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="account.ad">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<li><a href="${ pagination }">${ p }</a> &nbsp;</li>
					</c:if>
				</c:forEach>
				
           		<c:if test="${ pi.currentPage >= pi.maxPage }">
					<li class="disabled"><a>&gt;</a></li>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="account.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<li><a href="${ after }">&gt;</a></li>
				</c:if>
           	</ul>
         </div>
          </div>
       </div>
   </div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
   <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-1.11.0.js"></script>
   <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery.table2excel.js"></script>
   <script> 
		function ReportToExcelConverter(){
			$("#table1").table2excel({
				name: "Excel Document Name",
				filename: "report",
				fileext: ".xls",
				exclude_img: true,
				exclude_links: true,
				exclude_inputs: true
			});
		};
		
		$('.detailTR').click(function(){
			   var fno = $(this).parent().children().eq(0).text();
		   	   location.href = 'detail.bo?fno='+ fno;
		})
		   
		$('.agreeBtn').click(function(){
			var fno = $(this).parent().parent().children().eq(0).text();
			var bdate = $(this).parent().parent().children().eq(1).text();
			var id = $(this).parent().parent().children().eq(2).text();
			var ftitle = $(this).parent().parent().children().eq(3).text();
			var people = $(this).parent().parent().children().eq(4).text();
			var sales = $(this).parent().parent().children().eq(5).text();
			var amount = $(this).parent().parent().children().eq(6).text();

			var result = confirm('정말로 정산요청을 승인하시겠습니까?');
			if(result){
				alert('정산 처리 완료');
				location.href = 'agreeAccount.ad?fno='+ fno+"&id="+id+"&ftitle="+ftitle+"&people="+people+"&sales="+sales+"&amount="+amount+"&bdate="+bdate;
			} else{
				alert('정산 처리 취소');	
			}
		})
	</script>
</body>
</html>