<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 화폐단위 체크용 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 주문 상세 정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css?ver=1.0"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css?ver=1.1"> <!-- 상세 페이지 고유 css -->

    <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  	
  	<style>
  	
  	#wrapper-list {
  		display : flex; 
  	}
  	
  	</style>
</head>
<body>

<jsp:include page="../../common/header.jsp"/>

<!-- js 파일 -->
<jsp:include page="gMemOrderViewJS.jsp"></jsp:include>

<!-- 모달 파일 -->
<jsp:include page="../../review/reviewInsertForm.jsp"/>


<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

    <div id="container-list-all" class="container-view">
        <div class="list-title">
            <span>선물 주문 상세 정보</span>
        </div>
    
        <div id="order-info">
            <span class="order-date">주문 일자</span><span class="order-date">${oList[0].orderDate}</span>
            <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
            <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
            <span class="order-no">주문 번호</span><span class="order-no">${oList[0].orderNo}</span>
        </div>

				<!-- 최종 합계 금액용 -->
				<c:set var="total" value="0"/>

        <div class="container-orders"><!-- 반응형 관련 -->
        <!-- 주문 목록 리스트 -->
        <c:forEach  var="order" items="${oList}">
            <div class="container-list">
                <div class="list-card">
                		
                		<c:forEach var="image" items="${thumbnails}">
                			<c:if test="${image.prdtNo == order.prdtNo}">
												<c:set var="imgUrl" value="${contextPath}${image.filePath}/${image.fileName}"/>                			
                			</c:if>
                		</c:forEach>
                    <div class="list-thumb" style="background-image: url(${imgUrl});"></div>
                    <div class="list-text">
                        <span class="opNo list-hidden">${order.opNo}</span> <!-- 상품 주문 번호 -->
                        <span class="list-name">${order.prdtName}</span><!-- 클릭시 해당 판매글로 이동 -->
                        <span class="list-text-1"><fmt:formatNumber value="${order.prdtPrice * order.opAmount}"/>원</span>
                        <c:set var="total" value="${total + order.prdtPrice * order.opAmount }"/>
                        
                        <span class="list-text-2">
                        	<c:forEach var="option" items="${optList}">
                        		<c:if test="${option.gOptNo == order.giftOpNo}">
                        			${option.gOptName} / 
                        		</c:if>
                        	</c:forEach>
                        		${order.opAmount}개
                        </span>
                        <span class="list-text-3">${order.statusName}</span>
                    </div>
                </div>
                <div class="list-btn">
                    <div class="list-seller">
                        <span class="seller-name">${order.sellerName}</span>
                        <a class="btn-inquiry" onclick="gotoInquiry(${order.sellerNo})">문의하기</a>
                    </div>
                    <div class="list-status">
	                       
												 <%-- 구매 확정 + 후기 없으면 후기 쓰기 --%>
                    		 <c:if test="${order.statusNo == 300 && empty rCheck}">
                    		 		<a class="btn-review" onclick="popUp(${order.opNo}, 'g')">후기 쓰기</a>
                    		 </c:if>

													<%-- 구매 확정 + 후기가 있으나 rvNo==opNo인 후기가 없으면 : 후기 쓰기 --%>                    		 
                    		 <c:if test="${order.statusNo == 300 && !empty rCheck}">
                    				<c:set var="flag" value="false"/> <%-- 후기 유무 확인용 --%>
                    				
                    				<c:forEach var="review" items="${rCheck}">
                    					<c:if test="${!flag}">
			                    			<c:if test="${review.rvNo == order.opNo}">
			                    				<c:set var="flag" value="true"/> <%-- true -> 반복 중단 --%>
			                    			</c:if>
                    					</c:if>
														</c:forEach>
														
														<c:if test="${!flag}"> <%-- flag가 false이면 후기 없음 -> 버튼 출력 --%>
				                    	<a class="btn-review" onclick="popUp(${order.opNo}, 'g')">후기 쓰기</a>
														</c:if>
                    		 </c:if>
                    		 
                    		 <c:if test="${order.statusNo == 100}">
		                    		 <%-- 결제 완료 후 : 취소 요청(팝업창)--%>
		                        <a href="${contextPath}/gMember/cancelRequest/G/${order.opNo}" class="btn-cancel">취소 요청</a> 
		                     </c:if>
		                     
		                     <c:if test="${order.statusNo == 200}">
                        		<%-- 선물 발송 후 : 구매확정(confirm) / 반품 요청(팝업창) --%>
		                        <a class="btn-confirm" onclick="confirm(${order.opNo})">구매 확정</a> <!-- 발송 후 30일 이후에는 자동으로 확정 -->
		                        <a href="${contextPath}/gMember/cancelRequest/G/${order.opNo}" class="btn-takeback">반품 요청</a> 
		                    </c:if>	
                    </div>
                </div>
            </div><!-- container-list 끝 -->
            
	   		</c:forEach> 
        </div> 
        <!-- container-orders 끝 -->

        <div class="list-title">
            <span>최종 결제 정보</span>
        </div>
        <div class="container-table" id="pay-info">
            <div class="columns">
                <span class="column-label">최종 결제 금액</span>
                <span class="column-content" id="total-order"><fmt:formatNumber value="${total}"/>원</span>
            </div>
            <div class="columns">
                <span class="column-label">결제 수단</span>
                <span class="column-content" id="payType">신용카드</span>
            </div>
        </div>

        <div class="list-title">
            <span>배송지 정보</span>
        </div>
        <div class="container-table" id="ship-info">
            <div class="columns"><!-- 왼 레이블 / 오 내용 -->
                <span class="column-label">받는 사람</span>
                <span class="column-content" id="ship-name">${oList[0].shipName}</span>
            </div>
            <div class="columns">
                <span class="column-label">연락처</span>
                <span class="column-content" id="ship-phone">${oList[0].shipPhone}</span>
            </div>
            <div class="columns">
                <span class="column-label">배송지</span>
                <span class="column-content" id="ship-addr">${oList[0].shipAddr}</span>
            </div>
        </div>
        <a href="" class="btn-gotolist btn-view">목록</a>
    </div>
</div>


<jsp:include page="../../common/footer.jsp"/>
</body>
</html>