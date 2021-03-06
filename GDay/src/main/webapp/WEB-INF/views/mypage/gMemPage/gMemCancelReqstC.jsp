<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 화폐단위 체크용 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 수강 취소 요청</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css?ver=1.2"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/requestCancel.css?ver=1.3">
    <!-- 취소 요청 페이지 고유 -->
    
  	<style>
  	
  	#wrapper-list {
  		display : flex; 
  	}
  	
  	</style>
</head>
<body>


<jsp:include page="../../common/header.jsp"/>

<!-- js 파일 -->


<div id="wrapper-list">
	<jsp:include page="gMemSidebar.jsp"/>
		
		
	<div id="container-cancel-all">
    <div class="list-title">
        <span>클래스 수강 취소 신청</span>
    </div>
    <div id="order-info">
        <span class="order-date">신청일</span><span class="order-date">${order.orderDate}</span>
        <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
        <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
        <span class="order-prdt-no">클래스 신청 번호&nbsp; &nbsp;</span><span class="order-prdt-no">${order.opNo}</span>
    </div>

    <div class="container-table" id="class-info">
      <div class="columns-cover">
				<div class="columns">
				    <c:set var="imgUrl" value="${contextPath}${thumbnail.filePath}/${thumbnail.fileName}"/>
		        <div class="columns-thumb" style="background-image: url(${imgUrl});">
		        </div>
				</div>
        <div class="columns"><!-- 왼 레이블 / 오 내용 -->
            <span class="column-label">클래스명</span>
            <span class="column-content class-name">${order.prdtName}</span>
        </div>
        <div class="columns">
            <span class="column-label">강사명</span>
            <span class="column-content teacher">${order.sellerName}</span>
        </div>
        <div class="columns">
            <span class="column-label">클래스 기간(회차)</span>
            <span class="column-content" id="class-period">${gClass.cStartDate} ~ ${gClass.cEndDate} (${gClass.cSession}회차)</span>
        </div>
        <div class="columns">
            <span class="column-label">클래스 시간</span>
            <span class="column-content" id="class-dates">${gClass.cDate}</span>
        </div>
        <div class="columns">
            <span class="column-label">수강료</span>
            <span class="column-content class-price"><fmt:formatNumber value="${order.prdtPrice * order.opAmount}"/>원 / ${order.opAmount}명</span>
        </div>
      </div>
    </div>


    <form action="${contextPath}/gMember/sendRequest/C" id="cancel-request" onsubmit="return returnValidate()">
        <div class="list-title">
            <span>취소 정보</span>
        </div>
        <div class="container-cancel-input">
            <div class="cancel-form" id="cancel-rf">
                <label for="rfReasonCode" class="cancel-title">수강 취소 사유</label>
                <select name="rfReasonCode" id="rfReasonCode" class="cancel-content">
                    <option value="600">수강 의사 취소</option>
                    <option value="700">클래스 변경</option> 
                    <option value="800">기타</option>
                </select>
            </div>
            <div class="cancel-form" id="cancel-explain">
                <label for="rfContent" class="cancel-title">사유 상세 내용</label>
                <textarea name="rfContent" id="rfContent" class="cancel-textarea"
                	placeholder="상세 내용을 작성해 주세요."></textarea>
            </div>
            <input class="cancel-hidden" name="opNo" value="${order.opNo}"/>
            <input class="cancel-hidden" name="orderNo" value="${order.orderNo}"/>
            <input class="cancel-hidden" name="statusNo" value="${order.statusNo}"/>
            <!-- 주문 상세 번호 / 주문 번호(반송 주소 넣을 때 필요)/statusNo(주문 상태 바꿀 때 현재 상태 확인용) - hidden -->
        </div>


        <div class="list-title">
            <span>환불 예정 금액</span>
        </div>
        <div class="container-table-cancel" id="pay-info">
            <div class="columns">
                <span class="column-label">환불 금액</span>
                <span class="column-content" id="total-order"><fmt:formatNumber value="${order.prdtPrice * order.opAmount}"/>원</span>
            </div>
            <div class="columns">
                <span class="column-label">환불 방식</span>
                <span class="column-content" id="payType">신용카드</span>
            </div>
        </div>


        <%-- 북마크나 주소로 인한 직접 접근 시 목록으로 버튼 경로 지정 --%>
				<c:if test="${empty sessionScope.returnViewURL}">
					<c:set var="returnViewURL" value="${contextPath}/gMember/orderView/C/${order.orderNo}" scope="session"/>
				</c:if>
        <div class="wrap-btn">
        <button type="button" class="rf-btn goback-btn" onclick="location.href=${returnListURL}">이전으로</button>
        <button type="submit" class="rf-btn sumbit-btn">취소 요청</button>
        </div>
    </form>
	</div>
		
</div><!-- wrapper끝 -->


<script>

function returnValidate(){
		var $rfContent = $("textarea[name='rfContent']");
		var $rfReasonCode = $("#rfReasonCode");
		
		if($rfReasonCode.val() == 800 && $rfContent.val().trim().length == 0){
			swal.fire({
				icon : "warning",	
				html : "<b style='font-size:24px;'>'기타' 선택 시 반드시<br>상세 내용을 작성해 주세요!</b>",
				confirmButtonColor: "#54b39E"
			}).then(function() {
				$rfContent.focus();
			});
			
			return false;
		}
}

$(function(){
	$(".goback-btn").on("click", function(){
		location.href = "${returnViewURL}";
	});
});


</script>


<jsp:include page="../../common/footer.jsp"/>
</body>
</html>