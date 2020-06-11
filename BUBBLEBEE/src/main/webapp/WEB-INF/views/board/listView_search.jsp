<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "stylesheet"  href= "resources/css/listAllViewCss.css" type = "text/css">
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
<!--      <div id = "category"> -->
<!--      	<div id = "categoryD"> -->
     		
<!--      				<label id="cmoim">모임</label> -->
<!--      				<hr id="chline" align="left"> -->
<!--      			<table id="categoryT" >	 -->
<!--      			<tr> -->
<!--      				<td>토크/파티</td> -->
<!--      				<td>취향</td> -->
<!--      				<td>스터디</td> -->
<!--      				<td>이벤트/공간</td> -->
<!--      			</tr> -->
<!--      		</table> -->
     		
<!--      	</div> -->
<!--      </div> -->
     
      <div class = "main">
       	
      	<div id="allLabel" style="margin-top:80px;">
      		<c:if test="${ cate eq 'party'}" >	     
         		토크/파티 모임 전체
         	</c:if>
         	<c:if test="${ cate == 'like'}" >	     
         		취향 모임 전체
         	</c:if>	
         	<c:if test="${ cate == 'study'}" >	     
         		스터디 모임 전체
         	</c:if>	
         	<c:if test="${ cate == 'event'}" >	     
         		이벤트/공간 모임 전체
         	</c:if>	
         	
         	<c:if test="${ cate == 'diy'}" >	     
         		공예/DIY 클래스 전체
         	</c:if>
         	<c:if test="${ cate == 'cook'}" >	     
         		요리 클래스 전체
         	</c:if>
         	<c:if test="${ cate == 'sport'}" >	     
         		스포츠 클래스 전체
         	</c:if>
         	<c:if test="${ cate == 'learn'}" >	     
         		어학/취업 클래스 전체
         	</c:if>
         	
         	<c:if test="${ cate == 'sell'}" >	     
         		작품  전체
         	</c:if>
      	</div>
      	
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
							<td><input type="radio" name="farray" value="popular">
						</tr>
						<tr>
							<td>등록일순</td>
							<td><input type="radio" name="farray" value="latest">
						</tr>
						<tr>
							<td>평점순</td>
							<td><input type="radio" name="farray" value="rate">
						</tr>
						<tr>
							<td>가격높은순</td>
							<td><input type="radio" name="farray" value="highprice">
						</tr>
						<tr>
							<td>가격낮은순</td>
							<td><input type="radio" name="farray" value="lowprice">
						</tr>
						
						</table>
					</div>
					<hr>
					
					<span id="pprice">가격</span>&nbsp;&nbsp;&nbsp; <input type="text" id="amount" readonly><br><br><br>
					<input type="hidden" id="sprice" value="0"><input type="hidden" id="eprice" value="30">
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
								   $("#amount").val(ui.values[0] + " ~ " + ui.values[1] + "만원");
								   $("#sprice").val(ui.values[0]);
								   $("#eprice").val(ui.values[1]);
							   }
						   });
						 } );
					  </script>
					  
					<!-- 슬라이더 -->
					
					<div id="applyb" onclick="searchBoard();">적용하기</div>
					
				</div>
				<label for="popup"><!-- 외곽클릭 --></label>
			</div>
			
			<!-- 필터값넘기기 -->
			<script>
			function searchBoard(){
				var a = $(':radio[name="farray"]:checked').val();
				var startPrice = $("#sprice").val();
				var endPrice = $("#eprice").val();
				location.href="search.bo?cate="+'${cate}'+"&a="+a+"&startPrice="+startPrice+"&endPrice="+endPrice;
			}
			</script>

      	
      	<!-- 필터버튼끝 -->
      
     	
     	<!-- 모음 -->
     	
     	<input type="hidden" value="${ sessionScope.loginUser.id}" id="uid">
        <c:set var="uid" value="${ sessionScope.loginUser.id}"/>
     	
		<div id="hotmoim">
         <div class="moim">
         
         <c:forEach var="b" items="${ list }" varStatus="status">
            <div class="moim_total">
            <c:url var="bdetail" value="detail.bo">
            	<c:param name="fno" value="${ b.fno }"/>
            	<c:param name="page" value="${ pi.currentPage }"/>
            </c:url>
                  <div class="moim_each">
                  <div class="moim_img">
                     <div class="heart_div">
                        <button class="heart_button" width="24px" height="24px" value="${ b.fno }">
                        	<c:if test="${b.hid ne uid || empty uid}">
                        	<img class="heart" width='16' height='18' src="${contextPath }/resources/img/빈하트.png" alt="찜하기">
                        </c:if>
                         <c:if test='${b.hid eq uid && !empty b.hid}'>
                        	<img class="heart" width='16' height='18' src="${contextPath }/resources/img/채워진하트.png" alt="찜하기">
                        </c:if>
                        </button>
                     </div>
                     
                     
                     <c:set var="rf2" value="${ b.renameFileName }"/>
                     <% 
                     	String rf2 = (String)pageContext.getAttribute("rf2");
            			int idx2 = rf2.indexOf(",");
            			String str2 = rf2.substring(0, idx2);
            			pageContext.setAttribute("str2", str2);
                     %> 
                     
                     <a href="${ bdetail }">
                     <img id="" width="100%" height="200" class="" src="${contextPath }/resources/buploadFiles/${ str2 }" />
                  </div>
                     <div class="moim_small_title">${ b.small_title }</div>
                     <div class="moim_title">${ b.ftitle }</div>
                     <div class="moim_price">
                        <span>${ b.price }원</span>
                     </div>
                     <div class="moim_score">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E" alt="별점 icon">
                        <span>
                        	<c:if test="${b.rcount ne 0}">
                        		<c:set var="d" value="${ b.rsum / b.rcount }"/>
                        		<%
                        		java.text.DecimalFormat df = new java.text.DecimalFormat("0.00");
                        		double dNum =(double)pageContext.getAttribute("d");
                        		String grade = df.format(dNum);
                        		%>
                        		<%= grade %>               		                    
                        	</c:if>
                        	<c:if test="${b.rcount eq 0}">
                        		0.00
                        	</c:if>
                        </span>
                     </div>
                  </div>
               </a>
            </div>
            </c:forEach>
            </div>
            </div>
            
      <!-- 좋아요 -->
            <script>
        	var uid = $('#uid').val();
         	
             $(".heart_button").click(function(){
            	 var bid = $(this).val();
            	 var th = $(this).find('.heart');
            	 
            	 if(uid ==''){
            		 alert('로그인 후 이용해주세요');
            	 } else{
            		 $.ajax({
                		 url :'heart.bo',
                		 data : {uid:uid, fno:bid},
       	                 success : function(data){
       	                    if(data==1) {
       	                        $(th).prop("src","resources/img/채워진하트.png");
       	                    }
       	                    else{
       	                        $(th).prop("src","resources/img/빈하트.png");
       	                    }
       	                } 
                		 
                	 }); 
            	 }
            	
             });
            </script>      
                 
 
      <!-- 페이징 처리 -->
      
      <div id="paging" style="margin-left:50%; margin-top:30px; font-size:20px;">
	      <!-- [이전] -->
			<c:if test="${ pi.currentPage <= 1 }">
				< &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="search.bo">
					<c:param name="page" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }"> <</a> &nbsp;
			</c:if>
			
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="gold" size="4"><b>[${ p }]</b></font>&nbsp;
				</c:if>
				
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="search.bo">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			
			<!-- [다음] -->
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				>
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="search.bo">
					<c:param name="page" value="${ pi.currentPage + 1 }"/>
				</c:url> 
				<a href="${ after }"> > </a>
			</c:if>
		
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