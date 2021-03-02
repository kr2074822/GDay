<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 반품/취소 요청</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/requestCancel.css?ver=1.1">
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
    <div id="list-title">
        <span>선물 반품·취소 신청</span>
    </div>
    <div id="order-info">
        <span class="order-date">주문 일자</span><span class="order-date">2021.02.04</span>
        <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
        <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
        <span class="order-prdt-no">주문 상품 번호 &nbsp;</span><span class="order-prdt-no">2021020412345</span>
    </div>

    <div class="container-orders"><!-- 반응형 관련 -->
    <!-- 주문 리스트 -->
        <div class="container-list">
            <div class="list-card">
                <div class="list-thumb">
                    <img src="#"> <!-- 클릭시 해당 판매글로 이동 -->
                </div>
                <div class="list-text">
                    <span class="orderNo list-hidden">21020411334</span> <!-- 주문번호 -->
                    <span class="list-name">선물명</span><br><!-- 클릭시 해당 판매글로 이동 -->
                    <span class="list-text-2">빨강</span><br>
                </div>
            </div>
            <div class="list-info">
                <div class="list-total">
                    <span class="total-price">100,000원</span>
                    <span class="separate" style="font-size : 16px;">&nbsp;/&nbsp;</span>
                    <span class="total-amount">2개</span>
                </div>
                <div class="list-seller">
                    <span class="seller-name">판매업체</span>
                </div>
            </div>
        </div><!-- container-list 끝 -->
    </div> 
    <!-- container-orders 끝 -->

    <form action="#" id="cancel-request">
        <div id="list-title">
            <span>취소·반품 정보</span>
        </div>
        <div class="container-cancel-input">
            <div class="cancel-form" id="cancel-rf">
                <label for="rfContent" class="cancel-title">취소·반품 사유</label>
                <select name="" id="rfReasonCode" class="cancel-content">
                    <option value="">구매 의사 취소</option>
                    <option value="">사이즈 및 색상 변경</option>
                    <option value="">수량 등 주문 실수</option>
                    <option value="">배송 지연</option>
                    <option value="">파손 및 불량</option>
                    <option value="">오배송</option>
                    <option value="">기타</option>
                </select>
            </div>
            <div class="cancel-form" id="cancel-explain">
                <label for="rfContent" class="cancel-title">사유 상세 내용</label>
                <textarea name="rfContent" id="explain" class="cancel-textarea"></textarea>
                <!-- 회원 주소1 : 우편번호-->
            </div>
        </div>


        <div id="list-title">
            <span>환불 예정 금액</span>
        </div>
        <div class="container-table-cancel" id="pay-info">
            <div class="columns">
                <span class="column-label">환불 금액</span>
                <span class="column-content" id="total-order">200,000원</span>
            </div>
            <div class="columns">
                <span class="column-label">환불 방식</span>
                <span class="column-content" id="payType">신용카드/일시불</span>
            </div>
        </div>

        <div id="list-title">
            <span>수거지 정보</span>
        </div>
        <div class="container-cancel-input">
            <div class="cancel-form" id="cancel-phone">
                <label for="buyer" class="cancel-title">반송자</label>
                <input type="text" name="buyer" value="박사람" class="cancel-content" required/><!-- 회원 전화번호 -->
            </div>
            <div class="cancel-form" id="cancel-phone">
                <label for="phone" class="cancel-title">연락처</label>
                <input type="text" name="phone" value="01011111111" class="cancel-content" required/><!-- 회원 전화번호 -->
            </div>

            <div class="cancel-form" id="cancel-address-1">
                <label class="cancel-title">우편번호</label>
                <div class="input-btn">
                    <input type="text" name="address1" value="01234" class="cancel-content-1"/>
                    <button type="button" class="rf-btn" id="post-search-btn">검색</button>
                <!-- 회원 주소1 : 우편번호-->
                </div>
            </div>
            <div class="cancel-form" id="cancel-address-2">
                <label class="cancel-title">도로명 주소</label>
                <input type="text" name="address2" value="서울특별시 중구 남대문로 120" class="cancel-content"/>
                <!-- 회원 주소2 : 도로명 주소-->
            </div>

            <div class="cancel-form" id="cancel-address-3">
                <label for="address3" class="cancel-title">상세 주소</label>
                <input type="text" name="address3" value="대일빌딩 2층" class="cancel-content"/>
                <!-- 회원 주소1 : 우편번호-->
            </div>
        </div> 
        
        <div class="wrap-btn">
        <button type="reset" class="rf-btn goback-btn">이전으로</button>
        <button type="submit" class="rf-btn sumbit-btn">취소 요청</button>
        </div>
    </form>
	</div>
		
</div><!-- wrapper끝 -->
</body>
</html>