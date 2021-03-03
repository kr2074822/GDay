<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">

<style>
.container {
	width: 80%;
	margin: 0 auto;
	padding: 3%;
}

.container-title, .title-area{
	padding-bottom: 20px;
}

.info-area{
	font-size: 15px; 
	line-height: 15px
}

.board-area {
	margin-bottom: 100px;
	padding: 30px;
	width: 95%;
	text-aling: center;
}

.board-content{ 
	padding-bottom:20%;
}

.float-right{
	padding-bottom: 40px;
}

.inquiry {
	background-color: #FE929F;
	color: white;
	height: 25px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container">
		<div class="container-title">
			<h3 style="font-weight: bold; font-size: 25px;">고객센터</h3>
		</div>
		<div class="board-area">
			<div class="title-area">
				<h2 style="font-weight: bold; font-size: 20px;">안녕하세요</h2>
			</div>
			<div class="info-area">
				<h4>작성자: 회원명</h4>
				<h5>작성일자: 2021-02-20</h5>
			</div>
			<hr>
			<div class="board-content">
				<span>내용</span>
			</div>
			
			<div class="float-right">
				<%-- <c:if test="${empty sessionScope.returnListURL}">
					<c:set var="returnListURL" value="../list/${board.boardCode}" scope="session"/>
				</c:if> --%>
				<button type="button" class="btn btn-success inquiry" onclick="location.href='${contextPath}/admin/memberCustomer'">목록으로</button>			
			</div>
			<hr>
			
			<jsp:include page="adminReply.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>