<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보 수정</title>
</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;justify-content: center;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}

#l_modify a{font-weight: bold; color: gold;}
#c_body input[type=password]{width: 300px;height: 50px;border: none;border-bottom:1px solid #eee; margin-bottom: 10px;}
input[type=submit]{width: 300px;height: 50px;}
#pwd_all{text-align: center;display:flex;flex-direction: column;}
#pwd_title{font-size: 20px;font-weight: bolder;margin-bottom: 20px;}
#pwd_submit{margin: 20px 0;}
#pwd_submit input{background: #F39C12; border:none;outline: none;border-radius: 5px;color: white;}
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
		    <form action="">
		    	<div id="pwd_all">
		    		<div>
			    		<div id="pwd_title">비밀번호 수정</div>
				    	<div id="pwd_wrap">
				    		<div><input type="password" id="pwd" name="pwd" placeholder="현재 비밀번호를 입력하세요"></div>
				    		<div><input type="password" id="newpwd" name="newpwd" placeholder="새로운 비밀번호를 입력하세요"></div>
				    		<div><input type="password" id="newpwd1" name="newpwd1" placeholder="새 비밀번호 확인"></div>
				    	</div>
				    </div>
			    	<div id="pwd_submit"><input type="submit" value="변경하기"></div>
			    </div>
		    </form>
		 </div>
	</div>
   </section>
   <script>
   	$(function(){
   		//새 비밀번호 확인
   		$('#newpwd1').change(function(){
   			var s = $('#newpwd').val();
   			var ss = $('#newpwd1').val();
   			if(s != ss){
   				alert('비밀번호 확인이 일치하지않습니다!');
   				$(this).select();
   			}
   		});
   		
   		$('#pwd_submit').click(function(){
   			var s1 = $('#pwd').val();
   			var s2 = $('#newpwd').val();
   			var s3 = $('#newpwd1').val();
   		});   	
   		
   	});
   </script>
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
</body>
</html>