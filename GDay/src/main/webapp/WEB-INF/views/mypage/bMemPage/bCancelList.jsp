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
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/bMemPage/bCancelList.css"/>
</head>
	<jsp:include page="../../common/header.jsp"/>
	
	<div id="wrapper">
		<jsp:include page="bMemSidebar.jsp"/>	
		
		<div id="b-cancel-list-wrapper">
		
			<h1>주문 취소 조회</h1>
			
			<div id="wrapper-top-area">
			<!-- 주문 목록 기간 검색 -->
		    <div class="row" id="container-period">
		      <div id="date-form">
		        <div class="list-search" id="list-search-1">
		        	<button type="button" class="day-btn" onclick="location.href='${contextPath}/bMember/bCancelList'">전체</button>
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
		    
		    <div class="list-search" id="list-search-3 container-form">
           <select name="cancelStatus" id="cancelStatus">
               <option value="400">취소 요청</option>
               <option value="600">취소 완료</option>
           </select> <!-- giftStats : 주문 선물 상태 -->
           <button type="button" id="status-change-btn" class="day-btn">변경</button>
        </div>
			</div>
			

					
			<div id="cancel-list">
					
				<table id="list-table">
				<thead>
					<tr id="table-head" style = "background-color: #fdd7dc;">
						<th></th>
						<th class="hide">상품 번호</th>
						<th class="hide">반품일</th>
						<th class="">구매자</th>
						<th class="">반품 사유</th>
						<th class="">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty oCList}">
						<tr>
							<td colspan="9" rowspan="10" style=
							"text-align: center; 
							 padding-top: 200px;
							 font-family: 'TmoneyRoundWindRegular';
							 font-size: 20px;">
								존재하는 주문글이 없습니다.
							</td>
						</tr>
					</c:if>

					<c:if test="${!empty oCList}">
						<c:forEach var="cancel" items="${oCList}" varStatus="vs">
							<tr class="cancel-rows">
								<td><input type="checkbox" name="cancelSelectBox"/></td>
								<td class="cancel-td hide">${cancel.opNo}</td>
								<td class="cancel-td hide">
									<%-- 날짜 출력 모양 지정 --%>
									<fmt:formatDate var="createDate" value="${cancel.refundDate }" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/> 
									<c:choose>
										<c:when test="${createDate != now}">
											${createDate }
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${cancel.refundDate }" pattern="HH:mm"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="cancel-td">${cancel.memName}</td>
								<td class="cancel-td">${cancel.rfReasonName}</td>
								<td class="cancel-td">${cancel.statusName}</td>

							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
					
			</div>
			
			
			<c:if test="${!empty day}">	
				<c:set var="url" value="${contextPath}/bMemSearch/bOcSearch/${day}"/>
			</c:if>		
			<c:if test="${empty day}">	
		 	  <c:set var="url" value="${contextPath}/bMemSearch/bOcSearch"/>
			</c:if>
			<c:if test="${!empty startText && !empty endText}">	
		 	  <c:set var="url" value="${contextPath}/bMemSearch/bOcSearch/${startText}/${endText}"/>
			</c:if>

			
			<form action="${url}" method="post" id="container-form">
		    <div class="list-search" id="list-search-3 container-form">
           <select name="sk" id="searchKey">
               <option value="memName">회원명</option>
               <option value="prdtName">상품명</option>
               <option value="status">상태</option>
           </select>
           <input type="text" name="sv" id="searchValue"/>
           <button type="submit" id="list-search-btn" class="day-btn">검색</button>
        </div>
      </form>			
			
			<div id="page-area">
		<!--------------------------------- pagination  ---------------------------------->
		
					<ul class="pagination">
		
						<c:url var="pageUrl" value="bCancelList?"/>
		
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
			
			location.href = "${contextPath}/bMemSearch/bOcDaySearch/" + day;
			
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
 	 				 location.href = "${contextPath}/bMemSearch/bOcDaySearch2/" + startText + "/" + endText;
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
 	 				 location.href = "${contextPath}/bMemSearch/bOcDaySearch2/" + startText + "/" + endText;
 	 			 }
 	 		} 	 		 			
 		});
 
 				
 		// 상태 변경
 		var opAry = [];
 		
 		$("[name='cancelSelectBox']").on("change", function() {
 			if($(this).is(":checked")) {
 				opAry.push($(this).parent().next().text());
 				
 			} else {
 				for(var i = 0; i < opAry.length; ++i) {
 					if(opAry[i] == $(this).parent().next().text()) {
 						opAry.splice(i, 1);
 					}
 				} 		
 			}
 		});				
		
		$("#status-change-btn").on("click", function() {	
			
			var status = $("#cancelStatus > option:selected").val();
			
			if(opAry.length <= 0) {
				window.alert("하나 이상 체크해 주세요.");
			} else {
				if(window.confirm("선택된 항목들을 수정하시겠습니까?")) {
					$.ajax({
						url : "${contextPath}/bMember/cancelStatusChange/" + status,
						data : {"opAry" : opAry},
						type : "post",
						success : function(result) {
							if(result > 0) {
								console.log("상태가 변경되었습니다.");
								location.reload(true);
							}
						}, error : function() {
								console.log("실패.")
						}						
					});
					
				} else {
					console.log("아니오");
				}
			}
			
		});
 		
	</script>
	
		
</body>
</html>