<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 고객 센터</title>

<link rel="stylesheet" href="reset.css">

<style>
div {
	padding: 10px;
}

.container {
	width: 80%;
	margin: 0 auto;
	float: left;
	height: 100%;
	
	margin: 200px 0;
}

#adminCus-search {
	float: right;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

table th {
	font-weight: bold;
	background-color: #fafafa;
}

th, td {
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

#adminCus-se, #search {
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
				<h3>고객 센터</h3>
				<div id="adminCus-search">
					<select name="adminCus-se" id="adminCus-se">
						<option class="">작성자</option>
						<option class="">문의 내용</option>
					</select> <input type="text" id="search">
					<button type="submit">검색</button>
				</div>
			</div>
			<div>
				<form action="#" method="POST" id="adminCustomerService">

					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>작성자</th>
								<th>문의 내용</th>
								<th>작성일</th>
								<th>게시글 상태</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>user01@naver.com</td>
								<td>문의 있습니다.</td>
								<td>2021-02-20</td>
								<td>답변완료</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>문의 있습니다.</td>
								<td>2021-02-20</td>
								<td>답변완료</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>문의 있습니다.</td>
								<td>2021-02-20</td>
								<td>답변완료</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>문의 있습니다.</td>
								<td>2021-02-20</td>
								<td>답변완료</td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>문의 있습니다.</td>
								<td>2021-02-20</td>
								<td>답변완료</td>
							</tr>
						</tbody>
					</table>

				</form>

			</div>
		</div>
	</div>

	<footer> </footer>
</body>
</html>