<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 70%;
	margin: 0 auto;
	border: 1px solid black;
	float: right;
}

#adminMember-search, #adminMember-Application {
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

#sk, #adminMember-ap, #search {
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
				<h3>전체 회원 보기</h3>
				<div id="adminMember-search">
					<select id="sk" name="sk" class="form-control sf-margin">
						<option class="updateMem" value="namal">일반</option>
						<option class="updateMem" value="bisuness">비즈니스</option>
						<option class="updateMem" value="noCheck">미인증</option>
						<option class="updateMem" value="blackList">블랙리스트</option>
						<option class="updateMem" value="secession">탈퇴</option>
					</select> 
					<input type="text" name="sv" class="form-control sf-margin" id="search" placeholder="검색어를 입력하세요.">
					<button type="submit">등급 보기</button>
				</div>
			</div>
			<div class="my-4">
				<form action="memberRating" method="POST" id="adminMember" onsubmit="return memValidate();">
					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>회원 아이디</th>
								<th>회원 닉네임</th>
								<th>가입일</th>
								<th>등급</th>
								<th><input type="checkbox" id="checkAll"></th>
							</tr>
						</thead>
						<tbody>
							<!-- 회원이 없을 경우 -->
							<%-- <c:choose>
                    	<c:when test="${empty mList}">
                    		<tr>
                    			<td colspan="4">존재하는 회원이 없습니다.</td>
                    		</tr>
                    	</c:when>
                    </c:choose>
                    <c:otherwise>
                    	<!-- 회원이 있을 경우 -->
                    	<c:forEach var="member" items="${mList}">  --%>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<tr>
								<td>user01@naver.com</td>
								<td>유저일</td>
								<td>2021-02-20</td>
								<td>일반</td>
								<td><input type="checkbox" class="check-input"
									id="checkedAll"></td>
							</tr>
							<%-- </c:forEach> 
							</c:otherwise> --%>
						</tbody>
					</table>

					<div id="adminMember-Application">
						<select name="adminMember-ap" id="adminMember-ap">
							<option class="updateMem" value="namal">일반</option>
							<option class="updateMem" value="bisuness">비즈니스</option>
							<option class="updateMem" value="noCheck">미인증</option>
							<option class="updateMem" value="blackList">블랙리스트</option>
							<option class="updateMem" value="secession">탈퇴</option>
						</select>
						<button type="submit" id="changeMemBtn" class="form-control btn">등급 변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer> </footer>

	<script>
	</script>
</body>
</html>