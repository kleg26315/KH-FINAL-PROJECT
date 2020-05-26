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
   max-width: 135px;
}
.nav_li{
   font-size:16px;
   margin-bottom: 30px;
   font-weight: 500;
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
             <li id="l_like" class="nav_li"><a>좋아요</a></li>
             <li id="l_class" class="nav_li"><a>참여 모임/클래스</a></li>
             <li id="l_slist" class="nav_li"><a>장바구니</a></li>
             <li id="l_point" class="nav_li"><a>마일리지</a></li>
             <li id="l_modify" class="nav_li"><a>정보 수정</a></li>
             <li id="l_review" class="nav_li"><a>후기</a></li>
             <li id="l_hostenroll" class="nav_li"><a>호스트 등록</a></li>
    </ul>
</body>
</html>