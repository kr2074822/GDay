<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>

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
	<div class="container">
		<div>
			<h3>고객센터 문의글 작성</h3>
		</div>
		<div class="input-area">
			<form action="#" method="POST">
				<div class="title-area">
					<span>제목</span> <input type="text" name="title" id="titleInput"
						required="제목을 입력해주세요.">
				</div>
				<div class="content-area">
					<span>내용</span>
					<textarea class="content" id="summernote"></textarea>
				</div>
				<div id="form-btn" class="form-size">
					<button type="submit" class="inquiry">문의하기</button>
					<button type="button" class="none">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>