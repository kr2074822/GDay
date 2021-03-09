<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 신고 게시판</title>

<link rel="stylesheet" href="reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="adminSidebar.jsp" />

	<div class="container">
		<div id="container-tb">
			<div>
				<h3>신고 게시판</h3>
				<div id="report-search">
					<!-- <input type="text" id="search">
					<button type="submit">검색</button> -->
				</div>
			</div>
			<div class="my-4">
				<form action="#" method="POST" id="reportStand">

					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>신고 번호</th>
								<th>게시글 타입</th>
								<th>게시글 번호</th>
								<th>신고 타입</th>
								<th>신고한 회원</th>
								<th>신고 받은 회원</th>
								<th>신고 받은 횟수</th>
							</tr>
						</thead>

						<tbody>
							<!-- 회원이 없을 경우 -->
	                    	<c:if test="${empty rsList}">
	                    		<tr>
	                    			<td colspan="7">존재하는 신고글이 없습니다.</td>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty rsList}">
		                    	<!-- 회원이 있을 경우 -->
		                    	<c:forEach var="report" items="${rsList}">
									<tr>
										<td>${report.reportNo}</td>
										<td>${report.reportType}</td>
										<td>${report.parentNo}</td>
										<td>${report.parentType}</td>
										<td>${report.memberNo}</td>
										<td>${report.reportTarget}</td>
										<td>${report.reportCount}</td>
									</tr>
								</c:forEach> 
							</c:if>
						</tbody>
					</table>

					<!-- <div id="report-Application">
						<select name="report-ap" id="report-ap">
							<option>사유 적합</option>
							<option>사유 부적합</option>
						</select>
						<button type="submit">신고 처리</button>
					</div> -->
				</form>

			</div>
			
		<!-- 페이징처리 -->
 		<div class="my-4">
			<ul class="pagination">

				 <%-- 주소 조합 작업 --%>
				<c:url var="pageUrl" value="adminReportStand?"/>

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
		/* 체크박스 전체 선택 */
		$(document).ready(function(){
			
			// 전체 선택 박스 클릭
			$("#checkAll").click(function(){
				if($("#checkAll").prop("checked")){ // 클릭 되었을 시
					$("input[id=check]").prop("checked", true);
				}else{ // 클릭이 되어있지 않을 시
					$("input[id=check]").prop("checked", false);
				}
			});
		});
		
		/* 게시글 상세보기 */
/* 		$("#list-table td").on("click", function(){
			var boardNo = $(this).parent().children().eq(0).text();
							
			var boardViewURL = "../${pInfo.boardType}/" + boardNo;
							
			location.href = "${contextPath}/admin/memberCustomerView"; 
		}); */
	</script>	
</body>
</html>