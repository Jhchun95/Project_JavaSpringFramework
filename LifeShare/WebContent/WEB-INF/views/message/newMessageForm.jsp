<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
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
      	margin-bottom:30px;
      	font-family: 'RIDIBatang';
        font-size: 1.1rem;
        text-anchor: middle;
      }
      #margin{padding-top:50px;}
    </style>
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
<title>새로운 쪽지 전송</title>

  <script>
    function newMessageForm() {
    	if (form.message.value == "") {
    		alert("쪽지 내용을 입력하십시오.");
    		form.message.focus();
    		return false;
    	}
    	else {
    		alert("쪽지를 전송했습니다.");
    		form.submit();
    		return true;
    	}
    }
    </script>
</head>
<body>			
<jsp:include page="../header.jsp"/>
	<div class="container" id="margin">
        <div class="text-center">
            <p id="text1">새 쪽지 보내기</p>
            <br>
            <ul class="list-group">
            <li class="list-group-item">
            <br>
            <form name="form" method="POST" action="<c:url value='/message/sendMessage' />">
             <fieldset>
		    <div class="form-group row">
		      <label for="InputownerName" class="col-sm-2 col-form-label">보내는 사람</label>
		      <div class="col-sm-1">
		      <c:if test="${loginOK != null}">${loginOK.id}</c:if>
				<input type="hidden" name="sender" value="${loginOK.id}">
		       </div>
		    </div>
		    <div class="form-group row">
		      <label for="InputownerPhone"  class="col-sm-2 col-form-label">받는 사람</label>
		      <div class="col-sm-1">
		      ${receiver}
		      <input type="hidden" name="receiver" value="${receiver}">
		      </div>
		    </div>
		    <div class="form-group row">
		      <label for="InputanimalSpecies"  class="col-sm-2 col-form-label">매세지 내용</label>
		      <div class="col-sm-10">
		      <input type="text" class="form-control" name="message" id="message" style="width:800px; height:150px;">
		      </div>
		    </div>

	        <button type="button" class="btn btn-primary" onClick="newMessageForm()">보내기</button>
	        &nbsp;&nbsp;
	        <a href="javascript:history.back()" class="btn btn-light">취소</a>
		  </fieldset>
            </form>
            </li>
            </ul>
            <br><br>
        </div>
  </div>
</body>
</html>