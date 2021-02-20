<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 상세 페이지</title>
<script src="https://kit.fontawesome.com/955b087c12.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/gClass/gClassView.css">
</head>
<body>

<jsp:include page="../common/header.jsp"/>

	<div class="wrapper">
		<div class="flex-center">
			<div class="box-1">
				<div class="thumbnailBx">
					<img src="" />
				</div>
				<div class="row large-font"><i class="fas fa-star"></i> 4.5</div>
			</div>
			<div class="box-2">
				<div class="productInfo">
					<div class="flex-between large-font">
						클래스명
						<i class="far fa-comments"></i>
					</div>
					<div class="align-right">문의하기</div>
					<div class="product-option">
						<div class="row" style="margin-top: 0px;">120,000원 / 8회 수업</div>
						<div class="small-row">2021-02-16 ~ 2021-03-16 (매주 수, 금)</div>
						<div class="small-row">전체 정원 20명 중 10명이 수업을 신청했어요.</div>
						<div class="amount-box flex-between">
							<div style="line-height:100px;">참가 인원</div>
							<div style="line-height:100px;">
								<i class="fas fa-minus plus-minus"></i>
								<input type="number" style="width:20px;">
								<i class="fas fa-plus plus-minus"></i>
							</div>
						</div>
					</div>
					<hr>
					<div class="align-right">총 1개</div>
					<div class="row flex-between">총 상품 금액
						<span class="large-font">12,000원</span>
					</div>
					<div class="row">
						<button class="btn">장바구니에 넣기</button>
						<button class="btn">위시리스트로 등록하기</button>
						<button class="btn2">주문하기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="box-3">
			<div class="infoTab" id="detail">상품설명</div>
			<div class="infoTab" id="review">상품후기</div>
			<div class="infoTab" id="refund">배송/교환/반품</div>
		</div>
		<hr>
		<div class="align-right"><a href="#">신고</a></div>
		<div class="content">강사 정보</div>
		<div class="content">강의 설명</div>
		<div class="content">약도</div>
		<div class="content">강의 후기
		
		<jsp:include page="gClassReview.jsp"/>
		</div>
	</div>

<script>


</script>
</body>
</html>