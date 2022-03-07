<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>게시글 목록</title>
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/blog/">

	    <!-- Bootstrap core CSS -->
	<link href="/docs/4.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	
	    <!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/4.5/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/4.5/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/4.5/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
	<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon.ico">
	<meta name="msapplication-config" content="/docs/4.5/assets/img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#563d7c">
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <style>
        @font-face { font-family: 'RIDIBatang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal; }
      #text1{
      	margin-top:50px;
      	font-family: 'RIDIBatang';
        font-size: 1.1rem;
        text-anchor: middle;
      }
	#btype1 {border:1px outset #5882FA; color:#5882FA;}
	#btype2 {border:1px outset #D358F7; color:#D358F7;}
	#mainimg{margin-top:5px; margin-bottom:1px; padding-bottom:2px;}
	#order{margin-top:60px;}
	
		/* 중앙 정렬 추가 */
		.centered { 
			display: table; 
			margin:0 auto; 
		}
	
	</style>
	
    <script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/board";

		url = url + "?order=" + "${categoryOrder.order}";
		url = url + "&category=" + "${categoryOrder.category}";
		url = url + "&keyword=" + "${categoryOrder.keyword}";
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	
  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, order, category, keyword) {
		var url = "${pageContext.request.contextPath}/board";

		url = url + "?order=" + order;
		url = url + "&category=" + category;
		url = url + "&keyword=" + keyword;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, order, category, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/board";

		url = url + "?order=" + "${categoryOrder.order}";
		url = url + "&category=" + "${categoryOrder.category}";
		url = url + "&keyword=" + "${categoryOrder.keyword}";
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	</script>
</head>
<body style="overflow-x:hidden">
<jsp:include page="header.jsp"/>
 <br><br>
 <!-- width 수정 -->
<div style="width:1600px;">
 <div class="col-11">
 
 <br>
 <div style="margin-left:50px;">
 <div style="text-align:center;">
 <c:if test="${categoryOrder.keyword ne ''}">
 <c:choose>
 <c:when test="${categoryOrder.listCnt eq '0'}">
 <p id="text1">${categoryOrder.keyword} 에 대한 검색 결과가 존재하지 않습니다.</p>
 <a href="javascript:history.back()" class="btn btn-light">홈으로</a>
 </c:when>
 <c:otherwise>
  <p id="text1">${categoryOrder.keyword} 에 대한 검색 결과입니다.</p>
  </c:otherwise>
  </c:choose>
 </c:if>
 </div>
 <br><br>
 <c:if test="${categoryOrder.listCnt ne '0'}">
    <a class="size" href="<c:url value='/board'><c:param name='order' value=''/><c:param name='category' value='${categoryOrder.category}'/><c:param name='keyword' value='${categoryOrder.keyword}'/>
    </c:url>">
   최신순&nbsp;&nbsp;</a>
   <a class="size" href="<c:url value='/board'><c:param name='order' value='likes'/><c:param name='category' value='${categoryOrder.category}'/><c:param name='keyword' value='${categoryOrder.keyword}'/>
      </c:url>">
   인기순&nbsp;&nbsp;</a>
   <a class="size" href="<c:url value='/board'><c:param name='order' value='views'/><c:param name='category' value='${categoryOrder.category}'/><c:param name='keyword' value='${categoryOrder.keyword}'/>
      </c:url>">
   조회순&nbsp;&nbsp;</a>
   <div class="float-right">
      <button type="button" class="btn btn-primary text-left" onClick="location.href='<c:url value='/board/form' />'">글쓰기</button>
      </div>
   <hr>
   <br>
   <div class="row">
        <c:forEach var="list" items="${boards}">
          <div class="col-md-2" style="float: none; margin: 10 auto;">
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
			<img src="resource/img/default.png" width="220">
			</c:when>
			<c:otherwise>
			<img
			class="thumbnail" alt="이미지가 존재하지 않습니다."
			src="/LifeShare/board/show/img/${list.bid}" width="220" height="220">
			</c:otherwise>
			</c:choose>
		  </a>
          </div>
            <h6>${list.title}</h6><br>
          </div>
           </c:forEach>
        </div> </c:if></div>
</div>
   <hr>
   <br><br>
	
	 <nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${categoryOrder.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${categoryOrder.page}', '${categoryOrder.range}', '${categoryOrder.rangeSize}')">이전</a></li>
			</c:if>

			<c:forEach begin="${categoryOrder.startPage}" end="${categoryOrder.endPage}" var="idx">
				<li class="page-item <c:out value="${categoryOrder.page == idx ? 'active' : ''}"/> ">
				<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${categoryOrder.range}', '${categoryOrder.rangeSize}', '${categoryOrder.order}', '${categoryOrder.category}', '${categoryOrder.keyword}')"> ${idx} </a></li>
			</c:forEach>

			<c:if test="${categoryOrder.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${categoryOrder.page}', '${categoryOrder.range}', '${categoryOrder.rangeSize}')" >다음</a></li>
			</c:if>
		</ul>
	</nav> 
<br>
<br>
</div>
</body>
</html>
