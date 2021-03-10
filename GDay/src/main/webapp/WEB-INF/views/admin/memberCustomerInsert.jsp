<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>

<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">

<style>
.container {
	width: 80%;
	margin: 0 auto;
	padding: 80px;
}

hr {
	border: 2px solid #FE929F;
	width: 100%;
}

.input-area {
	padding: 3%;
}

#titleInput {
	width: 100%;
	margin: 5px;
}

.content {
	width: 100%;
	height: 500px;
	resize: none;
	margin: 5px;
}

.content-area{
	padding-top: 30px;
}

#form-btn {
	float: right;
}

.inquiry {
	background-color: #FE929F;
	color: white;
	height: 25px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.none {
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

	<div class="container">
		<div>
			<h3 style="font-weight: bold; font-size: 20px;">고객센터 문의글 작성</h3>
		</div><br>
		<hr>
		<div class="input-area">
			<form action="${contextPath}/admin/customerInsert" method="POST">
				<div class="title-area">
					<span>제목</span> <input type="text" name="title" id="titleInput"
						required="제목을 입력해주세요.">
				</div>
				<div class="content-area">
					<span>내용</span>
					<textarea class="content" id="summernote" name="content"></textarea>
				</div>
				<div id="form-btn" class="form-size">
					<button type="submit" class="inquiry">문의하기</button>
					<button type="button" class="none" onclick="location.href='${contextPath}/admin/memberCustomer'">취소</button>
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>