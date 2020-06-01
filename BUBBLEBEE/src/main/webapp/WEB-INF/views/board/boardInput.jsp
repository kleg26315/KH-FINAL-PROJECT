<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/boardInput.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>

</head>

<body>
<header id="header">
	<c:import url="../layout/header.jsp"/>
</header>

	<div id="bmain">
		<main><h2>등록</h2></main>
		<hr>
		<!-- 첨부파일 등록을 위해 Multipart/form-data encType 지정 -->
		<form action="binsert.bo" onsubmit="return validate();" enctype="Multipart/form-data">
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
								<option value="no">주제를 설정해주세요</option>
								<option value="activity">액티비티</option>
								<option value="learn">배움</option>
								<option value="health">건강/뷰티</option>
								<option value="travel">여행</option>
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
						<input type="text" placeholder="제목을 입력해주세요" name="title" id="title" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h4>캐치프레이즈(제목을 부연 설명하는 문구입니다)</h4>
						<div id="ca2">
							<input type="text" placeholder="호스트님만의 특색과 매력을 함축적으로 보일 수 있게 적어주세요." 
							 id="catch" name="catch" maxlength="20" tabindex="0" required>
							<span id="counter">0</span>/20<br>
						</div>
					</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2">대표 이미지</th>
						<td rowspan="2">
							<div class="B_n">
								- 초상권, 저작권에 문제가 없는 이미지<br>
								- 상업적으로 사용 가능한 이미지<br>
								- 최소 1 ~ 최대 3장
							</div>
						</td>
					</tr>
					
					<tr>
						<td><input type="file" id="thumb_file" name="uploadFile" required></td>
						<td><input type="file" id="thumb_file" name="uploadFile"></td>
						<td><input type="file" id="thumb_file" name="uploadFile" ></td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2">인원설정</th>
						<td rowspan="2">
							<div class="B_n">
								예) 마카롱 원데이 클래스의 인원을 일정별로<br>
									최소 1명 ~ 최대 10명으로 설정하여<br>
									해당 일정에 구매 옵션 상관없이 10명의 신청을 받을 수 있습니다.
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" id="me" name="me" placeholder="최소 1명 이상 최대 20명 이하"  maxlength="2" value="" required >
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2">구매옵션</th>
						<td rowspan="3">
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
							<input type="text" id="op" name="op" placeholder="옵션명"  value="참가비 (1인)" required maxlength="30"> 필수입력
						</td>
						<td rowspan="2" > 
							<button type="button" id="btn_op">옵션 추가하기</button>
						</td>
					</tr>
					<tr>	
						<td>
							<input type="text" id="op2" name="op2" placeholder="가격(5000원 이상)"  value="5000" required>원
						</td>
					</tr>

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
						<td>
							<input type="text" name="post" class="postcodify bRequired" value="" size="6" style="width: 300px;" required >
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
							<input type="text" name="address1" class="postcodify_address" value="">
						</td>
					</tr>
					<tr>
						<td colspan="2">상세 주소</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" name="address2" class="postcodify_extra_info" value="">
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2">상세일정</th>
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
						<td>
							<input type="text" name="bTime" id="bTime" value="" placeholder="30분" required>
						</td>
						<td rowspan="2">
							<button type="button" id="btn_DetailSet">세부일정 추가</button>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="bDetail" id="bDetail"  value="" placeholder="세부일정" required>
						</td>
					</tr>
					
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
							<textarea rows="5" cols="50" id="bIncluded" class="bText500" maxlength="500" required></textarea>
							<span class="btext">0</span>/500
						</td>
					</tr>
					<tr>
						<th colspan="2">불포함사항</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="50" id="bNcluded" class="bText500" required></textarea>
							<span class="btext">0</span>/500
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
							<textarea rows="5" cols="50" id="bMaterials" class="bText500" required></textarea>
							<span class="btext">0</span>/500
						</td>
					</tr>
					<tr>
						<th colspan="2">유의사항</th>
					</tr>
					
					<hr>
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="50" id="bNot" class="bText500" required></textarea>
							<span class="btext">0</span>/500
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th >자주 묻는 질문</th>
						<td>
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
						<td>
							<span id="Q">Q</span>
							<input type="text" id="b_Qt" placeholder="질문" required>
						</td>
						<td rowspan="2"><button type="button">삭제</button></td>
					</tr>
					<tr>
						
						<td>
							<span id="A">A</span>
							<input type="text" id="b_An" placeholder="답변" required>
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<th colspan="2">소개하기</th>
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
						<td><textarea class="form-control" id="editor" name="editor"></textarea></td>
						<td><button type="button">저장</button></td>
					</tr>
			</table>
			<div id="btn_area">
				<button id="complete">완료</button>
				<button onclick="location.href='history.back()'" id="cancel">취소</button>
			</div>
				
		</form>
	</div>
	
	 <footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
	
			<script>
				ClassicEditor
				.create( document.querySelector( '#editor' ),{
		             removePlugins: [ 'ImageUpload' ,'Link'],
		             enterMode:'2',
		             height:'200'
				});  
				.catch( error => {
		            console.error( error );
		        } );
				
				if(CKEDITOR.imstances.content.getDate()==""){
					window.alert("내용을 입력해주세요");
					return false
				}
			</script>
			
			<script>
				function validate(){
					var value1 = $('#category').val();
					var value2 = $('#category2').val();
					
					if(value1 == 'no' || value2 == 'no') {
							console.log("what");
							alert("카테고리 설정을 완료해주세요");
					}
				}
				
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
				$('#me').on('keyup', function() {
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
					$('.bText500').keyup(function(e){
						var counter = $('.bText500').val();
						
						$('.btext').html(counter.length);
						if(counter.length >= 500){
							$('.btext').css('color', 'red');
						}
					});
					$('.btext').keyup();
				});
			</script>
			
		
			<script>
				// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
				$(function(){
					$("#postcodify_search_button").postcodifyPopUp();
				});
			</script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>