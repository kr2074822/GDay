<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 화폐단위 체크용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 개행문자 처리용 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 취소신청 정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css?ver=1.5"> <!-- 상세 페이지 고유 css -->

    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- swal2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
    <!-- <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script> -->
  	
  	<style>
  	
  	#wrapper-list {
  		display : flex; 
  	}
  	
  	</style>
</head>
<body>

<jsp:include page="../../common/header.jsp"/>


<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

    <div id="container-list-all" class="container-view">
        <div class="list-title">
            <span>수강 취소 상세 정보</span>
        </div>
    
        <div id="order-info">
            <span class="order-date">수강 취소 신청일&nbsp;&nbsp;</span><span class="order-date">${refund.rfDate}</span>
            <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
            <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
            <span class="order-no">클래스 신청 번호&nbsp;&nbsp;</span><span class="order-no">${order.opNo}</span>
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
		            <span class="column-content">
		            	<span class="class-name column-content-1">${order.prdtName}</span>
		            	<a class="btn-detail btn-view" onclick="gotoDetail(${order.orderNo})">수강 신청 정보</a>
		            </span>
		            
		        </div>
		        <div class="columns">
		            <span class="column-label">강사명</span>
		            <div class="column-content">
	                <span class="column-content-1 teacher">${order.sellerName}</span>
	                <a class="btn-inquiry btn-view" onclick="gotoInquiry(${order.sellerNo})">문의하기</a>
                </div>
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
     
      <!-- container-orders 끝 -->

      <div class="list-title">
          <span>취소·반품 사유</span>
      </div>
      <div class="container-table" id="cancel-info">
          <div class="columns">
              <span class="column-label">취소·반품 사유</span>
              <span class="column-content" id="rfReason">${refund.rfReasonName}</span>
          </div>
          <div class="columns">
              <span class="column-label">사유 상세 내용</span>
              <span class="column-content" id="rfContent">
								<%-- JSTL을 이용한 개행문자 처리 : 출력 시 개행문자 처리함. boardContent에 있는  "\n"을 <br>로--%>
								<% pageContext.setAttribute("newLine", "\n"); %>
								${fn:replace(refund.rfContent, newLine, "<br>")}</span>
          </div>
      </div>

      <div class="list-title">
          <span>환불 예정 금액</span>
      </div>
      <div class="container-table" id="pay-info">
          <div class="columns">
              <span class="column-label">환불 금액</span>
              <span class="column-content" id="total-order"><fmt:formatNumber value="${order.prdtPrice * order.opAmount}"/>원</span>
          </div>
          <div class="columns">
              <span class="column-label">환불 방식</span>
              <span class="column-content" id="payType">신용카드</span>
          </div>
      </div>
   </div>    
</div>


<script>
//ready 함수
$(function(){
	//상세 내역을 클릭하면 상세 주문 내역으로 이동
	$(".list-text > span").on("click", function(){
		var no = $(this).eq(0).val();
		gotoDetail(no);
	});
	
});//ready 함수 끝

//썸네일, 상품명 클릭 시 상세 주문 내역으로 이동
function gotoDetail(orderNo){
	url = "../../orderView/C/" + orderNo;
	
	location.href = url;
}


//클릭 시 판매자에게 문의하는 창 연결
function gotoInquiry(sellerNo){

  Swal.fire({ 
  	  input: 'textarea',
  	  inputLabel: 'Message',
  	  inputPlaceholder: '내용을 입력해주세요', 
  	  inputAttributes: {
  	    'aria-label': 'Type your message here'
  	  },
  	  showCancelButton: true
  	}).then((result) => {
		    $.ajax({
		    	url: "${contextPath}/message/gcMsg",
		    	type: "post",
		    	data: {
		    		msgContent: result.value,
		    		me: "${loginMember.memberNo}",
		    		you: sellerNo,
		    		
		    	},
		    	success: (result) => {
		    		console.log("성공")
		    		Swal.fire(
					  '문의가 전송되었습니다',
					  ' ',
					  'success'
					)
		    	},
		    	error: () => {
		    		console.log("실패")
		    		
		    	}
		    });
  	})
  	
}

</script>

</body>
</html>