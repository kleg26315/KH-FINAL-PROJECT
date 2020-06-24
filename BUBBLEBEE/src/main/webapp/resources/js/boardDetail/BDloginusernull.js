$(function(){
	$("#comfirmNull3").hide();
	$("#comfirmNull4").hide();
});

$("#loginUserNull1").on("click", function(){
	alert("로그인이 필요한 서비스입니다.");
});

$("#loginUserNull2").on("click", function(){
	alert("로그인이 필요한 서비스입니다.");
});

$("#optionNull3").on("click", function(){
	alert("옵션을 선택해 주세요.");
});

$("#optionNull4").on("click", function(){
	alert("옵션을 선택해 주세요.");
});

$(".CLK").on("click", function(){
	$("#optionNull3").hide();
	$("#optionNull4").hide();
	$("#comfirmNull3").css("display", "block");
	$("#comfirmNull4").css("display", "block");
})