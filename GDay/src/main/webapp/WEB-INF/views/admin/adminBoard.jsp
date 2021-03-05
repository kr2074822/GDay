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
						<option class="boardOp" value="C">선물</option>
						<option class="boardOp" value="G">클래스</option>
					</select> 
					<input type="text" id="search">
					<button type="submit">게시글 보기</button>
				</div>
			</div>
			<div class="my-4">
				<form action="#" method="POST" id="adminBoard">
					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>게시글 번호</th>
								<th>게시글 유형</th>
								<th>게시글 제목</th>
								<th>작성일자</th>
								<th>수정일자</th>
								<th>게시글 상태</th>
								<th><input type="checkbox" class="check-input" id="checkAll"></th>
							</tr>
						</thead>

						<tbody>
							<tr>
							<!-- 회원이 없을 경우 -->
	                    	<c:if test="${empty product}">
	                    		<tr>
	                    			<td colspan="6">존재하는 게시글이 없습니다.</td>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty product}">
		                    	<!-- 회원이 있을 경우 -->
		                    	<c:forEach var="product" items="${product}">
									<tr>
										<td>${product.prdtNo}</td>
										<td>${product.prdtType}</td>
										<td>${product.prdtName}</td>
										<td>${product.createDate}</td>
										<td>${product.modifyDate}</td>
										<td>${product.prdtStatus}</td>
										<td><input type="checkbox" class="check-input" id="checkBoard" value="${product.prdtNo}"></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>

					<div id="adminBoard-Application">
						<select name="board-ap" id="board-ap">
							<option class="boardAp" value="B">블라인드</option>
							<option class="boardAp" value="Y">블라인드 해제</option>
						</select>
						<button type="submit">상태 변경</button>
					</div>
				</form>
			</div>
			
		<!-- 페이징처리 -->
 		<div class="my-4">
			<ul class="pagination">

				 <%-- 주소 조합 작업 --%>
				<c:url var="pageUrl" value="adminBoard?"/>

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
						<a class="page-link" href="${firstPage}">&lt;&lt;</a>
					</li>
					
					<li> <!-- 이전 페이지로 이동 (<) -->
						<a class="page-link" href="${prevPage}">&lt;</a>
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
								<a class="page-link" href="${pageUrl}cp=${page}">${page}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
					
		
				<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
				<c:if test="${next <= pInfo.maxPage}">
					<li> <!-- 다음 페이지로 이동 (>) -->
						<a class="page-link" href="${nextPage}">&gt;</a>
					</li>
					
					<li> <!-- 마지막 페이지로 이동(>>) -->
						<a class="page-link" href="${lastPage}">&gt;&gt;</a>
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
					$("input[id=checkBoard]").prop("checked", true);
				}else{ // 클릭이 되어있지 않을 시
					$("input[id=checkBoard]").prop("checked", false);
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