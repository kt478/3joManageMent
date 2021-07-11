<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Team_Project2</title> 

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
* {
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

#searchImg:hover {
	cursor: pointer;
}

/*갤러리 화살표 스타일  */
.carousel-control-next:after {
	content: '>';
	font-size: 60px;
	color: green;
}

.carousel-control-prev:after {
	content: '<';
	font-size: 60px;
	color: green;
}
</style>
<script>
        $(function(){
           
        	// 네비바 검색창
            $("#searchImg").on("click",function(){
                $("#search").show("slow");
                $("#search").focus();
            })
            $("#search").on("blur",function(){
               $("#search").hide("slow");
            })
            // 펫시터
			$("#petsitter, #read_more_pet").on("click",function(){
					let result = confirm("로그인이 필요한 화면입니다 로그인 하시겠습니까?")
					if(result){
						location.href="Signup/login.jsp";
					}else {
					location.href="main.jsp";
				}
			})
			//네비바 검색창에서 검색기능
        	$("#search").on("keyup",function(e){
        		if(e.keyCode==13){
        			let search = $("#search").val();
        			location.href="${pageContext.request.contextPath}/search.cos?cpage=1&keyWord="+search;
        		}
        	})
			
            
        })    
    </script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">


<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/style.css">
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

<!--부트스트랩4 cdn 만약, 오류나면 지워라  -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"> -->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>


<body>



<!--네비바  -->
	<c:choose>

		<c:when test="${login.id==null}">
			<div class="container-fluid p-0" id="navibar">


				<div class="row m-0">
					<div class="col-12 col-lg-3 col-xl-2 p-0">
						<a href="beforeLogin.gal?cpage=1"><img src="project_logo.jpg"></a>
					</div>
					<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
						<a href="${pageContext.request.contextPath}/getCourse.cos?course_area=종로구">산책장소</a>
					</div>
					<div class="col-3 col-lg-2 col-xl-1 p-0 navitext">
						<a href= "javascript:;" id="petsitter">펫시터</a>
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
						<a href="Signup/signupView.jsp">회원가입</a>
					</div>
					<div class="col-6 col-lg-4 col-xl-1 p-0 navitext">
						<a href="Signup/login.jsp">로그인</a>
					</div>
				</div>

			</div>
		</c:when>


		<c:otherwise>
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
						<img src="search.png" id="searchImg"> <input type="text"
							placeholder="원하는구,장소를 검색하세요." class="form-control me-2 ml-3"
							id="search">
					</div>
					<div class="col-6 col-lg-4 col-xl-1 p-0 navitext" id="mypage">
						<a href="${pageContext.request.contextPath}/Mypage.mem">마이페이지</a>
					</div>
					<div class="col-6 col-lg-4 col-xl-1 p-0 navitext">
						<a href="logout.mem">로그아웃</a>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<!-- 친구들과 함께 산책해보세요! -->
	<div class="hero-wrap js-fullheight"
		style="background-image: url('images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-11 ftco-animate text-center">
					<h1 class="mb-4"
						style="font-weight: 200px; font-family: 'Sunflower';">
						<a href="#" style="color: white;">친구들과 함께 산책해 보세요!</a>
					</h1>
					<!-- <p><a href="#" class="btn btn-primary mr-md-4 py-3 px-4" style="font-size: large;font-weight: 100px; margin-top:50px;">둘러보기<span class="ion-ios-arrow-forward"></span></a></p> -->
				</div>
			</div>
		</div>
	</div>



