<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Modify</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<!-- 색깔 흰색으로 변경 -->
<body style ="background-color:#ffffff">
<jsp:include page="header.jsp"/>
<div class="container">
</br></br></br>
<h1>My Page - Modify</h1>

	<%-- <form action="update" method="post">
	<c:set var="my" value="${users}" />	

	ID:
	Password:<input type =text name="password" id="password" value="${my.password}"></br>
	Phone:<input type =text name="phone" id="phone" value="${my.phone}"></br>		
	Name<input type =text name="name" id="name" value="${my.name}"></br>
	Level<input type =text name="level" id="level" readOnly value="${my.level}"></br>
	<input type = submit value ="수정하기" class="btn btn-secondary">
	
	</form> --%>
	<c:set var="my" value="${users}" />	
	<form class="needs-validation" action="update" method="post">
            
             <div class="mb-3">
               <label for="firstName">ID</label>
               <input type =text class="form-control" name="id" id="id" readOnly value="${my.id}">
             </div>
          
            <div class="mb-3">
              <label for="username">UserName</label>
              <div class="input-group">
                <input type="text" class="form-control" name="name" id="name" value="${my.name}" readOnly placeholder="Username">
               
              </div>
            </div>

            <div class="mb-3">
              <label for="phone">Phone</label>
              <input type="text" class="form-control" name="phone" id="phone" value="${my.phone}" placeholder="ex)010-xxxx-xxxx">
            </div>

            <div class="mb-3">
              <label for="password">Password</label>
              <input type="password" class="form-control"  name="password" id="password" placeholder= "password">
            </div>

            <div class="mb-3">
              <label for="password">Password-Check</label>
              <input type="password" class="form-control"  name="cpassword" id="cpassword" placeholder= "password">
            </div>

            
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">수정하기</button>
          </form>
</div>
	
</body>
</html>