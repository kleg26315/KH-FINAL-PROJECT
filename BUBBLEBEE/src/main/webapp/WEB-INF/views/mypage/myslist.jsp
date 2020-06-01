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
		<div style="margin-top: 30px;">
		<table id="table">
		<tr>
			<th colspan="2" style="width:40%;text-align:center;">상품정보</th>
			<th style="width:20%;text-align:center;" class="">판매자</th>
			<th style="width:20%;text-align:center;" class="">상품 금액</th>
			<th style="width:20%;text-align:center;" class="">주문</th>
		</tr>
		<tr>
			<td>
				<span><input type="checkbox" value="" style="width: 15px;height: 15px;"></span>
			</td>
			<td>
				<div style="display: flex; justify-content:flex-start;">
				<a style="margin: 20px 20px;"><img width="80" height="80"src="<%=request.getContextPath()%>/resources/img/main_resize.png"></a>
				<div style="display: flex; flex-direction: column; align-content: space-around; margin: auto 5px; width: 100%;">
				<span>상품명</span>
				<hr style="width: 100%;">
				<span>옵션</span>
				</div>
				</div>
			</td>
			<td>전희은</td>
			<td>100,000</td>
			<td>
			<div><button>주문하기</button></div>
			<br>
			<div><button id="deleteBtn">삭제하기</button></div>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">
				<span><input type="checkbox" value="" style="width: 15px;height: 15px;"></span>
			</td>
			<td>
				<div style="display: flex; justify-content:flex-start;">
				<a style="margin: 20px 20px;"><img width="80" height="80"src="<%=request.getContextPath()%>/resources/img/main_resize.png"></a>
				<div style="display: flex; flex-direction: column; align-content: space-around; margin: auto 5px; width: 100%;">
				<span>상품명</span>
				<hr style="width: 100%;">
				<span>옵션</span>
				</div>
				</div>
			</td>
			<td>전희은</td>
			<td>100,000</td>
			<td>
			<div><button id="orderBtn">주문하기</button></div>
			<br>
			<div><button id="deleteBtn">삭제하기</button></div>
			</td>
		</tr>
		</table>
		</div>
		 </div>
	</div>
   </section>
   <script>
   		$(function(){
   			$('#deleteBtn').click(function(){
   				var bool = confirm('정말로 삭제하시겠습니까?');
   				if(bool){
   					alert('ajax 사용 예정');
   				}
   			});
   		});
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>