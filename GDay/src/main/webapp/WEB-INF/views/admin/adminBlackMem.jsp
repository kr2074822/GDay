<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리</title>

<link rel="stylesheet" href="reset.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
div {
	padding: 10px;
}

.container {
	width: 65%;
	margin: 0 auto;
	float: left;
	height: 100%;
	padding-left: 7%;
	
	margin: 200px 0;
}

#report-search, #report-Application {
	float: right;
}

.my-4 form table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.my-4 form table th {
	font-weight: bold;
	background-color: #fafafa;
}

.my-4 form table th, .my-4 form table td {
	text-align: center;
	border-bottom: 1px solid #444444;
	padding: 10px;
}

button {
	height: 25px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	background-color: #FE929F;
	color: white;
}

#search{
	padding: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="adminSidebar.jsp" />
	
	<div class="container">
		<div id="container-tb">
			<div>
				<h3>블랙리스트 보기</h3>
				<div id="report-search">
					<input type="text" id="search">
					<button type="submit">검색</button>
				</div>
			</div>
			<div class="my-4">
				<form action="#" method="POST" id="adminBlackList">
					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>회원 아이디</th>
								<th>회원 닉네임</th>
								<th>가입일</th>
								<th>블랙리스트 사유</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>욕설</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>욕설</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>욕설</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>욕설</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>욕설</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>욕설</td>
							</tr>
						</tbody>
					</table>
				</form>
 			</div>
		</div>
	</div>
	<footer> </footer>
	
	<script>
		
	</script>
</body>
</html>