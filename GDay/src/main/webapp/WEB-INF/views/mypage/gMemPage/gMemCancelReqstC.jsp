<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 수강 취소 요청</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css?ver=1.1"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/requestCancel.css?ver=1.2">
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
        <span>클래스 수강 취소 신청</span>
    </div>
    <div id="order-info">
        <span class="order-date">수강 신청 일자</span><span class="order-date">2021.02.04</span>
        <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
        <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
        <span class="order-prdt-no">수강 신청 번호 &nbsp;</span><span class="order-prdt-no">2021020412345</span>
    </div>

    <div class="container-table" id="ship-info">
        <div class="columns"><!-- 왼 레이블 / 오 내용 -->
            <span class="column-label">클래스명</span>
            <span class="column-content" id="class-name">손뜨개 클래스</span>
        </div>
        <div class="columns">
            <span class="column-label">클래스 기간(회차)</span>
            <span class="column-content" id="class-period">2021.03.30. ~ 2021.04.30.(4회차)</span>
        </div>
        <div class="columns">
            <span class="column-label">클래스 시간</span>
            <span class="column-content" id="class-dates">토 2시</span>
        </div>
        <div class="columns">
            <span class="column-label">강사명</span>
            <span class="column-content" id="teacher">강사님</span>
        </div>
    </div>


    <form action="#" id="cancel-request">
        <div id="list-title">
            <span>취소 정보</span>
        </div>
        <div class="container-cancel-input">
            <div class="cancel-form" id="cancel-rf">
                <label for="rfContent" class="cancel-title">취소·반품 사유</label>
                <select name="" id="rfReasonCode" class="cancel-content">
                    <option value="">수강 의사 취소</option>
                    <option value="">클래스 변경</option>
                    <option value="">클래스 일정 문제</option>
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


        <div class="wrap-btn">
        <button type="reset" class="rf-btn goback-btn">이전으로</button>
        <button type="submit" class="rf-btn sumbit-btn">취소 요청</button>
        </div>
    </form>
	</div>
		
</div><!-- wrapper끝 -->
</body>
</html>