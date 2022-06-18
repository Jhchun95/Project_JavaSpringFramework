<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<body style="background-color: #ffffff">
	<jsp:include page="header.jsp" />
	</br>
	</br>
	<div class="container">
		<!-- Contact Section Heading-->
		<h2
			class="page-section-heading text-center text-uppercase text-secondary mb-0">게시글
			등록</h2>

		<!-- Contact Section Form-->
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
				<form action="uploads" enctype="multipart/form-data" method="post">
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2">
							<label>제목</label> <input class="form-control" id="title"
								name="title" type="text" placeholder="ex)청소기 나눔합니다~"
								required="required">

						</div>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2">
							<label>거래 타입</label> <select name="btype" class="form-control"
								id="btype" required="required">
								<option value="교환">교환
								<option value="나눔">나눔
							</select>
						</div>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2">
							<label>물품 항목</label> <select name="category" class="form-control"
								id="category" required="required">
								<option value="모두" selected>--물품 항목--
								<option value="생활용품">생활용품
								<option value="패션잡화">패션잡화
								<option value="뷰티용품">뷰티용품
								<option value="디지털">디지털
								<option value="가구">가구
								<option value="도서">도서
								<option value="기타">기타
							</select>

						</div>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2">
							<label>지역 선택(구단위)</label> <select name="loc" class="form-control"
								id="loc" required="required">
								<option value="서울시" selected>--서울시--
								<option value="강서구">강서구
								<option value="양천구">양천구
								<option value="구로구">구로구
								<option value="금천구">금천구
								<option value="영등포구">영등포구
								<option value="동작구">동작구
								<option value="관약구">관악구
								<option value="마포구">마포구
								<option value="서대문구">서대문구
								<option value="은평구">은평구
								<option value="종로구">종로구
								<option value="중구">중구
								<option value="용산구">용산구
								<option value="서초구">서초구
								<option value="강남구">강남구
								<option value="송파구">송파구
								<option value="강동구">강동구
								<option value="광진구">광진구
								<option value="성동구">성동구
								<option value="동대문구">동대문구
								<option value="성북구">성북구
								<option value="강북구">강북구
								<option value="도봉구">도봉구
								<option value="노원구">노원구
								<option value="중랑구">중랑구
							</select>

						</div>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2">
							<label>지역 입력(세부지역)</label> <input class="form-control" id="loc2"
								name="loc2" type="text" placeholder="ex)월곡" required="required">

						</div>
					</div>

					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2">
							<label>내용</label>
							<textarea class="form-control" id="content" name="content"
								rows="5" placeholder="Content" required="required"></textarea>

						</div>
					</div>
					<img src ="/board/show/img/34"><br> <br>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>