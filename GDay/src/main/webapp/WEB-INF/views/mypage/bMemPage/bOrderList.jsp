<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css?ver=1.2">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/bMemPage/bOrderList.css"/>
</head>

<body>
	<jsp:include page="../../common/header.jsp"/>
	
	<div id="wrapper">
		<jsp:include page="bMemSidebar.jsp"/>	
		
		<div id="b-order-list-wrapper">
		
			<h1>주문 조회</h1>
			
			<div id="wrapper-top-area">
			<!-- 주문 목록 기간 검색 -->
		    <div class="row" id="container-period">
		        <form action="${contextPath}/bMember/bOrderSearch" method="post" id="container-form">
		        <div class="list-search" id="list-search-1">
		            <input type="radio" name="periodRadio" id="7days" value="7days">
		            <label for="7days">일주일</label>
		            <input type="radio" name="periodRadio" id="1Month" value="1Month">
		            <label for="1Month">1개월</label>
		            <input type="radio" name="periodRadio" id="3Months" value="3Months">
		            <label for="3Months">3개월</label>
		            <input type="radio" name="periodRadio" id="6Months" value="6Months">
		            <label for="6Months">6개월</label>
		            <input type="radio" name="periodRadio" id="selfInput" value="selfInput">
		            <label for="selfInput">직접 입력</label>
		        </div>
		        <div class="list-search" id="list-search-2">
		            <input type="date" name="periodStart" id="periodStart">
		            <span>~</span>
		            <input type="date" name="periodEnd" id="periodEnd">
		        </div>
		        <div class="list-search" id="list-search-3">
		            <select name="giftStatus" id="giftStatus">
		                <option value="#">결제 완료</option>
		                <option value="#">선물 발송</option>
		                <option value="#">구매 확정</option>
		                <option value="#">취소/반품 완료</option>
		                <option value="#">취소/반품 처리 중</option>
		            </select> <!-- giftStats : 주문 선물 상태 -->
		           	<input id="search-input" type="text"/>
		            <button type="submit" id="list-search-btn">조회</button>
		        </div>
		        </form>
		    </div>
			</div>
					
			<div id="order-list">
					
				<table id="list-table">
				<thead>
					<tr style="border-bottom: 1px solid black;">
						<th>주문번호</th>
						<th>상품 번호</th>
						<th>주문일</th>
						<th>주문자</th>
						<th>상품명</th>
						<th>옵션</th>
						<th>수량</th>
						<th>금액</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty oList}">
						<tr>
							<td colspan="6">존재하는 주문글이 없습니다.</td>
						</tr>
					</c:if>

					<c:if test="${!empty oList}">
						<c:forEach var="order" items="${oList}" varStatus="vs">

							<tr class="order-rows">
								<td class="order-td">${order.orderNo}</td>
								<td class="order-td">${order.opNo}</td>
								<td class="order-td">
									<%-- 날짜 출력 모양 지정 --%>
									<fmt:formatDate var="createDate" value="${order.orderDate }" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/> 
									<c:choose>
										<c:when test="${createDate != now}">
											${createDate }
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${order.orderDate }" pattern="HH:mm"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="order-td">${order.memName}</td>
								<td class="order-td">${order.prdtName}</td>
								<td class="order-td">${order.gOptName}</td>
								<td class="order-td">${order.opAmount}</td>
								<td class="order-td">${order.prdtPrice}</td>
								<td class="order-td">${order.statusName}</td>

							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
					
			</div>
			
			<div id="page-area">
		<!--------------------------------- pagination  ---------------------------------->
		
					<ul class="pagination">
		
						<c:url var="pageUrl" value="bOrderList?"/>
		
						<!-- 화살표에 들어갈 주소를 변수로 생성 -->
						<c:set var="firstPage" value="${pageUrl}cp=1"/>
						<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}"/>
						
						<%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다--%>
						<%-- 
							<fmt:parseNumber>   : 숫자 형태를 지정하여 변수 선언 
							integerOnly="true"  : 정수로만 숫자 표현 (소수점 버림)
						--%>
						
						<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"  integerOnly="true" />
						<fmt:parseNumber var="prev" value="${ c1 * 10 }"  integerOnly="true" />
						<c:set var="prevPage" value="${pageUrl}cp=${prev}" />
						
						
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
	
	<script>
		$("#list-search-btn").on("click", function() {
			
		})
	</script>
	
	
</body>
</html>