<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 좋아요</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/smartEditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
</head>
<style>
section hr{margin-top: 40px;margin-bottom: 40px;border: 0;border-top: 1px solid #eee;}
#content{display: flex;align-items: flex-start;}
section>nav{-webkit-box-flex: 0;flex-grow: 0;flex-shrink: 0;flex-basis: 18%;max-width: 130px;}
#c_body{flex-grow: 2;margin-left: 30px;width: 900px;}
.c_list{display: inline;margin-right: 50px;font-size: 20px;}
.c_list a{color: black;}
.c_list a:hover{text-decoration: none;color: black;cursor: pointer;}
#ul_list{
   list-style: none; 
   padding:0;
   padding-right:20px;
   margin: 0;
   text-align: center;
   width: 170px;
}
#ul_ul_list{
   list-style: none; 
}
.nav_li{
    font-size: 24px;
    margin-bottom: 30px;
    font-weight: bold;
    text-align: left;
    margin-left: 32px;
}
.nav_sub_li{
	font-size: 15px;
    margin-bottom: 16px;
    font-weight: 700;
    text-align: left;
    margin-left: 10px;
}
.nav_sub_li a{
   cursor:pointer;
   color: black;
}
.nav_sub_li a:hover{
   text-decoration: none;
   color: gold;
}
.nav_li a{
   cursor:pointer;
   color: black;
}
.nav_li a:hover{
   text-decoration: none;
   color: gold;
}
#l_hostenroll{
    background: gold;
    padding: 5px 10px;
    border-radius: 5px;
}
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
<!--    <div id="main"> -->
     <header>
     <c:import url="admin_header.jsp"/> 
     </header>
      <hr>
    <div id="content">
		<ul id="ul_list">
             <li id="l_class" class="nav_li"><a href="account.ad">정산 관리</a></li>
             <li id="l_slist" class="nav_li"><a href="class.ad">클래스 승인</a></li>
             <li id="l_point" class="nav_li closee"><a style="color: gold;">공지글 관리</a></li>
             	<ul id="ul_ul_list" style="visibility: visible;">
	             	<li id="l_like" class="nav_sub_li"><a href="noticeInsertView.ad" style="color: gold;">공지글 작성</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="list.no">공지글 목록</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="FAQInsertView.ad">FAQ 작성</a></li>
	             	<li id="l_like" class="nav_sub_li"><a href="FAQList.no">FAQ 목록</a></li>
             	</ul>
		</ul>
		<script>
			$(document).ready(function(){
			  $('#l_point').click(function(){
				if($('.more').hasClass('more')){
			       $('.more').addClass('closee').removeClass('more');
			       $('#ul_ul_list').css('visibility', 'visible');
			    }else if($('.closee').hasClass('closee')){
			       $('.closee').addClass('more').removeClass('closee');  
			       $('#ul_ul_list').css('visibility', 'hidden');
			    }
			  })
			})
		</script>
		
       <div id="c_body">
          <div id="content_list">
          	 <form action="insert.no" id="frm" method="post">
          	 	 <input type="text" hidden size="0">
	             <input type="text" id="title" name="title" placeholder="제목" style="height: 40px;" size="50"><br><br>
	             <textarea id="smartEditor" name="content" rows="20" cols="" style="width: 100%;"></textarea>
	             <button class="agreeBtn" type="button">취소</button>
	             <button class="agreeBtn" id="save" type="button">저장</button>
             </form>
          </div>
       </div>
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
				var result = confirm('정말로 공지사항 등록하시겠습니까?');
				if(result){
					/* $('#frm').submit(); */
					$.ajax({
						type: "POST",
						url: "insert.no",
						data: {title:title, content:smartEditor},
						success: function(data){
							if(data == "success"){
								socket.send("reload");
								location.href="list.no";
							}
						}
					})
					alert('공지사항 등록 완료');
				} else{
					alert('등록을 취소합니다.');
				}
			}
		})
	</script>
   </section>
   
   <footer id="footer" style="padding-top: 115px;">
     <c:import url="../layout/footer.jsp"/>
   </footer>
   
   
</body>
</html>
