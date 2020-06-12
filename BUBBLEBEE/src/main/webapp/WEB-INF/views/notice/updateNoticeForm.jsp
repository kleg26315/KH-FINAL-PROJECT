<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel = "stylesheet"  href= "resources/css/FAQViewCss.css" type = "text/css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/smartEditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
</head>
<style>
.agreeBtn{
	float: right;
	border: none;
    background: #f1e018;
    color: #fff;
    border-radius: 5px;
    margin: 10px;
    width: 90px;
    height: 34px;
}
</style>
<body>
	<header id="header">
	     <c:import url="../layout/header.jsp"/>
	</header> 

    <section style="padding-top: 115px; padding-left: 20%; width: 78%;">
			<h1 id="noticeLabel" style="font-weight: bold; cursor: pointer;" onclick="location.href='list.no'">공지사항</h1>
			<br>
			<div id="content_list">
          	 <form action="updateNotice.no" id="frm" method="post">
          		 <input name="bno" hidden value="${notice.bno }">
          	 	 <input type="text" hidden size="0">
	             <input type="text" id="title" name="title" placeholder="제목" style="height: 40px;" size="50" value="${notice.btitle }">
	             <br><br>
	             <textarea id="smartEditor" name="content" rows="20" cols="" style="width: 100%;">${notice.bcontent }</textarea>
	             <button class="agreeBtn" type="button" id="cancel">취소</button>
	             <button class="agreeBtn" id="save" type="button">수정</button>
             </form>
          </div>
          
          <script type="text/javascript">
			   var oEditors = [];   
					nhn.husky.EZCreator.createInIFrame({
					    oAppRef: oEditors,
					    elPlaceHolder: "smartEditor",  //textarea ID
					    sSkinURI: "${ pageContext.servletContext.contextPath }/resources/js/smartEditor/SmartEditor2Skin.html",  //skin경로
					    htParams : {
					      	  // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					    	  bUseToolbar : true,             
				              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				              bUseVerticalResizer : true,     
				              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				              bUseModeChanger : true,         
				              fOnBeforeUnload : function(){
				              }
				          }, 
				          fOnAppLoad : function(){
				              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				              //oEditors.getById["smartEditor"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
				          },
					    fCreator: "createSEditor2"
					});   
					
					$('#save').click(function(){
				        oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
				        var smartEditor = $("#smartEditor").val();
						var title = $('#title').val();
						if(title == "" || title.trim() == ""){
							alert('제목을 입력해주세요');
							$('#title').focus();
							return;
						} else if( smartEditor == ""  || smartEditor == null || smartEditor == '&nbsp;' || smartEditor == '<p>&nbsp;</p>' || smartEditor== '<p><br></p>')  {
				             alert("내용을 입력하세요.");
				             oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
				             return;
						} else{
							var result = confirm('정말로 공지사항을 수정하시겠습니까?');
							if(result){
								alert('공지사항 수정 완료');
								$('#frm').submit();			
							} else{
								alert('수정을 취소합니다.');
							}
						}
					})
					
					$('#cancel').click(function(){
						history.back();
					})
				</script>
	</section>
	
   <footer id="footer" style="padding-top: 115px;">
		<c:import url="../layout/footer.jsp"/>
	</footer>
</body>
</html>