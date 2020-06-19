<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수정Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/boardInput.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.js"></script>

	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/smartEditor/js/service/HuskyEZCreator2.js" charset="UTF-8"></script>
</head>
<style>

</style>
<body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be0b8d3e154f1e2bf1a278bd7fbf3d2a&libraries=services"></script>
   <header id="header">
     <c:import url="../layout/header.jsp"/>   
      </header>

   <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
     <div id="bmain">
		
		
		<!-- 첨부파일 등록을 위해 Multipart/form-data encType 지정 -->
		<form action="bupdate.bo"  enctype="Multipart/form-data" id="form" method="POST" data-use-autosave="true">
			<input type="hidden" value="${loginUser.id}" name="user_id">
			<input type="hidden" value="${board.fno}" name="fno">
			<input type="hidden" value="${board.ftype}" name="ftype">
			<input type="hidden" value="${board.renameFileName}" name="renameFileName">
			
			<table> 
				<tr>
					<th colspan="2" >카테고리 설정</th>
					<td rowspan="2">
						<div class="B_n" >
							<b>다음과 같은 경우, 오픈이 어렵습니다.</b><br>
							- 소개팅 / 남녀 만남 주선 프립<br>
							- 드라이브, 안전이 보장되지 않은 장소에서 진행하는 프립<br>
							- 개인 판매 또는 타 플랫폼과 금액 차이가 나는 프립
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="1">
						<span>
							<select id="category" name="ftype" onchange="itemChange(this.value);">
								<option value="">카테고리를 설정해주세요</option>
								<option value="1">모임</option>
								<option value="2">클래스</option>
								<option value="3">작품</option>
							</select>
						</span>
					</td>
					<td>
						<span>
							<select id="category2" name="category" class="test"style="display : none">
								<option value="party">토크/파티</option>
								<option value="like">취향</option>
								<option value="study">스터디</option>
								<option value="event">이벤트/공간</option>
							</select> 
							
							<select id="category3" name="category" class="test" style="display : none">
								<option value="diy">공예/DIY</option>
								<option value="cook">요리</option>
								<option value="sport">스포츠</option>
								<option value="learn">어학/취업</option>
							</select>
							<select id="category4" name="category" class="test" style="display : none">
								<option value="sell">작품</option>
							</select>
						</span>
					</td>
				</tr>
				</table>
				<script>
					function itemChange(sVal) {
						if(sVal == "1"){
							$('.test').css('display','none')
				            $('.test').attr("name", null);
				            $('#category2').css('display','block');
				            $('#category2').attr("name","category");
						}else if(sVal == "2"){
							$('.test').css('display','none')
				            $('.test').attr("name", null);
				            $('#category3').css('display','block');
				            $('#category3').attr("name","category");
						}else if(sVal == "3"){
							$('.test').css('display','none')
				            $('.test').attr("name", null);
				            $('#category4').css('display','block');
				            $('#category4').attr("name","category");
						} else if(sVal == "no"){
							$('.test').css('display','none')
				            $('.test').attr("name", null);
						}
					}
					
				</script>
				
				<table>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				
				<tr>
					<th colspan="2">소개1</th>
					<td rowspan="3">
						<div class="B_n" >
							- 목록에서 대원들에게 어필할 수 있는 포인트입니다.<br>
							- 공간, 요일, 액티비티를 Title에 넣어주셔도 좋아요.
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h4>Title</h4>
						<input type="text" value="${board.ftitle}" name="ftitle" id="title" style="height: 50px;" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h4>캐치프레이즈(제목을 부연 설명하는 문구입니다)</h4>
						<div id="ca2">
							<input type="text" value="${board.small_title}" id="catch" name="small_title" maxlength="20" tabindex="0" style="height: 50px;" required>
							<span id="counter">0</span>/20<br>
						</div>
					</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 52%;">대표 이미지</th>
						<td style="padding-left: 21px;">
							<button type="button" id="sumFile">파일 추가</button>
						</td>
						<td rowspan="2">
							<div class="B_n">
								- 초상권, 저작권에 문제가 없는 이미지<br>
								- 상업적으로 사용 가능한 이미지<br>
								- 최소 1 ~ 최대 3장
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="file" class="thumb_file" name="reloadFile" required >
							<c:if test="${ !empty board.originalFileName }">
								<br>현재 업로드한 파일 : 
									<a href="${ contextPath }/resources/buploadFiles/${ board.renameFileName }">
										${ board.originalFileName }
									</a>
									<input type="hidden" name="originalFileName" value="${ board.originalFileName }"/>
							</c:if>
						</td>
					</tr>
					
					<tbody id="tbody4">
					
					</tbody>
				</table>
				<script>
					$('#sumFile').on('click', function(){
						var bot = $('#tbody4 tr').length;
						
						if(bot < 2){
							var innerHtml = "";
							
							innerHtml += '<tr>';
							innerHtml += '<td><input type="file" class="thumb_file" name="uploadFile"></td>';
							innerHtml += '<td><button type="button" class="btnD" onclick="delete_file(this); ">삭제</button></td>';
							innerHtml += '</tr>';
							
							$('#tbody4').append(innerHtml);
						}else{
							alert("최대 3개까지만 가능합니다.");
							return false;
						}
					});
					
				</script>
				<table>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2">인원설정</th>
						<td rowspan="2">
							<div class="B_n">
								예) 마카롱 원데이 클래스의 인원을 일정별로<br>
									최소 1명 ~ 최대 10명으로 설정하여<br>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" id="maxMember" name="maxMember" value="${ board.maxMember }"  maxlength="2"  required >
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					</table>
					<table>
						<tr>
							<th style="width: 50%;">구매옵션</th>
							<td style="padding-left: 5px;"> 
								<button type="button" id="btn_op">옵션 추가하기</button>
							</td>
							<td rowspan="5">
								<div class="B_n">
									<b>옵션명</b>  
									&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <b>가격(추가금액X, 최종 결제액O)</b><br>
									예) 참가비 (1인) / 참가비(2인)  &nbsp;&emsp;&emsp;&emsp;&emsp;     예) 1회 이용권 | 30,000원<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기본 옵션 / 선물 포장 &nbsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 10회 이용권 | 280,000원<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;헬스장 이용권 / 헬스장 이용+PT 10회
									<br>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="op" class="op" name="oname" value="${ board.oname }"  maxlength="30" required>
							</td>
						</tr>
						<tr>	
							<td>
								<input type="text" id="op2" class="op2" name="price" value="${ board.price }" required>
							</td>
						</tr>
						<tr>	
							<td>
								<input type="text" id="op3" class="op3" name="ocount" value="${ board.ocount }" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</td>
						</tr>
						<tr>	
							<td>
								<input type="date" id="op4" class="op4" name="odeadline" placeholder="마감일"  >
							</td>
						</tr>
					<tbody id="tbody1">
					
					</tbody>
					</table>
					<script>
					   $(function(){
	                         $('.op4').prop('min', function(){
	                             return new Date().toJSON().split('T')[0];
	                         });
	                     });
						
						$('#btn_op').on('click', function(){
							var bot = $('#tbody1 tr').length;
							
							if(bot < 20){
								var innerHtml = "";
								
								innerHtml += '<tr>';
								innerHtml += '<td><input type="text" class="op" name="oname" placeholder="옵션명"  maxlength="30"></td>';
								innerHtml += '<td rowspan="4"><button type="button" class="btnDelete" onclick="delete1(this); ">삭제</button></td>';
								innerHtml += '</tr>';
								innerHtml += '<tr>';
								innerHtml += '<td><input type="text" onkeyup="onlyNumber(this);" class="op2" name="price" placeholder="가격(5000원 이상)" >원</td>';
								innerHtml += '</tr>';
								innerHtml += '<tr>';
								innerHtml += '<td><input type="text" class="op3" name="ocount" placeholder="수량(재고)"></td>';
								innerHtml += '</tr>';
								innerHtml += '<tr>';
								innerHtml += '<td><input type="date" class="op4" name="odeadline" placeholder="2020-06-29"></td>';
								innerHtml += '</tr>';
								
								$('#tbody1').append(innerHtml);
							}else{
								alert("최대 10개까지만 가능합니다.");
								return false;
							}
						});
												
						function delete1(obj){
							console.log(obj);
							$(obj).parent().parent().parent().next().remove();
							$(obj).parent().parent().parent().parent().remove();
						}

						
						function delete_file(obj){
							$(obj).parent().parent().remove();
						}
						
						function onlyNumber(a){
							$(a).val($(a).val().replace(/[^0-9]/g,""));
						}
					</script>
					<table>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2" >진행장소</th>
						<td rowspan="7">
							<div class="B_n">
								<b>진행지</b><br>
								- 진행되는 장소의 주소를 입력해 주세요. (건물의 층, 호수까지)<br>
								- 배송상품 : "테헤란로 14길 6" 입력 후 상세정보에 (배송상품)으로 입력해주세요
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">우편번호</td>
					</tr>
					<tr>	
						<td style="width: 53%;">
							<input type="text" name="post" class="postcodify_postcode5"  size="6" style="width: 300px;" >
						</td>
						<td >
							<button type="button" id="postcodify_search_button">주소 찾기</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">도로명 주소</td>
					</tr>
					<tr>	
						<td colspan="2">
							<input type="text" name="address1" class="postcodify_address" value="" style="width: 300px;">
						</td>
					</tr>
					<tr>
						<td colspan="2">상세 주소</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" name="address2" class="postcodify_extra_info" value="" style="width: 300px;">
						</td>
						<td>
							<div style="display:none" id="map"></div>
						</td>
					</tr>
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
				</table>
				<table>
					<tr>
						<th style="width: 51%;">상세일정</th>
						<td style="padding-left: 7px;" >
							<button type="button" id="btn_DetailSet">세부일정 추가</button>
						</td>
						<td rowspan="3">
							<div class="B_n">
								<b>소요시간별로 구체적인 일정을 상세히 적어주세요.</b><br>
								<b>상세 일정은 1개 이상 입력해주셔야 합니다.</b><br>
								<br>
								시간이 고정일 때    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 시간이 유동적일 때<br>
								- 14:00   종합 운동장 5번 출구 집결    &emsp;&emsp;&emsp;&emsp; - 20분  오리엔테이션<br>
								- 14:10   인원 파악 후 출발   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 10분   타이거 포터리의 시연<br>
								- 15:30   피톤치드길 산책 겸 힐링          &emsp;&emsp;&emsp;&emsp;&emsp;- 20분   색종이 스케치<br>
								- 16:30   서울로 복귀   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 50분   만들기 시간<br>
							</div>
						</td>
					</tr>
					<tr>
						<td >
							<input type="text" name="bTime" class="bTime"  value="${ board.bTime }" required>
						</td>
					</tr>
					<tr>
						<td >
							<input type="text" name="bDetail" class="bDetail"  value="${ board.bDetail }" required>
						</td>
					</tr>
					<tbody id="tbody2">
						
					</tbody>
				</table>
					
				<script>
				$('#btn_DetailSet').on('click', function(){
					var bot = $('#tbody2 tr').length;
					
					if(bot < 20){
						var innerHtml = "";
						innerHtml += '<tr>';
						innerHtml += '<td><input type="text" name="bTime" class="bTime" placeholder="30분"></td>';
						innerHtml += '<td rowspan="2"><button type="button" class="btnDelete" onclick="delete2(this); ">삭제</button></td>';
						innerHtml += '</tr>';
						innerHtml += '<tr>';
						innerHtml += '<td><input type="text" name="bDetail" class="bDetail"  placeholder="세부일정"></td>';
						innerHtml += '</tr>';

						$('#tbody2').append(innerHtml);
					}else{
						alert("최대 10개까지만 가능합니다.");
						return false;
					}
				});
										
				function delete2(obj){
					console.log(obj);
					$(obj).parent().parent().next().remove();
					$(obj).parent().parent().remove();
				}
				
				</script>
				<table>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<th colspan="2">포함사항</th>
						<td rowspan="4">
							<div class="B_n">
								<b>상세페이지에 노출시킬 포함/불포함사항을 입력해 주세요.</b><br>
								<b>대원들이 오해할 수 있는 사항들은 꼭 기재해주시기 바랍니다.</b>	<br>
	
								포함 사항 예시    &emsp;&emsp;&emsp; 불포함 사항 예시<br>
								- 안전 보험료    &emsp;&emsp;&emsp;&emsp; - 주차비<br>
								- 차량 보험료    &emsp;&emsp;&emsp;&emsp; - 교통비<br>
								- 입장료           &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 필기도구<br>
								- 강습비	   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 음식/음료<br>
								- 기사비	   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 픽업<br>
								- 교재비	   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 운동복<br>
								- 재료비	   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 가이드비<br>
								- 앞치마	   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 뒤풀이 비용<br>
								- 탈의실	   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 항공권<br>
								- 샤워실	   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 개인 경비<br>
								- 대관료	   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - 개별 여행자보험<br>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="50" class="bIncluded" id="fcontain" name="fcontain"  maxlength="500" required>${ board.fcontain }</textarea>
							<span id="btext1">0</span>/500
						</td>
					</tr>
					<tr>
						<th colspan="2">불포함사항</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="50" class="bIncluded" id="fncontain" name = "fncontain"  maxlength="500" required>${ board.fncontain }</textarea>
							<span id="btext2">0</span>/500
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2">준비물</th>
						<td rowspan="4">
							<div class="B_n">
								<b>준비물</b><br>
								준비물 예시<br>
								- 원데이 클래스에 필요한 도구<br>
								- 필기도구<br>
								- 필요한 복장<br>
								- 신분증 및 자격증<br>
								
								<br>
								
								<b>유의사항</b><br>
								유의사항 예시<br>
								- 1인당 최대 구매 가능 수량 : 1인 3매 or 제한없음(최대인원으로 설정)<br>
								- 수업 시작 5-10분 전 여유롭게 도착 부탁드립니다.<br>
								- 날짜 변경은 3일 전까지 연락 부탁드립니다.<br>
								- 오븐 앞에서 베이킹을 하므로 주의하시기 바랍니다.<br>
								
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="50" class="bIncluded" id="fmaterials" name="fmaterials"  maxlength="500" required>${ board.fmaterials }</textarea>
							<span id="btext3">0</span>/500
						</td>
					</tr>
					<tr>
						<th colspan="2">유의사항</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="50" class="bIncluded" id="fprecaution" name="fprecaution"  maxlength="500" required>${ board.fprecaution }</textarea>
							<span id="btext4">0</span>/500
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
				</table>
				<table>
					<thead>
						<tr>
							<th style="width: 50%;">자주 묻는 질문</th>
							<td style="padding-left: 13px;">
								<button type="button" id="btn_Q">질문/답변 추가</button>
							</td>
							<td rowspan="3">
								<div class="B_n">
									<b>참가자들이 궁금해 할 만한 내용이나</b><br>
									<b>자주 묻는 질문에 대한 답변을 작성해 주세요</b><br>
									<br>
									자주 묻는 질문 예시)<br>
									Q 체력이 약한데 저도 할 수 있나요?<br>
									A 누구나 쉽게 할 수 있는 코스입니다.<br><br>
									
									Q 등산화가 있어야 할까요?<br>
									A 길이 깨끗해 러닝화로도 충분히 등반 가능합니다.<br><br>
								</div>
							</td>
						</tr>
						<tr>
							<td><span>Q</span><input type="text" class="b_Qt" name="b_Qt" value="${ board.b_Qt }"></td>
						</tr>
						<tr>
							<td><span>A</span><input type="text" class="b_An" name="b_An" value="${ board.b_An }"></td>
						</tr>
					</thead>
					<tbody id="tbody3">
						
					</tbody>
				</table>
					<script>
						$('#btn_Q').on('click', function(){
							var bot = $('#tbody3 tr').length;
							
							if(bot < 20){
								var innerHtml = "";
								
								innerHtml += '<tr>';
								innerHtml += '<td><span>Q</span><input type="text" class="b_Qt" name="b_Qt" placeholder="질문"></td>';
								innerHtml += '<td rowspan="2"><button type="button" class="btnDelete" onclick="delete3(this); ">삭제</button></td>';
								innerHtml += '</tr>';
								innerHtml += '<br>';
								innerHtml += '<tr>';
								innerHtml += '<td><span>A</span><input type="text" class="b_An" name="b_An" placeholder="답변"></td>';
								innerHtml += '</tr>';
								
								$('#tbody3').append(innerHtml);
							}else{
								alert("최대 10개까지만 가능합니다.");
							}
						});
												
						function delete3(obj){
							console.log(obj);
							$(obj).parent().parent().next().remove();
							$(obj).parent().parent().remove();
						}
						
					</script>
					<table>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2">소개2</th>
						<td rowspan="4">
							<div class="B_n">
								<b>클래스/모임/판매에 대해 소개해주세요.</b><br>
								[필수]<br>
								· 참여 시 얻을 수 있는 효과<br>
								· 진행 종목에 대한 소개<br>
								· 난이도 설명을 해주세요. (ex. 초급, 중급, 고급)<br>
								<br>
								[선택]<br>
								· 강사 소개나 자격증은 신뢰도를 높일 수 있어요<br>
								· 정규 클래스/다회차 클래스일 경우 각 회차별 세부 커리큘럼을 기재해주세요.<br>
								<br>
								- 개인 연락처, 카카오톡 ID, 오픈카톡, SNS 주소, 외부링크 등은 기재가 불가합니다.<br>
								- BUBBLEBEE를 통해서가 아닌 외부로 접근한 대원이 호스트님과 직접 현장결제 혹은 구매할 경우, 보호할 수 없으니 참고 부탁드립니다.<br>
							</div>
						</td>
					</tr>
					<tr>
						<td><textarea class="form-control" id="editor" name="introduce">${ board.introduce }</textarea></td>
					</tr>
			</table>
			<script type="text/javascript">
			   var oEditors = [];   
					nhn.husky.EZCreator.createInIFrame({
					    oAppRef: oEditors,
					    elPlaceHolder: "editor",  //textarea ID
					    sSkinURI: "${ pageContext.servletContext.contextPath }/resources/js/smartEditor/SmartEditor2Skin2.html",  //skin경로
					    htParams : {
					      	  // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					    	  bUseToolbar : true,             
				              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				              bUseVerticalResizer : true,     
				              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				              bUseModeChanger : true,         
				              fOnBeforeUnload : function(){
				              }
				          }, 
				          fOnAppLoad : function(){
				              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				              //oEditors.getById["smartEditor"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
				          },
					    fCreator: "createSEditor2"
					});   
					
			</script>
			
			<input type="hidden" id="lat" name="lat">
			<input type="hidden" id="lng" name="lon">
			
			<div id="btn_area">
				<button id="complete" type="button">수정</button>
				<button type="button" onclick="location.href='${ list.bo }'">목록으로</button>
				<button onclick="location.href='history.back()'" id="cancel">취소</button>
			</div>
				<script>
					$('#complete').on('click', function(){
				        oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				        var editor = $("#editor").val();
				        var category = $('#category').val();
				        var title = $('#title').val();
				        var catchp = $('#catch').val();
				        var thumb_file = $('.thumb_file').val();
				        var op = $('#op').val();
				        var op2 = $('#op2').val();
				        var op3 = $('#op3').val();
				        var bTime = $('.bTime').val();
				        var bDetail = $('.bDetail').val();
						 if( editor == ""  || editor == null || editor == '&nbsp;' || editor == '<p>&nbsp;</p>' || editor== '<p><br></p>')  {
				             alert("내용을 입력하세요.");
				             oEditors.getById["editor"].exec("FOCUS"); //포커싱
				             return;
						} else if(category == ""){
							alert("카테고리 설정을 완료해주세요");
							$('#category').focus();
						} else if(title == ""){
							alert("제목을 입력해주세요");
							$('#title').focus(); 
						} else if(catchp == ""){
							alert("캐치프레이즈를 작성해주세요");
							$('#catch').focus(); 
						} else if(thumb_file == ""){
							alert("사진을 넣어주세요");
							$('.thumb_file').focus(); 
						}else if($('#maxMember').val() == "" ){
							alert("인원 수 설정을 완료해주세요");
							$('#maxMember').focus(); 
						}else if(op == "" || op2 == "" || op3 == ""){
							alert("옵션 설정을 마무리 해주세요");
							$('#op').focus(); 
						}else if($('.postcodify_postcode5').val()==""){
							alert("주소를 작성해주세요");
							$('.postcodify_postcode5').focus(); 
						}else if(bTime=="" || bDetail == ""){
							alert("상세일정을 마무리 해주세요");
							$('.bTime').focus(); 
						}else if($('#fcontain').val()==""){
							alert("포함사항을 작성해주세요");
							$('#fcontain').focus(); 
						}else if($('#fncontain').val()==""){
							alert("불포함사항을 작성해주세요");
							$('#fncontain').focus(); 
						}else if($('#fmaterials').val()==""){
							alert("준비물을 작성해주세요");
							$('#fmaterials').focus(); 
						}else if($('#fprecaution').val()==""){
							alert("유의사항을 작성해주세요");
							$('#fprecaution').focus(); 
						}else{
							var result = confirm('모임/클래스/판매 수정 완료');
							if(result){
								$('#form').submit();		
							} else{
								alert('등록을 취소합니다.');
							}
						}
					});
				</script>
				
		</form>
	</div>
   </section>
   
   <footer id="footer" >
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
		<script>
			function addressInfo(){
				var address = $('.postcodify_address').val();
				console.log(address);
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				};
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(address, function(result, status) {
				
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
						
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);	
			
						// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});
			
						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
							getInfo(coords);
					}
				})
				
				function getInfo(coords) {
				
					// 지도의 현재 중심좌표를 얻어옵니다 
					var center = map.getCenter(coords); 
					
					var lat = center.getLat();
					var lng = center.getLng();
					
					$('input[name=lat]').val(lat);
					$('input[name=lon]').val(lng); 
					
					console.log($('#lat').val());
					console.log(typeof($('#lat').val()));
				};
			};
		</script>
		
		<script>
		// 캐치프레이즈 20자 제한
		$(function(){
			$('#catch').keyup(function(e){
				var counter = $(this).val();
				
				$('#counter').html(counter.length);
				if(counter.length >= 20){
					$('#counter').css('color', 'red');
				}else if(counter.length < 20){
					$('#counter').css('color', 'black');
				}
			});
			$('#counter').keyup();
		});
		
		// 인원수 20명 제한
		$('#maxMember').on('keyup', function() {
		    if (/\D/.test(this.value)) {
		        this.value = this.value.replace(/\D/g, '')
		        alert('숫자만 입력가능합니다.');
		    }
		  if (this.value > 20) {
		      this.value = 20;
		      alert('20명까지만 가능합니다.');
		  }
		});
		
		//포함사항, 불포함사항, 준비물, 유의사항 500자 제한
		$(function(){
			$('.bIncluded').keyup(function(e){
				// console.log(this);
				var counter = $(this).val();
				addressInfo();
				$(this).next().html(counter.length);
				if(counter.length >= 500){
					$(this).next().css('color', 'red');
				}else if(counter.length < 500){
					$(this).next().css('color', 'black');
				}
			});
			$(this).next().keyup();
		});
		
		//자동저장
		$('#im').click(function(){
			var fcontain = $('#fcontain').val();
			var fncontain = $('#fncontain').val();
			var fmaterials = $('#fmaterials').val();
			var fprecaution = $('#fprecaution').val();
			
			if(true){
				localStorage.setItem('fcontain', fcontain);
				localStorage.setItem('fncontain', fncontain);
				localStorage.setItem('fmaterials', fmaterials);
				localStorage.setItem('fprecaution', fprecaution);
				
				document.querySelector('#fcontain').innerHTML = localStorage.getItem("fcontain");
				$('#form').submit();		
			}
		})
		</script>
		
		
	
	
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>