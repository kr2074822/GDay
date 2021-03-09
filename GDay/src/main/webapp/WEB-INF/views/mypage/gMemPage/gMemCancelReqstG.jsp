<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 화폐단위 체크용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- split 사용 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 반품/취소 신청</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css?ver=1.0"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css?ver=1.0"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/requestCancel.css?ver=1.0">
    <!-- 취소 요청 페이지 고유 -->

    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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
        <span>선물 반품·취소 신청</span>
    </div>
    <div id="order-info">
        <span class="order-date">주문 일자</span><span class="order-date">${order.orderDate}</span>
        <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
        <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
        <span class="order-prdt-no">주문 상품 번호 &nbsp; &nbsp;</span><span class="order-prdt-no">${order.opNo}</span>
    </div>

    <div class="container-orders"><!-- 반응형 관련 -->
    <!-- 주문 리스트 -->
        <div class="container-list">
            <div class="list-card">
                <c:set var="imgUrl" value="${contextPath}${thumbnail.filePath}/${thumbnail.fileName}"/>
                <div class="list-thumb" style="background-image: url(${imgUrl});">
                </div>
                <div class="list-text" id="cancel-text">
                    <span class="list-name">${order.prdtName}</span>
                    <span class="list-text-2" id="cancel-opt">${gOption.gOptName}</span>
                </div>
            </div>
            <div class="list-info">
                <div class="list-total">
                    <span class="total-price">
                    	<fmt:formatNumber value="${order.prdtPrice * order.opAmount}"/>원
                    </span>
                    <span class="separate" style="font-size : 16px;">&nbsp;/&nbsp;</span>
                    <span class="total-amount">${order.opAmount}개</span>
                </div>
                <div class="list-seller">
                    <span class="seller-name">${order.sellerName}</span>
                </div>
            </div>
        </div><!-- container-list 끝 -->
    </div> 
    <!-- container-orders 끝 -->

    <form action="${contextPath}/gMember/sendRequest/G" id="cancel-request" onsubmit="return returnValidate()">
        <div class="list-title">
            <span>취소·반품 정보</span>
        </div>
        <div class="container-cancel-input">
            <div class="cancel-form" id="cancel-rf">
                <label for="rfReasonCode" class="cancel-title">취소·반품 사유</label>
                <select name="rfReasonCode" id="rfReasonCode" class="cancel-content">
                    <option value="100">구매 의사 취소</option>
                    <option value="200">옵션·수량 변경</option>
                    <option value="300">배송 지연</option>
                    <option value="400">파손 및 불량</option>
                    <option value="500">오배송</option>
                    <option value="800">기타</option>
                </select>
            </div>
            <div class="cancel-form" id="cancel-explain">
                <label class="cancel-title">사유 상세 내용</label>
                <textarea name="rfContent" id="rfContent" class="cancel-textarea" 
                	placeholder="상세 내용을 작성해 주세요."></textarea>
                <!-- 회원 주소1 : 우편번호-->
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

		<c:if test="${order.statusNo == 200}">
			<!-- 도로명주소 api로 하는 경우 -->	
			<c:set var="address" value="${fn:split(order.shipAddr, ',')}" /> 
        <div class="list-title">
            <span>수거지 정보</span>
        </div>
        
        <div class="container-cancel-input">
        <div class="ur-btn cancel-form"><button type="button" class="rf-btn" id="reset-addr">초기화</button></div>
            <div class="cancel-form" id="cancel-phone">
                <label for="shipName" class="cancel-title">반송자</label>
                <input type="text" id="shipName" name="shipName" value="${order.shipName}" class="cancel-content" required/><!-- 회원 전화번호 -->
            </div>
            <div class="cancel-form" id="cancel-phone">
                <label for="shipPhone" class="cancel-title">연락처</label>
                <input type="text" id="shipPhone" name="shipPhone" value="${order.shipPhone}" class="cancel-content" 
                	maxlength='11' placeholder="'-' 없이 숫자만 입력" required/><!-- 회원 전화번호 -->
            </div>

            <div class="cancel-form" id="cancel-address-1">
                <label class="cancel-title">우편번호</label>
                <div class="input-btn">
                    <input type="text" name="address0" value="${address[0]}" class="cancel-content-1 postcodify_postcode5" readonly/>
                    <button type="button" class="rf-btn" id="post-search-btn">검색</button>
                <!-- 회원 주소1 : 우편번호-->
                </div>
            </div>
            <div class="cancel-form" id="cancel-address-2">
                <label class="cancel-title">도로명 주소</label>
                <input type="text" name="address1" value="${address[1]}" class="cancel-content postcodify_address" readonly/>
                <!-- 회원 주소2 : 도로명 주소-->
            </div>

            <div class="cancel-form" id="cancel-address-3">
                <label for="address3" class="cancel-title">상세 주소</label>
                <input type="text" name="address2" value="${address[2]}" class="cancel-content postcodify_details"
                	placeholder="상품 수거를 위해 정확한 주소를 입력해 주세요!"/>
                <!-- 회원 주소3 : 상세 주소-->
                
                <input type="text" name="newAddr" value="${order.shipAddr}" class="cancel-hidden"/>
            </div>
        </div> 
  	</c:if>
  	
  	
  	    <%-- 북마크나 주소로 인한 직접 접근 시 목록으로 버튼 경로 지정 --%>
				<c:if test="${empty sessionScope.returnViewURL}">
					<c:set var="returnViewURL" value="${contextPath}/gMember/orderView/G/${order.orderNo}" scope="session"/>
				</c:if>	      
        <div class="wrap-btn">
        <button type="button" class="rf-btn goback-btn">이전으로</button>
        <button type="submit" class="rf-btn sumbit-btn">신청</button>
        </div>
    </form>
	</div>
	
