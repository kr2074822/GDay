<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${contextPath}/resources/css/mypage/reviewList.css?ver=1.1">
<link rel="stylesheet" href="${contextPath}/resources/css/common/modalBasic.css"/>
		
   <h1>후기</h1>
    <div class="bar">
        <div class="info">
            <span>별점 평균</span>
        </div>
        <div class="progress_line"><span></span></div>
    </div>
		<div id="container-reviews">
		
					<!-- 클래스 -->		
<!-- 				<div class="container-review">
	        <div class="review-img-v"></div>
	        <div class="review-card">
	        		<div class="review-date">
	                <span class="date-text">후기 작성일</span>
	                <span>2021.03.01.</span>
	            </div>
	            <div class="review-info-v">
	                <span class="info-writer">닉네임</span>
	            </div>
 	            <div class="review-star">
                 <i class="fas fa-star star-1"></i>
                 <i class="fas fa-star star-2"></i>
                 <i class="fas fa-star star-3"></i>
                 <i class="fas fa-star star-4"></i>
                 <i class="fas fa-star star-5"></i>
                 <input type="number" class="star-count" name="rvStar">
	            </div>
	            <div class="review-content-v">후기후기후기</div>
	            <a class="a-report">신고</a>
	        </div>
        </div>
		 -->
				<!-- 선물 -->
<!-- 				<div class="container-review">
					<div class="review-img-v"></div>
	        <div class="review-card">
	        	  <div class="review-date">
	                <span class="date-text">후기 작성일</span>
	                <span>2021.03.01.</span>
	            </div>
	            <div class="review-info-v">
	            	  <span class="info-writer">닉네임</span>
	                <span class="info-opt">옵션 │ 빨강, 1개</span>
	            </div>
	            <div class="review-star">
	                    <i class="fas fa-star star-1"></i>
	                    <i class="fas fa-star star-2"></i>
	                    <i class="fas fa-star star-3"></i>
	                    <i class="fas fa-star star-4"></i>
	                    <i class="fas fa-star star-5"></i>
	                    <input type="number" class="star-count" name="rvStar">
	            </div>
	            <div class="review-content-v">후기후기후기</div>
	            <a class="a-report">신고</a>
	        </div>
	      </div>  -->
			</div>

			<div class="r-pagination">
					
			</div>


 <!-- 모달창 : 이미지 확대 팝업-->
<div class="modal-cover">
  <div class="cal-modal" id="modal-img" style="width:600px; height:600px;">
    <a class="modal-close"><i class="fas fa-times map-close"></i></a>
    <div class="m-content-box">
    		<img id="big-img">
   	</div>
  </div>
</div>
 

<script>

var pagePath = window.location.pathname; // /gday/gift/34 이런식
var pages = pagePath.split("/"); // pages[2] == gift / gClass
var type = pages[2];

var prdtNo; //상품 번호
var cp;
var maxPage;

var rContainer = $("#container-reviews");//review 컨테이너

var sellerNo;

if(type == "gift") {
	prdtNo = "${gift.prdtNo}"; 
	sellerNo = "${gift.memNo}";

} else if(type == "gClass") {
	prdtNo = "${gclass.prdtNo}"; 
	sellerNo = "${gclass.memNo}";
}


$(function(){
	console.log("현재 페이지 : " + type);
	console.log("cp: " + cp);
	
	selectReviewView(cp);
	
});//레디함수 끝


