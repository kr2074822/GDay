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
	console.log("진행")
	$("#7days").click();

	loadNewPage(); //로드 탭

})();	

//period 조회 버튼 클릭
$("#list-search-btn").on("click", function(){
	cp = 1;
	selectReviewList(cp);
});

//더보기 버튼 클릭
$(".btn-more").on("click", function(){
	cp = cp + 1;
	console.log(cp);
	selectReviewList(cp);
});

});//ready 함수 끝



//처음 화면 로딩 + tab 클릭시 진행되는 함수
function loadNewPage(){
		tabMenu = $(".tab-active").prev().val();
		listContainer = $("#" + tabMenu);
		
		listContainer.html("");
		
		if(cp == undefined || cp <= 0) {
			cp = 1;//첫 페이지
		} 
		//cp 조작 : 만약 이전에 현재 페이지에서 selectOrderList를 진행했다면 
		//그 당시 cp가 남아 있을 것 => 해당 페이지만큼 다시 리스트 로드해야 함

		console.log(cp);

		for(var i=1; i<=cp; i++){ 
			//목록, 이전으로 버튼으로 돌아온 경우
				selectReviewList(i); 
		}
}

/* 주문 내역 조회 */
function selectReviewList(cp){
	var periodStart = $("#periodStart").val();//조회 시작일
	var periodEnd = $("#periodEnd").val();//조회 마지막일
	
	periodRadio = $("input[name='periodRadio']").val();
	
	tabMenu = $(".tab-active").prev().val();
	
	var type;
	switch(tabMenu){
	case "review-gift" : type = "G"; break;
	case "review-class" : type = "C"; break;
	}
	
	listContainer = $("#" + tabMenu);
	
	console.log(tabMenu);
	
	if(cp <= 1){
		listContainer.html("");
	}
	
	//array를 넘기기 위해 필요한 설정
//	jQuery.ajaxSettings.traditional = true;

	$.ajax({
		url : "../review/selectReviewList", /* 회원번호*/
		data : { "cp" : cp, 
						"periodStart" : periodStart, 
						"periodEnd" : periodEnd, 
						"type" : type,
						"writerNo" : memberNo
						},
		type : "post",
		dataType : "json",
		success : function(map){
			console.log(map);
			
			var rList = map.rList;
			var oList = map.oList;
			
			if(rList.length > 0){
				
		    $.each(rList, function(index, review){   
					
					var container = $("<div>").addClass('container-review');
		    
					/* 삭제 버튼 */
					var aDelete = $("<div>").addClass("a-delete")
		     								.text("삭제").attr("onclick", "deleteReview(" + review.rvNo + ")");
		     	
					/* 썸네일 부분 */
					/* 썸네일 부분 */
					var imgUrl = review.rvImgPath + "/" + review.rvImgName;
			    	
					var reviewImg = $("<div>").addClass('review-img')
													.css("background-image", "url(" + "${contextPath}" + imgUrl + ")");
												/* 	.attr("onclick", "imageView("+ imgUrl +")"); */

					container.append(aDelete).append(reviewImg);
					
					
					var reviewCard = $("<div>").addClass('review-card');

					var reviewDt = $("<div>").addClass("review-date");
					var dateText1 = $("<span>").addClass("date-text").text("리뷰 작성일");
					var dateText2 = $("<span>").text(review.createDate);
					
					reviewDt.append(dateText1).append(dateText2);
					
					reviewCard.append(reviewDt);
					
					var info = $("<div>").addClass("review-info");
					
					var infoName;//상품명, 클래스명
					
					if(type == "G"){//선물일 때
						var optList = map.optList;

						//상품명, 결제일
						var infoDate;
						$.each(oList, function(index, order){
								if(order.prdtNo == review.prdtNo){
			        		
									var name = order.prdtName;
			        		if(name.trim().length > 20){
			        			name = name.substring(0, 19) + "…";
			        		}
									
									infoName = $("<a>").addClass("info-name").text(name)
															.attr("href", "${contextPath}/gift/" + order.prdtNo);
									infoDate = $("<span>").addClass("info-date").text(order.orderDate);
								}
						});
						info.append(infoName).append(infoDate);//상품명/클래스명

						//옵션
						var infoOpt;
						$.each(optList, function(index, option){
							if(review.giftOpNo == option.gOptNo){
								infoOpt = $("<span>").addClass("info-opt").text("옵션 | " + option.gOptName);
								info.append(infoOpt);
							}
						});
						
					}//선물 끝
					
					else if(type == "C"){//클래스일때
						var cList = map.cList;
						
						//클래스명, 강사명
						var infoTeacher;
						$.each(oList, function(index, order){
							if(order.prdtNo == review.prdtNo){
								
								var name = order.prdtName;
		        		if(name.trim().length > 20){
		        			name = name.substring(0, 19) + "…";
		        		}
								
								infoName = $("<a>").addClass("info-name").text(name)
														.attr("href", "${contextPath}/gClass/" + review.prdtNo);
								infoTeacher = $("<span>").addClass("info-opt").text(order.sellerName);
							}
						});
						info.append(infoName).append(infoTeacher);

						//강의일
						var infoCDT;
						$.each(cList, function(index, gClass){
							if(gClass.prdtNo == review.prdtNo){
								infoCDT = $("<span>").addClass("info-date")						
													.text("수업일 | " + gClass.cStartDate + " ~ " + gClass.cEndDate);
							}
						});
						info.append(infoCDT);
					
					}//클래스명
					
					reviewCard.append(info);
					
					//별점
					var star = $("<div>").addClass("review-star");
					
					for(var i=1; i<=5; i++){
						
						var $icon = $("<i>").addClass("fas fa-star");
						
						if(review.rvStar >= i) {
							$icon.css("color", "#ffe600");
						}
						star.append($icon);
					}
					
					reviewCard.append(star);
					
					var beforeContent = review.rvContent;
					 beforeContent = beforeContent.replace(/&amp;/g, "&");   
				   beforeContent = beforeContent.replace(/&lt;/g, "<");   
				   beforeContent = beforeContent.replace(/&gt;/g, ">");   
				   beforeContent = beforeContent.replace(/&quot;/g, "\"");   
			  	 beforeContent = beforeContent.replace(/<br>/g, "\n");

					//후기 내용
					var content = $("<div>").addClass("review-content").text(beforeContent);
					
					reviewCard.append(content);
					
					container.append(reviewCard);
					
					listContainer.append(container);
					
				});//rList 담기 끝
				
			}//rList가 있을 때 if 문 끝
			
			else { //rList가 없을 때
				
				var div = $("<div>").addClass('no-list');
				
				var msg = "작성한 후기가 없습니다😥";

				var span = $("<span>").addClass('no-list-text').text(msg);		
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
			
			cp = pInfo.currentPage;//재로딩시를 대비하여 cp 저장
			
		},
		error : function(){
			console.log("주문 내역 조회 중 오류");
		}
		
	});//ajax 끝
}//selectOrderList 끝


function deleteReview(rvNo){
	
	$.ajax({
		url : "${contextPath}/review/deleteReview/" + rvNo,
		type : "get",
		success : function(result){
			if(result > 0){
				loadNewPage();
			} else {
				swal.fire({icon: "error", title:"후기 삭제 실패!", text: "다시 시도해 주세요."});
			}
		},
		error : function(){
			console.log("후기 삭제 중 오류 발생");
		}
	});
}

//큰 이미지 보여주기
function imageView(imgUrl){
	console.loge(imgUrl);
	$("#big-img").attr("src", "${contextPath}" + imgUrl);
	$("#modal-img").parent().show();
}

//ready 함수
(function(){
	//지도 모달창 창닫기 버튼(x)
	$("#modal-img .modal-close").on("click", function(){
		 console.log("클릭");
		 $("#big-img").attr("src", "");
	    $("#modal-img").parent().hide();
	});
})();

</script>