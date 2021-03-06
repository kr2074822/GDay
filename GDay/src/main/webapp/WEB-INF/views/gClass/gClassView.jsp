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
    <link rel="stylesheet" href="${contextPath}/resources/css/gClass/gClassView.css">
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
                        <span><i class="fas fa-star"></i>4.1</span>
                    </div>
                </div>
                <div class="gift_info">
                    <div class="gift_option">
                        <div class="title">
                            <div>
                                <h1>${gclass.prdtName}</h1>
                                <span>${gclass.prdtPrice}</span>
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
                            <span class="sum">${gclass.prdtPrice }</span>
                        </div>
    
                        <div class="option_btn">
                            <button type="button" class="cart">장바구니에 넣기</button>
                            <a class="wish">위시리스트로 등록하기</a>
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
                <div><a href="">상품 설명</a></div>
                <div><a href="">상품 후기</a></div>
                <div><a href="">배송 교환 반품</a></div>
            </div>
            <div class="describe">
                <h1>판매자 정보</h1>
                <div class="report">
                    <a href="">
                        <i class="fas fa-siren-on"></i>
                    </a>
                </div>
                <div class="b_info">
                    <table>
                        <tr>
                            <th colspan="2"><span>${member.memberName}</span> 강사님</th>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td>${member.memberName}</td>
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
                        <tr>
                            <td>상호명</td>
                            <td>${member.memberName}</td>
                        </tr>
                    </table>
                </div>
                <h1>상품 설명</h1>
                <div class="about_gift">
                    <p>
                       ${gclass.prdtContent}
                    </p>
                </div>
                <div class="g_info">
                    <table>
                        <tr>
                            <th colspan="4">상품 태그</th>
                        </tr>
                        <tr>
                            <td>연령대</td>
                            <td>이이1</td>
                            <td>가격대</td>
                            <td>이이1</td>
                        </tr>
                        <tr>
                            <td>분위기</td>
                            <td>이이1</td>
                            <td>관계</td>
                            <td>이이1</td>
                        </tr>
                        <tr>
                            <td>기념일/명절</td>
                            <td>이이1</td>
                            <td>계절</td>
                            <td>이이1</td>
                        </tr>
                        <tr>
                            <td>색상</td>
                            <td>이이1</td>
                            <td>종류</td>
                            <td>이이1</td>
                        </tr>
                    </table>
                </div>

                <div class="gift_pic">
                    <img src="images/gift1.jpg" alt="">
                    <img src="images/gift1.jpg" alt="">
                </div>

                <div class="refund">
                    <h1>반품 / 교환정보</h1>
                    <div class="table_wrapper">
                        <table>
                            <tr>
                                <th colspan="4">
                                    <h2>G-Day 반품/교환 안내</h2>
                                    <p>반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.</p>
                                </th>
                            </tr>
                            <tr>
                                <td>판매자 지정댁배사</td>
                                <td colspan="3">우체국택배</td>
    
                            </tr>
                            <tr>
                                <td>반품배송비</td>
                                <td>무료</td>
                                <td>교환배송비</td>
                                <td>무료</td>
                            </tr>
                            <tr>
                                <td>보내실 곳</td>
                                <td colspan="3">서울특별시 중구 신당동 어딘가</td>
                            </tr>
                            <tr>
                                <td>반품/교환 사유에 <br>따른요청 가능 시간</td>
                                <td colspan="3">구매자 단순 변심은 상품 수령 후 7일 이내</td>
                            </tr>
                            <tr>
                                <td>반품/교환 불가능 사유</td>
                                <td colspan="3">-</td>
                            </tr>
                            
                        </table>
                    </div>
                </div>

                <div class="review_wrapper">
                    <h1>상품 후기</h1>
                    <div class="bar">
                        <div class="info">
                            <span>별점</span>
                        </div>
                        <div class="progress_line"><span style="width: 70%;">3.5</span></div>
                    </div>
                  
                    <!-- 
                    <div class="review_editor">
                        <div class="write_form">
                            <form action="">
                                <textarea name="" id="" cols="30" rows="7"></textarea>
                                <img src="" alt="">
                                <input type="file">
                                <button type="button">입력</button>
                            </form>
                        </div>
                    </div>
 -->
                 
                    <div class="review">
                        <div class="item">
                            <div class="rank">
                                <span>별점 <span>5</span></span>
                            </div>
                            <div class="rev_content">
                                <img src="" alt="">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                </p>
                            </div>
                            <div class="writer">
                                <span>김누구</span>
                                <span>작성날짜</span>
                            </div>
                        </div>
                        <div class="item">
                            <div class="rank">
                                <span>별점 <span>5</span></span>
                            </div>
                            <div class="rev_content">
                                <img src="" alt="">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                </p>
                            </div>
                            <div class="writer">
                                <span>김누구</span>
                                <span>작성날짜</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div> 
    </section>
	
		<script type="text/javascript" src="${contextPath}/resources/js/fontawesome.js"></script>
    
    <script>
    var price = ${gclass.prdtPrice };
    function add(){
    	$(".amount").val( Number($(".amount").val()) + 1  );
    	$(".sum").text( Number($(".sum").text()) + price  );
    }
    
    function del(){
    	
    	if($(".amount").val() > 1 ){
	    	$(".amount").val( Number($(".amount").val()) - 1  );
	    	$(".sum").text( Number($(".sum").text()) - price  );
    	}
    }
    
    $(".amount").on("input", function(){
    	
    	if(isNaN(Number($(".amount").val())) ){ // 숫자 말고 다른 것 입력 시
    		$(".amount").val("");
    		$(".sum").text( price  );
    	}else{
    		$(".sum").text( Number($(".amount").val()) * price  );
    	}
    	
    	
    });
    /* var sell_price;
    var amount;
    var hm;
    
    $(function() {
    	init();
    })

  	
  	function init() {
  		sell_price = $(".sell_price").val();
  		amount = $(".amount").val();
  		$(".sum").val(sell_price);
  		change();
  	}
  	
  	function add() {
  		hm = amount;
  		sum = $(".sum").val();
  		hm.value++;

  		sum.val(parseInt(hm) * sell_price);
  	}

  	function del() {
  		hm = amount;
  		sum = $(".sum").val();
  			if (hm.value > 1) {
  				hm.value--;
  				sum.value = parseInt(hm.value) * sell_price;
  			}
  	}

  	function change() {
  		hm = amount;
  		sum = $(".sum").val();

  			if (hm.value < 0) {
  				hm.value = 0;
  			}
  		sum.value = parseInt(hm.value) * sell_price;  
  	}
     */
     
     
     /* ======================== 장바구니 버튼 클릭 시 ======================== */
     var loginFlag = ${loginFlag};

     $(".cart").on("click", function() {
    	 var prdtNo = ${gclass.prdtNo};
    	 var price = ${gclass.prdtPrice};
    	 var amount = $(".amount").val();
    	 var imgPath = $(".gift_img > img").attr("src");
    	 
    	 if(loginFlag == 1) {
    		 $.ajax({
   	    		url : "${contextPath}/cart/memberClassCart",
   	    		data : {"prdtNo" : prdtNo,
   	    				"price" : price,
   	    				"amount" : amount,
   	    				"imgPath" : imgPath},
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