<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

<link rel="stylesheet" href="reset.css">

<style>
div {
	padding: 10px;
}

.container {
	width: 80%;
	margin: 0 auto;
}

.input-area {
	margin: 0 auto;
	padding: 5px;
}

.comment-area {
	width: 100%;
	resize: none;
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
</style>
</head>
<body>
	<div class="container">
		<div>
			<h3>고객센터</h3>
		</div>
		<div class="input-area">
			<form action="#" method="POST">
				<div class="title-area">
					<h4>안녕하세요</h4>
				</div>
				<div class="info-area">
					<h1>작성자: 회원명</h1>
					<h1>작성일자: 2021-02-20</h1>
				</div>
				<hr>
				<div class="content-area">
					<span>내용</span>
				</div>
				<hr>
				<div class="comment-area">
					<textarea class="comment"></textarea>
				</div>
				<div id="form-btn" class="form-size">
					<button type="submit" class="inquiry">답변등록</button>
				</div>
				<div>
					<p>관리자</p>
					<textarea class="reply">작성</textarea>
				</div>
			</form>
		</div>
	</div>

</body>
</html>