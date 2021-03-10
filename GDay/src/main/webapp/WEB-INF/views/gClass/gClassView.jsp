<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../common/header.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- reset.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    
    <!-- giftView.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/gClass/gClassView.css?ver=1.0">
    <title>클래스 상세 페이지</title>
    
</head>
<body>

	<c:if test="${loginMember == null}">
		<c:set var="loginFlag" value="0"></c:set>
	</c:if>
	<c:if test="${loginMember != null}">
		<c:set var="loginFlag" value="1"></c:set>
	</c:if>

    <section>
        <div class="gift_wrapper">
            <form action="">
                <div class="gift_img_wrapper">
                    <div class="gift_img">
                        <img src="${contextPath}${thumbnail.filePath}/${thumbnail.fileName}" alt="">
                    </div>
                    <div class="rate">
                        <span><i class="fas fa-star"></i>${star.rvStarView}</span>
                    </div>
                </div>
                <div class="gift_info">
                    <div class="gift_option">
                        <div class="title">
                            <div>
                                <h1>${gclass.prdtName}</h1>
                                <span>${gclass.prdtPrice}원 / ${gclass.cCount}회 수업</span><br>
                                <span>${gclass.cStartDate} ~ ${gclass.cEndDate}</span><br>
                                <span>전체 정원 <b>${gclass.cCount}</b>명 중 <b>${gclass.cNowCount}</b>명이 수업을 신청했어요.</span>
                            </div>
                            <div>
                                <i class="far fa-comments"></i>
                                <span>문의하기</span>
                            </div>
                        </div>
                        <div class="option">
                            <div class="gift_cnt">
                                <div class="opt_title">
                                    <span class="class-amount">참여 인원</span>
                                    </div>
                                <div class="cnt">
                              		  <i class="fas fa-minus" onclick="del()"></i>
                                    <input type="text" class="amount" value=1 style="width:30px">
                                    <i class="fas fa-plus" onclick="add()"></i>
                                   <!--  <input type=hidden name="sell_price" value="${gclass.prdtPrice}"> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="priceBtn">
                        <!-- <p>총 <span>123</span>개</p> -->
                        <div class="price">
                            <span>총 상품금액</span>
                            <span class="sum" style="font-size: 30px;"><fmt:formatNumber value="${gclass.prdtPrice}"/>원</span>
                        </div>
    
                        <div class="option_btn">
                            <button type="button" class="cart">장바구니에 넣기</button>
                          <!--   <a class="wish">위시리스트로 등록하기</a> -->
                            <button type="button" class="order">주문하기</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <section>
        <div class="gift">
            <div class="gift_title">
                <div id="fnMove1" class="pointCursor"><a>상품 설명</a></div>
                <div id="fnMove2" class="pointCursor"><a>상품 후기</a></div>
                <div id="fnMove3" class="pointCursor"><a>수강 취소 정보</a></div>
            </div>
            <div class="describe">
                <h1>강사 정보</h1>
                <div class="report">
                    <a href='javascript:;' onclick="window.open('${contextPath}/admin/reportForm/${gclass.prdtNo}', '', 'width=500, height=500, top=200, left=100, scrollbars=no'); return false;">
                        <i class="fas fa-siren-on"></i>
                    </a>
                </div>
                <div class="b_info">
                    <table>
                        <tr>
                            <th colspan="2"><span>${member.memberNick}</span></th>
                        </tr>
							<%--  		<tr>
                            <td>이름</td>
                            <td>${member.memberName}</td>
                        </tr> --%>
                        <tr>
                            <td>상호명</td>
                            <td id="memberNick">${member.memberNick}</td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>${member.memberPhone}</td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>${member.memberAddress}</td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>${member.memberEmail}</td>
                        </tr>
                    </table>
                </div>
                <h1>상품 설명</h1>
                <div class="about_gift" id="about_gift">
                    <p>
                       ${gclass.prdtContent}
                       
                <h1>강의장 위치</h1>
                       <div id="cLocal">${gclass.cLocal}</div>
                       <div id="map" style="width:100%;height:350px;margin-top:30px;margin-bottom:20px;"></div>
                    </p>
                </div>
                <div class="g_info" id="g_info">
                    <table>
                        <tr>
                            <th colspan="4">상품 태그</th>
                        </tr>
                        <tr>
                            <td>연령대</td>
                            <td>
                            <c:forEach var="tag" items="${prdtTagList}" varStatus="vs">
                            	<c:if test="${tag.ctNo == 100}">
                            		${tag.tagName}
                            	</c:if>
                            </c:forEach>
                            </td>
                            <td>가격대</td>
                            <td>
                            <c:forEach var="tag" items="${prdtTagList}" varStatus="vs">
                            	<c:if test="${tag.ctNo == 200}">
                            		${tag.tagName}
                            	</c:if>
                            </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <td>분위기</td>
                            <td>
                            <c:forEach var="tag" items="${prdtTagList}" varStatus="vs">
                            	<c:if test="${tag.ctNo == 300}">
                            		${tag.tagName}
                            	</c:if>
                            </c:forEach>
                            </td>
                            <td>관계</td>
                            <td>
                            <c:forEach var="tag" items="${prdtTagList}" varStatus="vs">
                            	<c:if test="${tag.ctNo == 400}">
                            		${tag.tagName}
                            	</c:if>
                            </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <td>기념일/명절</td>
                            <td>
                            <c:forEach var="tag" items="${prdtTagList}" varStatus="vs">
                            	<c:if test="${tag.ctNo == 500}">
                            		${tag.tagName}
                            	</c:if>
                            </c:forEach>
                            </td>
                            <td>계절</td>
                            <td>
                            <c:forEach var="tag" items="${prdtTagList}" varStatus="vs">
                            	<c:if test="${tag.ctNo == 600}">
                            		${tag.tagName}
                            	</c:if>
                            </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <td>색상</td>
                            <td>
                            <c:forEach var="tag" items="${prdtTagList}" varStatus="vs">
                            	<c:if test="${tag.ctNo == 700}">
                            		${tag.tagName}
                            	</c:if>
                            </c:forEach>
                            </td>
                            <td>종류</td>
                            <td>
                            <c:forEach var="tag" items="${prdtTagList}" varStatus="vs">
                            	<c:if test="${tag.ctNo == 800}">
                            		${tag.tagName}
                            	</c:if>
                            </c:forEach>
                            </td>
                        </tr>
                    </table>
                </div>
							<!-- 이게 모지 -->
                <div class="gift_pic">
                    <img src="images/gift1.jpg" alt="">
                    <img src="images/gift1.jpg" alt="">
                </div>

                <div class="refund">
                    <h1>수강 취소 정보</h1>
                    <div class="table_wrapper">
                        <table>
                            <tr>
                                <th colspan="4">
                                    <h2>G-Day 수강 취소 안내</h2>
                                    <p>수강 취소 시 먼저 강사와 연락하셔서 취소 사유 등을 협의하신 후 취소 요청해 주시기 바랍니다.</p>
                                </th>
                            </tr>
