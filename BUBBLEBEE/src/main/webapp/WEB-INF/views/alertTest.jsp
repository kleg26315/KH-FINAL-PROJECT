<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ㅎㅇ</h1>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

	<script type="text/javascript">
    var wsUri = "ws://localhost:8780/bubblebee/count";
    function send_message(){
        websocket = new WebSocket(wsUri);
        websocket.onopen = function(evt) {
            onOpen(evt);
            setTimeout(function(){
        	send_message();
	        }, 1000);
        };
        websocket.onmessage = function(evt) {
            onMessage(evt);
            websocket.close();
        };
        websocket.onerror = function(evt) {
            onError(evt);
        };
        
    } 
   
    function onOpen(evt) 
    {
       websocket.send("${loginUser.id}");
    }

    function onMessage(evt) {
    	var realData = [];
    	realData = evt.data.split('&');
	
   		$('#count').text(realData[0]);	    		

   		var data = realData[1].substr(1, ( realData[1].length)-3 );
   		var myArrayData1 =[];
   		var myArrayData2 =[];
   		myArrayData1 = data.split("/,");
   		for(var i in myArrayData1){
   			myArrayData2 = myArrayData1[i].split(",");
   			var aid = myArrayData2[0];
   			var acontent = myArrayData2[1];
   			var acreatedate = myArrayData2[2];
   			$('#message').append("aid : ", aid);
   			$('#message').append(" acontent : ", acontent);
   			$('#message').append(" acreatedate : ", acreatedate+"<br>");
   		}
    	
    }

    function onError(evt) {

    }
    $(document).ready(function(){
    	 send_message();
    })
</script>
	
	<span id="count" class="badge bg-theme"></span>
	<br>
	<span id="message" class="badge bg-theme"></span>
 
</body>
</html>