<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LifeShare</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<style>
#btype1 {
	border: 1px outset #5882FA;
	color: #5882FA;
}

#btype2 {
	border: 1px outset #D358F7;
	color: #D358F7;
}

#mainimg {
	margin-top: 5px;
	margin-bottom: 5px;
	padding-bottom: 2px;
}
@font-face {
     font-family: 'S-CoreDream-5Medium';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
 @font-face { font-family: 'RIDIBatang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal; }
 #textcate{
     font-family: 'RIDIBatang';
     font-style:bold; font-size:1.5em;
 }
 #textmain{
     font-family: 'S-CoreDream-5Medium';
 }
/*
	img.absolute {
	    position: absolute;
	    left: 0px;
	    top: 0px;
	    z-index: -1; 
	} */
	.thumbnail {
		height: 250px;
		width: 250px;
		object-fit: cover;
	}
	/* 카테고리 중앙 정렬*/
	.text-sm-center {
    	text-align: center!important;
		margin : auto;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<main role="main"> <!-- Main jumbotron for a primary marketing message or call to action -->
	<!-- height 변경 -->
	<div class="jumbotron" style="margin-bottom: 0px; height: 450px;">
		<div class="container">
			<br>
			<br>
			<!-- LifeShare 사진 수정 -->
			<h1 class="display-3">
				<img src="resource/img/main1.png" height="190px">
			</h1>
			<!-- style 추가해서 글씨 위치 조정 -->
			<p style="margin-left:21px;font-size:18px;">우리주변의 지역이름과 원하시는 물품을 검색해주세요!</p>
			<form action="<c:url value='/board' />"
				class="form-inline my-2 my-lg-0">
				<!-- style width 변경 -->
				<input class="form-control mr-sm-2" id="keyword" name="keyword"
					type="text" placeholder="주소명/물품명을 입력해주세요." aria-label="Search"
					style="width: 383px;">
				<button class="btn btn-outline-primary my-2 my-sm-0" type="submit"> 검색 &#x1F50D; </button>
			</form>
		</div>
	</div>

	<header class="masthead d-flex"
		style="background-color: #f3f3f3; height: 400px;">
		<!-- 회색 변경 -->
		<!-- 지금 우리 주변의 이웃들과 나눔을 실천하세요! 레이아웃 색깔-->
		<div class="container text-center my-auto">
			<h1 class="mb-1" id="textmain">지금 우리 주변의 이웃들과 나눔을 실천하세요!</h1>
			<h3 class="mb-5">
				<em>Let's sharing with the neighbors around us now!</em>
			</h3>
			<a class="btn btn-primary btn-lg js-scroll-trigger" href="board/form" style="width:150pt;height:40pt;">
				Share </a>
		</div>
		<img src="resource/img/sharephoto.png">
		<div class="overlay"></div>
	</header>
	<!-- JH 수정 -->
	<br><br><br>
	<div style="background-color: #ffffff">
		<!-- 여기도 색깔 바꿔야합니다.-->
		<div class="container">
			<nav class="nav nav-pills flex-column flex-sm-row">
				<!-- style 추가 -->
				<a class="flex-sm-fill text-sm-center nav-link disabled" href="#" id="textcate">카테고리</a>
				<a class="flex-sm-fill text-sm-center nav-link" href="board">전체</a>
				<a class="flex-sm-fill text-sm-center nav-link" href="board?category=생활용품">생활용품</a>
				<a class="flex-sm-fill text-sm-center nav-link" href="board?category=패션잡화">패션잡화</a>
				<a class="flex-sm-fill text-sm-center nav-link" href="board?category=뷰티용품">뷰티용품</a>
				<a class="flex-sm-fill text-sm-center nav-link" href="board?category=디지털">디지털</a>
				<a class="flex-sm-fill text-sm-center nav-link" href="board?category=가구">가구</a>
				<a class="flex-sm-fill text-sm-center nav-link" href="board?category=도서">도서</a>
				<a class="flex-sm-fill text-sm-center nav-link" href="board?category=기타">기타</a>
			</nav>
			<br>
			<br>
			<!-- Example row of columns -->
			<h4>인기 게시물</h4>
			<hr>
			<div class="row">
				<c:forEach var="list" begin="0" end="3" items="${list_likes}">
					<div class="col-md-3">
						<div style="width: 250px;">
							<c:choose>
								<c:when test="${list.btype eq '나눔'}">
									<span class="badge badge-pill badge-light" id="btype1">${list.btype}</span>
								</c:when>
								<c:otherwise>
									<span class="badge badge-pill badge-light" id="btype2">${list.btype}</span>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${list.state eq '완료'}">
									<span class="badge badge-pill badge-dark">${list.state}</span>
								</c:when>
								<c:when test="${list.state eq '미완료'}">
									<span class="badge badge-pill badge-success">${list.state}</span>
								</c:when>
								<c:otherwise>
									<span class="badge badge-pill badge-warning">${list.state}</span>
								</c:otherwise>
							</c:choose>
							<div style="float: right;">
								<span class="badge badge-pill badge-light">&#x1f497;${list.likes}</span>
							</div>
						</div>
						<div id="mainimg">
							<a href="/LifeShare/board/bid/${list.bid}"> 
							<c:choose>
							<c:when test="${empty list.img}">
							<img src="resource/img/default.png" width="250">
							</c:when>
							<c:otherwise>
							<img
								class="thumbnail" alt="이미지가 존재하지 않습니다."
								src="/LifeShare/board/show/img/${list.bid}">
							</c:otherwise>
							</c:choose>
							</a>
						</div>
						<h6>${list.title}</h6>
					</div>
				</c:forEach>
			</div>
			<br>

		</div>
		<!-- /container -->

		<!-- br 추가 -->
		<br><br>
		<div class="container">
			<!-- Example row of columns -->
			<h4>최근 게시물</h4>
			<hr>
			<div class="row">
				<c:forEach var="list" begin="0" end="3" items="${list}">
					<div class="col-md-3">
						<div style="width: 250px;">
							<c:choose>
								<c:when test="${list.btype eq '나눔'}">
									<span class="badge badge-pill badge-light" id="btype1">${list.btype}</span>
								</c:when>
								<c:otherwise>
									<span class="badge badge-pill badge-light" id="btype2">${list.btype}</span>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${list.state eq '완료'}">
									<span class="badge badge-pill badge-dark">${list.state}</span>
								</c:when>
								<c:when test="${list.state eq '미완료'}">
									<span class="badge badge-pill badge-success">${list.state}</span>
								</c:when>
								<c:otherwise>
									<span class="badge badge-pill badge-warning">${list.state}</span>
								</c:otherwise>
							</c:choose>
							<div style="float: right;">
								<span class="badge badge-pill badge-light">&#x1f497;
									${list.likes}</span>
							</div>
						</div>
						<div id="mainimg">
							<a href="/LifeShare/board/bid/${list.bid}"> 
							<c:choose>
							<c:when test="${empty list.img}">
							<img src="resource/img/default.png" width="250">
							</c:when>
							<c:otherwise>
							<img
								class="thumbnail" alt="이미지가 존재하지 않습니다."
								src="/LifeShare/board/show/img/${list.bid}">
							</c:otherwise>
							</c:choose>
							</a>
						</div>
						<h6>${list.title}</h6>
					</div>
				</c:forEach>
			</div>
			<!-- br 추가 -->
			<br><br>
			<hr>

		</div>
		<!-- /container -->
	</div>
	</main>

	<!-- footer 수정 -->
    <footer class="container" >
      <p>©LifeShare Company 2020-2021</p>
      	  <!--  
	      <div class="footer item" >
			<p style="width:100%; height:110px; background-color:#495057;"></p>
	      </div> -->
    </footer>



</body>
</html>