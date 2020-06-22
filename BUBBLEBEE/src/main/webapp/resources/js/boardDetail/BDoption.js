			var CONT1 = $("<div>")
			var CONT2 = $("<div>")
			var CONT3 = $("<div>")
			var MID = $('<input type = "text" readonly style = "border:none; outline:none; height : 15px; width : 15px;" id ="MID" value = "1" name = "ocode">');
			var BTN1 = $('<div style = "width : 20px; height : 20px; border-radius : 10px 10px; border : 1px solid gray; cursor : pointer;" >')
			var BTN2 = $('<div style = "width : 20px; height : 20px; border-radius : 10px 10px; border : 1px solid gray; cursor : pointer;" >')
			var BTN1V = $('<div style = "float : left; cursor : pointer;" id = "MIN1">')
			var BTN2V = $('<div style = "float : left; cursor : pointer;" id = "ADD1">')
			
			
			var ona = $("#ONA").val();
			var oco = $("#OCO").val()*1;
			var pri = $("#PRI").val();
			var ono = $("#ONO").val();
			
			$(".CLK").hide();
			$("#CON").hide();
			
			$("#DIV").on("click", function(){
				$(".CLK").toggle();
			})
			
			$(".CLK").on("click", function(){
				var e = window.event,
				qwe = e.target || e.srcElement;
				
				var conF = qwe.id;
				
				var oona = "#ONA" + conF;
				var ooco = "#OCO" + conF;
				var ppri = "#PRI" + conF;
				var oono = "#ONO" + conF;
				
				var onaa = $(oona).val();
				var ocoo = $(ooco).val()*1;
				var prii = $(ppri).val()*1;
				var onoo = $(oono).val()*1;
				
				$("#confirmONO").val(onoo);
				
				console.log("confirmONO : " + $("#confirmONO").val());
				console.log("conF : " + conF);
				console.log("onaa : " + onaa);
				console.log("ocoo : " + ocoo);
				console.log("prii : " + prii);
				console.log("onoo : " + onoo);
				console.log(">>>>>>>>>>>>>>>>>>>>>>");
				
				$(".CLK").hide();
				$("#CON").show();
				
				MID.val(1);
				
				CONT1.text(onaa);
				CONT1.css('font-weight', '600');
				CONT1.css('margin-left' , '4%');
				CONT1.css('margin-top', '16px');
				
				CONT2.text(prii + "원");
				CONT2.css('margin-left', '4%');
				CONT2.css('width', '70%');
				CONT2.css('float', 'left');
				CONT2.css('margin-top', '16px');
				CONT2.css('font-size', '14pt');
				CONT2.css('color', 'gold');
				CONT2.css('font-weight', '900');
				
				BTN1.css("margin-left" , "74%");
				BTN1.css("float", "left");
				BTN1.css("margin-top", "-20px");
				
				BTN1V.text(" -");
				BTN1V.css("font-size", "24pt");
				BTN1V.css("font-weight", "900");
				BTN1V.css("margin-top", "-15px");
				BTN1V.css("margin-left", "3.5px");
				
				BTN2.css("margin-left" , "90%");
				BTN2.css("float", "left");
				BTN2.css("margin-top", "-20px");
				
				BTN2V.text(" +");
				BTN2V.css("font-size", "16pt");
				BTN2V.css("font-weight", "900");
				BTN2V.css("margin-top", "-7px");
				BTN2V.css("margin-left", "3px");
				
				MID.css("margin-top" , "23px");
				MID.css("margin-left", "8.8%");
				
				BTN1.append(BTN1V);
				BTN2.append(BTN2V);
				
// 				CONT.append(CONT1, CONT2);
// 				$("#CON").append(CONT);

				$("#CON").append(CONT1, CONT2, BTN1, MID, BTN2);
				$("#ADD1").on("click", function(){
					var MIDVAL = $("#MID").val();
					console.log(MIDVAL);
					if($("#MID").val()*1 > 4 ){
						$("#MID").val(5);
					}else if( $("#MID").val()*1 >= oco){
						$("#MID").val(oco);
					}else{
						$("#MID").val(MIDVAL*1 + 1);
						CONT2.text(prii*(MIDVAL*1+1) + "원");
					}
				});
				
				$("#MIN1").on("click", function(){
					var MIDVAL = $("#MID").val();
					if($("#MID").val()*1 <= 1 ){
						$("#MID").val(1);
					}else{
						$("#MID").val(MIDVAL*1 - 1);
						CONT2.text(prii*(MIDVAL*1-1) + "원");
					}
				});
				
			})