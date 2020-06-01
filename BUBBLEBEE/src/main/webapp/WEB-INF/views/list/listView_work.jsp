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
     		
     				<label id="cmoim">작품</label>
     				<hr id="chline" align="left">
     			<table id="categoryT2" >	
     			<tr>
     				<td>액세서리</td>
     				<td>인테리어소품</td>
     				<td>패션잡화</td>
     				<td>기타</td>
     				<td>나눔</td>
     			</tr>
     		</table>
     		
     	</div>
     </div>
     
      <div class = "main">
    
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
      
     	
     	<!-- 인기작품 -->
		<div id="hotmoim">
         <label style="font-weight: bold; font-size: 20px;">인기 작품</label>
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
      
      	<!-- 최신작품 -->
      	<div id="latestmoim">
         <label style="font-weight: bold; font-size: 20px;">최신 작품</label>
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
      		<a href="wkallList.bo">전체보기</a>
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