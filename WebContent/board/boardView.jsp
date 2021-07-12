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

/* 게시판 사이즈 */
.container {max-width: 900px; margin: 50px auto;}

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
#viewForm {border: 1px solid #f2f2f2; border-radius: 5px;}
.title {padding-left: 20px;}
.contents {width: 100%; min-height: 300px; padding-left: 20px;}
.info {padding-right: 20px; color: grey;}
.btns {float: right;}

/* 댓글 폼 */
.cmtForm {background-color: #f2f2f2; border: 1px solid gainsboro; border-radius: 3px;}
.comments {padding: 20px;}
.comments textarea {margin: 0px; padding: 5px; border-color: #fff; border-radius: 5px;}
.replyForm {border: 1px solid gainsboro; border-radius: 5px; padding: 5px;}

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

		// 게시글 수정 폼으로 이동
		$("#modify").on("click", function() {
			$("#viewForm").attr("action", "modiForm.fb").submit();
		})
		
		// 댓글 삭제
		$("#delete").on("click", function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/deleteProc.fb?seq=${dto.seq}";
			}
		})
		
		// 댓글 수정
		$("body").on("click", "#modi", function() {
			if ($(this).val() == "수정") {
				$(this).val("완료");
				$(this).parents(".container").children(".content").attr("contenteditable", "true");
				$(this).parents(".container").children(".content").focus();
				$(this).parents(".").siblings(".seq").attr("name", "seq");
			} else {
				$(this).parents(".container").find(".modifytxt").val($(this).parents(".container").children(".content").text());
				$(this).parents(".commentForm").attr("action", "modifyCmt.fbc").submit();
			}
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
			<div class="container shadow-sm p-3 mb-5 bg-white rounded"
				id="notMember">
				로그인 후 사용이 가능합니다.<br> 
				<input type="button" id="main" class="btn btn-outline-secondary" value="메인페이지"> 
				<input type="button" id="login" class="btn btn-outline-secondary" value="로그인화면">
			</div>
		</c:otherwise>
	</c:choose>

	<!-- 메인 내비바 아래 공간 -->
	<div class="container-fluid" id="temp"><img src="board.jpg"></div>

		<div class="container">
			
			<!-- 게시글 출력 -->
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
							<h6 align="right">${dto.writer}   |   ${dto.write_date}</h6>
						</div>
					</div>
	
					<hr>
					<div class="row contents">
						<div class="col">
							<h4>${dto.contents}</h4>
						</div>
					</div>
					
					<!-- 로그인에 따라 게시글 관련 버튼이 다르게 출력됨 -->
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
	
			<!-- 댓글 작성 폼 -->
			<form action="writeCmt.fbc" method="post" id="cmtForm">
				<div class="container cmtForm">
					<div class="row">
						<div class="col">
							<i class="bi bi-check-all"></i> ${login.id}
						</div>
					</div>
	
					<div class="row comments">
						<div class="col">
							<textarea name="comments" style="width: 700px; height: 100px;"></textarea>
							<input type="hidden" value="${dto.seq}" name="parent_seq">
						</div>
	
						<div class="col">
							<a href="${pageContext.request.servletPath}/writeCmt.fbc?parent_seq=${dto.seq}">
								<button id="reply" class="btn btn-info" style="width: 100%; height: 100px; padding: 0px;">작성</button>
							</a>
						</div>
					</div>
				</div>
			</form>
	
			<!-- 댓글 출력 및 수정, 삭제 -->
			<c:forEach var="i" items="${clist}" varStatus="s">
				<c:choose>
					<c:when test="${login.id == i.writer}">
						<form action="" method="post" class="commentForm">
							<div class="container comment shadow-sm p-3 mb-5 bg-white rounded" style="overflow: hidden; width: 800px; margin: 0px 35px 0px 35px;">
								<div class="header" style="background-color: white; padding-bottom: 10px;">
									${i.writer} | ${i.write_date}</div>
	
								<div class="content">${i.comments}</div>
								<input type="hidden" name="comments" class="modifytxt"> 
								<input type="hidden" class="seq" value="${i.seq}">
	
								<div class="reply">
									<a href="${pageContext.request.contextPath}/deleteCmt.fbc?seq=${i.seq}&parent_seq=${dto.seq}" style="float: right;"> 
									<input type="button" class="btn btn-outline-danger" value="삭제" style="float: right;"></a>
									<input type="button" id=modi class="btn btn-outline-success" style="float: right; margin-bottom: 10px; margin-right: 5px;" value="수정">
								</div>
							</div>
	
							<input type="hidden" id="seq" name="seq" value="${i.seq}">
							<input type="hidden" name="parent_seq" value="${dto.seq}">
							<hr>
						</form>
					</c:when>
	
					<c:when test="${login.id == 'admin'}">
						<br>
						<div class="container shadow-sm p-3 mb-5 bg-white rounded" style="overflow: hidden; width: 800px; margin: 0px 35px 0px 35px;">
							<div class="header" style="background-color: white; padding-bottom: 10px;">
								${i.writer} | ${i.write_date}</div>
	
							<div class="content">${i.comments}</div>
							<input type="hidden" class="seq" value="${i.seq}">
	
							<div class="reply">
								<a href="${pageContext.request.contextPath}/deleteCmt.fbc?seq=${i.seq}&parent_seq=${dto.seq}" style="float: right;"> 
									<input type="button" class="btn btn-outline-danger" value="삭제" style="float: right;"></a>
							</div>
						</div>
	
						<input type="hidden" value="${i.seq}" id="seq" name="seq">
						<input type="hidden" name="parent_seq" value="${dto.seq}">
						<hr>
					</c:when>
	
					<c:otherwise>
						<br>
						<div class="container shadow-sm p-3 mb-5 bg-white rounded" style="overflow: hidden; width: 800px; margin: 0px 35px 0px 35px;">
							<div class="header" tyle="background-color: white; padding-bottom: 10px;">
								${i.writer} | ${i.write_date}</div>
	
							<div class="content">${i.comments}</div>
							<input type="hidden" class="seq" value="${i.seq}">
	
							<div class="reply"></div>
						</div>
	
						<input type="hidden" value="${i.seq}" id="seq" name="seq">
						<input type="hidden" name="parent_seq" value="${dto.seq}">
						<hr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		
		<!-- footer 여백 만듦 -->
		<div class="container-fluid" style="width: 100%; height: 100px; background-color: white;"></div>
		
</body>

</html>