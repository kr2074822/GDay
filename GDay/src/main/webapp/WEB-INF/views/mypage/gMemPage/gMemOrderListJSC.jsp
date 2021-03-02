<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- orderListJS 용 JSP -->    
    
<script>
$(document).ready(function(){//ready 함수
/* 목록 클릭 시 상세 조회로 이동(주문번호 사용) */
$(".container-list > .list-card > .list-thumb").on("click", function(){
	$(this).next().children().trigger('click');
});
$(".container-list > .list-card > .list-text > span").on("click", function(){
	console.log("클릭");
	var orderNo = $(this).eq(0).text();
	console.log(orderNo);
	orderNo = 1;

	url = "../orderView/2/" + orderNo;
	location.href = url;
});

});//ready 함수 끝



/* 주문 내역 조회 */
function selectOrderList(cp){
	var start = $("#periodStart").val();//조회 시작일
	var end = $("#periodEnd").val();//조회 마지막일
	
	var statusNo = $("#giftStatus").val();//상태


}












</script>