</div><!-- wrapper끝 -->


<!-- 도로명 주소 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>    
<script>
	/* 도로명 주소 API */
	//도로명 주소 API
	 // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
	 $(function(){
	     $("#post-search-btn").postcodifyPopUp();
 	     $(".postcodify_details").on("focus", function(){
	    	 $(this).val("");
	     });
 		
		//주소 초기화 버튼 시 기존 내용 저장
 	  var basicName = "${order.shipName}";
		var basicPhone = "${order.shipPhone}";
		var basicAddr0 = "${address[0]}";
		var basicAddr1 = "${address[1]}";
		var basicAddr2 = "${address[2]}";
 	     
		$("#reset-addr").on("click", function(){
			
			$("#shipName").val(basicName);
			$("#shipPhone").val(basicPhone);
			$("input[name='address0']").val(basicAddr0);
			$("input[name='address1']").val(basicAddr1);
			$("input[name='address2']").val(basicAddr2);
			
		});
		
		$(".goback-btn").on("click", function(){
			location.href = "${returnViewURL}";
		});
		
	 });//레디함수 끝
	
	     
	//submit 유효성 검사
	var validateCheck = {
			"shipName" : false,
			"shipPhone" : false,
			"rfContent" : false
	}
 	function returnValidate(){
		 
		var sel = "";
 		
		var $name = $("input[name='shipName']");
		var $phone = $("input[name='shipPhone']");
 		var $rfContent = $("textarea[name='rfContent']");
 		var $rfReasonCode = $("#rfReasonCode");

 		
 		var statusNo = "${order.statusNo}";
 		if(statusNo == 100) {//취소 요청일 때
			validateCheck.shipName = true;
 			validateCheck.shipPhone = true;
 		
 		} else { //반품 요청일 때
	 		//name 유효성 검사 : 한글 6글자 + 영어 20글자
	 		var regExp1 = /^[가-힣\s]{2,6}$/;
	 		var regExp2 = /^[A-Za-z\s]{2,20}$/;
	 		
	 		if(!regExp1.test($name.val()) && !regExp2.test($name.val())){
	 			validateCheck.shipName = false;
	 		} else {
	 			validateCheck.shipName = true;
	 		}
	 		
	 		//phone 유효성 검사
	 		regExp1 = /^01\d{8,9}$/;
	 		if(!regExp1.test($phone.val())){
	 			validateCheck.shipPhone = false;
	 		} else {
	 			validateCheck.shipPhone = true;
	 		}
 		
 		}
 		
 		console.log("사유: " + $rfReasonCode.val());
 		
 		if($rfReasonCode.val() == 800 && $rfContent.val().trim().length == 0){
 			validateCheck.rfContent = false;
 		} else {
 			validateCheck.rfContent = true;
 		}
 		
 		for ( var key in validateCheck) {
 			
			if (!validateCheck[key]) {
				var str;
				switch (key) {
				case "shipName": str = "<b style='font-size:24px;'>반송자 형식이<br>유효하지 않습니다.</b>"; break;
				case "shipPhone": str = "<b style='font-size:24px;'>연락처 형식이<br>유효하지 않습니다.</b>";	break;
				case "rfContent": str = "<b style='font-size:24px;'>'기타' 선택 시 반드시<br>상세 내용을 작성해 주세요!</b>";	break;
				}
				sel = "#" + key;
				
				swal.fire({
					icon : "warning",	
					html : str,
					confirmButtonColor: "#54b39E"
				}).then(function() {
					var id = "#" + key;
					$(id).focus();
				});
				
				return false;
			}
		}
 		
 		/* 주소 합치기 */
 		var shipAddr = $("input[name='address0']").val() + ","
 								+ $("input[name='address1']").val() + "," + $("input[name='address2']").val();
 		$("input[name='newAddr']").val(shipAddr);
 		
 		console.log($("input[name='newAddr']").val());
 		
 	}//유효성 검사 끝
	
</script>  
    

<jsp:include page="../../common/footer.jsp"/>

</body>
</html>