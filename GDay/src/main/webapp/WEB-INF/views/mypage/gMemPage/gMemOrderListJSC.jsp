<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- orderListJS 용 JSP -->    
    
<script>

var memberNo = "${loginMember.memberNo}";
var cp;
var tabMenu;
var periodRadio;
var listContainer;
var maxPage; //최대 페이지

$(document).ready(function(){//ready 함수
	
//기본 화면 결제일 기간 : 일주일 / 전체  + list 초기화
(function(){
	
	$("#7days").click();

	cp=1;
	console.log(cp);
	loadTab(cp); //로드 탭

})();	

//period 조회 버튼 클릭
$("#list-search-btn").on("click", function(){
	cp = 1;
	listContainer.html("");
	selectOrderList(cp);
});

//더보기 버튼 클릭
$(".btn-more").on("click", function(){
	cp = cp + 1;
	console.log(cp);
	selectOrderList(cp);
});

});//ready 함수 끝



/* 주문 내역 조회 */
function selectOrderList(cp){
	var periodStart = $("#periodStart").val();//조회 시작일
	var periodEnd = $("#periodEnd").val();//조회 마지막일
	
	var statusNo = $("#giftStatus").val();//상태
	 
	periodRadio = $("input[name='periodRadio']").val();
	
	tabMenu = $(".tab-active").prev().val();
	
	if(tabMenu == "endClass") {
		statusNo = 800;
	}
	
	listContainer = $("#" + tabMenu);
	
	if(cp <= 1){
		listContainer.html("");
	}
	
	//array를 넘기기 위해 필요한 설정
//	jQuery.ajaxSettings.traditional = true;

	$.ajax({
		url : "../selectOrderList/C/" + memberNo, /* type : 1(선물) + 회원번호*/
		data : { "cp" : cp, 
						"periodStart" : periodStart, 
						"periodEnd" : periodEnd, 
						"periodRadio" : periodRadio,
						"statusNo" : statusNo, 
						"tabMenu" : tabMenu },
		type : "post",
		dataType : "json",
		success : function(map){
			console.log(map);
			
			var oList = map.oList;

			if(oList.length > 0){
				
				var thumbnails = map.thumbnails;
				var cList = map.cList;
				var rCheck = map.rCheck;
				
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
					
					var text1;
					var text2;
					
						console.log(cList);
					$.each(cList, function(index, gClass){
						
						if(order.prdtNo == gClass.prdtNo){
							
							/* 숫자.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); : 화폐단위 , 찍어줌 */
							text1 = (order.prdtPrice * order.opAmount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원 / " + gClass.cSession + "회";
							text2 = gClass.cStartDate + " ~ " + gClass.cEndDate;
						}
					});
					var listText1 = $("<span>").addClass('list-text-1').text(text1).attr("onclick", click);
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
					
					var url = "../cancelRequest/C/" + order.opNo;//반품/취소 요청 href + 주문 상품 번호 
					
					btn = "";
					
					if(status == 900) { //수강신청
						btn = $("<a>").addClass('btn-cancel').attr("href", url).text("수강 취소");
						
					} else if(status == 800){ //수강 완료
						btn = $("<a>").addClass('btn-review')
						.attr("onclick", "popUp("+ order.opNo + ", 'g'" +")").text("후기 쓰기");
					
						$.each(rCheck, function(index, review){
							if(review.rvNo == order.opNo) btn = "";
						});
					}
					listStatus.append(btn);
					
					listBtn.append(listSeller).append(listStatus);
					/* btn 부분 끝 */
					container.append(listCard).append(listBtn); //추가
					
					listContainer.append(container);//누적 담기
					
				});//oList 담기 끝
				
			}//oList가 있을 때 if 문 끝
			
			else { //oList가 없을 때
				
				var div = $("<div>").addClass('no-list');
				
				var msg;
				if(tabMenu == "readyClass") msg = "😥수강 내역이 없습니다😥";
				else if(tabMenu == "endClass") msg = "😥수강 완료 내역이 없습니다😥";
				
			
				var span = $("<span>").addClass('no-list-text').text();		
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


//처음 화면 로딩 + tab 클릭시 진행되는 함수
function loadTab(cp){
	
	for(var i=0; i<cp; i++){ 
		//목록, 이전으로 버튼으로 돌아온 경우
		selectOrderList(cp); 
	}
	
}


//클릭 시 상세 이동
/* 목록 클릭 시 상세 조회로 이동(주문번호 사용) */
function gotoDetail(orderNo, opNo, statusNo){
var url;

if(statusNo >= 800){
	url = "../orderView/C/" + orderNo;
	
} else { //취소-반품 요청 중 혹은 완료됐을 때
	url = "../cancelView/C/" + opNo;
}
	location.href = url;
}

//클릭 시 판매자에게 문의하는 창 연결
function gotoInquiry(sellerNo){

}




</script>