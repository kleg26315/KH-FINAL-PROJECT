<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>등록Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/boardInput.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
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
		<main><h2>등록</h2></main>
		
		<!-- 첨부파일 등록을 위해 Multipart/form-data encType 지정 -->
		<form action="binsert.bo" onsubmit="return validate()" enctype="Multipart/form-data" id="form" method="POST" data-use-autosave="true">
			<table> 
				<tr>
					<th colspan="2" >카테고리 설정</th>
					<td rowspan="2">
					<input type="hidden" value="${loginUser.id}" name="user_id">
						<div class="B_n" >
							<b>다음과 같은 경우, 오픈이 어렵습니다.</b><br>
							- 소개팅 / 남녀 만남 주선 프립<br>
							- 드라이브, 안전이 보장되지 않은 장소에서 진행하는 프립<br>
							- 개인 판매 또는 타 플랫폼과 금액 차이가 나는 프립
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<span>
							<select id="category" name="ftype">
								<option value="no">카테고리를 설정해주세요</option>
								<option value="1">모임</option>
								<option value="2">클래스</option>
								<option value="3">작품</option>
							</select>
						</span>
						
						<span>
							<select id="category2" name="category">
								<option value="">==모임==</option>
								<option value="party">토크/파티</option>
								<option value="like">취향</option>
								<option value="study">스터디</option>
								<option value="event">이벤트/공간</option>
								<option value="">==클래스==</option>
								<option value="diy">공예/DIY</option>
								<option value="cook">요리</option>
								<option value="sport">스포츠</option>
								<option value="learn">어학/취업</option>
								<option value="sell">==작품==</option>
							</select>
						</span>
					</td>
				</tr>
				
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
						<input type="text" placeholder="제목을 입력해주세요" name="ftitle" id="title" required style="height: 50px;">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h4>캐치프레이즈(제목을 부연 설명하는 문구입니다)</h4>
						<div id="ca2">
							<input type="text" placeholder="호스트님만의 특색과 매력을 함축적으로 보일 수 있게 적어주세요." 
							 id="catch" name="small_title" maxlength="20" tabindex="0" required>
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
							<input type="file" class="thumb_file" name="uploadFile" required >
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
							<input type="text" id="maxMember" name="maxMember" placeholder="최소 1명 이상 최대 20명 이하"  maxlength="2"  required >
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
							<td rowspan="4">
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
								<!-- <input type="text" id="op" class="op" name="oname" placeholder="옵션명"  value="참가비 (1인)"  maxlength="30" required> --> 
								<input type="text" id="op" class="op" name="oname" placeholder="옵션명"  maxlength="30" required>
							</td>
						</tr>
						<tr>	
							<td>
								<!--  <input type="text" id="op2" class="op2" name="price" placeholder="가격(5000원 이상)"  value="5000" required>원 -->
								<input type="text" id="op2" class="op2" name="price" placeholder="가격(5000원 이상)"   required>
							</td>
						</tr>
						<tr>	
							<td>
								<!-- <input type="text" id="op3" class="op3" name="ocount" placeholder="수량(재고)"  value="14명" required> -->
								<input type="text" id="op3" class="op3" name="ocount" placeholder="수량(재고)" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</td>
						</tr>
						<tr>	
							<td>
								<input type="date" id="op4" class="op4" name="odeadline" placeholder="마감일" >
							</td>
						</tr>
					<tbody id="tbody1">
					
					</tbody>
					</table>
					<script>
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
							$(obj).parent().parent().parent().remove();
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
							<input type="text" name="bTime" class="bTime"  placeholder="30분" required>
						</td>
					</tr>
					<tr>
						<td >
							<input type="text" name="bDetail" class="bDetail"  placeholder="세부일정" required>
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
							<textarea rows="5" cols="50" class="bIncluded" name="fcontain"  maxlength="500" required></textarea>
							<span id="btext1">0</span>/500
						</td>
					</tr>
					<tr>
						<th colspan="2">불포함사항</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="50" class="bIncluded" name = "fncontain"  maxlength="500" required></textarea>
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
							<textarea rows="5" cols="50" class="bIncluded" name="fmaterials"  maxlength="500" required></textarea>
							<span id="btext3">0</span>/500
						</td>
					</tr>
					<tr>
						<th colspan="2">유의사항</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="50" class="bIncluded" name="fprecaution"  maxlength="500" required></textarea>
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
							<td rowspan="1">
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
							<td><span>Q</span><input type="text" class="b_Qt" name="b_Qt" placeholder="질문"></td>
						</tr>
						<tr>
							<td><span>A</span><input type="text" class="b_An" name="b_An" placeholder="답변"></td>
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
						<td><textarea class="form-control" id="editor" name="introduce"></textarea></td>
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
				<button id="complete" type="button">완료</button>
				<button onclick="location.href='history.back()'" id="cancel">취소</button>
			</div>
				<script>
					$('#complete').on('click', function(){
				        oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				        var editor = $("#editor").val();
						 if( editor == ""  || editor == null || editor == '&nbsp;' || editor == '<p>&nbsp;</p>' || editor== '<p><br></p>')  {
				             alert("내용을 입력하세요.");
				             oEditors.getById["editor"].exec("FOCUS"); //포커싱
				             return;
						} else{
							var result = confirm('모임/클래스/판매 등록 완료');
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
		function validate(){
			var value1 = $('#category').val();
			var value2 = $('#category2').val();
			
			if(value1 == 'no' || value2 == 'no') {
				console.log("what");
				alert("카테고리 설정을 완료해주세요");
			}
		};
		</script>
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
		</script>
	
	
	
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>