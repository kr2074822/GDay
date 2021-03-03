<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- orderListJS 용 JSP -->    
    
<script>

var memberNo = "${loginMember.memberNo}";
var cp;
var listContainer;
var maxPage; //최대 페이지

$(document).ready(function(){//ready 함수
	
	listContainer = $(".container-orders");
	
	//기본 화면 결제일 기간 : 일주일 / 전체  + list 초기화
	(function(){
	
		$("#7days").click();
		cp = 1;//첫 페이지
		selectOrderList(cp); //첫 조회

	})();	
	
	//period 조회 버튼 클릭
	$("#list-search-btn").on("click", function(){
		cp = 1;
		selectOrderList(cp);
	});
	
	//더보기 버튼 클릭
	$("#btn-more").on("click", function(){
		cp = cp + 1;
		selectOrderList(cp);
	});

});//ready 함수 끝


/* 주문 내역 조회 */
function selectOrderList(cp){
	var start = $("#periodStart").val();//조회 시작일
	var end = $("#periodEnd").val();//조회 마지막일
	
	var statusNo = $("#giftStatus").val();//상태
	
	
	if(cp<=1){
		listContainer.html("");
	}
	//array를 넘기기 위해 필요한 설정
//	jQuery.ajaxSettings.traditional = true;

	$.ajax({
		url : "../selectOrderList/G/" + memberNo, /* type : 1(선물) + 회원번호*/
		data : { "cp" : cp, "start" : start, "end" : end, "statusNo" : statusNo },
		type : "post",
		dataType : "json",
		success : function(map){
			console.log(map);
			var oList = map.oList;

			if(oList.length > 0){
				
				var thumbnails = map.thumbnails;
				var optList = map.optList;
				
		    $.each(oList, function(index, order){   
					
					var container = $("<div>").addClass('row container-list');
					
					/* listCard 시작 */
					var listCard = $("<div>").addClass('list-card');
					
					//상세 조회하는 함수
					var click = "gotoDetail(" + order.orderNo +","+ order.opNo +","+ order.statusNo + ")";
					
					/* 썸네일 부분 */
					var imgUrl;
					$.each(thumbnails, function(index, image){
						if(order.prdtNo == image.prdtNo){
							imgUrl = "url(" + "${contextPath}" + image.filePath + "/" + image.fileName + ")";
						}
					});
					var listThumb = $("<div>").addClass('list-thumb').attr("onclick", click)
													.css("background-image", imgUrl);
	
					/* list text 부분 */
					var listText = $	("<div>").addClass('list-text');
					
					var orderNo = $("<span>").addClass('orderNo list-hidden').text(order.orderNo).attr("onclick", click);
					var opNo = $("<span>").addClass('opNo list-hidden').text(order.opNo).attr("onclick", click);
					
					var listName = $("<span>").addClass('list-name').text(order.prdtName).attr("onclick", click);
					
					var text1 = (order.prdtPrice * order.opAmount) + "원";
					var listText1 = $("<span>").addClass('list-text-1').text(text1).attr("onclick", click);
					
					var text2;
					$.each(optList, function(index, option){
						if(order.giftOpNo == option.gOptNo){
							text2 = option.gOptName + " / " + order.opAmount + "개";
						}
					});
					var listText2 = $("<span>").addClass('list-text-2').text(text2);
	
					var listText3 = $("<span>").addClass('list-text-3').text(order.statusName);
					
					listText.append(orderNo).append(opNo).append(listName)
									.append(listText1).append(listText2).append(listText3);
					
					listCard.append(listThumb).append(listText);
					/* listCard 끝 */
					
					/* list-btn 시작 */
					var listBtn = $("<div>").addClass('list-btn');
					var listSeller = $("<div>").addClass('list-seller');
					var listStatus = $("<div>").addClass('list-status');
					
					var btn; 
					
					/* seller 부분 */
					var sellerName = $("<div>").addClass('seller-name').text(order.sellerName);
					
					click = "gotoInquiry(" + order.sellerNo + ")"; //문의하기 팝업창 생기게 하는 함수
					var btn = $("<a>").addClass('btn-inquiry').text("문의하기")
												.attr("onclick", click);
					
					listSeller.append(sellerName).append(btn);
					
					/* status 부분 */
					var status = order.statusNo;
					
					var url = "../cancelRequest/G/" + order.opNo;//반품/취소 요청 href + 주문 상품 번호 
					
					if(status == 100) { //결제 완료
						btn = $("<a>").addClass('btn-cancel').attr("href", url).text("취소 요청");
						listStatus.append(btn);
						
					} else if(status == 200){ //발송 완료
						btn = $("<a>").addClass('btn-takeback').attr("href", url).text("반품 요청");
						var btn2 = $("<a>").addClass('btn-confirm')
											.attr("onclick", "confirm(" + order.opNo + ")").text("구매 확정");
	
						listStatus.append(btn).append(btn2);
	
					} else if(status == 300){//구매 확정
						btn = $("<a>").addClass('btn-review')
									.attr("onclick", "popUp("+ order.opNo + ", 'g'" +")").text("후기 쓰기");
					
						listStatus.append(btn);
					} //취소-반품 요청 중 + 완료
					
					listBtn.append(listSeller).append(listStatus);
					/* btn 부분 끝 */
					
					container.append(listCard).append(listBtn); //추가
					
					listContainer.append(container);//누적 담기
					
				});//oList 담기 끝
				
			}//oList가 있을 때 if 문 끝
			
			else { //oList가 없을 때
				
				var div = $("<div>").addClass('no-list');
				var span = $("<span>").addClass('no-list-text').text("😥주문 내역이 없습니다😥");		
				div.append(span);
				listContainer.append(div);
				
			}
			
			//더보기 버튼 현재 페이지가 마지막 페이지이면 숨기기 + 아니면 보이기
			var pInfo = map.pInfo;
			maxPage = pInfo.maxPage;
			console.log(maxPage +"/"+ cp);
			if(cp >= maxPage) {
				$(".btn-more").hide();
			} else {
				$(".btn-more").show();
			}
			
		},
		error : function(){
			console.log("주문 내역 조회 중 오류");
		}
		
	});//ajax 끝
}//selectOrderList 끝






//클릭 시 상세 이동
	/* 목록 클릭 시 상세 조회로 이동(주문번호 사용) */
function gotoDetail(orderNo, opNo, statusNo){
	var url;
	
	if(statusNo <= 300){
		url = "../orderView/G/" + orderNo;
		
	} else { //취소-반품 요청 중 혹은 완료됐을 때
		url = "../cancelView/G/" + opNo;
	}
		location.href = url;
}

//클릭 시 판매자에게 문의하는 창 연결
function gotoInquiry(sellerNo){
	
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
													
													selectOrderList(cp);//재 로드
													
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

//팝업은 모달창jsp에 있음



</script>