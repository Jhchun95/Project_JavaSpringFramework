<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<style>
	/* 상단바 색상 변경 */
	.bg-dark {
	    background-color: #273b58!important;
	}
	/* Search바 있는 전체 레이아웃, 흰색 변경 */
	.jumbotron {
	    padding: 2rem 1rem;
	    margin-bottom: 2rem;
	    background-color: #ffffff;
	    border-radius: .3rem;
	}
	/* 우리 주변의 지역이름 ~ + 지금 우리 주변의 이웃들과 글씨 관련된 색상 변경코드 */
	body {
	    margin: 0;
	    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #000000;
	    text-align: left;
	    background-color: #fff;
	}
</style>
<body>

  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="/LifeShare">LifeShare</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

       <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto"><!-- 
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li> -->
        </ul>
       <!--  <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> -->
      </div>
      <!-- 로그인 전 -->
     
      
  
    
        
 	
      <ul class="navbar-nav mr-auto"> 
       <c:choose> 	 
   		 <c:when test="${loginOK != null}">
   		 <li class="nav-item active">
			<a class="nav-link">'${loginOK.name}'님</a>
		</li>
   		 <li class="nav-item active">
			<a class="nav-link" href="/LifeShare/logout ">Logout </a> 
		</li>
 	   <li class="nav-item active">
     	 	<a class="nav-link" href="/LifeShare/mypage=${loginOK.id} ">MyPage </a>
		</li>
		<c:choose>
		 <c:when test="${isOpen eq 0}">
			<li class="nav-item active">
	     	 	<a class="nav-link" href="/LifeShare/message/${loginOK.id} ">Message  </a> 
			</li>
			</c:when>
		<c:otherwise>
			<li class="nav-item active">
	     	 	<a class="nav-link" href="/LifeShare/message/${loginOK.id} ">Message <span class="badge badge-pill badge-danger">${isOpen}</span></a> 
			</li>
		</c:otherwise>
		</c:choose>
      </c:when>
      <c:otherwise>
		<li class="nav-item active">
			<a class="nav-link" href="/LifeShare/login ">Login </a> <!-- 로그인 새션이 없을 때 --> 
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/LifeShare/join ">Join </a> <!-- 로그인 새션이 없을 때 -->
		</li>
		 </c:otherwise>
		 </c:choose>
		</ul>
		 
		
    
    </nav>
  
</body>
</html>