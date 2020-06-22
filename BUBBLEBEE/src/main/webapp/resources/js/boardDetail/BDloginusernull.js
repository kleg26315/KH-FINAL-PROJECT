$("#loginUserNull1").on("click", function(){
	alert("로그인이 필요한 서비스입니다.");
});

$("#loginUserNull2").on("click", function(){
	alert("로그인이 필요한 서비스입니다.");
});

$("#optionNull1").on("click", function(){
	alert("옵션을 선택해 주세요.");
});

$("#optionNull2").on("click", function(){
	alert("옵션을 선택해 주세요.");
});

$(".CLK").on("click", function(){
	$("#optionNull3").hide();
	$("#optionNull4").hide();
	$("#confirmNull3").show();
	$("#confirmNull4").show();
})