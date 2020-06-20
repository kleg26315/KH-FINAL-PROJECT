
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 알림</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

</head>
<style>
#main_hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px; font-weight: bold;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}
#alert a, #l_alert a{font-weight: bold;color: gold;}
#alert_all{margin-top: 30px;}
#alert_wrap{display: flex;border: 1px solid #eee;padding:20px 10px;margin-bottom: 20px;}

.tool-section {
    display: flex;
    background-color: #f8f9fa;
    padding: 14px 12px;
    justify-content: space-between;
    margin-bottom: 16px;
}
.tool-section .unchecked-cnt {
    color: #212529;
    font-size: 1.5rem;
}
.tool-section .unchecked-cnt .cnt {
    color: #F39C12;
    font-weight: 700;
}
.tool-section .all-check-cover {
    display: flex;
}
.tool-section .all-check-cover .all-check {
    border: none;
    background: none;
    font-size: 14px;
    display: inline-flex;
    align-items: center;
    color: #212529;
    cursor: pointer;
}
.tool-section .all-check-cover .all-check:disabled .infd-icon {
    background-color: #adb5bd;
}
.tool-section .all-check-cover .all-check .infd-icon {
    font-size: 8px;
    color: #fff;
    background-color: #ff5b16;
    width: 13px;
    height: 13px;
    margin-right: 8px;
}
.infd-icon.circle {
    border-radius: 100%;
}
.infd-icon {
    display: inline-flex;
    justify-content: center;
    align-items: center;
}
.infd-button, .infd-icon {
    display: flex;
    align-items: center;
    justify-content: center;
}
.far {
    font-weight: 400;
}
.fal, .far {
    font-family: "Font Awesome 5 Pro";
}
.fa, .fab, .fad, .fal, .far, .fas {
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    display: inline-block;
    font-style: normal;
    font-variant: normal;
    text-rendering: auto;
    line-height: 1;
}
.list-section {
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
}
.list-section .infd-message-el {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    padding: 12px 12px 12px 22px;
}
a {
    color: currentColor;
    text-decoration: none;
    cursor: pointer;
}
.list-section .infd-message-el.checked:before {
    background-color: #ced4da;
}
.list-section .infd-message-el:before {
    position: absolute;
    display: inline-block;
    content: "";
    background-color: #ff5b16;
    width: 6px;
    height: 6px;
    border-radius: 100%;
    top: 20px;
    left: 4px;
}
.list-section .infd-message-el.checked .title {
    color: #495057;
    font-weight: 400;
}
.list-section .infd-message-el .title {
    font-size: 16px;
    font-weight: 500;
    color: #212529;
    margin-bottom: unset;
    display: inline-block;
    margin-right: 10px;
}

.list-section .infd-message-el .date {
    color: #495057;
    font-size: 14px;
    flex-shrink: 0;
}
.list-section .infd-message-el:hover {
    background-color: #f8f9fa;
    text-decoration: none;
}
a:hover {
    color: #454545;
}
.list-section .infd-message-el {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    padding: 12px 12px 12px 22px;
}
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
		    <div id="" class="c_list"><a href="myalert.mg">모든 알림</a></div>
		    <br><br>
		    <div class="tool-section">
		    	<div class="unchecked-cnt">읽지 않은 알림 <span class="cnt">${count }</span> 개</div>
				<div class="all-check-cover">
				  <button class="all-check e-all-check" onclick="checkAll();">
				    <span class="infd-icon circle">
				      <i class="fas fa-chevron-down"></i>
				    </span>
				    모두 읽음 표시
				  </button>
				</div>
			</div>
			<script>
				$(document).ready(function(){
					if(${count} == 0){
						$('.all-check').attr('disabled', true);
					} else{
						$('.all-check').attr('disabled', false);
					}
				})
			</script>		
			<div class="list-section">
				<c:forEach var="a" items="${ alist }">
					<c:if test="${a.check_yn == 'N' }">
						<a class="infd-message-el">
						  <input value="${a.bno }" name="bno" hidden>
						  <span class="title">${a.a_content }</span>
						  <span class="date">${a.a_create_date }</span>
						</a>
					</c:if>
					<c:if test="${a.check_yn == 'Y' }">
						<a class="infd-message-el checked">
						  <input value="${a.bno }" name="bno" hidden>
						  <span class="title">${a.a_content }</span>
						  <span class="date">${a.a_create_date }</span>
						</a>
					</c:if>
				</c:forEach>
			</div>
			<script>
				$('.infd-message-el').click(function(){
					var bno = $(this).children().eq(0).val();
					location.href = 'noticeSelect.no?bno='+ bno;
				})			
				
				function checkAll(){
					location.href = 'checkAllAlert.mg';
				}
			</script>
		</div>
	</div>
   </section>
	   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
</body>
</html>