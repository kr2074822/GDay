<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 신고 내역</title>

<link rel="stylesheet" href="reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="adminSidebar.jsp" />

	<div class="container">
		<div id="container-tb">
			<div>
				<h3>신고 처리 완료</h3>
				<div id="report-search">
					<input type="text" id="search">
					<button type="submit">검색</button>
				</div>
			</div>
			<div class="my-4">
				<form action="#" method="POST" id="reportEnd">
					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>분류</th>
								<th>게시글 명</th>
								<th>신고 일자</th>
								<th>신고 사유</th>
								<th><input type="checkbox"></th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>클래스</td>
								<td>악세사리</td>
								<td>2021-02-20</td>
								<td>허위 클래스</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>악세사리</td>
								<td>2021-02-20</td>
								<td>허위 클래스</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>악세사리</td>
								<td>2021-02-20</td>
								<td>허위 클래스</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>악세사리</td>
								<td>2021-02-20</td>
								<td>허위 클래스</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>클래스</td>
								<td>악세사리</td>
								<td>2021-02-20</td>
								<td>허위 클래스</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
						</tbody>
					</table>

					<div id="report-Application">
						<select name="report-ap" id="report-ap">
							<option class="">사유 적합</option>
							<option>사유 부적합</option>
						</select>
						<button type="submit">신고 처리</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>