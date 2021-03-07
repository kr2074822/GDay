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
	padding: 120px;
}

.container-area{
	padding: 7%;
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

td{
	cursor: pointer;
}

button {
	width: 60px;
	height: 60px;
	border: none;
	cursor: pointer;
	border-radius: 50%;
	background-color: #FE929F;
	color: white;
	float: right;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container">
		<h3 style="font-weight: bold; font-size: 20px;">나의 문의글</h3>
		<br>

		<div class="container-area">
			<form action="#" method="POST">
				<table class="table table-hover" id="list-table">
					<thead>
						<tr>
							<th>문의 번호</th>
							<th>문의 내용</th>
							<th>작성 일자</th>
							<th>게시글 상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2</td>
							<td>문의있습니다.</td>
							<td>2021-02-20</td>
							<td>미답변</td>
						</tr>
						<tr>
							<td>1</td>
							<td>악세사리</td>
							<td>2021-02-20</td>
							<td>답변 완료</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../common/chatbot.jsp" />	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		/* 게시글 상세보기 */
		$("#list-table td").on("click", function(){
			var boardNo = $(this).parent().children().eq(0).text();
			
			var boardViewURL = "../${pInfo.prdtType}/" + boardNo;
			
			location.href = "${contextPath}/admin/memberCustomerView"; 
		});
	</script>
</body>

</html>