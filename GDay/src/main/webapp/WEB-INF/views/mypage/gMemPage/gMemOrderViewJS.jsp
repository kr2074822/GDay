<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$.ready(function(){
/* 상품 정보 클릭시 판매글로 이동 */
$(".container-list > .list-card *").on("click", function(){
	//판매글 상세 조회 코드 끝난 후에 추가 진행
	
});

});

//구매확정 메소드
function confirm(opNo){
	
	  //confirm 확인 후 진행
	  swal.fire({icon:"question", 
		  					title: "해당 상품을 구매 확정하시겠습니까?",
		  					html: "구매 확정 시, 반품 요청이 불가합니다.",
		  					showCancelButton: true,
		  					confirmButtonText: "구매 확정",
		  					confirmButtonColor: "#54b39E",
		  					cancelButtonText: "취소",
		  					cancelButtonColor: "#a9a9a9",
		  					reverseButtons: true//버튼 위치 바꾸기
		  					}).then((result) => {
		  						if(result.isConfirmed){
		  							
		  							$.ajax({
		  								url : "${contextPath}/gMember/confirmOrder",
											data : {"opNo" : opNo},
											success : function(result){
												if(result > 0) {
													swal.fire ({icon: "success", 
																			title : "구매 확정되었습니다.",
																			confirmButtonColor: "#54b39E"});	

													location.reload();
													
												} else {
													swal.fire ({icon: "error", 
																			title : "구매 확정에 실패했습니다.",
																			confirmButtonColor: "#54b39E"});
												}
											},
											error : function(){
												console.log("구매 확정 과정 중 에러 발생");
											}
		  							});//ajax 끝
		  							
		  						} 
		  					});//confirm 끝
}//구매 확정 끝

//구매확정 메소드
function confirmIn(orderNo, opNo){
	 console.log(orderNo);
	 console.log(opNo);
	 
	  //confirm 확인 후 진행
	  swal.fire({icon:"question", 
		  					title: "해당 상품을 구매 확정하시겠습니까?",
		  					html: "구매 확정 시, 반품 요청이 불가합니다.",
		  					showCancelButton: true,
		  					confirmButtonText: "구매 확정",
		  					confirmButtonColor: "#54b39E",
		  					cancelButtonText: "취소",
		  					cancelButtonColor: "#a9a9a9",
		  					reverseButtons: true//버튼 위치 바꾸기
		  					}).then((result) => {
		  						if(result.isConfirmed){
		  							
		  							//상세정보에서 구매확정하기 경로
		  							location.href
		  								= "${contextPath}/gMember/confirmOrderIn/"
		  									+ orderNo + "/" + opNo;
		  						} 
		  					});//confirm 끝
}//구매 확정 끝



</script>