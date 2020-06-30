<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 좋아요</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
.agreeBtn2{
	border: none;
    background: #f1e018;
    color: #fff;
    border-radius: 5px;
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
             <li id="l_class" class="nav_li"><a href="account.ad">정산 관리</a></li>
             <li id="l_slist" class="nav_li"><a href="class.ad" style="color: gold">클래스 승인</a></li>
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
             <table class="table table-hover" style="table-layout: fixed;">
             	<thead>
             	<tr>
             		<!-- <th style="width: 13%">예상 진행일</th> -->
             		<th style="width: 20%">호스트</th>
             		<th style="width: 50%">클래스명</th>
             		<th style="text-align: center; width: 15%">승인</th>
             		<th style="text-align: center; width: 15%">거절</th>
             	</tr>
             	</thead>
             	<tbody>
             	<c:if test="${empty list}">
					<tr>
						<td colspan="4" style="text-align: center;">검색 결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach var="c" items="${ list }">
						<tr>
							<td style="display: none;">${c.fno }</td>
							<td style="display: none;">${c.user_id }</td>
	             			<td class="detailTR" style="cursor: pointer; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${c.nickname }</td>
		             		<td class="detailTR" style="cursor: pointer; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${c.ftitle }</td>
		             		<td style="text-align: center;"><button class="agreeBtn" id="agree">클래스 승인</button></td>
		             		<td style="text-align: center;"><button class="agreeBtn2" id="reject">승인 거절</button></td>
	             		</tr>
             		</c:forEach>
             	</c:if>
             	</tbody>
             </table>
             <div class="text-center">
           	<ul class="pagination">
           		<c:if test="${ pi.currentPage <= 1 }">
           			<!-- <li><a class="disable">&lt;</a></li> -->
           			<li class="disabled"><a>&lt;</a></li>
           		</c:if>
           		<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="class.ad">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<li><a href="${ before }">&lt;</a></li>
				</c:if>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<li class="active"><a>${ p }</a></li>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="class.ad">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<li><a href="${ pagination }">${ p }</a> &nbsp;</li>
					</c:if>
				</c:forEach>
				
           		<c:if test="${ pi.currentPage >= pi.maxPage }">
					<li class="disabled"><a>&gt;</a></li>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="class.ad">
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
   
   <script>
	   $('.detailTR').click(function(){
		   var fno = $(this).parent().children().eq(0).text();
	   	   location.href = 'detail.bo?fno='+ fno;
	   })
	   
	   $('.agreeBtn').click(function(){
			var fno = $(this).parent().parent().children().eq(0).text();
			var result = confirm('정말로 승인하시겠습니까?');
			if(result){
				alert('승인 처리 완료');
				location.href = 'agreeClass.ad?fno='+ fno;
			} else{
				alert('승인 처리 취소');	
			}
		})
		 $('.agreeBtn2').click(function(){
			var fno = $(this).parent().parent().children().eq(0).text();
			var id = $(this).parent().parent().children().eq(1).text();
			var title = $(this).parent().parent().children().eq(3).text();
			console.log(title);
			var result = confirm('정말로 거절하시겠습니까?');
			if(result){
				var content = window.prompt();
				location.href = 'rejectClass.ad?fno='+ fno+'&content='+content+'&title='+title+'&id='+id;
			} else{
				alert('거절 처리 취소');	
			}
		})
		
   </script>
</body>
</html>