$(".mInputQ").on("keyup", function() {
	var iqi2 = $("#IQI2").val();
	var iqi21 = $("#IQI21").val();
	var iqi22 = $("#IQI22").val();

	$("#GADD").val(iqi2 + " " + iqi21 + iqi22);

	console.log($("#GADD").val());
});

$('#FBDI1').on(
		'click',
		function() {

			var fbdi2 = $("#FBDI2").val();

			if ($("#IQI1").val() == 0) {
				alert("수신자를 입력해주세요!");

				$("#IQI1").focus();

			} else if (($("#IQI2").val() == 0) || ($("#IQI21").val() == 0)
					|| ($("#IQI22").val() == 0)) {
				alert("배송지를 입력해주세요!");

				$("#IQI2").focus();
			} else {
				if (fbdi2 == 0) {
					$('form[name=doubleTarget]').attr('action',
							'purchaseConfirm.pu');
					$('form[name=doubleTarget]').submit();

				} else {
					$('form[name=doubleTarget]').attr('action', 'kakaoPay.pu');
					$('form[name=doubleTarget]').submit();
				}
			}
		})

// variable
var tc1 = $("#TC1").val();
var ih1 = Number($("#IH1").val());
var ih1ih = Number($("#IH1I1").val());

var totalC = tc1 - ih1ih;

// onload
$("#BIC3").text(tc1);

// 종합계산
var costCarculate = function() {
	var tc1 = Number($("#TC1").val());
	var ih1 = Number($("#IH1").val());
	var ih1ih = Number($("#IH1I1").val());
	var bic3 = $("#BIC3").text();
	var bic1 = $("#BIC1").text();

	var totalC = tc1 - ih1ih;

	if ($("#FCC1").is(":checked") == true) {
		if ((ih1ih < tc1) && (ih1ih <= ih1)) {
			$("#BIC3").text(totalC);
			$("#BIC1").text(ih1ih);
			$("#FBDI3").val(ih1ih);
			$("#FBDI1").val(totalC + "원 결제하기");
			$("#FBDI1").attr('disabled', false);
			$("#FBDI2").val(totalC);
		} else if ((ih1ih > ih1) && (ih1ih <= tc1)) {
			alert("님의 마일리지 사용한도는" + ih1 + "입니다.");
			$("#BIC1").text(ih1);
			$("#FBDI3").val(ih1);
			$("#BIC3").text(tc1 - ih1);
			$("#IH1I1").val(ih1);
			$("#FBDI1").val(tc1 - ih1 + "원 결제하기");
			$("#FBDI2").val(tc1 - ih1);
		} else if ((ih1ih == tc1) && (ih1ih <= ih1)) {
			$("#FBDI1").attr('disabled', false);
			$("#IH1I1").val(tc1);
			$("#BIC1").text(tc1);
			$("#FBDI3").val(tc1);
			$("#BIC3").text("0");
			$("#FBDI1").val("결제하기");
			$("#FBDI2").val("0");
		} else if ((ih1ih >= tc1) && (ih1ih <= ih1)) {
			alert("최대금액은" + tc1 + "원 까지 설정하실 수 있습니다.");
			$("#FBDI1").attr('disabled', false);
			$("#IH1I1").val(tc1);
			$("#BIC1").text(tc1);
			$("#FBDI3").val(tc1);
			$("#BIC3").text("0");
			$("#FBDI1").val("결제하기");
			$("#FBDI2").val("0");
		} else {
			$("#IH1I1").val("");
			$("#BIC3").text(tc1);
			$("#BIC1").text("0");
			$("#FBDI3").val(0);
			$("#FBDI1").val(tc1 + "원 결제하기");
			$("#FBDI1").attr('disabled', false);
			$("#FBDI2").val(tc1);
		}
	} else {
		$("#FBDI1").attr('disabled', true);
		$("#FBDI1").val("약관에 동의해 주세요");
		if ((ih1ih < tc1) && (ih1ih <= ih1)) {
			$("#BIC1").text(ih1ih);
			$("#FBDI3").val(ih1ih);
			$("#BIC3").text(totalC);
		} else if ((ih1ih > ih1) && (ih1ih <= tc1)) {
			alert("님의 마일리지 사용한도는" + ih1 + "입니다.");
			$("#BIC1").text(ih1);
			$("#FBDI3").val(ih1);
			$("#BIC3").text(tc1 - ih1);
			$("#IH1I1").val(ih1);
		} else if ((ih1ih == tc1) && (ih1ih <= ih1)) {
			$("#IH1I1").val(tc1);
			$("#BIC1").text(tc1);
			$("#FBDI3").val(tc1);
			$("#BIC3").text("0");
		} else if ((ih1ih >= tc1) && (ih1ih <= ih1)) {
			alert("최대금액은" + tc1 + "원 까지 설정하실 수 있습니다.");
			$("#IH1I1").val(tc1);
			$("#BIC1").text(tc1);
			$("#FBDI3").val(tc1);
			$("#BIC3").text("0");
		} else {
			$("#IH1I1").val("");
			$("#BIC3").text(tc1);
			$("#BIC1").text("0");
			$("#FBDI3").val(0);
		}
	}
}
$(function() {
	$("#FBDI1").attr("disabled", true);

	$("#IH1B1").on("click", function() {
		var ih1 = $("#IH1").val();
		$("#IH1I1").val(ih1);
		costCarculate();
	})

	$("#FCC1").on("change", function() {
		costCarculate();
	});

	$(function() {
		costCarculate();
	});

	// keyup function
	$("#IH1I1").on("keydown", function() {
		costCarculate();
	})

	$("#IH1I1").on("keyup", function() {
		costCarculate();
	})
})