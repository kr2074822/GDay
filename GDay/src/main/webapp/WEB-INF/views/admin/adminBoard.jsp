<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 게시글 관리</title>
<link rel="stylesheet" href="reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="adminSidebar.jsp" />

	<div class="container">
		<div id="container-tb">
			<div>
				<h3>게시글 관리</h3>
				<div id="adminBoard-search">
					<select name="board-se" id="board-se">
						<option class="">일반</option>
						<option class="">블라인드</option>
					</select> <input type="text" id="search">
					<button type="submit">상태 보기</button>
				</div>
			</div>
			<div class="my-4">
				<form action="#" method="POST" id="adminBoard">
					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>게시글 유형</th>
								<th>게시글 제목</th>
								<th>작성일자</th>
								<th>게시글 상태</th>
								<th><input type="checkbox"></th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>클래스</td>
								<td>종이공예</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>종이공예</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>종이공예</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>종이공예</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>종이공예</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>종이공예</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
						</tbody>
					</table>

					<div id="adminBoard-Application">
						<select name="board-ap" id="board-ap">
							<option class="">블라인드</option>
							<option class="">블라인드 해제</option>
						</select>
						<button type="submit">상태 변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>