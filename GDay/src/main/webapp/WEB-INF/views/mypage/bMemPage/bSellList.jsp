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
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/bMemPage/bSellList.css"/>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	
	<div id="wrapper">
		<jsp:include page="bMemSidebar.jsp"/>	
		
		<div id="b-sell-list-wrapper">
		
			<h1>내 판매글</h1>
			
			<div id="wrapper-top-area">
			<!-- 주문 목록 기간 검색 -->
				<div class="row" id="container-period">
		      <div id="date-form">
		        <div class="list-search" id="list-search-1">
		        	<button type="button" class="day-btn" onclick="location.href='${contextPath}/bMember/bSellList'">전체</button>
		        	<button type="button" class="day-btn" name="periodRadio" value="7days">일주일</button>
		        	<button type="button" class="day-btn" name="periodRadio" value="1Month">1개월</button>
		        	<button type="button" class="day-btn" name="periodRadio" value="3Months">3개월</button>
		        	<button type="button" class="day-btn" name="periodRadio" value="6Months">6개월</button>
		        </div>
		        <div class="list-search" id="list-search-2">
		            <input type="date" name="periodStart" id="periodStart">
		            <span>~</span>
		            <input type="date" name="periodEnd" id="periodEnd">
		        </div>	
		      </div>	        
		    </div>
			</div>
					
			<div id="sell-list">					
					<c:if test="${empty gList}">
						<tr>
							<td colspan="6">존재하는 판매글이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${!empty gList}">
						<c:forEach var="gift" items="${gList}" varStatus="vs">
							<div class="sell-item">
								<c:forEach items="${thList}" var="th">
									<c:if test="${th.prdtNo == gift.prdtNo}">								
										<img src="${contextPath}${th.filePath}/${th.fileName}">										
									</c:if>
								</c:forEach>
								
								<span class="item-no">[${gift.prdtNo}]</span>		
								<span class="item-name" title="${gift.prdtName}">${gift.prdtName}</span>
							</div>
						</c:forEach>					
					</c:if>					
			</div>
			
			<div id="page-area">
		<!--------------------------------- pagination  ---------------------------------->
		
					<ul class="pagination">
		
					<c:if test = "${empty selectDay}">
						<c:url var="pageUrl" value="bSellList?"/> 
					</c:if>
					
 					<c:if test = "${!empty selectDay}">
						<c:url var="pageUrl" value="${selectDay}?"/> 
					</c:if>
					
					<c:if test = "${!empty startText && !empty endText}">
						<c:url var="pageUrl" value="${endText}?"/> 
					</c:if>
		
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
	
	<jsp:include page="../../common/footer.jsp"/>
	
	<script>
	/* 날짜 선택 시 */
		$("[name='periodRadio']").on("click", function() {
		var day = $(this).val();
		
		location.href = "${contextPath}/bMemSearch/bSellDaySearch/" + day;
		
	});
		
		
		/* 날짜 직접 선택 시  */
		$("#periodStart").on("change", function() {
	 		if($("#periodStart").val() != "" && $("#periodEnd").val() != "") {
	 			 var startText = $(this).val();
	 			 var endText = $("#periodEnd").val();
	 			 
	 			 var startAry = startText.split('-');
	 			 var endAry = endText.split('-');
	 			 
	 			 var startDate = new Date(startAry[0], Number(startAry[1])-1, startAry[2]);
	 			 var endDate = new Date(endAry[0], Number(endAry[1])-1, endAry[2]);
	 			 
	 			 var result = (endDate.getTime() - startDate.getTime()) / (1000*3600*24);
	 			 
	 			 if(result < 0) {
	 				 window.alert("시작날짜가 마지막 날짜보다 작아야 합니다.");
	 			 } else {
	 				 location.href = "${contextPath}/bMemSearch/bSellDaySearch2/" + startText + "/" + endText;
	 			 }
	 		} 	 		 			
		});
		
 		$("#periodEnd").on("change", function() {
 	 		if($("#periodStart").val() != "" && $("#periodEnd").val() != "") {
 	 			 var startText = $("#periodStart").val();
 	 			 var endText = $(this).val();
 	 			 
 	 			 var startAry = startText.split('-');
 	 			 var endAry = endText.split('-');
 	 			 
 	 			 var startDate = new Date(startAry[0], Number(startAry[1])-1, startAry[2]);
 	 			 var endDate = new Date(endAry[0], Number(endAry[1])-1, endAry[2]);
 	 			 
 	 			 var result = (endDate.getTime() - startDate.getTime()) / (1000*3600*24);
 	 			 
 	 			 if(result < 0) {
 	 				 window.alert("시작날짜가 마지막 날짜보다 작아야 합니다.");
 	 			 } else {
 	 				 location.href = "${contextPath}/bMemSearch/bSellDaySearch2/" + startText + "/" + endText;
 	 			 }
 	 		} 	 		 			
 		});
		
	</script>
	
</body>
</html>