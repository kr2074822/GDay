<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/modalBasic.css?ver=1.1">
    <link rel="stylesheet" href="${contextPath}/resources/css/review/reviewInsert.css?ver=1.0">

<!-- <a href="#" onclick="popUp(1, 'g')">후기 쓰기 선물</a>
<a href="#" onclick="popUp(1, 'c')">후기 쓰기 클래스</a> -->


<!-- 모달창1 : 등록 모달창 -->
<div class="modal-cover">
    <div class="cal-modal rv-modal" id="rvGift">
      <a class="modal-close"><i class="fas fa-times"></i></a>
      <div class="review-card">
      </div>
      <form id="review-form" enctype="multipart/form-data">
	      <div class="m-content-box">
	        <div class="input-star">
	            <i class="fas fa-star star-1" onclick="checkStar(1)"></i>
	            <i class="fas fa-star star-2" onclick="checkStar(2)"></i>
	            <i class="fas fa-star star-3" onclick="checkStar(3)"></i>
	            <i class="fas fa-star star-4" onclick="checkStar(4)"></i>
	            <i class="fas fa-star star-5" onclick="checkStar(5)"></i>
	            <input type="number" class="star-count review-hidden" name="rvStar">
	        </div>
	        <input type="number" class="review-hidden rvNo" name="rvNo"/>
	        <input type="number" class="review-hidden prdtNo" name="prdtNo"/>
	        <input type="number" class="review-hidden writerNo" name="writerNo"/>
	        
	        <div class="m-input-box">
	            <span class="input-title">후기를 작성해 주세요!</span>
	            <textarea name="rvContent" class="input-text" placeholder="10자 이상 150자 이내" maxlength="150"></textarea>
	        </div>
	        <div class="input-review-img">
	            <div class="review-hidden">
	                <input type="file" name="rvImage" class="rvImage" onchange="LoadProfile(this)">
	            </div>
	            <div class="btn-rv-img">사진 첨부하기</div>
	            <div class="rv-img-view">
	                <div class="img-del"><i class="fas fa-times"></i></div>
	            </div>
	        </div>
	      </div>
	      <div class="m-btn-box">
	        <button type="reset" class="modal-btn m-cancel-btns" id="m-cancel-btn">취소</button>    
	        <button type="button" class="modal-btn m-submit-btns" id="m-submit-btn">등록</button> <!-- ajax -->    
	      </div>
	  	</form>
    </div>
  </div>
  
  
  


