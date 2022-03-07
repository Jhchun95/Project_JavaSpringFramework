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
#article-profile {
	width: 677px;
	margin: 0 auto;
}

#article-profile-left {
	display: inline-block;
	margin-left: 8px;
}

#article-profile .space-between {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#article-profile-image {
	display: inline-block;
}

#article-profile-right {
	position: absolute;
	right: 0;
	padding-right: 36px;
}

#article-description {
	padding: 32px 0;
	width: 677px;
	margin: 0 auto;
	border-bottom: 1px solid #e9ecef;
}

#content {
	margin-top: 100px;
	padding-bottom: 0;
}

#thisimage {
	width: 600px;
}

.thumbnail {
	height: 600px;
	width: 600px;
	object-fit: cover;
}

#content {
	margin-left: auto;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	</br>
	</br>
	</br>
	<c:set var="my" value="${users}" />
	<div id="content">

		<div>
			<section id="article-profile">
				<div class="space-between">
					<div>
						<div id="article-profile-image">
							<img alt="young"
								src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png">
						</div>
						<div id="article-profile-left">
							<div id="uid">${board.uid }</div>
							<div id="loc">${board.loc }</div>
							<c:choose>
								<c:when
									test="${level} gte 0 && ${level} lte 2 || ${level eq null}">
									<div>새싹</div>
								</c:when>
								<c:when test="${level} gte 3 && ${level} lte 5">
									<div>나물</div>
								</c:when>
								<c:when test="${level} gte 5 && ${level} lte 8">
									<div>꽃</div>
								</c:when>
								<c:when test="${level} gte 8 && ${level} lte 12">
									<div>나무</div>
								</c:when>
								<c:otherwise>
									<div>숲</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

				</div>
			</section>
			<section id="article-description">
				<h1 property="schema:name" id="article-title"
					style="margin-top: 0px;">${board.title }</h1>
				<p id="article-category">
					${board.category}
					<time> ${board.time_of_upload} </time>
					<br>조회수 ${board.views}
				</p>
				<p property="schema:priceValidUntil" datatype="xsd:date"
					content="2023-02-01"></p>
				<p rel="schema:url" resource="https://www.daangn.com/186771850"></p>
				<p property="schema:priceCurrency" content="KRW"></p>
				<p id="article-price" property="schema:price" content="60000.0"
					style="font-size: 20px; font-weight: bold;">${board.btype}</p>
				<p style="float: right;">
					<span class="badge badge-pill badge-light">&#x1f497; <c:choose>
							<c:when test="${board.btype eq '나눔'}">
								<span class="badge badge-pill badge-light" id="btype1">${board.btype}</span>
							</c:when>
							<c:otherwise>
								<span class="badge badge-pill badge-light" id="btype2">${board.btype}</span>
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when test="${board.state eq '완료'}">
								<span class="badge badge-pill badge-dark">${board.state}</span>
							</c:when>
							<c:when test="${board.state eq '미완료'}">
								<span class="badge badge-pill badge-success">${board.state}</span>
							</c:when>
							<c:otherwise>
								<span class="badge badge-pill badge-warning">${board.state}</span>
							</c:otherwise>
						</c:choose> <a href="/LifeShare/likes/${loginOK.id}/${bid}"
						style="color: red;"> 좋아요 ${board.likes}</a>
					</span>
				</p>
		
				<%-- <p id="article-counts">
			<p style="float: right;">
				<a href="/LifeShare/likes/${loginOK.id}/${bid}" style="color: red;">Likes&nbsp;</a>${board.likes}</p>
		 --%>
		<!-- 상태 변경하기  -->
				<c:choose>
					<c:when test="${loginOK.id eq board.uid}">
						<p style="float: left; margin-right: 30px;">
							<a href="/LifeShare/board/modify/${board.bid}"
								class="btn btn-outline-primary my-2 my-sm-0">수정하기</a>
						</p>
						<c:choose>

							<c:when test="${board.state eq '완료'}">
								<p style="float: left; margin-right: 30px;">
									<a href="#" class="btn btn-outline-primary my-2 my-sm-0">
										Share 완료</a>
								</p>
							</c:when>
							<c:when test="${board.state eq '미완료'}">
								<p style="float: left; margin-right: 30px;">
									<a href="/LifeShare/board/toreserved/${board.bid}"
										class="btn btn-outline-primary my-2 my-sm-0">예약으로 변경</a>
								</p>
							</c:when>

							<c:when test="${board.state eq '예약중'}">
								<p style="float: left; margin-right: 30px;">
									<a href="/LifeShare/board/tocomplete/${board.bid}/${users.id}"
										class="btn btn-outline-primary my-2 my-sm-0">완료로 변경</a>
								</p>
								<p style="float: left; margin-right: 30px;">
									<a href="/LifeShare/board/toincomplete/${board.bid}"
										class="btn btn-outline-primary my-2 my-sm-0">미완료로 변경</a>
								</p>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<p style="float: left; margin-right: 30px;">
							<a href="/LifeShare/message/newMessageForm/${board.uid}"
								class="btn btn-outline-primary my-2 my-sm-0">메세지 보내기</a>
						</p>
					</c:otherwise>
				</c:choose>
		</div>
		<!-- 이미지 부분  -->
		<div>
			<div property="schema:description" id="article-detail">
				<p>${board.content}</p>
			</div>
			<div id="contents">
				<c:choose>
					<c:when test="${empty board.img}">
					</c:when>
					<c:otherwise>
						<img class="thumbnail" alt="이미지가 존재하지 않습니다."
							src="/LifeShare/board/show/img/${board.bid}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<!-- 컨텐트 부분  -->



		</section>
	</div>
</body>
</html>