<!--산책 / 펫시터 / 갤러리  -->
	<section class="ftco-section bg-light ftco-no-pt ftco-intro">
		<div class="container">
			<div class="row">

				<div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
					<div class="d-block services text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-blind"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">산책</h3>
							<p>주변, 혹은 다른 지역의 친구들과 함께 산책해 보세요. 여러 지역을 산책로를 둘러보고 마음에 드는
								산책로를 선택할 수 있습니다.</p>
							<a href="#"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="fa fa-chevron-right"></span><i class="sr-only">Read
									more</i></a>
						</div>
					</div>
				</div>

				<div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
					<div class="d-block services text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-dog-eating"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">펫시터</h3>
							<p>여러분의 강아지를 믿고 맡길 수 있는 분에게 잠시 위탁해보세요! 강아지에게 새로운 경험을 선물해 주세요!</p>
							<c:choose>
							<c:when test="${login.id==null}">
							<a href= "javascript:;" id="read_more_pet"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="fa fa-chevron-right"></span><i class="sr-only">Read
									more</i></a>
							</c:when>
							<c:otherwise>
							<a href="${pageContext.request.contextPath}/petBoardList.pet?cpage=1"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="fa fa-chevron-right"></span><i class="sr-only">Read
									more</i></a>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>


				<div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
					<div class="d-block services text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-pawprint-1"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">갤러리</h3>
							<p>귀여운 강아지들의 활동모습을 구경해 보세요.</p>
							<a href="galList.gal?cpage=1"
								class="btn-custom d-flex align-items-center justify-content-center"><span
								class="fa fa-chevron-right"></span><i class="sr-only">Read
									more</i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<!--사이트 장점  -->
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex no-gutters">
				<div class="col-md-5 d-flex">
					<div
						class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0"
						style="background-image: url(images/about-1.jpg);"></div>
				</div>
				<div class="col-md-7 pl-md-5 py-md-5">
					<div class="heading-section pt-md-5">
						<h2 class="mb-4">우리 사이트의 장점은?</h2>
					</div>
					<div class="row">
						<div class="col-md-6 services-2 w-100 d-flex">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-stethoscope"></span>
							</div>
							<div class="text pl-3">
								<h4>케어를 해줍니다.</h4>
								<p>강아지와 함께 재밌는 놀이</p>
							</div>
						</div>
						<div class="col-md-6 services-2 w-100 d-flex">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-customer-service"></span>
							</div>
							<div class="text pl-3">
								<h4>서로를 연결해 줍니다.</h4>
								<p>서로 연결</p>
							</div>
						</div>
						<div class="col-md-6 services-2 w-100 d-flex">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-emergency-call"></span>
							</div>
							<div class="text pl-3">
								<h4>선별된 사용자들</h4>
								<p>모든 사용자들을 믿고 이용하실 수 있습니다.</p>
							</div>
						</div>
						<div class="col-md-6 services-2 w-100 d-flex">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-veterinarian"></span>
							</div>
							<div class="text pl-3">
								<h4>언제든지 물어보세요.</h4>
								<p>언제든 문의사항을 질문하시면, 빠르게 답변드립니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- 산책장소 -->
	<div class="hero-wrap js-fullheight" id="backGif"
		style="background: linear-gradient(to bottom, rgba(92, 77, 66, 0.8) 0%, rgba(92, 77, 66, 0.8) 100%), url('images/dogWalk.gif');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-11 ftco-animate text-center">
					<h1 class="mb-4" style="font-size: 40px; font-family: 'Sunflower';">
						산책장소!<br> 정하기 어려우셨다구요?<br>추천코스를 이용해보세요!
					</h1>
					<p>
						<a href="#" class="btn btn-primary mr-md-4 py-3 px-4"
							style="font-size: large;">둘러보기<span
							class="ion-ios-arrow-forward"></span></a>
					</p>
				</div>
			</div>
		</div>
	</div>




	<!--포토북  -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center pb-5 mb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h2>포 토 북</h2>
					<hr
						style="height: 0.2rem; max-width: 3.25rem; margin: 1.5rem auto; background-color: #146c43; opacity: 1;">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 ftco-animate">
					<div class="work mb-4 img d-flex align-items-end"
						style="background-image: url(images/gallery-1.jpg);">
						<a href="images/gallery-1.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="fa fa-expand"></span>
						</a>
						<div class="desc w-100 px-4">
							<div class="text w-100 mb-3">
								<span>Cat</span>
								<h2>
									<a href="work-single.html">Persian Cat</a>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="work mb-4 img d-flex align-items-end"
						style="background-image: url(images/gallery-2.jpg);">
						<a href="images/gallery-2.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="fa fa-expand"></span>
						</a>
						<div class="desc w-100 px-4">
							<div class="text w-100 mb-3">
								<span>Dog</span>
								<h2>
									<a href="work-single.html">Pomeranian</a>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="work mb-4 img d-flex align-items-end"
						style="background-image: url(images/gallery-3.jpg);">
						<a href="images/gallery-3.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="fa fa-expand"></span>
						</a>
						<div class="desc w-100 px-4">
							<div class="text w-100 mb-3">
								<span>Cat</span>
								<h2>
									<a href="work-single.html">Sphynx Cat</a>
								</h2>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 ftco-animate">
					<div class="work mb-4 img d-flex align-items-end"
						style="background-image: url(images/gallery-4.jpg);">
						<a href="images/gallery-4.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="fa fa-expand"></span>
						</a>
						<div class="desc w-100 px-4">
							<div class="text w-100 mb-3">
								<span>Cat</span>
								<h2>
									<a href="work-single.html">British Shorthair</a>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="work mb-4 img d-flex align-items-end"
						style="background-image: url(images/gallery-5.jpg);">
						<a href="images/gallery-5.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="fa fa-expand"></span>
						</a>
						<div class="desc w-100 px-4">
							<div class="text w-100 mb-3">
								<span>Dog</span>
								<h2>
									<a href="work-single.html">Beagle</a>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="work mb-4 img d-flex align-items-end"
						style="background-image: url(images/gallery-6.jpg);">
						<a href="images/gallery-6.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="fa fa-expand"></span>
						</a>
						<div class="desc w-100 px-4">
							<div class="text w-100 mb-3">
								<span>Dog</span>
								<h2>
									<a href="work-single.html">Pug</a>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!--갤러리  -->
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center pb-5 mb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h2 style="border: 1px;">갤 러 리</h2>
					<hr
						style="height: 0.2rem; max-width: 3.25rem; margin: 1.5rem auto; background-color: #146c43; opacity: 1;">
				</div>
			</div>



			

				
						<div class="row d-flex">

							<c:forEach var="i" items="${list }">
								<div class="col-md-4 d-flex ftco-animate">
									<div class="blog-entry align-self-stretch"
										style="width: 350px; height: 500px;">
										<a href="blog-single.html" class="block-20 rounded"> 
										<img src="files/${i.thumbPath}" style="width:100%;height:100%;">
										</a>
										<div class="text p-4">
											<div class="meta mb-2">
												<div>
													<a href="#">${i.write_date }</a>
												</div>

												
											</div>
											<div class="meta mb-2">
                  								<div><a href="#">글쓴이 : ${i.writer } </a></div>
                 
                							</div>
											<h3 class="heading">
												<a href="#" style="font-size:25px;">${i.title }</a>
											</h3>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					


		</div>
	</section>











	<!--문의하기  -->
	<section
		class="ftco-appointment ftco-section ftco-no-pt ftco-no-pb img"
		style="background-image: url(images/bg_3.png);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row d-md-flex justify-content-end">
				<div class="col-md-12 col-lg-6 half p-3 py-5 pl-lg-5 ftco-animate">
					<h2 class="mb-4">문의하기</h2>
					<form action="#" class="appointment">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<div class="form-field">
										<div class="select-wrap">
											<div class="icon">
												<span class="fa fa-chevron-down"></span>
											</div>
											<select name="" id="" class="form-control">
												<option value="">선택하세요</option>
												<option value="">산책장소</option>
												<option value="">펫시터</option>
												<option value="">갤러리</option>
												<option value="">플래너</option>
												<option value="">기타</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="이름*">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="메일*">
								</div>
							</div>


							<div class="col-md-12">
								<div class="form-group">
									<textarea name="" id="" cols="30" rows="7" class="form-control"
										placeholder="내용*"></textarea>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" value="문의 보내기"
										class="btn btn-primary py-3 px-4">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	
