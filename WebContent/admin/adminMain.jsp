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
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
	})
</script>
<style>
* {
	font-family: 'Sunflower';
}

body {
	background-color:;
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

=======
<
script src ="https: //ajax.googleapis.com /ajax /libs /jquery /3.5.1 /jquery.min.js
	"> </script> <link rel ="stylesheet " href ="https: //code.jquery.com /ui
	/1.12.1 /themes /base /jquery-ui.css "> <link rel ="stylesheet " href
	="https: //stackpath.bootstrapcdn.com /bootstrap /4.3.1 /css /bootstrap.min.css
	"> <script src ="https: //cdnjs.cloudflare.com /ajax /libs /popper.js /1.14.7
	/umd /popper.min.js "> </script> <script src ="https: //stackpath.bootstrapcdn.com
	/bootstrap /4.3.1 /js /bootstrap.min.js "> </script> <link rel ="preconnect
	" href ="https: //fonts.googleapis.com "> <link rel ="preconnect " href
	="https: //fonts.gstatic.com " crossorigin> <link href ="https: //fonts.googleapis.com
	/css2 ?family =Jua &display =swap " rel ="stylesheet "> <link href ="https:
	//fonts.googleapis.com /css2 ?family =Gugi &display =swap " rel ="stylesheet
	"> <link href ="https: //fonts.googleapis.com /css2 ?family =Nanum+Brush+Script
	&display =swap " rel ="stylesheet "> <link href ="https: //fonts.googleapis.com
	/css2 ?family =Sunflower:wght @300 &display =swap " rel ="stylesheet ">
	<script> $(function () { // 네비바 검색창 $("#searchImg").on("click",
	function () { $("#search").show("slow"); $("#search ").focus();
	
}

)

     
$
(
"
#search ").on( "blur ", function () { $("#search ").hide("slow");
	
}

)

     
}
)


</
script> <style>* {
	font-family: 'Sunflower';
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

/* 회원 명단 style */
.memberList {
	position: absolute;
	top: 120px;
	left: 400px;
}
</style>
</head>
<body>

	<div class="container-fluid p-0" id="navibar">
		<div class="row m-0">
			<div class="col-12 col-lg-3 col-xl-2 p-0">
				<a href="${pageContext.request.contextPath}/main.jsp"><img
					src="project_logo.jpg"></a>
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
				<a href="#">관리자</a>
			</div>
			<div class="col-6 col-lg-4 col-xl-1 p-0 navitext">
				<a href="${pageContext.request.contextPath}/logout.mem">로그아웃</a>
			</div>
		</div>
	</div>
	<div class="container side_menu">
		<ul class="list-group">
			<li class="list-group-item"><a
				href="${pageContext.request.contextPath}/memberList.admin?cpage=1"
				class="list-group-item list-group-item-action list-group-item-secondary admin_menu">회원
					명단</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/questionList.ask?cpage=1"
				class="list-group-item list-group-item-action list-group-item-secondary admin_menu">쪽지함</a>
			</li>
			<li class="list-group-item"><a href="#"
				class="list-group-item list-group-item-action list-group-item-secondary admin_menu">블랙리스트명단</a>
			</li>
		</ul>
	</div>

</body>
</html>