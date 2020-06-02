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
		    		<th>유효기간</th>
		    	</tr>
		    	<tr>
		    		<td>2020-05-26</td>
		    		<td>+ 2000</td>
		    		<td>생일</td>
		    		<td>2020-06-26 까지</td>
		    	</tr>
		    </table>
		    </div>
		 </div>
	</div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>