function selectReviewView(cp){
	
	rContainer.html("");
	
	if(cp == undefined || cp <= 0){
		cp = 1; //첫 페이지
	}
	console.log("cp: " + cp);
	
	//cp, prdtNo, pages[2]==type
	
	$.ajax({
		url: "../review/selectReviewView",
		data : { "cp" : cp, "prdtNo" : prdtNo, "type" : type},
		type : "POST",
		dataType : "json",
		success : function(map){
		
				var rList = map.rList;
		  	if(rList.length > 0){
		  		
				  $.each(rList, function(index, review){   
					  	
					  	var starAvg = map.starAvg;
					  	var starLine = $(".progress_line span");
					  	starLine.text(starAvg).css("width", starAvg*20+"%");

					  	var container = $("<div>").addClass("container-review");
				  		
				  		var imgUrl = review.rvImgPath + "/" + review.rvImgName;
				  		var reviewImg = $("<div>").addClass("review-img-v").css("background-image", "url(" + "${contextPath}" + imgUrl + ")");
		
				  		container.append(reviewImg);
				  		
				  		var rCard = $("<div>").addClass("review-card");
				  		
				  		var rDate = $("<div>").addClass("review-date");
				  		var dateText = $("<span>").addClass("date-text").text("후기 작성일");
				  		var date = $("<span>").text(review.createDate);
							rDate.append(dateText).append(date);
							
							var rInfo = $("<div>").addClass("review-info-v");
							var writer = $("<span>").addClass("info-writer").text(review.writer);
							rInfo.append(writer);
							
							if(type == "gift"){
								var optList = map.optList;
								
								$.each(optList, function(index, option){
									if(option.gOptNo == review.giftOpNo){
										var opt = $("<span>").addClass("info-opt").text(option.gOptName);
										rInfo.append(opt);
									}
								});
							}
							
							//별점
							var star = $("<div>").addClass("review-star");
							
							for(var i=1; i<=5; i++){
								
								var $icon = $("<i>").addClass("fas fa-star");
								
								if(review.rvStar >= i) {
									$icon.css("color", "#ffe600");
								}
								star.append($icon);
							}
							
							rCard.append(star);
							
							var beforeContent = review.rvContent;
							 beforeContent = beforeContent.replace(/&amp;/g, "&");   
						   beforeContent = beforeContent.replace(/&lt;/g, "<");   
						   beforeContent = beforeContent.replace(/&gt;/g, ">");   
						   beforeContent = beforeContent.replace(/&quot;/g, "\"");   
					  	 beforeContent = beforeContent.replace(/<br>/g, "\n");
		
							//후기 내용
							var content = $("<div>").addClass("review-content-v").text(beforeContent);
							
							rCard.append(rDate).append(rInfo).append(star).append(content);
							
							
								//신고 버튼 
/* 							if("${loginMember.memberNo}" == review.sellerNo){
								var aReport = $("<div>").addClass("a-report")
					     								.text("신고").attr("onclick", "reportReview(" + review.rvNo + ")");
									
									rCard.append(aReport);
							}
							 */

							
							container.append(rCard);
							
							rContainer.append(container);
				  });
					
		  	} else { //후기 없을 때
		  		var div = $("<div>").addClass('no-list');
				
					var msg = "작성된 후기가 없습니다😥";
			
					var span = $("<span>").addClass('no-list-text').text(msg);		
					div.append(span);
					rContainer.append(div);
		  	}
		  	
			  //더보기 버튼 현재 페이지가 마지막 페이지이면 숨기기 + 아니면 보이기
				var pInfo = map.pInfo;
				maxPage = pInfo.maxPage;
				cp = pInfo.currentPage;
				
				var pagination = $(".r-pagination");
				pagination.html("");
				
				if(cp > pInfo.pageSize){
					var first = $("<a>").addClass("r-page").text("<<").attr("onclick", "goToPage(1)");
					
					/* 5개 페이지사이즈 */
					var prevNum = ((cp - 1)/5)*5; 
					var prev =  $("<a>").addClass("r-page").text("<").attr("onclick", "goToPage(" + prevNum + ")");
					
					pagination.append(first).append(prev);
				}
				
				for(var i=pInfo.startPage; i<=pInfo.endPage; i++){
					var num = $("<a>").addClass("r-page").text(i).attr("onclick", "goToPage("+ i +")");
					
					if(cp == i){
						num.css("color", "#FE929F");
					}
					
					pagination.append(num);
				}
				
				/* 5개 페이지사이즈 */
				var nextNum = ((cp + 9)/5)*5 + 1; 
				if(nextNum <= maxPage){
					var next =  $("<a>").addClass("r-page").text(">").attr("onclick", "goToPage(" + nextNum + ")");
					var last =	$("<a>").addClass("r-page").text(">>").attr("onclick", "goToPage(" + maxPage + ")");
					pagination.append(next).append(last);
				}
		
		},
		error : function(){
			console.log("후기 조회 중 오류");
		}
		
	});//ajax 끝
	
}

function goToPage(cp){
	selectReviewView(cp);
}



</script>
