<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리</title>

<link rel="stylesheet" href="reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminPage.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
				<form id="adminBlackList">
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
							<!-- 회원이 없을 경우 -->
	                    	<c:if test="${empty bmList}">
	                    		<tr>
	                    			<td colspan="4">존재하는 회원이 없습니다.</td>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty bmList}">
		                    	<!-- 회원이 있을 경우 -->
		                    	<c:forEach var="member" items="${bmList}">
									<tr>
										<td>${member.memberNo}</td>
										<td>${member.memberEmail}</td>
										<td>${member.memberName}</td>
										<td>${member.memberType}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</form>
 			</div>
		</div>
	</div>
	
	<!-- 페이징처리 -->
 	<div class="my-4">
		<ul class="pagination">

			<%-- 주소 조합 작업 --%>
			<c:url var="pageUrl" value="adminBlackMem?"/>

			<!-- 화살표에 들어갈 주소를 변수로 생성 -->
			<c:set var="firstPage" value="${pageUrl}cp=1"/>
			<c:set var="lastPage" value="${pageUrl}cp=${pinfo.maxPage}"/>
				
			<%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다
				
				<fmt:parseNumber>   : 숫자 형태를 지정하여 변수 선언 
				integerOnly="true"  : 정수로만 숫자 표현 (소수점 버림) --%>
				
			<fmt:parseNumber var="c1" value="${(pinfo.currentPage - 1) / 10 }"  integerOnly="true" />
			<fmt:parseNumber var="prev" value="${ c1 * 10 }"  integerOnly="true" />
			<c:set var="prevPage" value="${pageUrl}cp=${prev}" />
											<%-- 1?cp=nn의 형태 --%>
				
			<fmt:parseNumber var="c2" value="${(pinfo.currentPage + 9) / 10 }" integerOnly="true" />
			<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
			<c:set var="nextPage" value="${pageUrl}cp=${next}" />
				

			<c:if test="${pinfo.currentPage > pinfo.pageSize}">
				<li> <!-- 첫 페이지로 이동(<<) -->
					<a class="page-link noteSelected" href="${firstPage}">&lt;&lt;</a>
				</li>
					
				<li> <!-- 이전 페이지로 이동 (<) -->
					<a class="page-link noteSelected" href="${prevPage}">&lt;</a>
				</li>
			</c:if>



			<!-- 페이지 목록 -->
			<c:forEach var="page" begin="${pinfo.startPage}" end="${pinfo.endPage}" >
				<c:choose>
					<c:when test="${pinfo.currentPage == page }">
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
			<c:if test="${next <= pinfo.maxPage}">
				<li> <!-- 다음 페이지로 이동 (>) -->
					<a class="page-link noteSelected" href="${nextPage}">&gt;</a>
				</li>
					
				<li> <!-- 마지막 페이지로 이동(>>) -->
					<a class="page-link noteSelected" href="${lastPage}">&gt;&gt;</a>
				</li>
			</c:if>
		</ul>
	</div>	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		
	</script>
</body>
</html>