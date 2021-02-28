<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css?ver=1.2">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/bMemPage/bCancelList.css"/>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	
	<div id="wrapper">
		<jsp:include page="bMemSidebar.jsp"/>	
		
		<div id="b-cancel-list-wrapper">
		
			<h1>주문 취소 조회</h1>
			
			<div id="wrapper-top-area">
			<!-- 주문 목록 기간 검색 -->
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
			</div>
					
			<div id="cancel-list">
					
				<table id="list-table">
				<thead>
					<tr>
						<th>접수날짜</th>
						<th>주문자</th>
						<th>상품명</th>
						<th>옵션</th>
						<th>수량</th>
						<th>금액</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
					
			</div>
			
			<div id="page-area">
				페이징바 영역
			</div>
			
		</div>
	</div>
	
	
</body>
</html>