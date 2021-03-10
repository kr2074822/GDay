<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
/* 상품 정보 클릭시 판매글로 이동 */
	$(".container-list > .list-card *").on("click", function(){
		//판매글 상세 조회 코드 끝난 후에 추가 진행
	});


	//지도 모달창 창닫기 버튼(x)
	$("#modal-map .modal-close").on("click", function(){
		 console.log("클릭?");
	    $("#modal-map").parent().hide();
	});
	

});

function loadNewPage(){
	location.reload(); //
}

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




/* 지도 확인 모달창 */
function mapView(addr){
	
	$("#modal-map").parent().show();
	
	var mapContainer = document.getElementById('map-box'),  // 지도를 표시할 div 
			mapOption = {
			    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			    level: 5 // 지도의 확대 레벨
			};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
		
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
		
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content: '<div style="width:200px;text-align:center;padding:6px 0;">' + addr + '</div>'
		    });
		    infowindow.open(map, marker);
		
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
		} 
	}); 

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