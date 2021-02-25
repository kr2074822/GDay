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
		<h3>나의 문의글</h3>
		<br>

		<div>
			<form action="#" method="POST">
				<table>
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
	
	<!-- closer 챗봇 연동 설정(설치 스크립트) -->
	<script>
		(function(c, l, o, s, e, r) {
			c[e] = c[e] || {};
			r = l.createElement('script');
			s && (o += '?botId=' + s);
			e && (r.setAttribute('data-bind', e));
			r.src = o;
			r.async = 1;
			l.head.appendChild(r);
		})(window, document, 'https://app.closer.ai/webchat.js', 'B266ew');
	</script>
</body>

</html>