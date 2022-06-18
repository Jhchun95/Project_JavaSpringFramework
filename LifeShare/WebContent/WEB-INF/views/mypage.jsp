<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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
</head>
<style>
.textPost {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 300px;
	width:300px;
}
#mainimg {
	margin-top: 5px;
	margin-bottom: 5px;
	padding-bottom: 2px;
}
#btype1 {
	border: 1px outset #5882FA;
	color: #5882FA;
}

#btype2 {
	border: 1px outset #D358F7;
	color: #D358F7;
}

.thumbnail {
	width: 250px;
	height: 250px;
	object-fit: cover;
}
</style>
<body style="background-color: #ffffff">
	<jsp:include page="header.jsp" />

	</br>
	</br>
	</br>
	<div class="container">
		<!-- br 추가 -->
		<br>
		<div>
			<h1>My Page</h1>
		</div>
		<hr>
		<h2>회원정보</h2>
		<c:set var="my" value="${users}" />
		아이디: ${my.id} </br> 이름: ${my.name} </br> Level: ${my.level} </br>
		<p style="float: right;">
			<a class="btn btn-secondary" href="modify=${my.id}" role="button">수정하기
			</a>
		</p>
		<!-- br 추가 -->
		</br> </br><br>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<h1>My Post</h1>
		<hr>
		<div class="row">
        <c:forEach var="list" items="${boards}">
          <div class="col-md-3" style="margin: 0;">
          <div style="width:220px;">
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
          <div style="float:right;"><span class="badge badge-pill badge-light">&#x1f497; ${list.likes}</span></div>
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
			src="/LifeShare/board/show/img/${list.bid}" width="250" height="250">
			</c:otherwise>
			</c:choose>
		  </a>
          </div>
          	<h4>${list.title}</h4>
            <h6>${list.content}</h6>
            <p><a class="btn btn-secondary"href="/LifeShare/board/bid/${list.bid}" role="button">View details »</a></p>
          </div>
           </c:forEach>
        </div>
    
		<!-- br 추가 -->
		<br><br>
	</div>
	<!-- /container -->

</body>
</html>