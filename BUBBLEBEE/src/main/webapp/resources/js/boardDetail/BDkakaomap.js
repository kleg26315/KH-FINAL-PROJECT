var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소 따오기
			var addressArr = document.getElementById('address').innerHTML.trim().split("/");
			var address = addressArr[1];
			console.log(address);
			
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
						getInfo();
				}
				
				function getInfo() {
				    // 지도의 현재 중심좌표를 얻어옵니다 
				    var center = map.getCenter(coords); 
				    
				    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
				    message += '경도 ' + center.getLng() + ' 이고 <br>';
				    
				    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
				    console.log(message);
				}
			});