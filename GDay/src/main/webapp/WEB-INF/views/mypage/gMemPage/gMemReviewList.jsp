<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 후기</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/listPeriod.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/reviewList.css?ver=1.0">

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

<!-- js 파일 -->
<jsp:include page="orderListTab.jsp"/>

<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

   <div id="container-list-all">
        <div id="list-title">
            <span>나의 후기</span>
        </div>
				
				<!-- 탭메뉴 -->
			<div class="tabs">	
				<input type="radio" name="tabMenu1" class="tab-radio" id="tab-left">
		    <label for="tabMenu1" class="tab-label tab-l tab-active" >선물</label>
		    <input type="radio" name="tabMenu2" class="tab-radio" id="tab-right">
		    <label for="tabMenu2" class="tab-label tab-r">클래스</label>
			</div>
				
		<div class="wrapper-tab">
				
        <!-- 주문 목록 기간 검색 -->
        <div id="list-title-period"><span>개강 일시</span></div>
        <div class="row" id="container-period">
            <form action="#" method="post" id="container-form">
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
                <select name="giftStatus" class="wrap-tab-l" id="giftStatus"><!-- 왼쪽에서만 보여짐 -->
                    <option value="#">수강 신청</option>
                    <option value="#">취소 완료</option>
                    <option value="#">취소 처리 중</option>
                </select> <!-- giftStats : 주문 선물 상태 -->
                <button type="submit" id="list-search-btn">조회</button>
            </div>
            </form>
        </div>
        
        
        <!-- 주문 목록 리스트 : 수강 신청 클래스 -->
        <div class="container-reviews wrap-tab-l" id="review-gift">
	        <div class="container-review">
			        <a class="a-delete">삭제</a>
			        <div class="review-card">
			            <div class="review-date">
			                <span class="date-text">리뷰 작성일</span>
			                <span>2021.03.01.</span>
			            </div>
			            <div class="review-info">
			                <a href="#상품번호" class="info-name">선물2</a>
			                <span class="info-opt">옵션 │ 빨강, 1개</span>
			                <span class="info-date">구매일 │ 2021.02.20.</span>
			            </div>
			            <div class="review-star">
			                    <i class="fas fa-star star-1"></i>
			                    <i class="fas fa-star star-2"></i>
			                    <i class="fas fa-star star-3"></i>
			                    <i class="fas fa-star star-4"></i>
			                    <i class="fas fa-star star-5"></i>
			                    <input type="number" class="star-count" name="rvStar">
			            </div>
			            <div class="review-content">후기후기후기</div>
			        </div>
			        <div class="review-img"></div>
			      </div>
			    </div><!--container-orders 끝 -->
			
			
			    <!-- 주문 목록 리스트 : 수강 완료 클래스 -->
	        <div class="container-reviews wrap-tab-r" id="review-gift">
		        <div class="container-review">
				        <a class="a-delete">삭제</a>
				        <div class="review-card">
				            <div class="review-date">
				                <span class="date-text">리뷰 작성일</span>
				                <span>2021.03.01.</span>
				            </div>
				            <div class="review-info">
				                <a href="#상품번호" class="info-name">클래스2</a>
				                <span class="info-date">수업일 │ 2021.03.21 ~ 2021.04.20.</span>
				                <span class="info-opt">강사 │ 임강사</span>
				            </div>
				            <div class="review-star">
				                    <i class="fas fa-star star-1"></i>
				                    <i class="fas fa-star star-2"></i>
				                    <i class="fas fa-star star-3"></i>
				                    <i class="fas fa-star star-4"></i>
				                    <i class="fas fa-star star-5"></i>
				                    <input type="number" class="star-count" name="rvStar">
				            </div>
				            <div class="review-content">후기후기후기</div>
				        </div>
				        <div class="review-img"></div>
				        </div>
				    </div>
	  	</div> <!--wrapper-tab -->
      
        <!-- 더보기 버튼 : 목록이 더 있을 때만 표시 -->
      	<a href="#" class="btn-more"><i class="fas fa-plus"></i></a>
 		</div>
 </div>
        
<script src="${contextPath}/resources/js/mypage/listPeriod.js"></script>

</body>
</html>