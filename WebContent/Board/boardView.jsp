<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>

/* 메인 내비바 */
#navibar {
	background-color:white;
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
	line-height: 300px;
	text-align: center;
	font-size: 30px;
	font-style: initial;
	font-weight: 600;
}

/* 게시글 폼 */
#viewForm {
	border: 1px solid #f2f2f2;
	border-radius: 5px;
}
.title {padding-left: 20px;}
.contents {width: 100%; min-height: 300px; padding-left: 20px;}
.info {padding-right: 20px; color: grey;}
.btns {float: right;}

/* 댓글 폼 */
.cmtForm {
	background-color: #f2f2f2;
	border: 1px solid gainsboro;
	border-radius: 3px;
	width: 100%;
	height: 120px;
}
.comments {padding: 20px;}
.comments textarea {
	margin: 0px;
	padding: 5px;
	width: 100%;
	height: 15%;
	border-color: #fff;
	border-radius: 5px;
}
#reply {width: 90px; height: 55px;}
.replyForm {border: 1px solid gainsboro; border-radius: 5px; padding: 5px;}

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
		
		// 댓글 수정 및 삭제
		$("#modify").on("click", function() {
			$("#viewForm").attr("action", "modiForm.fb").submit();
		})
		$("#delete").on("click", function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/deleteProc.fb?seq=${dto.seq}";
			}
		})
		
		// 댓글 수정 폼
		$("#myForm").css("display", "none");

		$("#modifyCmt").on("click", function() {
			$("#myForm").show();
		})
		$("#close").on("click", function() {
			$("#myForm").hide();
			})
		})
	
</script>
</head>

<body>

	<div class="container-fluid">
	
		<div class="container-fluid p-0" id="navibar">
			<div class="row m-0">
				<div class="col-12 col-lg-3 col-xl-2 p-0">
					<img src="project_logo.jpg" id="searchImg">
				</div>
				<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
					<a href="#">산책장소</a>
				</div>
				<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
					<a href="#">팻시터</a>
				</div>
				<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
					<a href="#">갤러리</a>
				</div>
				<div class="col-3 col-lg-3 col-xl-1 p-0 navitext">
					<a href="#">자유게시판</a>
				</div>
				<div class="col-12 col-lg-4 col-xl-4 p-0">
					<img src="search.png" id="searchImg"> 
					<input type="text" placeholder="원하는구,장소를 검색하세요." class="form-control me-2 ml-3" id="search">
				</div>
				<div class="col-6 col-lg-4 col-xl-1 p-0 navitext" id="mypage">
					<a href="#">마이페이지</a>
				</div>
				<div class="col-6 col-lg-4 col-xl-1 p-0 navitext">
					<a href="#">로그아웃</a>
				</div>
			</div>
		</div>
		
		<div class="container-fluid" id="temp"></div>

		<div class="container" id="writeForm">

			<form action="" method="post" id="viewForm" class="shadow-sm p-3 mb-5 bg-white rounded">
			
				<div class="container viewForm">
					<div class="row title">
						<div class="col">
							<h6>[${dto.seq}]<input type="hidden" name="seq" value="${dto.seq}"></h6>
							<h3>${dto.title}</h3>
						</div>
					</div>

					<div class="row info">
						<div class="col">
							<h6 align="right">${dto.writer}|${dto.write_date}</h6>
						</div>
					</div>

					<hr>
					<div class="row contents">
						<div class="col">
							<h4>${dto.contents}</h4>
						</div>
					</div>

					<div class="row btns">
						<div class="col">
						
							<c:choose>
								<c:when test="${login.id == dto.writer}">
									<input type="button" class="btn btn-outline-success" value="수정" id="modify">
									<input type="button" class="btn btn-outline-danger" value="삭제" id="delete">
									<input type="button" class="btn btn-outline-info" value="목록" id="tolist" onclick="history.back()">
								</c:when>

								<c:when test="${login.id == 'admin'}">
									<input type="button" class="btn btn-outline-danger" value="삭제" id="delete">
									<input type="button" class="btn btn-outline-info" value="목록" id="tolist" onclick="history.back()">
								</c:when>

								<c:otherwise>
									<input type="button" class="btn btn-outline-info" value="목록" id="tolist" onclick="history.back()">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</form>

			<form action="writeCmt.fbc" method="post" id="cmtForm">
				<div class="container cmtForm">
					<div class="row">
						<div class="col">
							<i class="bi bi-check-all"></i> ${login.id}
						</div>
					</div>
					
					<div class="row comments">
						<div class="col-10">
							<textarea cols="80" rows="15" name="comments"></textarea>
							<input type="hidden" value="${dto.seq}" name="parent_seq">
						</div>

						<div class="col-2 justify-center">
							<a href="${pageContext.request.servletPath}/writeCmt.fbc?parent_seq=${dto.seq}">
								<button id="reply" class="btn btn-outline-info">작성</button>
							</a>
						</div>
					</div>
				</div>
			</form>

			<form action="${pageContext.request.contextPath}/modifyCmt.fbc" method="post" id="replyForm">
				<div class="container replyForm">
				
					<c:forEach var="i" items="${clist}" varStatus="s">
						<div class="row">
							<div class="col-10">
								<h6 align="left">[${s.count}] ${i.writer} | ${i.write_date}</h6>
							</div>

							<div class="col-2">
								<input type="hidden" name="seq" value="${i.seq}"> <input
									type="hidden" name="parent_seq" value="${i.parent_seq}">
									
								<c:choose>
									<c:when test="${login.id == i.writer}">
										<a href="#" onclick="return false;" id="modifyCmt">수정</a>
										<a href="${pageContext.request.contextPath}/deleteCmt.fbc?seq=${i.seq}&parent_seq=${i.parent_seq}"
											id="deleteCmt">삭제</a>
									</c:when>

									<c:when test="${login.id == 'admin'}">
										<a href="${pageContext.request.contextPath}/deleteCmt.fbc?seq=${i.seq}&parent_seq=${i.parent_seq}" id="deleteCmt">삭제</a>
									</c:when>
								</c:choose>
							</div>
						</div>

						<div class="row">
							<div class="col-12">
								<h5>${i.comments}</h5>
								<div class="form-popup" id="myForm">
									<textarea cols=80 rows=5 id="cmt" name="cmt">${i.comments}</textarea>
									<button type="submit" class="btn">수정완료</button>
									<button type="button" class="btn cancel" id="close">닫기</button>
								</div>
							</div>
						</div>
						<hr>
					</c:forEach>
				</div>
			</form>
		</div>
	</div>
	
</body>

</html>