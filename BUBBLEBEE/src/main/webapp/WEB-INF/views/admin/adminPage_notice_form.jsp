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
   color: black;
}
.nav_li a{
   cursor:pointer;
   color: black;
}
.nav_li a:hover{
   text-decoration: none;
   color: black;
}
#l_hostenroll{
    background: gold;
    padding: 5px 10px;
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
             <li id="l_like" class="nav_li"><a href="adminPageView.ad">신고 관리</a></li>
             <li id="l_class" class="nav_li"><a href="account.ad">정산 관리</a></li>
             <li id="l_slist" class="nav_li"><a href="class.ad">클래스 승인</a></li>
             <li id="l_point" class="nav_li"><a href="noticeInsertView.ad" style="color: gold">공지글 관리</a></li>
             	<ul id="ul_ul_list">
	             	<li id="l_like" class="nav_sub_li"><a href="noticeInsertView.ad" style="color: gold">공지글 작성</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="list.no">공지글 목록</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="FAQInsertView.ad">FAQ 작성</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="#">FAQ 목록</a></li>
             	</ul>
		</ul>
       <div id="c_body">
          <div id="content_list">
             
          </div>
       </div>
   </div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
   
</body>
</html>