<!--                             <tr>
                                <td>판매자 지정댁배사</td>
                                <td colspan="3">우체국택배</td>
    
                            </tr> -->
                            <tr>
                                <td>취소 수수료</td>
                                <td colspan="3">없음</td>
                            </tr>
                            <tr>
                                <td>수강 취소 가능 기간</td>
                                <td colspan="3">개강 1일 전까지 가능</td>
                            </tr>
                            <tr>
                                <td>개강 후 취소</td>
                                <td colspan="3">클래스 폐강 등의 강사 측 문제, 천재지변 등의 사유만 가능</td>
                            </tr>
                        <!--<tr>
                                <td>반품/교환 불가능 사유</td>
                                <td colspan="3">-</td>
                            </tr> -->
                            
                        </table>
                    </div>
                </div>

					<div id="review" class="review_wrapper">
             
          <jsp:include page="../review/reviewView.jsp"></jsp:include>
             
          </div>
                <c:url var="updateUrl" value="${gclass.prdtNo}/update"/>
                <c:url var="pauseUrl" value="${gclass.prdtNo}/pause"/>
          	<c:if test="${(loginMember != null) && (member.memberEmail == loginMember.memberEmail)}">
                 	<div class="Gbutton">
                  	<a href="${updateUrl}">
                   	 <button class="update" style="margin-right: 10px;" id="update">수정</button>
                  	</a>
                    	<button class="update delete" id="pause">마감하기</button>
                	</div>
             </c:if>
            </div> 
        </div> 
    </section>
		<jsp:include page="../common/footer.jsp" />
		<script type="text/javascript" src="${contextPath}/resources/js/fontawesome.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=930f7a74b0fd1bdc17d81c3d8fb76bf4&libraries=services"></script>
    
    <script>
    //상단바 페이지 내 이동
    $("#fnMove1").on("click", function() {
    	var offset = $(".about_gift").offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    });
    $("#fnMove2").on("click", function() {
    	var offset = $(".review_wrapper").offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    });
    $("#fnMove3").on("click", function() {
    	var offset = $(".g_info").offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    });
    
    /* 참여 인원에 따른 금액 증가 로직 */
    var price = ${gclass.prdtPrice};
    function add(){
    	$(".amount").val(Number($(".amount").val()) + 1);
    	$(".sum").text(Number($(".sum").text()) + price);
    }
    
    function del(){
    	
    	if($(".amount").val()> 1){
	    	$(".amount").val( Number($(".amount").val()) - 1);
	    	$(".sum").text( Number($(".sum").text()) - price);
    	}
    }
    
    $(".amount").on("input", function(){
    	
    	if(isNaN(Number($(".amount").val()))){ // 숫자 말고 다른 것 입력 시
    		$(".amount").val("");
    		$(".sum").text(price);
    	}else{
    		$(".sum").text(Number($(".amount").val()) * price);
    	}
    });

     /* 마감하기 버튼 클릭시 */
     $("#pause").on("click", function() {
    	 var prdtNo = ${gclass.prdtNo};
    	 
    	 if(confirm("클래스를 마감하시겠습니까?")) {
    		 location.href = prdtNo + "/pause"
    	 }
     });
     
     
     /* 맵 표시 */
     var cLocal = $("#cLocal").text();
     var memberNick = $("#memberNick").text();
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(cLocal, function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + memberNick + '</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
     
     
/*      /* 댓글 보여지기 
var parentBoardNo = ${prdtN.boardNo}; // 게시글 번호 --500 : EL이지만 쌍따옴표가 없어도 저장이 됨. (int)

// 댓글
// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectReplyList();
});

// 댓글 목록 불러오기(AJAX)
function selectReplyList(){
	$.ajax({
		url : "${contextPath}/reply/selectReplyList/" + parentBoardNo,
		type: "post",
		dataType: "json",
		success: function(rList) {
			// rList에는 현재 게시글의 댓글 List가 담겨 있음.
	         
						//댓글을 출력하기 위한 영역
	         var replyListArea = $("#replyListArea");
	         
	         replyListArea.html(""); // 기존 정보 초기화
	         
	         
	         // 댓글 List 반복 접근
	         $.each(rList, function(index, item){   
	            
	            // 댓글을 출력할 li 요소를 생성
	            var li = $("<li>").addClass("reply-row");
	            
	            
	            // 댓글의 깊이가 1인 요소는 대댓글 이므로 별도 스타일을 적용할 수 있도록 childReply-li 클래스를 추가
	            if(item.replyDepth == 1){
	               li.addClass("childReply-li"); //클래스 지정 -> padding-left:50px. 안 쪽으로 더 들어가는 모양
	            }
	            
	            // 작성자, 작성일, 수정일 영역 
	            var div = $("<div>");
	            var rWriter = $("<a>").addClass("rWriter").html(item.memberId);
	            var rDate = $("<p>").addClass("rDate").html("작성일 : " + item.replyCreateDate + "<br>마지막 수정 날짜 : " + item.replyModifyDate);
	            div.append(rWriter).append(rDate)
	            
	            
	            // 댓글 내용
	            var rContent = $("<p>").addClass("rContent").html(item.replyContent);
	            
	            // 대댓글, 수정, 삭제 버튼 영역
	            var replyBtnArea = $("<div>").addClass("replyBtnArea");
	            
	            // 로그인 되어 있고, 대댓글이 아닐 경우 경우에 답글 버튼 추가
	            // 댓글 아래에만 답글을 달 수 있는 모양(대대댓글 x)
	            if(loginMemberId != "" && item.replyDepth != 1){
	               var childReply = $("<button>").addClass("btn btn-sm btn-success ml-1 childReply").text("답글").attr("onclick", "addChildReplyArea(this, "+ item.parentReplyNo + ")");
	               replyBtnArea.append(childReply);
	            }
	            
	            // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
	            if(item.memberId == loginMemberId){
	               
	               // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
	               var showUpdate = $("<button>").addClass("btn btn-success btn-sm ml-1").text("수정").attr("onclick", "showUpdateReply(" + item.replyNo + ", this)");
	               var deleteReply = $("<button>").addClass("btn btn-success btn-sm ml-1").text("삭제").attr("onclick", "deleteReply(" + item.replyNo + ")");
	               
	               replyBtnArea.append(showUpdate, deleteReply);
	            }
	            
	            
	            // 댓글 하나로 합치기
	            li.append(div).append(rContent).append(replyBtnArea);
	            
	            // 댓글 영역을 화면에 배치
	            replyListArea.append(li);
	         });
	         
		},
		error: function() {
			console.log("댓글 목록 조회 실패")
		}
	});
	
} */




		$(".fa-comments").on('click', function(){
		    
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
				    		you: "${member.memberNo}",
				    		
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
		
		    	
		    
		});

/* ======================== 주문하기 버튼 클릭 시 ======================== */    
	var loginFlag = ${loginFlag};  
	
$(".order").on("click", function() {
	var prdtNo = ${gclass.prdtNo};
	var prdtName = "${gclass.prdtName}";
	var prdtPrice = ${gclass.prdtPrice};
	var prdtAmount = $(".amount").val();

	console.log(prdtNo);
	console.log(prdtName);
	console.log(prdtPrice);
	console.log(prdtAmount);
	
	 if(loginFlag == 1) {
		 $.ajax({
	    		url : "${contextPath}/payment/onePaymentInfo2",
	    		data : {"prdtNo" : prdtNo,
	    				"prdtName" : prdtName,
	    				"prdtPrice" : prdtPrice,
	    				"prdtAmount" : prdtAmount},
	    		type : "post",
	    		success : function(result) {
	    			if(result > 0) {
	    				location.href = "${contextPath}/payment/onePaymentForm";
	    			} else {
	    				window.alert("주문 페이지 이동 중 에러가 발생했습니다.");
	    			}
	    			
	    		},
	    		error : function() {
	    			window.alert("장바구니에 등록 중 에러가 발생하였습니다.");
	    		}
	    	 });	 
	 } else {
		 window.alert("로그인 후 장바구니 사용이 가능합니다.");
	 }
	
	
});    


     
     /* ======================== 장바구니 버튼 클릭 시 ======================== */
     var loginFlag = ${loginFlag};

     $(".cart").on("click", function() {
    	 var prdtNo = ${gclass.prdtNo};
    	 var amount = $(".amount").val();
    	 
    	 if(loginFlag == 1) {
    		 $.ajax({
   	    		url : "${contextPath}/cart/memberClassCart",
   	    		data : {"prdtNo" : prdtNo,
   	    				"amount" : amount},
   	    		type : "post",
   	    		success : function(result) {
   	    			if(result > 0) {
   	    				window.alert("장바구니에 등록되었습니다.");
   	    			} else {
   	    				window.alert("이미 등록된 상품입니다.");
   	    			}
   	    			
   	    		},
   	    		error : function() {
   	    			window.alert("장바구니에 등록 중 에러가 발생하였습니다.");
   	    		}
   	    	 });	 
    	 } else {
    		 window.alert("로그인 후 장바구니 사용이 가능합니다.");
    	 }
   			
    	 
     });
     
    </script>
    
</body>
</html>