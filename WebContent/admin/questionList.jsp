<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">

<style>
/* 글씨체 적용 */
* {font-family: 'Sunflower';}

/* 메인 내비바 */
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
.navitext>a {color: black;}
.navitext>a:link {text-decoration: none;}
.navitext>a:hover {color: #52734D;}
.navitext>a:visited {color: black;}
.navitext:hover {border-bottom: 3px solid #52734D;}
#naviSearch {width: 250px; height: 41px; display: none;}
#searchImg:active ~#naviSearch {left: 0px;}

/* 메인 내비바 아래 제목 공간 */
#temp {
	margin-bottom: 50px;
	width: 100%;
	height: 300px;
	background-color: #c8e3c4;
	line-height: 400px;
	text-align: center;
	font-size: 30px;
	font-style: initial;
	font-weight: 600;
}

/* 게시판 사이즈 */
/* .container {max-width: 900px; margin: 50px auto;} */
.page_nav {position: absolute; left: 50%; top: calc(50% + 0.475rem); transform: translate(-50%, -50%); margin-left: 20px;}
.table {table-layout: fixed;}
.table thead {background-color: #f2f2f2;}
.table thead th {border-bottom: none;}
.table td, .table th {border-color: #ddd;}
.table td {word-wrap: break-word; position: relative;}
tfoot {position: relative;}

/* 메인 내비바 아래 제목 공간 */
#temp {
	margin-bottom: 50px;
	width: 100%;
	height: 300px;
	background-color: #c8e3c4;
	line-height: 400px;
	text-align: center;
	font-size: 30px;
	font-style: initial;
	font-weight: 600;
}

/* 게시판 페이지 내비 */
ul {list-style: none;}
li {float: left;}
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: black;}
a:hover {text-decoration: none; color: black;}
#boardNavi ul li {display: inline-block;}
#boardNavi ul li.active a {background: #fff; color: grey; border: 1px solid gainsboro;}

</style>

<script>
	$(function() {
		// 메인 내비바 검색창
		$("#searchImg").on("click",function(){
             $("#naviSearch").show("slow");
             $("#naviSearch").focus();
           })
        $("#naviSearch").on("blur",function(){
             $("#naviSearch").hide("slow");
           })
	})
</script>

</head>
<body>
	
	<!-- 메인 내비바 -->
	<c:choose>
		<c:when test="${login == null}">
			<div class="container-fluid">
				<div class="container-fluid p-0" id="navibar">
					<div class="row m-0">
						<div class="col-12 col-lg-3 col-xl-2 p-0">
							<a href="${pageContext.request.contextPath}/main.jsp"><img
								src="project_logo.jpg"></a>
						</div>
						<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
							<a href="${pageContext.request.contextPath}/getCourse.cos?course_area=종로구">산책장소</a>
						</div>
						<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
							<a href="${pageContext.request.contextPath}/petBoardList.pet?cpage=1">펫시터</a>
						</div>
						<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
							<a href="${pageContext.request.contextPath}/galList.gal?cpage=1">갤러리</a>
						</div>
						<div class="col-3 col-lg-3 col-xl-1 p-0 navitext">
							<a href="${pageContext.request.contextPath}/listProc.fb?cpage=1">자유게시판</a>
						</div>
						<div class="col-12 col-lg-4 col-xl-4 p-0">
							<img src="search.png" id="searchImg"> 
							<input type="text" placeholder="원하는구,장소를 검색하세요." class="form-control me-2 ml-3" id="naviSearch">
						</div>
						<div class="col-6 col-lg-4 col-xl-1 p-0 navitext" id="mypage">
							<a href="${pageContext.request.contextPath}/Mypage.mem">마이페이지</a>
						</div>
						<div class="col-6 col-lg-4 col-xl-1 p-0 navitext">
							<a href="${pageContext.request.contextPath}/logout.mem">로그아웃</a>
						</div>
					</div>
				</div>
		</c:when>

		<c:when test="${login.id=='admin'}">
			<div class="container-fluid p-0" id="navibar">
				<div class="row m-0">
					<div class="col-12 col-lg-3 col-xl-2 p-0">
						<a href="main.jsp"><img src="project_logo.jpg"></a>
					</div>
					<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
						<a href="${pageContext.request.contextPath}/getCourse.cos?course_area=종로구">산책장소</a>
					</div>
					<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
						<a href="${pageContext.request.contextPath}/petBoardList.pet?cpage=1">펫시터</a>
					</div>
					<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
						<a href="${pageContext.request.contextPath}/galList.gal?cpage=1">갤러리</a>
					</div>
					<div class="col-3 col-lg-3 col-xl-1 p-0 navitext">
						<a href="${pageContext.request.contextPath}/listProc.fb?cpage=1">자유게시판</a>
					</div>
					<div class="col-12 col-lg-4 col-xl-4 p-0">
						<img src="search.png" id="searchImg"> 
						<input type="text" placeholder="원하는구,장소를 검색하세요." class="form-control me-2 ml-3" id="naviSearch">
					</div>
					<div class="col-6 col-lg-4 col-xl-1 p-0 navitext" id="mypage">
						<a href="${pageContext.request.contextPath}/adminMain.admin">관리자</a>
					</div>
					<div class="col-6 col-lg-4 col-xl-1 p-0 navitext">
						<a href="${pageContext.request.contextPath}/logout.mem">로그아웃</a>
					</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="container shadow-sm p-3 mb-5 bg-white rounded" id="notMember">
				로그인 후 사용이 가능합니다.<br> 
				<input type="button" id="main" class="btn btn-outline-secondary" value="메인페이지"> 
				<input type="button" id="login" class="btn btn-outline-secondary" value="로그인화면">
			</div>
		</c:otherwise>
	</c:choose>

	<!-- 메인 내비바 아래 공간 -->
	<div class="container-fluid" id="temp"><img src="board.jpg"></div>

	<!-- 문의하기 쪽지함 목록 -->
	<div class="container" style="text-align:center;">
		문의하기 쪽지함 <hr>
		<c:forEach var="list" items="${list}" varStatus="">
			<div class="container form"  style="border: 1px solid grey; padding: 10px; text-align:center; border-radius:5px; margin-bottom:5px;">
				<div class="row">
					<div class="col">번호 : ${list.seq}</div>
					<div class="col">이름 : ${list.name}</div>
					<div class="col">이메일 : ${list.email}</div>
				</div>
				<hr>
				<div class="row">
					<div class="col">날짜 : ${list.ask_date}</div>
					<div class="col">카테고리 : ${list.type}</div>
					<div class="col"><a href="${pageContext.request.contextPath}/questionDelete.ask?seq=${list.seq}">
						<button class="btn btn-outline-info btn-sm delete">삭제</button></a></div>
				</div>
				<hr>
				<div class="row">
					<div class="col">내용 : ${list.contents}</div>
				</div>
			</div>
			
		</c:forEach>				
	</div>

	<!-- 페이지 내비 -->
	<nav aria-label="Page navigation example" id="boardNavi">
		<ul class="pagination justify-content-center">
			<c:forEach var="i" items="${navi}" varStatus="s">
				<c:choose>
					<c:when test="${i == '>'}">
						<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/questionList.ask?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}"
							id="rightNavi">${i}</a></li>
					</c:when>

					<c:when test="${i == '<'}">
						<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/questionList.ask?cpage=${navi[s.index+1]-1}&category=${category}&keyword=${keyword}"
							id="leftNavi">${i}</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item active">
						<a class="page-link" href="${pageContext.request.contextPath}/questionList.ask?cpage=${i}&category=${category}&keyword=${keyword}"
							id="centerNavi">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</nav>

	<!-- footer 여백 만듦 -->
	<div class="container-fluid" style="width: 100%; height: 100px; background-color: white;"></div>
	
</body>
</html>