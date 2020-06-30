<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정산요청</title>
     <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
#content{display: flex;align-items: flex-start;height: 500px;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}
.main_title{font-weight: bolder;font-size: 25px;}

.main_wrap{display: flex;justify-content: space-between;}

.ac_all{margin: 10px 0;}
#table{width: 100%;}
th{font-size: 15px;padding:20px;}
tbody td{line-height: 30px;}
/* 정산요청 버튼 */
.re_account_btn{
    background: #F39C12;
    width: max-content;
    color: white;
    margin:5px;
    padding: 5px;
    border-radius: 5px;
}
.re_com_account_btn{
	background: #eee;
    width: max-content;
    color: black;
    margin:5px;
    padding: 5px;
    border-radius: 5px;
}

.noaccount{background: #F39C12; color: white;}
.comaccount{background: #eee;color: white;}
.re_account_btn:hover {
	cursor: pointer;
}
</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
    <div id="content">
	 	<nav style="height: 100%; width: 220px; border-right:1px solid gray;">
	 		 <c:import url="../layout/hostpage_nav.jsp"/> 
	 	</nav>
	    <div id="c_body">
	    	<div>
			     <div class="main_wrap">
			     	<div class="main_title">정산 요청</div>
			     	<div>
			     	</div>
			     	</div>
			     <div class="ac_all">
			     	<div class="ac_main">
				     	<table border="1" id="table">
				     		<thead>
				     			<tr>
				     				<th>진행일</th>
				     				<th>클래스명</th>
				     				<th>구매</th>
				     				<th>수수료율</th>
				     				<th>매출</th>
				     				<th>수수료</th>
				     				<th>실정산금액</th>
				     				<th>상태</th>
				     			</tr>
				     		</thead>
				     		<tbody>
				     			<c:forEach var="ac" items="${acList}"> 
				     			<tr>
				     				<td>${ac.bdate }</td>
				     				<td>${ac.ftitle} </td>
				     				<td>${ac.amount}</td>
				     				<td>20%</td>
				     				<td>${ac.total}</td>
				     				<td>${ac.fees}</td>
				     				<td>${ac.cprice}</td>
				     				<td>
				     					<c:choose>
				     						<c:when test="${ac.buy_status}">
						     					<div class="re_account_wrap">
						     					<div class="re_account_btn ">정산요청하기</div>
						     					<input type="hidden" value="${ac.bdate}" class="bdate">
						     					<input type="hidden" value="${ac.ftitle}" class="ftitle">
						     					<input type="hidden" value="${ac.amount}" class="amount">
						     					<input type="hidden" value="${ac.total}" class="total">
						     					<input type="hidden" value="${ac.cprice}" class="cprice">
						     					<input type="hidden" value="${ac.fno }" class="fno">
						     					<input type="hidden" value="${ac.buy_status }" class="buy_status">
						     					</div>
				     						</c:when>
				     						<c:otherwise>
				     							<div class="re_com_account">
				     								<div class="re_com_account_btn">정산 요청 완료</div>
				     							</div>
				     						</c:otherwise>
				     					</c:choose>
				     				</td>
				     			</tr>
				     			</c:forEach>
				     		</tbody>
				     	</table>
			     	</div>
			     </div>
			  </div>  
		 </div>
	</div>
   </section>
   <script>
   $(function(){
	  $('.re_account_wrap').click(function(){
		 var hostId = "${loginUser.id}";
		 var bdate = $(this).find('.bdate').val();
		 var ftitle = $(this).find('.ftitle').val();
		 var amount = $(this).find('.amount').val();
		 var total = $(this).find('.total').val();
		 var cprice = $(this).find('.cprice').val();
		 var fno = $(this).find('.fno').val();
		 var buy_status = $(this).find('.buy_status').val();
		 
		 var abtn = $(this).find('.re_account_btn');
		 $.ajax({
			url:'requestAccount.ho',
			data:{hostId:hostId,bdate:bdate,ftitle:ftitle,amount:amount,total:total,cprice:cprice,fno:fno,buy_status:buy_status},
			success:function(data){
				if(data == "true"){
				abtn.toggleClass('comaccount');
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