<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

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
	<style>
        @font-face { font-family: 'RIDIBatang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal; }
      #text1{
      	margin-top:50px;
      	font-family: 'RIDIBatang';
        font-size: 1.1rem;
        text-anchor: middle;
      }
      #margin{padding-top:50px;}
    </style>
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
<title>나의 쪽지함</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container" id="margin">
        <div class="text-center">
            <p id="text1">나의 쪽지함</p>
	<table class="table" align="center">
	 	<thead>
		<th>아이디</th>
		<th>최근 받은 쪽지</th>
		<th>보낸 날짜</th>
		<br><br>
		</thead>
		<tbody>
	  <c:forEach var="myMessage" items="${myMessage}">
	  <c:choose>
	  <c:when test="${loginOK.id eq myMessage.sender}">
	  <c:set var="myid" value="${myMessage.sender}"/>
	  <c:set var="yourid" value="${myMessage.receiver}"/>
	  </c:when>
	  <c:otherwise>
	  <c:set var="yourid" value="${myMessage.sender}"/>
	  <c:set var="myid" value="${myMessage.receiver}"/>
	  </c:otherwise>
	  </c:choose>
	  <c:set var="mid" value="${myMessage.mid}"/>
	  <c:set var="isopen" value="${myMessage.is_open}"/>
	  <c:if test="${isopen eq '0'}">
	  	<tr align="center">
		  <td width="190" align="center" style="vertical-align:middle" bgcolor="ffffff" height="20">
		  	${yourid}
		  </td>
		  <td onMouseOver="this.style.backgroundColor='#F4F4F4';" style="cursor:pointer;" onMouseOut="this.style.backgroundColor=''" onClick="location.href='/LifeShare/message/${myid}/${yourid}/${mid} '" width="200" align="center" bgcolor="ffffff" height="20">
		    ${myMessage.message}<h4 class="small text-muted">안읽음</h4>
		  </td>
		  <td width="200" align="center" style="vertical-align:middle" bgcolor="ffffff" height="20">
		  <fmt:formatDate value="${myMessage.send_date}" type="both" pattern="yyyy.MM.dd HH:mm:ss" />
		  </td>
		</tr>
	   </c:if>
	   <c:if test="${isopen eq '1'}">
	  	<tr>	  	
		  <td width="190" align="center" style="vertical-align:middle" bgcolor="ffffff" height="40">
		  	${yourid}
		  </td>
		  <td style="vertical-align:middle;cursor:pointer;" onMouseOver="this.style.backgroundColor='#F4F4F4';" onMouseOut="this.style.backgroundColor=''" onClick="location.href='/LifeShare/message/${myid}/${yourid}/${mid} '" width="200" align="center" bgcolor="ffffff" height="70">
		    ${myMessage.message}
		  </td>
		  <td width="200" align="center" style="vertical-align:middle" bgcolor="ffffff" height="40">
		  <fmt:formatDate value="${myMessage.send_date}" type="both" pattern="yyyy.MM.dd HH:mm:ss" />
		  </td>
		</tr>
	   </c:if>
	  </c:forEach> 
	  </tbody>
	</table>
        </div>
  </div>
</body>
</html>