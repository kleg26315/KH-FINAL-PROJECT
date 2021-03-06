<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<form id="kakao" action="kakaoPayConfirm.pu" method = "post">
	<input type = "text" style = "display : none" name = "gno" value = "${gno}">
	<input type = "text" style = "display : none" name = "ono" value = "${ono }">
	<input type = "text" style = "display : none" name = "fno" value = "${fno }">
</form>

	<script>
	console.log(${p.gaddress});
	console.log(${p.gpay});
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp61847064'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'BUBBLEBEE결제 ',
            amount : ${gpay},
            buyer_address :'${gaddress}',
            buyer_name : '${gname}',
            buyer_tel : '${gphone}',
            buyer_message : '${gmsg}',
            buyer_postcode : '123-456'
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                    	msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\n결제 금액 : ' + rsp.paid_amount;
                        console.log(msg);
                         
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                msg = '결제에 성공하였습니다.';
                $('#kakao').submit();
                
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지5
                <%-- location.href="<%=request.getContextPath()%>/list.de?no=<%=no%>"; --%>
                location.href='purchaseFailed.jsp';
                
            }
        });
    });
    </script>

</body>
</html>