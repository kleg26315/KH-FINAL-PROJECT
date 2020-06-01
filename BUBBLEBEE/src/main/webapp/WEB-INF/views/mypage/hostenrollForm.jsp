<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호스트 등록하기</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_modify a{font-weight: bold; color: gold;}
#profile{font-weight: bolder;}

#pro_all{margin:30px 0; display: flex; flex-direction: column;} 
.pro_wrap{display: flex;margin:20px 0;}
.title{font-weight: bolder; width:100px; }

.m_title{width:60px;}
.p_content{
	-webkit-box-flex: 1;
    flex-grow: 1;
    flex-shrink: 1;
	flex-basis: auto;
    padding-left: 30px;
    text-align: left;
    }
.inter_wrap{
	padding-bottom: 30px;
	margin-bottom: 20px;
	border-bottom: 1px solid #eee;
}
.inter_title{
	margin-bottom: 20px;
}
#submit_wrap{
	margin-top: 30px;
	text-align: center;
	justify-content: center;
}

</style>
<body>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>
   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
    <div id="content">
	    <div id="c_body">
		    <form action="" method="post">
			   <div id="profile" class="c_list"><a>호스트 등록하기</a></div>
				  <div id="pro_all">
					   <div class="pro_wrap">
						   	<div class="title">프로필 사진</div>
						   	<div class="p_content"><input type="text" value="" id="nickname" name="nickname"></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">전화번호 *</div>
						   	<div class="p_content"><input type="text" id="phone" value="01090783699" name="phone"></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">이름 *</div>
						   	<div class="p_content"><input type="text" name="name" value=""></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">닉네임</div>
						   	<div class="p_content"><input type="text" name="nickname" value="${SessionScope.loginUser.nickname }"></div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">소개 *</div>
						   	<div class="p_content">
						   <textarea rows="5" cols="80"></textarea>
						   </div>
					  </div>
					  <div class="pro_wrap">
						   	<div class="title">입금 계좌 *</div>
						   	<div class="p_content">
							<select>
								<option>신한</option>
								<option>국민</option>
							</select>
							<input type="text" name="ac_name" placeholder="예금주명">
							<input type="text" name="ac_num" placeholder="-를 빼고 숫자만 입력해주세요">
						   	</div>
					  </div>
						  <div id="submit_wrap">
						  	<input type="button" value="이전으로" id="cancle">
						  	<input type="submit" value="등록하기" id="submit">
						  </div>
				  </div>
			  </form>
		</div>
	</div>
   </section>
   <script>
   		$(function(){
   			$('#cancle').click(function(){
   				var bool = confirm('이전으로 돌아가시겠습니까?');
   				if(bool){
   					location.href="javascript:history.back();";	
   				}
   			});
   		});
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>