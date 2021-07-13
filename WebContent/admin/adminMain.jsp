<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
   rel="stylesheet">
<script>
   $(function() {

      // 네비바 검색창
      $("#searchImg").on("click", function() {
         $("#search").show("slow");
         $("#search").focus();
      })
      $("#search").on("blur", function() {
         $("#search").hide("slow");
      })

      //삭제버튼
      $(".block_reg").on("click",function() {
               $(".block_id").val($(this).parent().siblings(".mem_id").text());
               $(".block_name").val($(this).parent().siblings(".mem_name").text());
               $(".block_email").val($(this).parent().siblings(".mem_email").text());
               $(".block_contact").val($(this).parent().siblings(".mem_contact").text());
               $("#block_reg_form").submit();
               
            })
            
            
            $("#blacklistshowup").on("click",function(){
               var box1 = document.getElementById("BlackListView");
               var box2 = document.getElementById("BlackListView2");
               
               
            if(box1.style.display=="none"||box2.style.display=="none"){   
               $("#BlackListView").css("display","block");
               $("#BlackListView2").css("display","block");
            }
            else if(box1.style.display=="block"||box2.style.display=="block"){
               $("#BlackListView").css("display","none");
               $("#BlackListView2").css("display","none");
            }
            })
   })
</script>
<style>
* {
   font-family: 'Sunflower';
   box-sizing: border-box;
}

body {
   background-color: white;
   border-color: black;
}

#navibar {
   background-color: white;
   text-align: center;
   line-height: 98px;
   min-height: 100px;
   height: auto;
   position: fixed;
   top: 0px;
   left: 0px;
   font-weight: 600;
   font-size: large;
   z-index: 1000 !important;
}

.row div{text-align:center;}
.navitext>a {
   color: black;
}

.navitext>a:link {
   text-decoration: none;
}

.navitext>a:hover {
   color: #52734D;
}

.navitext>a:visited {
   color: black;
}

.navitext:hover {
   border-bottom: 3px solid #52734D;
}

#search {
   width: 250px;
   height: 41px;
   display: none;
}

#searchImg:active ~#search {
   left: 0px;
}

#topContainer {
   margin: auto;
   text-align: center;
   position: relative;
   top: 90px;
   max-width: 1150px;
}

.top {
   height: 250px;
   background-color: white;
   border-radius: 8px;
}

.img {
   border: 1px solid #ddd;
   border-radius: 50%;
}

.name>h2 {
   line-height: 160px;
}

.name>h2:after {
   display: block;
   border-bottom: 8px solid seagreen;
   position: relative;
   top: -60px;
   left: 30px;
   width: 150px;
   content: "";
}

#bottomContainer {
   margin: auto;
   text-align: center;
   position: relative;
   top: 40px;
   max-width: 1140px;
}

.menu {
   background-color: white;
   border-radius: 8px;
}

.menu>.row {
   height: 100px;
}

.title {
   line-height: 100px;
   border: 1px solid rgb(173, 173, 173);
   border-radius: 8px;
}

.side_menu {
   position: fixed;
   top: 120px;
   width: 250px;
}

.list-group {
   height: 100px;
}

.list-group-item {
   padding: 0px;
}

.admin_menu {
   width: 100%;
   height: 200px;
   text-align: center;
   line-height: 200px;
}

