<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 고객 센터</title>

<link rel="stylesheet" href="reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminPage.css">

<style>
td{
	cursor: pointer;
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
					<!-- <select name="adminCus-se" id="adminCus-se">
						<option class="" value="">작성자</option>
						<option class="" value="">문의 내용</option>
						<option class="" value="">게시글 상태</option>
					</select> <input type="text" id="search">
					<button type="submit">검색</button> -->
				</div>
			</div>
			<div class="my-4">
				<form action="#" method="POST" id="adminCustomerService">
					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>문의 번호</th>
								<th>문의 제목</th>
								<th>작성자</th>
								<th>게시글 상태</th>
							</tr>
						</thead>

						<tbody>
							<!-- 고객센터 문의글이 없을 경우 -->
	                    	<c:if test="${empty cList}">
	                    		<tr>
	                    			<td colspan="4">존재하는 문의글이 없습니다.</td>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty cList}">
		                    	<!-- 고객센터 문의글이 있을 경우 -->
		                    	<c:forEach var="customor" items="${cList}">
									<tr>
										<td>${customor.cusNo}</td>
										<td>${customor.cusTitle}</td>
										<td>${customor.memberName}</td>
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
				<c:url var="pageUrl" value="adminCustomor?"/>

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
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		/* 게시글 상세보기 */
		$("#list-table td").on("click", function(){
			var cusNo = $(this).parent().children().eq(0).text();
			window.location.href="${contextPath}/admin/memberCustomerView/"+cusNo;
			console.log(123);
		});
	</script>
</body>
</html>