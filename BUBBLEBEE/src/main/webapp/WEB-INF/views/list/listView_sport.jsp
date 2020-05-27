<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "stylesheet"  href= "resources/css/listViewCss.css" type = "text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">



</head>
<style>
#header{ 
   position: fixed;
   width : 100%;
   z-index: 100;
}

</style>
<body>

<header id="header">
     <c:import url="../layout/header.jsp"/>
</header> 

<br clear="all">  
     <div id = "category">
     	<div id = "categoryD">
     		
     				<label id="cmoim">클래스</label>
     				<hr id="chline" align="left">
     			<table id="categoryT" >	
     			<tr>
     				<td>공예/DIY</td>
     				<td>요리</td>
     				<td>스포츠</td>
     				<td>어학/취업</td>
     			</tr>
     		</table>
     		
     	</div>
     </div>
     
      <div class = "main">
       	
      	<!-- 어디서버튼 -->
     	<input type="checkbox" id="where">
		<label for="where">어디서</label>
			<div>
				<div>
					<span id="pfilter">어디서</span> <span id="pfreset2">초기화</span>
					<label for="where">x</label><br><br>
					<hr>
					
					<div class="tab_content" style="overflow-y:scroll; width:400px; height:380px;">

						<!-- 버튼요소 -->
						<input type="radio" name="tabmenu" id="tab01">
						<label for="tab01">서울</label><br>
						<input type="radio" name="tabmenu" id="tab02">
						<label for="tab02">경기</label><br>
						<input type="radio" name="tabmenu" id="tab03">
						<label for="tab03">강원</label><br>
						<input type="radio" name="tabmenu" id="tab04">
						<label for="tab04">인천</label><br>
						<input type="radio" name="tabmenu" id="tab05">
						<label for="tab05">부산</label><br>
						<input type="radio" name="tabmenu" id="tab06">
						<label for="tab06">대구</label><br>
						<input type="radio" name="tabmenu" id="tab07">
						<label for="tab07">제주</label><br>
						<input type="radio" name="tabmenu" id="tab08">
						<label for="tab08">대전</label><br>
						<input type="radio" name="tabmenu" id="tab09">
						<label for="tab09">울산</label><br>
						<input type="radio" name="tabmenu" id="tab10">
						<label for="tab10">경남</label><br>
						<input type="radio" name="tabmenu" id="tab11">
						<label for="tab11">충남</label><br>
						<input type="radio" name="tabmenu" id="tab12">
						<label for="tab12">충북</label><br>
						<input type="radio" name="tabmenu" id="tab13">
						<label for="tab13">전남</label><br>
						<input type="radio" name="tabmenu" id="tab14">
						<label for="tab14">경북</label><br>
						<input type="radio" name="tabmenu" id="tab15">
						<label for="tab15">광주</label>
					
						<!-- 컨텐츠 요소 -->
						<div class="conbox con1">서울전체</div>
						<div class="conbox con2">경기전체</div>
						<div class="conbox con3">강원전체</div>
						<div class="conbox con4">인천전체</div>
						<div class="conbox con5">부산전체</div>
						<div class="conbox con6">대구전체</div>
						<div class="conbox con7">제주전체</div>
						<div class="conbox con8">대전전체</div>
						<div class="conbox con9">울산전체</div>
						<div class="conbox con10">경남전체</div>
						<div class="conbox con11">충남전체</div>
						<div class="conbox con12">충북전체</div>
						<div class="conbox con13">전남전체</div>
						<div class="conbox con14">경북전체</div>
						<div class="conbox con15">광주전체</div>
						
					</div>
						
				</div>
				<label for="where"><!-- 외곽클릭 --></label>
			</div>
      	<!-- 어디서버튼 끝 -->&nbsp;&nbsp;
      	
      	<!-- 필터버튼 -->
     	<input type="checkbox" id="popup">
			<label for="popup">필터</label>
			<div>
				<div>
					<span id="pfilter">필터</span> <span id="pfreset">초기화</span>
					<label for="popup">x</label><br><br>
					<hr>
					<div id="sun">
						<table id="arrayT">
						<tr>
							<th width=300px height=30px; colspan=2 style="text-align:left;">정렬</td>
						</tr>
						<tr>
							<td width=300px>인기순</td>
							<td><input type="radio" name="farray" value="hot">
						</tr>
						<tr>
							<td>등록일순</td>
							<td><input type="radio" name="farray" value="regist">
						</tr>
						<tr>
							<td>평점순</td>
							<td><input type="radio" name="farray" value="grade">
						</tr>
						<tr>
							<td>가격높은순</td>
							<td><input type="radio" name="farray" value="expensive">
						</tr>
						<tr>
							<td>가격낮은순</td>
							<td><input type="radio" name="farray" value="cheap">
						</tr>
						
						</table>
					</div>
					<hr>
					
					<span id="pprice">가격</span>&nbsp;&nbsp;&nbsp; <input type="text" id="amount" readonly><br><br><br>
					
					<div id="slider" style="width: 85%;"></div>
					
					<!-- 슬라이더 -->

					 <script>
						 $( function() {
						   $( "#slider" ).slider({
							   range:true,
							   min: 0,
							   max: 30,
							   values: [0, 30],
							   slide: function(event, ui) {
								   $("#amount").val(ui.values[0] + " ~ " + ui.values[1] + "만원 이상");
							   }
						   });
						 } );
					  </script>
					  
					<!-- 슬라이더 -->
					
					<div id="applyb">적용하기</div>
					
				</div>
				<label for="popup"><!-- 외곽클릭 --></label>
			</div>

      	
      	<!-- 필터버튼끝 -->
      
     	
     	<!-- 인기 클래스 -->
		<div id="hotmoim">
         <label style="font-weight: bold; font-size: 20px;">인기 스포츠</label>
         <label style="float: right; padding-right: 5px;">전체보기</label>
         <br><br>
         <div class="moim">
            <div class="moim_total">
               <a>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px">
                        <img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        </button>
                     </div>
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/main.png" />
                  </div>
                     <div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
                     <div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
                     <div class="moim_price">
                        <span>14,000원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>4.90</span>
                     </div>
                  </div>
               </a>
            </div>
            
            <div class="moim_total">
               <a>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px">
                        <img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        </button>
                     </div>
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner1.png" />
                  </div>
                     <div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
                     <div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
                     <div class="moim_price">
                        <span>14,000원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>4.90</span>
                     </div>
                  </div>
               </a>
            </div>
            
            <div class="moim_total">
               <a>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px">
                        <img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        </button>
                     </div>
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner2.png" />
                  </div>
                     <div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
                     <div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
                     <div class="moim_price">
                        <span>14,000원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>4.90</span>
                     </div>
                  </div>
               </a>
            </div>
            
            <div class="moim_total">
               <a>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px">
                        <img width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
                        </button>
                     </div>
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner3.png" />
                  </div>
                     <div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
                     <div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
                     <div class="moim_price">
                        <span>14,000원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>4.90</span>
                     </div>
                  </div>
               </a>
            </div>
         </div>
      </div>
      
      	<!-- 최신클래스 -->
      	<div id="latestmoim">
         <label style="font-weight: bold; font-size: 20px;">최신 스포츠</label>
         <label style="float: right; padding-right: 5px;">전체보기</label>
         <br><br>
         <div class="moim">
            <div class="moim_total">
               <a>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px">
                        <img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        </button>
                     </div>
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/main.png" />
                  </div>
                     <div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
                     <div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
                     <div class="moim_price">
                        <span>14,000원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>4.90</span>
                     </div>
                  </div>
               </a>
            </div>
            
            <div class="moim_total">
               <a>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px">
                        <img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        </button>
                     </div>
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner1.png" />
                  </div>
                     <div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
                     <div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
                     <div class="moim_price">
                        <span>14,000원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>4.90</span>
                     </div>
                  </div>
               </a>
            </div>
            
            <div class="moim_total">
               <a>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px">
                        <img width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        </button>
                     </div>
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner2.png" />
                  </div>
                     <div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
                     <div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
                     <div class="moim_price">
                        <span>14,000원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>4.90</span>
                     </div>
                  </div>
               </a>
            </div>
            
            <div class="moim_total">
               <a>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px">
                        <img width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
                        </button>
                     </div>
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/img/cos-banner3.png" />
                  </div>
                     <div class="moim_small_title">1박 2일 ㅣ서핑 #바베큐 파티#펍파티</div>
                     <div class="moim_title">[프립버스] 성민 캡틴과 함께하는 청시행비치 1박 2일 서핑</div>
                     <div class="moim_price">
                        <span>14,000원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>4.90</span>
                     </div>
                  </div>
               </a>
            </div>
         </div>
      </div>
      	<!-- 전체보기 -->
      	<div id="allView">
      		전체보기
      	</div>
      	
      	
      </div> <!-- main div끝 -->
      
   <footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
	
	<!-- 가격필터 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      
      

</body>
</html>