.container {
   box-sizing: border-box;
}
</style>
</head>
<body>
   <div class="container-fluid p-0" id="navibar">
      <div class="row m-0">
         <div class="col-12 col-lg-3 col-xl-2 p-0">
            <a href="main.jsp"><img src="project_logo.jpg"></a>
         </div>
         <div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
            <a
               href="${pageContext.request.contextPath}/getCourse.cos?course_area=종로구">산책장소</a>
         </div>
         <div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
            <a
               href="${pageContext.request.contextPath}/petBoardList.pet?cpage=1">펫시터</a>
         </div>
         <div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
            <a href="${pageContext.request.contextPath}/galList.gal?cpage=1">갤러리</a>
         </div>
         <div class="col-3 col-lg-3 col-xl-1 p-0 navitext">
            <a href="${pageContext.request.contextPath}/listProc.fb?cpage=1">자유게시판</a>
         </div>
         <div class="col-12 col-lg-4 col-xl-4 p-0">
            <img src="search.png" id="searchImg"> <input type="text"
               placeholder="원하는구,장소를 검색하세요." class="form-control me-2 ml-3"
               id="search">
         </div>
         <div class="col-6 col-lg-4 col-xl-1 p-0 navitext" id="mypage">
            <a href="Mypage.mem">관리자</a>
         </div>
         <div class="col-6 col-lg-4 col-xl-1 p-0 navitext">
            <a href="${pageContext.request.contextPath}/logout.mem">로그아웃</a>
         </div>
      </div>
   </div>
   <div class="container side_menu">
      <ul class="list-group" style="margin-top: 50px;">
         <li class="list-group-item"><a href="#"
            class="list-group-item list-group-item-action list-group-item-secondary admin_menu">회원
               명단</a></li>
         <li class="list-group-item"><a href="${pageContext.request.contextPath}/questionList.ask?cpage=1"
            class="list-group-item list-group-item-action list-group-item-secondary admin_menu">쪽지함</a></li>
         <li class="list-group-item"><a href="#"
            class="list-group-item list-group-item-action list-group-item-secondary admin_menu" id="blacklistshowup">블랙 리스트 회원 명단</a></li>
      </ul>
   </div>

   <div class="container-lg border p-0" id="BlackListView"
      style="display:none;width: 1600px; height: 500px; margin-left: 250px; margin-top: 170px; box-sizing: border-box">
      <h3 style="text-align: center">가입 회원 정보 조회</h3>

      <div class="row m-0" style="box-sizing: border-box">

         <div class="border col-lg-1 col-xl-1">아이디</div>
         <div class="border col-lg-2 col-xl-2">이메일</div>
         <div class="border col-lg-1 col-xl-1">이름</div>
         <div class="border col-lg-1 col-xl-1">연령대</div>
         <div class="border col-lg-2 col-xl-2">연락처</div>
         <div class="border col-lg-1 col-xl-1">가입날짜</div>
         <div class="border col-lg-3   col-xl-2">강제탈퇴사유설정</div>
         <div class="border col-lg-2 col-xl-2">강제 탈퇴</div>

      </div>

      <c:forEach var="mem" items="${Member}">
         <form action="${pageContext.request.contextPath}/block_member.mem"
            method="post" id="block_reg_form">
            <div class="row m-0" style="box-sizing: border-box">
               <div class="border col-lg-1 col-xl-1 mem_id">${mem.id}</div>
               <div class="border col-lg-2 col-xl-2 mem_email">${mem.email}</div>
               <div class="border col-lg-1 col-xl-1 mem_name">${mem.person_name}</div>
               <div class="border col-lg-1 col-xl-1 ">${mem.person_age}</div>
               <div class="border col-lg-2 col-xl-2 mem_contact">${mem.contact}</div>
               <div class="border col-lg-1 col-xl-1">${mem.reg_date}</div>
               <div class="border col-lg-3 col-xl-2">
                  <select name="block_reason">
                     <option value="타 회원 비방 및 욕설">타 회원 비방 및 욕설</option>
                     <option value="불법적인 경로로 가입">불법적인 경로로 가입</option>
                     <option value="불법적인/선정적인 게시물 게시">불법적/선정적인 게시물 게시</option>
                  </select>
               </div>
               <div class="border col-lg-2 col-xl-2">
                  <input type="button" value="블랙리스트로 등록" class="block_reg">
               </div>
               <input type=hidden name="id" class="block_id" value=""> <input
                  type=hidden name="name" class="block_name" value=""> <input
                  type=hidden name="contact" class="block_contact" value="">
               <input type=hidden name="email" class="block_email" value="">
            </div>
         </form>
      </c:forEach>



   </div>

   <div class="container-lg border p-0" id="BlackListView2"
      style="display:none; width: 1600px; height: 500px; margin-left: 250px; margin-top: 170px; box-sizing: border-box">
      <h3 style="text-align: center">블랙리스트 회원 조회</h3>

      <div class="row m-0" style="box-sizing: border-box; margin: auto;">
         <div class="border col-lg-1 col-xl-1">번호</div>
         <div class="border col-lg-1 col-xl-1">아이디</div>
         <div class="border col-lg-2 col-xl-2">이메일</div>
         <div class="border col-lg-1 col-xl-1">이름</div>
         <div class="border col-lg-2 col-xl-2">연락처</div>
         <div class="border col-lg-3   col-xl-2">강제 탈퇴 사유</div>
         <div class="border col-lg-1 col-xl-1">강제 탈퇴 날짜</div>

      </div>



      <div class="row m-0" style="box-sizing: border-box">

         <c:forEach var="blocked" items="${BlackList}">
         
            <div class="border col-lg-1 col-xl-1">${blocked.seq}</div>
            <div class="border col-lg-1 col-xl-1">${blocked.id}</div>
            <div class="border col-lg-2 col-xl-2">${blocked.email}</div>
            <div class="border col-lg-1 col-xl-1">${blocked.name}</div>
            <div class="border col-lg-2 col-xl-2">${blocked.contact}</div>
            <div class="border col-lg-3   col-xl-2">${blocked.block_reason}</div>
            <div class="border col-lg-1 col-xl-1">${blocked.block_date}</div>

         </c:forEach>
      </div>

   </div>








</body>
</html>