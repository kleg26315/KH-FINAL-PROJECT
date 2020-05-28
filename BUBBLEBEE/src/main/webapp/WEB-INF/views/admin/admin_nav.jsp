<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
</head>
<body>
   <ul id="ul_list">
             <li id="l_like" class="nav_li"><a style="color: gold">신고 관리</a></li>
             	<ul id="ul_ul_list">
	             	<li id="l_like" class="nav_sub_li"><a style="color: gold">모임 신고</a></li>
	             	<li id="l_like" class="nav_sub_li"><a>클래스 신고</a></li>
	             	<li id="l_like" class="nav_sub_li"><a>판매 신고</a></li>
             	</ul>
             <li id="l_class" class="nav_li"><a>정산 관리</a></li>
             <li id="l_slist" class="nav_li"><a>클래스 승인</a></li>
             <li id="l_point" class="nav_li"><a>공지글 관리</a></li>
             	<ul id="ul_ul_list">
	             	<li id="l_like" class="nav_sub_li"><a>공지글 작성</a></li>
	             	<li id="l_like" class="nav_sub_li"><a>FAQ 작성</a></li>
             	</ul>
    </ul>
</body>
</html>