<script type="text/javascript" src="${contextPath}/resources/js/jquery.form.min.js"></script>
<script>
function popUp(opNo, type){
    modalInputReset();
    
    var url = "";

    //ajax로 opNo에 맞는 상세 정보 가져오기
    if(type == "g") url = "${contextPath}/review/getOrderInfo/G/" +  opNo;
    else if(type == "c") url = "${contextPath}/review/getOrderInfo/C/" + opNo;

    //g == gift / c == class : g/c에 따라서 success에서 만드는 html이 달라지게 하기(콜백함수 쓰기)
    $.ajax({
        url : url,
        dataType : "json",
        success : function(map){	
        	if(map != null) {
	        	var order = map.order;
	        	var image = map.thumbnail;
	        	console.log(image);
	        	var rCard = $(".review-card");
	        	rCard.html("");//초기화

						/* var param = {"orderNo" : order.orderNo, "opNo" : order.opNo,
	        								"writerNo" : order.buyer, "prdtNo" : order.prdtNo,
	        								"prdtType" : order.prdtType } */
	        	
	        /* 	var submitUrl = "insertReview(" 
	        									+ order.opNo + ","
	        									+ order.buyer + ","
	        									+ order.prdtNo 
	        									+ ")"; */
	        	
	        	$(".rvNo").val(order.opNo);
	        	$(".prdtNo").val(order.prdtNo);
	        	$(".writerNo").val(order.buyer);
	        									
	        	//서밋버튼에 클릭이벤트 추가
	        	$("#m-submit-btn").attr("onclick", "insertReview()");
	        	
						var thumb = $("<div>").addClass("review-thumb")
											.css("background-image", "url(" + "${contextPath}" + image.filePath + "/" + image.fileName + ")");            	
        		var info = $("<div>").addClass("review-info")
		      
        		var prdtName = order.prdtName
        		if(prdtName.trim().length > 11){
        			prdtName = prdtName.substring(0, 10) + "…";
        		}
        		var name = $("<span>").addClass("review-name").text(prdtName);
	        	
        		//gift일때
	        	if(type == 'g') {
	            	var option = map.gOption;
	
	/*     		<div class="review-thumb">
	        	</div>
	        	<div class="review-info">
	        	    <span class="opNo review-hidden">21020423456</span> 상품 주문 번호
	        	    <span class="review-name">선물명</span><br>
	        	    <span class="review-text-1">2021.03.02.</span><br>
	        	    <span class="review-text-2">100,000원</span><br>
	        	    <span class="review-text-3">옵션 │ 빨강, 1개</span>
	        	</div> */
	            	
	        		var text1 = $("<span>").addClass("review-text-1").text(order.orderDate);
	        		
	        		var price = (order.prdtPrice * order.opAmount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	        		var text2 = $("<span>").addClass("review-text-2").text(price);
	        		
	        		var opt = "";
	        		if(option != null) opt = option.gOptName + " / ";
	        		opt += order.opAmount + "개";
	        		
	        		var text3 = $("<span>").addClass("review-text-3").text(opt);
	        		info.append(name).append(text1).append(text2).append(text3);
	        	}
	        	
	        	//class일때
	        	else if (type == 'c'){
	        		var gClass = map.gClass;
	        		
/* 	        <div class="review-thumb">
	        	</div>
	        	<div class="review-info">
	        	    <span class="opNo review-hidden">21020423456</span> 상품 주문 번호
	        	    <span class="review-name">클래스명</span><br>
	        	    <span class="review-text-1">임강사</span><br>
	        	    <span class="review-text-2">100,000원</span><br>
	        	    <span class="review-text-3">수업일 │ 2021.03.04.~2021.03.10.</span>
	        	</div> */
		        	var text1 = $("<span>").addClass("review-text-1").text(order.sellerName);
	        		
	        		var price = (order.prdtPrice * order.opAmount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	        		var text2 = $("<span>").addClass("review-text-2").text(price);
	        		
							var classDate = gClass.cStartDate + " ~ " + gClass.cEndDate;	        		
	        		var text3 = $("<span>").addClass("review-text-3").text(classDate);
	        	
	        		info.append(name).append(text1).append(text2).append(text3);
	        	}

        		rCard.append(thumb).append(info);//review-card에 추가
        	
        	} else {
        		swal.fire({icon : "error", title : "후기를 작성할 수 있는 주문 정보가 없습니다."});
        	}
        },
        error : function(){
        	console.log("후기 작성을 위한 정보 조회 중 오류 발생");
        }
    }) 

    $("#rvGift").parent().show();
}

/* 인풋 창 닫기/취소 */
function cancelInsert(str){
  var message;
    if(str == "cancel") {
	  message = "취소하면 작성한 내용이 삭제됩니다.<h3>취소하시겠습니까?</h3>";
  } else if(str == "x") {
	  message = "창을 닫으면 작성한 내용이 삭제됩니다.<h3>창을 닫으시겠습니까?</h3>";
  }

  //confirm 확인 후 진행
  swal.fire({icon:"warning", 
	  					html: message,
	  					showCancelButton: true,
	  					confirmButtonText: "창 닫기",
	  					confirmButtonColor: "#54b39E",
	  					cancelButtonText: "취소",
	  					cancelButtonColor: "#a9a9a9",
	  					reverseButtons: true//버튼 위치 바꾸기
	  					}).then((result) => {
	  						if(result.isConfirmed){
	  							$(".modal-cover").hide();
                                //모달 리셋  
                  modalInputReset();
	  						} 
	  					});
}

/* 별점 적용 */
function checkStar(starNo) {
    $(".input-star i").css("color", "lightgray");//별 리셋
    for(var i=0; i<starNo; i++){
        $(".star-" + (i+1)).css("color", "#ffe600");
    }
    $(".star-count").val(starNo);
    var test = $(".star-count").val();
    console.log(test);
}

// 프로필 에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
function LoadProfile(value, type) {
    // value.files : 파일이 업로드되어 있으면 true
    // value.files[0] : 여러 파일 중 첫번째 파일이 업로드 되어 있으면 true
    
    if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
        
        var reader = new FileReader();
        // 자바스크립트 FileReader
        // 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
        // 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
        // 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체

        reader.readAsDataURL(value.files[0]);
        // FileReader.readAsDataURL()
        // 지정된의 내용을 읽기 시작합니다. 
        // Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.	

        reader.onload = function(e){
        // FileReader.onload
        // load 이벤트의 핸들러. 
        // 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.	
				
        // 읽어들인 내용(이미지 파일)을 화면에 출력
        $(".rv-img-view").css("background-image", "url("+e.target.result+")");
        // e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
        
        $(".btn-rv-img").hide();//사진 첨부 버튼 숨기기
        
        $(".rv-img-view").show();//img 보이게 하기
        }
    }
}

//모달창 리셋
function modalInputReset(){
    $(".btn-rv-img").show();//첨부 버튼
    $(".rv-img-view").css("background-image", "").hide();
    $(".rvImage").val("");//파일input
    $(".input-star i").css("color", "lightgray");//별
    $(".input-text").val("");
    /* $(".review-card").html(""); */ /* html 삭제 */
}

//후기 삽입
function insertReview(){
		
		//유효성 검사
		var flag = false;
		var rvStar = $("input[name='rvStar']").val();
		var rvContent = $("textarea[name='rvContent']").val();
		
		if(rvStar.length == 0) {
			flag = false;
			swal.fire({icon:"warning", html:"<h2>별을 클릭해</h2><h2>별점을 매겨주세요!</h2>"});
			return false;
		} else {
			flag = true;
		}
		if(rvContent.trim().length < 10){
			flag = false;
			swal.fire({icon:"warning", html:"<h2>후기를 10자 이상</h2><h2>작성해주세요.</h2>"});
			return false;
		} else {
			flag = true;
		}
	
		if(flag){
	    /* ajax로 파일과 텍스트를 같이 보낼 수 있는 jquery.form.min.js 사용 */
	    $("#review-form").ajaxForm({
	    	url : "${contextPath}/review/insertReview",
	    	type : "post",
				enctype : "multipart/form-data",
				success : function(result) {
					if(result > 0) {
						$(".modal-cover").hide();//모달창 닫기
						loadNewPage();//새로 리스트 고침 or view 화면 새로 고침
	
					} else {
						swal.fire({icon:"error", title:"후기 등록 실패"});
					}
				},
				error : function(){
					console.log("후기 등록 과정에서 오류");
				}
	    });
	    $("#review-form").submit();
		}
}

//유효성 검사
function insertValidate(){
	var rvStar = $("input[name='rvStar']").val();
	var rvContent = $("textarea[name='rvContent']").val();
	
	if(rvStar.length == 0) {
		swal.fire({icon:"warning", html:"<h2>별을 클릭해</h2><h2>별점을 매겨주세요!</h2>"});
		return false;
	}
	if(rvContent.trim().length < 10){
		swal.fire({icon:"warning", html:"<h2>후기를 10자 이상</h2><h2>작성해주세요.</h2>"})
		return false;
	}
}



$(function(){
    //창닫기 버튼(x)
    $("#rvGift .modal-close").children().on("click", function(){
        cancelInsert("x")
    });

    //입력 모달창 취소 버튼
    $("#rvGift .m-cancel-btns").on("click", function(){
        cancelInsert("cancel");
    });

    //사진 첨부 파일 버튼 클릭
    $(".btn-rv-img").on("click", function(){
        $(this).prev().children().click();//파일 input
       /*  $(this).next().show(); */
    });

    //사진 삭제
    $(".img-del").on("click", function(){
        $(this).parent().css("background-image", "");
        $(this).parent().hide();
        $(this).parent().eq(0).children().val("");//파일 ㅑㅞㅕㅅ
        $(this).parent().prev().show();
    });

});//ready함수 끝

</script>
