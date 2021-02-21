<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 리스트</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css?ver=1.2">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css?ver=1.4">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/listPeriod.css?ver=1.4">

    <!-- icon : font-awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
    
    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	
  	<style>
  	
  	#wrapper-list {
  		display : flex;
  	}
  	
  	/* 헤더 깨져서 추가 */
  	#header-ul { margin : 0px; }
  	</style>
  	
</head>
<body>
<%-- <c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/> --%>

<jsp:include page="../../common/header.jsp"/>
		

<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

    <div id="container-list-all">
        <div id="list-title">
            <span>선물 리스트</span>
        </div>

        <!-- 주문 목록 기간 검색 -->
        <div id="list-title-period"><span>결제일</span></div>
        <div class="row" id="container-period">
            <form action="#" method="post" id="container-form">
            <div class="list-search" id="list-search-1">
                <input type="radio" name="periodRadio" id="7days" value="7days">
                <label for="7days">일주일</label>
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
                <select name="giftStatus" id="giftStatus">
                    <option value="#">결제 완료</option>
                    <option value="#">선물 발송</option>
                    <option value="#">구매 확정</option>
                    <option value="#">취소/반품 완료</option>
                    <option value="#">취소/반품 처리 중</option>
                </select> <!-- giftStats : 주문 선물 상태 -->
                <button type="submit" id="list-search-btn">조회</button>
            </div>
            </form>
        </div>

        <!-- 주문 목록 리스트 -->
        <div class="row" id="container-list">
            <div class="list-card">
                <div class="list-thumb">
                    <img src="#">
                </div>
                <div class="list-text">
                    <span class="list-title">선물명</span><br>
                    <span class="list-text-1">100,000원 / 1개</span><br>
                    <span class="list-text-2">주문번호 : 210204113AAA</span><br>
                    <span class="list-text-3">[구매 확정]</span>
                </div>
            </div>
            <div class="list-btn">
                <div class="list-seller">
                    <span class="seller-name">판매업체</span>
                    <a href="#" class="btn-inquiry">문의하기</a><!-- 팝업창? 모달창? -->
                </div>
                <div class="list-status">
                    <!-- 구매 확정 후 : 후기 쓰기(팝업창) -->
                    <a href="#" class="btn-review">후기 쓰기</a>

                    <!-- 결제 완료 후 : 취소 요청(팝업창)-->
                    <a href="#" class="btn-cancel">취소 요청</a> 
                    
                    <!-- 선물 발송 후 : 구매확정(confirm) / 반품 요청(팝업창) -->
                    <a href="#" class="btn-confirm">구매 확정</a> <!-- 발송 후 30일 이후에는 자동으로 확정 -->
                    <a href="#" class="btn-takeback">반품 요청</a> 
                </div>
            </div>
        </div>
        <span class="list-hr"><hr></span><br>
        <!-- 더보기 버튼 : 목록이 더 있을 때만 표시 -->
        <a href="#" id="btn-more"><i class="fas fa-plus"></i></a>
    </div>
</div>

<script src="${contextPath}/resources/js/mypage/listPeriod.js"></script>

</body>
</html>