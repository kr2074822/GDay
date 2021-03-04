<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 화폐단위 체크용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 주문 상세 정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css?ver=1.7"> <!-- 상세 페이지 고유 css -->
		<link rel="stylesheet" href="${contextPath}/resources/css/common/modalBasic.css"/>
    
    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

		<!-- 주소 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=930f7a74b0fd1bdc17d81c3d8fb76bf4&libraries=services"></script>

		
  	
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
            <span>수강 클래스 상세 정보</span>
        </div>
    
        <div id="order-info">
            <span class="order-date">신청일</span><span class="order-date">${oList[0].orderDate}</span>
            <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
            <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
            <span class="order-no">신청 번호</span><span class="order-no">${oList[0].orderNo}</span>
        </div>

			
			<!-- 최종 합계 금액용 -->
			<c:set var="total" value="0"/>

        <div class="container-table" id="class-info">
	      <c:forEach  var="order" items="${oList}">
        	<div class="columns-cover">
        		
        		<c:forEach var="image" items="${thumbnails}">
        			<c:if test="${image.prdtNo == order.prdtNo}">
	        		<div class="columns">
							    <c:set var="imgUrl" value="${contextPath}${image.filePath}/${image.fileName}"/>
					        <div class="columns-thumb" style="background-image: url(${imgUrl});">
					        </div>
							</div>
							</c:if>
				    </c:forEach>    
            <div class="columns"><!-- 왼 레이블 / 오 내용 -->
                <span class="column-hidden opNo">${order.opNo}</span><!-- 클래스 상품 주문번호 -->
                <span class="column-label">클래스명</span>
                <span class="column-content" >
	                <span class="column-content-1 class-name">${order.prdtName}</span>
	                <span class="column-content-0">${order.statusName}</span>

 									<%-- 수강 완료 + 후기 없으면 후기 쓰기 --%>
	             		 <c:if test="${order.statusNo == 800 && empty rCheck}">
	             		 		<a class="btn-review btn-view" onclick="popUp(${order.opNo}, 'c')">후기 쓰기</a>
	             		 </c:if>
									<%-- 수강 완료 + 후기가 있으나 rvNo==opNo인 후기가 없으면 : 후기 쓰기 --%>                    		 
               		 <c:if test="${order.statusNo == 800 && !empty rCheck}">
               				<c:set var="flag" value="false"/> <%-- 후기 유무 확인용 --%>
               				<c:forEach var="review" items="${rCheck}">
               					<c:if test="${!flag}">
	                  			<c:if test="${review.rvNo == order.opNo}">
	                  				<c:set var="flag" value="true"/> <%-- true -> 반복 중단 --%>
	                  			</c:if>
               					</c:if>
											</c:forEach>
											<c:if test="${!flag}"> <%-- flag가 false이면 후기 없음 -> 버튼 출력 --%>
		                   	<a class="btn-review btn-view" onclick="popUp(${order.opNo}, 'c')">후기 쓰기</a>
											</c:if>
										</c:if>
									
									<%-- 수강 신청 상태 --%>
									<c:if test="${order.statusNo == 900 }">	
	                	<a href="${contextPath}/gMember/cancelRequest/C/${order.opNo}" class="btn-request btn-view">수강 취소</a>	
									</c:if>
                
                </span>
            </div>
            <div class="columns">
                <span class="column-label">강사명</span>
                <div class="column-content">
	                <span class="column-content-1 teacher">${order.sellerName}</span>
	                <a class="btn-inquiry btn-view" onclick="gotoInquiry(${order.sellerNo})">문의하기</a>
                </div>
            </div>
	           <c:forEach var="gClass" items="${cList}">
	           	<c:if test="${gClass.prdtNo == order.prdtNo}">
		            <div class="columns">
		                <span class="column-label">클래스 기간(회차)</span>
		                <span class="column-content" id="class-period">${gClass.cStartDate} ~ ${gClass.cEndDate} (${gClass.cSession}회차)</span>
		            </div>
		            <div class="columns">
		                <span class="column-label">클래스 시간</span>
		                <span class="column-content" id="class-dates">${gClass.cDate}</span>
		            </div>
		            <div class="columns">
		                <span class="column-label">클래스 장소</span>
		                <div class="column-content">
			                <span class="column-content-1" id="class-addr">${gClass.cLocal}</span>
		  	              <a class="btn-map btn-view" onclick="mapView('${gClass.cLocal}')">지도보기</a>
		  	            </div>
		            </div>
	            </c:if>
	           </c:forEach>
            <div class="columns">
                <span class="column-label">수강료</span>
                <span class="column-content class-price"><fmt:formatNumber value="${order.prdtPrice * order.opAmount}"/>원 / ${order.opAmount}명</span>
            </div>
            <c:set var="total" value="${total + order.prdtPrice * order.opAmount}"/>	
					</div>        
		     </c:forEach>
        </div>
        
        <div class="list-title">
            <span>수강생 정보</span>
        </div>
        <div class="container-table" id="pay-info">
            <div class="columns"><!-- 왼 레이블 / 오 내용 -->
                <span class="column-label">신청인(명)</span>
                <span class="column-content" id="ship-name">${oList[0].shipName}</span>
            </div>
            <div class="columns">
                <span class="column-label">대표 연락처</span>
                <span class="column-content" id="ship-phone">${oList[0].shipPhone}</span>
            </div>
        </div>
        

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

				<%-- 북마크나 주소로 인한 직접 접근 시 목록으로 버튼 경로 지정 --%>
				<c:if test="${empty sessionScope.returnListURL}">
					<c:set var="returnListURL" value="../../orderList/C" scope="session"/>
				</c:if>
        <a href="${sessionScope.returnListURL}" class="btn-gotolist btn-view">목록</a>
    </div>
</div>

<%-- 취소 요청 페이지에서 이전으로 클릭 시 주문 상세 페이지로 돌아오도록 url 세션에 올리기 --%>
	<c:set var="returnViewUrl" 
		scope="session"
		value="${contextPath}/gMember/orderView/C/${oList[0].orderNo}"/>


<!-- 모달창 : 지도 팝업 -->
<div class="modal-cover">
  <div class="cal-modal" id="modal-map" style="width:600px; height:550px;">
    <a class="modal-close"><i class="fas fa-times map-close"></i></a>
    <div class="m-title">강의장 확인하기</div>
     	<div class="m-content-box">
     		<br>
     		<div id="map-box" style="width:100%; height:400px;"></div>
    	</div>
  </div>
</div>


<jsp:include page="../../common/footer.jsp"/>
</body>
</html>
