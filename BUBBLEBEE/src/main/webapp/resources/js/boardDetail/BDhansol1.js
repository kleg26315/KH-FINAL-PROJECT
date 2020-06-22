var j = $.noConflict(true); // $.noConflict(true) 를 사용해서 $ -> 변수로 선언한 j로 바꾸니 해결!
j(document).ready(function() {
	var main = j('.bxslider').bxSlider({
		mode : 'fade',
		auto : true, // 자동으로 슬라이드
		controls : true, // 좌우 화살표
		autoControls : true, // stop,play
		pager : true, // 페이징
		pause : 3000,
		autoDelay : 0,
		slideWidth : 500,
		speed : 300,
		stopAutoOnclick : true
	});

	j(".bx-stop").click(function() { // 중지버튼 눌렀을때
		main.stopAuto();
		j(".bx-stop").hide();
		j(".bx-start").show();
		return false;
	});

	j(".bx-start").click(function() { // 시작버튼 눌렀을때
		main.startAuto();
		j(".bx-start").hide();
		j(".bx-stop").show();
		return false;
	});

	j(".bx-start").hide(); // onload시 시작버튼 숨김.
});