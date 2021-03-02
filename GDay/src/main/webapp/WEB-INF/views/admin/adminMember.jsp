<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    	<%-- <c:if test="${empty mList}">
                    		<tr>
                    			<td colspan="4">존재하는 회원이 없습니다.</td>
                    		</tr>
                    	</c:if>
                    <c:if test="${!empty mList }">
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
							</c:if> --%>
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
			
		<!-- 페이징처리 -->
 		<div class="my-4">
			<ul class="pagination">

				 <%-- 주소 조합 작업 --%>
				<c:url var="pageUrl" value="${pInfo.boardType}?"/>

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
</body>
</html>