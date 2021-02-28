<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리</title>

<link rel="stylesheet" href="reset.css">

<style>
div {
	padding: 10px;
}

#businessView {
	margin: auto;
	padding: 0 auto;
}

.header-business {
	width: 100%;
	padding-top: 8px;
	margin-bottom: 2rem;
}

.form-business {
	font-weight: bold;
}

.form-hr>hr {
	color: #FE929F;
}

#approval {
	background-color: #FE929F;
	color: white;
	height: 25px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

#none {
	background-color: darkgray;
	color: white;
	height: 25px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="adminSidebar.jsp" />

	<div class="container">
		<div id="container-tb">
			<div>
				<h3>비즈니스 회원 신청</h3>
			</div>
			<div>
				<form action="#" method="POST" id="businessView">
					<div class="header-business">
						<span class="form-business">비즈니스 회원 신청자</span> <span
							class="form-hr" style="position: absolute; width: 90%;">
							<hr>
						</span>
					</div>
					<div class="body-business">
						<p>성명: 비즈니스</p>
						<p>업체명: 비즈니스</p>
						<p>주소: 서울시 구로구</p>
						<p>연락처: 010-1111-1111</p>
						<p>비즈니스 신청 분야: 선물(또는 클래스)</p>
					</div>
					<div>
						<img>
					</div>
					<div id="business-Application">
						<button type="submit" id="approval">비즈니스 회원 승인</button>
						<button type="button" id="none" data-toggle="modal"
							href="#modal-container-1">비즈니스 회원 부적합</button>
					</div>

					<!-- 부적합 판정 모달창 -->
					<div class="modal fade" id="modal-container-4872" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										href="#modal-container-1">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<select name="business-modal" id="business-modal">
										<option>사진이 잘 보이지 않음.</option>
										<option>사유 부적합</option>
									</select>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">부적합</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

	<footer> </footer>
</body>
</html>