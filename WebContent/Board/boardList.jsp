<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>

*{box-sizing: border-box;}

/* 메인 내비바 */
#navibar {
	background-color: rgba(255, 255, 255, 0.945);
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

#search {
	width: 250px;
	height: 41px;
	display: none;
}
#searchImg:active ~#search {left: 0px;}

.container {
	max-width: 900px;
	margin: 50px auto;
}

tfoot {position: relative;}

.page_nav {
	position: absolute;
	left: 50%;
	top: calc(50% + 0.475rem);
	transform: translate(-50%, -50%);
	margin-left: 20px;
}

.table {table-layout: fixed;}
.table thead {background-color: #f2f2f2;}
.table thead th {border-bottom: none;}
.table td, .table th {border-color: #ddd;}
.table td {word-wrap: break-word; position: relative;}


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

/* 게시판 검색 */
#searchBoard {color: white;}
select {
	border-radius: 5px;
	height: 30px;
	border-color: #c8e3c4;
	color:green;
}
input[name="keyword"]{
	border-color: #c8e3c4;
	border-radius: 5px;
}
#searchBoardBtn{
	border-radius: 5px;
	height: 30px;
	border-color: #c8e3c4;
	color: green;
	background-color: white;
}

/* 비회원 진입 화면 */
#notMember {
	border: 1px solid black;
	width: 500px;
	height: 300px;
	text-align: center;
	line-height: 150px;
}

</style>

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

		// 글 작성 화면 이동
		$("#write").on("click", function() {
			location.href = "Board/boardWrite.jsp";
		})
	})
	
</script>

</head>

<body>
	
	<c:choose>
		<c:when test="${login != null}"> 
		
			<div class="container-fluid">
				<div class="container-fluid p-0" id="navibar">
					<div class="row m-0">
						<div class="col-12 col-lg-3 col-xl-2 p-0">
							<img src="project_logo.jpg" id="searchImg">
						</div>
						<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
							<a href="${pageContext.request.contextPath}/getCourse.cos?course_area=종로구">산책장소</a>
						</div>
						<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
							<a href="${pageContext.request.contextPath}/petBoardList.pet?cpage=1">팻시터</a>
						</div>
						<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
							<a href="${pageContext.request.contextPath}/galList.gal?cpage=1">갤러리</a>
						</div>
						<div class="col-3 col-lg-3 col-xl-1 p-0 navitext">
							<a href="#">자유게시판</a>
						</div>
						<div class="col-12 col-lg-4 col-xl-4 p-0">
							<img src="search.png" id="searchImg"> <input type="text"
								placeholder="원하는구,장소를 검색하세요." class="form-control me-2 ml-3"
								id="search">
						</div>
						<div class="col-6 col-lg-4 col-xl-1 p-0 navitext" id="mypage">
							<a href="Mypage.mem">마이페이지</a>
						</div>
						<div class="col-6 col-lg-4 col-xl-1 p-0 navitext">
							<a href="#">로그아웃</a>
						</div>
					</div>
				</div>
				
				<div class="container-fluid" id="temp">자유게시판</div>

				<div class=container>
					<table width="500" align="center" class="table table-hover shadow-sm p-3 mb-5 bg-white rounded">
						
						<colgroup>
							<col width="10%">
							<col width="45%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
						</colgroup>
						
						<thead>
							<tr align="center">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="list" items="${list}">
								<tr align="center">
									<td width="5%">${list.seq}</td>
									<td width="30%"><a
										href="${pageContext.request.contextPath}/viewProc.fb?seq=${list.seq}">${list.title}</a>
									</td>
									<td width="15%">${list.writer}</td>
									<td width="15%">${list.write_date}</td>
									<td width="10%">${list.view_count}</td>
								</tr>
							</c:forEach>
						</tbody>

						<tfoot>
							<tr>
								<td colspan="5" align=center>
									<nav aria-label="Page navigation example" id="boardNavi">
										<ul class="pagination justify-content-center">
										
											<c:forEach var="i" items="${navi}" varStatus="s">
												<c:choose>
													<c:when test="${i == '>'}">
														<li class="page-item">
															<a class="page-link" href="${pageContext.request.contextPath}/listProc.fb?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}"
															id="rightNavi">${i}</a>
														</li>
													</c:when>

													<c:when test="${i == '<'}">
														<li class="page-item">
															<a class="page-link" href="${pageContext.request.contextPath}/listProc.fb?cpage=${navi[s.index+1]-1}&category=${category}&keyword=${keyword}"
															id="leftNavi">${i}</a>
														</li>
													</c:when>

													<c:otherwise>
														<li class="page-item active">
															<a class="page-link" href="${pageContext.request.contextPath}/listProc.fb?cpage=${i}&category=${category}&keyword=${keyword}"
															id="centerNavi">${i}</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</ul>
									</nav>
							</tr>
							
							<tr>
								<td colspan=5 id="searchBoard">
									<form action="listProc.fb" method="get">
										<input type="hidden" name="cpage" value="1"> 
										<select name="category">
											<option value="title">제목</option>
											<option value="writer">작성자</option>
										</select> 
										<input type="text" name="keyword" placeholder="검색어를 입력하세요.">
										<button id="searchBoardBtn" type="button">검색</button>
										<button id="write" type="button" class="btn btn-success float-right">글쓰기</button>
									</form>
							</tr>
					</table>
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
	
</body>
</html>