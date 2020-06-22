$(".hashTagEnquiryContents").hide();
$(".hashTagRefundContents").hide();

$("#TQB1").on("click", function() {
	$(".hashTagEnquiryContents").toggle();
});

$("#TRB1").on("click", function() {
	$(".hashTagRefundContents").toggle();
});
