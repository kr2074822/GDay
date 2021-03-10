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

.pagination li{
	display: inline-block;
	aling: center;
} 

.pagination li a{
	display:inline-block;
	margin:0 auto;
	border:1px solid #FE929F;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#FE929F;
	font-size:13px;
	color:white;
	text-decoration:none;
} 

.noteSelected{
	background-color:#fff !important;
	color:black !important;
	border:1px solid #FE929F !important;
}
.pagination{
	margin-top: 50px;
	text-align:center;
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
				<table class="table" id="list-table">
						<thead>
							<tr>
								<th>작성자</th>
								<th>문의 내용</th>
								<th>게시글 타입</th>
								<th>게시글 상태</th>
							</tr>
						</thead>

						<tbody>
							<!-- 고객센터 문의글이 없을 경우 -->
	                    	<c:if test="${empty rList}">
	                    		<tr>
	                    			<td colspan="4">존재하는 문의글이 없습니다.</td>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty rList}">
		                    	<!-- 고객센터 문의글이 있을 경우 -->
		                    	<c:forEach var="customor" items="${rList}">
									<tr>
										<td>${customor.cusNo}</td>
										<td>${customor.cusTitle}</td>
										<td>${customor.cusCreateDate}</td>
										<td>${customor.replyStatus}</td>
									</tr>
								</c:forEach> 
							</c:if>
						</tbody>
					</table>
			</form>
		</div>
		
		<!-- 페이징처리 -->
 		<div class="my-4">
			<ul class="pagination">

				 <%-- 주소 조합 작업 --%>
				<c:url var="pageUrl" value="memberCustomer?"/>

				<!-- 화살표에 들어갈 주소를 변수로 생성 -->
				<c:set var="firstPage" value="${pageUrl}cp=1"/>
				<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}"/>
				
				<%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다
				
					<fmt:parseNumber>   : 숫자 형태를 지정하여 변수 선언 
					integerOnly="true"  : 정수로만 숫자 표현 (소수점 버림) --%>
				
				
				<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"  integerOnly="true" />
				<fmt:parseNumber var="prev" value="${ c1 * 10 }"  integerOnly="true" />
				<c:set var="prevPage" value="${pageUrl}cp=${prev}" />
											<%-- 1?cp=nn의 형태 --%>
				
				<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
				<c:set var="nextPage" value="${pageUrl}cp=${next}" />
				

				<c:if test="${pInfo.currentPage > pInfo.pageSize}">
					<li> <!-- 첫 페이지로 이동(<<) -->
						<a class="page-link noteSelected" href="${firstPage}">&lt;&lt;</a>
					</li>
					
					<li> <!-- 이전 페이지로 이동 (<) -->
						<a class="page-link noteSelected" href="${prevPage}">&lt;</a>
					</li>
				</c:if>



				<!-- 페이지 목록 -->
				<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}" >
					<c:choose>
						<c:when test="${pInfo.currentPage == page }">
							<li>
								<a class="page-link">${page}</a>
								<%-- 현재 보고있는 페이지는 클릭할수 없으므로 href가 없다. --%>
							</li>
						</c:when>
					
						<c:otherwise>
							<li>	
								<a class="page-link noteSelected" href="${pageUrl}cp=${page}">${page}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>  
					
		
				<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%> 
				<c:if test="${next <= pInfo.maxPage}">
					<li> <!-- 다음 페이지로 이동 (>) -->
						<a class="page-link noteSelected" href="${nextPage}">&gt;</a>
					</li>
					
					<li> <!-- 마지막 페이지로 이동(>>) -->
						<a class="page-link noteSelected" href="${lastPage}">&gt;&gt;</a>
					</li>
				</c:if>
			</ul>
		</div>					
	</div>
	<jsp:include page="../common/chatbot.jsp" />	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	// 문의글 상세보기
	$("#list-table td").on("click", function() {
		var cusNo = $(this).parent().children().eq(0).text();
		
		var cusViewURL = "memberCustomerView/" + cusNo;
		
		location.href = cusViewURL;
	});
	</script>
</body>

</html>