<!-- 하단 네비  -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">WAKI TOKI</h2>
					<p>
						Walk with dog Talk with dog의 줄임말로 반려견과 함께 호흡하는 즐거운 시간을 나타내는 말입니다.<br>
						<br> 소중한 반려견과 편안한 시간을 갖도록 도움을 주는 웹 플랫폼입니다.<br>
						<br> 산책친구찾기 기능부터 산책장소 추천 펫시터모집까지 다양한 편의기능을 지원합니다.
					</p>
					<ul class="ftco-footer-social p-0">
						<li class="ftco-animate"><a href="#" data-toggle="tooltip"
							data-placement="top" title="Twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#" data-toggle="tooltip"
							data-placement="top" title="Facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#" data-toggle="tooltip"
							data-placement="top" title="Instagram"><span
								class="fa fa-instagram"></span></a></li>
					</ul>
				</div>
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">최신 갤러리</h2>
					<div class="block-21 mb-4 d-flex">
						<a class="img mr-4 rounded"
							style="background-image: url(images/image_1.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">강아지와 함께 산책</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span>2021년 6월 7일</a>
								</div>

							</div>
						</div>
					</div>
					<div class="block-21 mb-4 d-flex">
						<a class="img mr-4 rounded"
							style="background-image: url(images/image_2.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">강아지 목욕시키기</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> 2021년 5월
										20일</a>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 pl-lg-5 mb-4 mb-md-0">
					<h2 class="footer-heading">빠른 메뉴</h2>
					<ul class="list-unstyled">
						<li><a href="#" class="py-2 d-block">홈</a></li>
						<li><a href="#" class="py-2 d-block">산책</a></li>
						<li><a href="#" class="py-2 d-block">펫시터</a></li>
						<li><a href="#" class="py-2 d-block">플레너</a></li>
						<li><a href="#" class="py-2 d-block">갤러리</a></li>
						<li><a href="#" class="py-2 d-block">문의하기</a></li>
					</ul>
				</div>
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">궁금한점이 있으신가요?</h2>
					<div class="block-23 mb-3">
						<ul>
							<li><span class="icon fa fa-map"></span><span class="text">203
									Fake St. Mountain View, San Francisco, California, USA</span></li>
							<li><a href="#"><span class="icon fa fa-phone"></span><span
									class="text">+2 392 3929 210</span></a></li>
							<li><a href="#"><span class="icon fa fa-paper-plane"></span><span
									class="text">info@yourdomain.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-md-12 text-center">

					<p class="copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib.com</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>




	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>



</body>
</html>