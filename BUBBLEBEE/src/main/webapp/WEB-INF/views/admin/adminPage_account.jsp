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
.agreeBtn{
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
             <li id="l_like" class="nav_li"><a href="adminPageView.ad">신고 관리</a></li>
             <li id="l_class" class="nav_li"><a href="account.ad" style="color: gold">정산 관리</a></li>
             <li id="l_slist" class="nav_li"><a href="class.ad">클래스 승인</a></li>
             <li id="l_point" class="nav_li"><a href="noticeInsertView.ad">공지글 관리</a></li>
		</ul>
       <div id="c_body">
          <div id="content_list">
             <table class="table table-hover" style="table-layout: fixed;">
             	<thead>
             	<tr>
             		<th style="width: 11%">정산 요청일</th>
             		<th style="width: 12%">호스트</th>
             		<th style="width: 31%">클래스명</th>
             		<th style="width: 5%">참여</th>
             		<th style="text-align: right">매출</th>
             		<th style="text-align: right">실정산금액</th>
             		<th style="text-align: center;">승인</th>
             	</tr>
             	</thead>
             	<tbody>
             	<tr>
             		<td>2020-05-09</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">닌텐도사주세요22222222222</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">혼밥 도자기세트혼밥 도자기세트혼밥 도자기세트혼밥 도자기세트혼밥 도자기세트</td>
             		<td>10</td>
             		<td style="text-align: right">1,000,000</td>
             		<td style="text-align: right">700,000</td>
             		<td style="text-align: center;"><button class="agreeBtn">정산승인</button></td>
             	</tr>
             	<tr>
             		<td>2020-05-09</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">닌텐도사주세요</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">혼밥 도자기세트</td>
             		<td>10</td>
             		<td style="text-align: right">1,000,000</td>
             		<td style="text-align: right">700,000</td>
             		<td style="text-align: center;"><button class="agreeBtn">정산승인</button></td>
             	</tr>
             	<tr>
             		<td>2020-05-09</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">닌텐도사주세요</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">혼밥 도자기세트</td>
             		<td>10</td>
             		<td style="text-align: right">1,000,000</td>
             		<td style="text-align: right">700,000</td>
             		<td style="text-align: center;"><button class="agreeBtn">정산승인</button></td>
             	</tr>
             	<tr>
             		<td>2020-05-09</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">닌텐도사주세요</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">혼밥 도자기세트</td>
             		<td>10</td>
             		<td style="text-align: right">1,000,000</td>
             		<td style="text-align: right">700,000</td>
             		<td style="text-align: center;"><button class="agreeBtn">정산승인</button></td>
             	</tr>
             	<tr>
             		<td>2020-05-09</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">닌텐도사주세요</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">혼밥 도자기세트</td>
             		<td>10</td>
             		<td style="text-align: right">1,000,000</td>
             		<td style="text-align: right">700,000</td>
             		<td style="text-align: center;"><button class="agreeBtn">정산승인</button></td>
             	</tr>
             	<tr>
             		<td>2020-05-09</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">닌텐도사주세요</td>
             		<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">혼밥 도자기세트</td>
             		<td>10</td>
             		<td style="text-align: right">1,000,000</td>
             		<td style="text-align: right">700,000</td>
             		<td style="text-align: center;"><button class="agreeBtn">정산승인</button></td>
             	</tr>
             	</tbody>
             </table>
             <div class="text-center">
             	<ul class="pagination">
             		<li><a href="#">&lt;</a></li>
             		<li><a href="#">1</a></li>
             		<li><a href="#">2</a></li>
             		<li><a href="#">3</a></li>
             		<li><a href="#">4</a></li>
             		<li><a href="#">5</a></li>
             		<li><a href="#">&gt;</a></li>
             	</ul>
             </div>
          </div>
       </div>
   </div>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
   
</body>
</html>