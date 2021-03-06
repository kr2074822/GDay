<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 리스트</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css?ver=1.8">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/listPeriod.css?ver=1.6">

    <!-- icon : font-awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
    
    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- swal2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
  	
  	<style>
  	
  	#wrapper-list {
  		display : flex;
  	}
  	
  	</style>
  	
</head>
<body>
<jsp:include page="../../common/header.jsp"/>


<!-- 모달 파일 -->
<jsp:include page="../../review/reviewInsertForm.jsp"/>

<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

    <div id="container-list-all">
        <div id="list-title">
            <span>클래스 리스트</span>
        </div>
				
				<!-- 탭메뉴 -->
			<div class="tabs">	
				<input type="radio" name="tabMenu" class="tab-radio" value="readyClass" id="tab-left" checked>
		    <label for="tab-left" class="tab-label tab-l tab-active" >수강 신청 클래스</label>
		    <input type="radio" name="tabMenu" class="tab-radio" value="endClass" id="tab-right">
		    <label for="tab-right" class="tab-label tab-r">수강 완료 클래스</label>
			</div>
				
				<div class="wrapper-tab">
				
        <!-- 주문 목록 기간 검색 -->
        <div id="list-title-period"><span>개강 일시</span></div>
        <div class="row" id="container-period">
            <form method="post" id="container-form">
            <div class="list-search" id="list-search-1">
                <input type="radio" name="periodRadio" id="7days" value="7days" checked>
                <label for="7days" class="radio-active">일주일</label>
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
                <select name="status" class="wrap-tab-l" id="giftStatus"><!-- 왼쪽에서만 보여짐 -->
                    <option value="1000">전체</option>
                    <option value="900">수강 신청</option>
                    <option value="400">취소 처리 중</option>
                    <option value="600">취소 완료</option>
                </select> <!-- giftStats : 주문 선물 상태 -->
                <button type="button" id="list-search-btn">조회</button>
            </div>
            </form>
        </div>
        
        
        <!-- 주문 목록 리스트 : 수강 신청 클래스 -->
        <div class="container-orders wrap-tab-l" id="readyClass">
	<%--     <div class="container-list">
	            <div class="list-card">
	                <div class="list-thumb">
	                </div>
	                <div class="list-text">
	                    <span class="orderNo list-hidden">주문번호</span> <!-- 주문번호 -->
	                    <span class="opNo list-hidden">주문상품번호</span> <!-- 상품 주문 번호 -->
	                    <span class="list-name">클래스명</span><br>
	                    <span class="list-text-1">100,000원/1회</span><br>
	                    <span class="list-text-2">2021.05.04. ~ 2021.05.04.</span><br>
	                    <span class="list-text-3">수강 상태</span>
	                </div>
	            </div>
	            <div class="list-btn">
	                <div class="list-seller">
	                    <span class="seller-name">강사</span>
	                    <a href="#" class="btn-inquiry">문의하기</a><!-- 팝업창? 모달창? -->
	                </div>
	                <div class="list-status">
	                    <!-- 구매 확정 후 : 후기 쓰기(팝업창) -->
	                    <a href="#" class="btn-review" onclick="popUp(1, 'c')">후기 쓰기</a>
	                </div>
	            </div>
           </div><!-- container-list 끝 --> --%>   
        	</div> <!--container-orders 끝 -->
			
			
			    <!-- 주문 목록 리스트 : 수강 완료 클래스 -->
        <div class="container-orders wrap-tab-r" id="endClass">
	<%--     <div class="container-list">
	            <div class="list-card">
	                <div class="list-thumb">
	                </div>
	                <div class="list-text">
	                    <span class="orderNo list-hidden">주문번호</span> <!-- 주문번호 -->
	                    <span class="opNo list-hidden">주문상품번호</span> <!-- 상품 주문 번호 -->
	                    <span class="list-name">클래스명</span><br>
	                    <span class="list-text-1">100,000원/1회</span><br>
	                    <span class="list-text-2">2021.05.04. ~ 2021.05.04.</span><br>
	                    <span class="list-text-3">수강 상태</span>
	                </div>
	            </div>
	            <div class="list-btn">
	                <div class="list-seller">
	                    <span class="seller-name">강사</span>
	                    <a href="#" class="btn-inquiry">문의하기</a><!-- 팝업창? 모달창? -->
	                </div>
	                <div class="list-status">
	                    <!-- 구매 확정 후 : 후기 쓰기(팝업창) -->
	                    <a href="#" class="btn-review" onclick="popUp(1, 'c')">후기 쓰기</a>
	                </div>
	            </div>
           </div><!-- container-list 끝 --> --%>   
        </div> <!-- container-orders 끝 -->
      
        <!-- 더보기 버튼 : 목록이 더 있을 때만 표시 -->
      	<a class="btn-more"><i class="fas fa-plus"></i></a>
      </div>
        
   </div><!-- list-all -->
</div>


<!-- js 파일 -->
<jsp:include page="gMemOrderListJSC.jsp"/>
<jsp:include page="orderListTab.jsp"/>
<script src="${contextPath}/resources/js/mypage/listPeriod.js"></script>


<jsp:include page="../../common/footer.jsp"/>
</body>
</html>