<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage_header</title>
<style type="text/css">
#main_header{
   margin-left: 10px;
   margin-top: 10px;
   margin-bottom: 10px;
}
#profile_wrap{
   display: flex;
   justify-content: flex-start;
   flex-wrap: wrap;
}

#profile_wrap div{
   display: inline-block;
   vertical-align: middle;
}
#proimg{
   width:100px;
   height: 100px;
   flex-grow: 1;
}
#info_wrap{
   margin-left:20px;
   flex-grow: 10;
}
#info_wrap div{
   margin-bottom: 8px;
}
#name_d{
   display:inline;
   font-size: 30px;
   font-weight: 900;
   cursor: default;
}
#m_btn{
   border-color: lightgray;
   border-style: solid;
   border-width: 1px;
   border-radius:5px;
   padding: 5px 10px;
   margin-left: 5px;
   cursor: pointer;
}
#point_wrap{
   background:gold;
   border-radius: 5px;
   padding:10px 20px;
   font-weight: bold;
   align-self:center;
   flex-grow: 1;
}
#point_con{
   line-height:20px;
   vertical-align: middle;
}
#point_con:hover{
   cursor: pointer;
}
#next{
   width: 8px;
   height: 8px;
}

</style>
</head>
<body>
   <div id="main_header">
       <div id="profile_wrap">
          <div id="proimg_wrap">
             <input type="hidden" id="fileNm"/>
            <a id="" href="javascript:fnUpload();"><img src="<%=request.getContextPath()%>/resources/img/users.png" alt="찾아보기" id="proimg" /></a>
            <input type="file" id="fileUpload" style="display:none" onchange="$('#fileNm').val(this.value)"/>
         </div>
            <div id="info_wrap">
               <div id="name_d">관리자</div>
               <br>
               <br>
            </div>
            <div id="point_wrap">
               <div id="point_con">
                  <div id="point_1">마일리지 <img src="<%=request.getContextPath()%>/resources/img/next.png" id="next"/></div>
                  <br>
                  <div>2000</div>
               </div>
            </div>
       </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    <script type="text/javascript">      
      function fnUpload(){
      
         $('#fileUpload').click();
      
      }
   </script>
</body>
</html>