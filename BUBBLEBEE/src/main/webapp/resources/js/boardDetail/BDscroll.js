//onscroll || function(){
//	var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
//	if(nVScroll > 40){
//		$(".detailMainForm").css("position", "fixed");
//	}else{
//		$(".detailMainForm").css("position", "relative");
//	}
//}

$(window).scroll(function(){
	if($(this).scrollTop() > 2100){
		$("#detailMainForm2").removeClass("positionfixed");
		$("#detailMainForm2").css("margin-top","2142px");
		$("#detailMainForm2").css("margin-left","2.58%");

	}else{
		$("#detailMainForm2").addClass("positionfixed");
		$("#detailMainForm2").css("margin-top","0px");
		$("#detailMainForm2").css("margin-left","2%");
	}
})

//$(window).scroll(
//		function(){
//			if($(window).scrollTop() > 1600){
//				$(".detailMainForm").css("position", "fixed");
//			}else{
//				
//			}
//		})

//var isVisible = false;
//
//$(window).on("scroll", function() {
//	if (checkVisible($('.bonjour')) && !isVisible) {
//		$("#detailMainForm2").css("position","relative");
//		isVisible = true;
//	}else{
//		$("#detailMainForm2").css("position","fixed");
//		isVisible = false;
//	}
//});
//
//function checkVisible(elm, eval) {
//	eval = eval || "object visible";
//	var viewportHeight = $(window).height(), // Viewport Height
//	scrolltop = $(window).scrollTop(), // Scroll Top
//	y = $(elm).offset().top, elementHeight = $(elm).height();
//
//	if (eval == "object visible")
//		return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
//	if (eval == "above")
//		return ((y < (viewportHeight + scrolltop)));
//}
//
//


