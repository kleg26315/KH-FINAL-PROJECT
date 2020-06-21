<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href='${ pageContext.servletContext.contextPath }/resources/css/calenCore/main.css' rel='stylesheet' />
    <link href='${ pageContext.servletContext.contextPath }/resources/css/calenDaygrid/main.css' rel='stylesheet' />
	<link href='${ pageContext.servletContext.contextPath }/resources/css/calenTime/main.css' rel='stylesheet' />
	
    <script src='${ pageContext.servletContext.contextPath }/resources/js/calenCore/main.js'></script>
    <script src='${ pageContext.servletContext.contextPath }/resources/js/calenDaygrid/main.js'></script>
	<script src='${ pageContext.servletContext.contextPath }/resources/js/calenTime/main.js'></script>
</head>
<body>
	<header id="header">
	  <c:import url="../layout/header.jsp"/>
   	</header>
   	
   	<section style="padding-top: 115px; padding-left: 20%; width: 78%;" id="section">
   		 <div id='calendar'></div>
   	</section>
   	
   	<script>
	   	document.addEventListener('DOMContentLoaded', function() {
	   	  var calendarEl = document.getElementById('calendar');
	   	  
	   	  var date = new Date();
	   	  
	   	  var year = date.getFullYear();
	   	  var month = date.getMonth() + 1;
	   	  var day = date.getDate();
	   	  
	   	  if(month < 10){
	   		  month = '0' + month;
	   	  }
	   	  
	   	  console.log(year + '-' + month + '-' + day);
	   	  
	   	  var calendar = new FullCalendar.Calendar(calendarEl, {
	   	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	   	    defaultView: 'dayGridMonth',
	   	    defaultDate: year + '-' + month + '-' + day,
	   	    header: {
	   	      left: 'prev,next,today',
	   	      center: 'title',
	   	      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	   	    },
	   	    events: [
	   	      {
	   	        title: 'All Day Event',
	   	        start: '2020-06-01'
	   	      },
	   	      {
	   	        title: 'Long Event',
	   	        start: '2020-06-07',
	   	        end: '2020-06-10'
	   	      },
	   	      {
	   	        groupId: '999',
	   	        title: 'Repeating Event',
	   	        start: '2020-06-09T16:00:00'
	   	      },
	   	      {
	   	        groupId: '999',
	   	        title: 'Repeating Event',
	   	        start: '2020-06-16T16:00:00'
	   	      },
	   	      {
	   	        title: 'Conference',
	   	        start: '2020-06-11',
	   	        end: '2020-06-13'
	   	      },
	   	      {
	   	        title: 'Meeting',
	   	        start: '2020-06-12T10:30:00',
	   	        end: '2020-06-12T12:30:00'
	   	      },
	   	      {
	   	        title: 'Lunch',
	   	        start: '2020-06-12T12:00:00'
	   	      },
	   	      {
	   	        title: 'Meeting',
	   	        start: '2020-06-12T14:30:00'
	   	      },
	   	      {
	   	        title: 'Birthday Party',
	   	        start: '2020-06-13T07:00:00'
	   	      },
	   	      {
	   	        title: 'Click for Google',
	   	        url: 'http://google.com/',
	   	        start: '2020-06-28'
	   	      }
	   	    ]
	   	  });
	
	   	  calendar.render();
	   	});
   	</script>
   	
   	<footer id="footer" style="padding-top: 115px;">
		<%@ include file = "../layout/footer.jsp" %>
	</footer>
</body>
</html>