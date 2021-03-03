<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/modalBasic.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/review/reviewInsert.css">

<!-- <a href="#" onclick="popUp(1, 'g')">후기 쓰기 선물</a>
<a href="#" onclick="popUp(1, 'c')">후기 쓰기 클래스</a> -->


<!-- 모달창1 : 등록 모달창 -->
<div class="modal-cover">
    <div class="cal-modal rv-modal" id="rvGift">
      <a class="modal-close"><i class="fas fa-times"></i></a>
      <div class="review-card">
        <div class="review-thumb">
        </div>
        <div class="review-info">
            <span class="opNo review-hidden">21020423456</span> <!-- 상품 주문 번호 -->
            <span class="review-name">클래스명</span><br>
            <span class="review-text-1">임강사</span><br>
            <span class="review-text-2">100,000원</span><br>
            <span class="review-text-3">수업일 │ 2021.03.04.~2021.03.10.</span>
        </div>
      </div>
      <div class="m-content-box">
        <div class="input-star">
            <i class="fas fa-star star-1" onclick="checkStar(1)"></i>
            <i class="fas fa-star star-2" onclick="checkStar(2)"></i>
            <i class="fas fa-star star-3" onclick="checkStar(3)"></i>
            <i class="fas fa-star star-4" onclick="checkStar(4)"></i>
            <i class="fas fa-star star-5" onclick="checkStar(5)"></i>
            <input type="number" class="star-count review-hidden" name="rvStar">
        </div>
        <div class="m-input-box">
            <span class="input-title">후기를 작성해 주세요!</span>
            <textarea name="rvContent" class="input-text" placeholder="150자 이내" maxlength="150"></textarea>
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
        <button type="button" class="modal-btn m-submit-btns" id="m-submit-btn" onclick="insertReview();">등록</button> <!-- ajax -->    
      </div>
    </div>
  </div>

<!-- 
<div class="review-thumb">
    <img src="#">
</div>
<div class="review-info">
    <span class="opNo review-hidden">21020423456</span> 상품 주문 번호
    <span class="review-name">선물명</span><br>
    <span class="review-text-1">2021.03.02.</span><br>
    <span class="review-text-2">100,000원</span><br>
    <span class="review-text-3">옵션 │ 빨강, 1개</span>
</div>

<div class="review-thumb">
    <img src="#">
</div>
<div class="review-info">
    <span class="opNo review-hidden">21020423456</span> 상품 주문 번호
    <span class="review-name">클래스명</span><br>
    <span class="review-text-1">임강사</span><br>
    <span class="review-text-2">100,000원</span><br>
    <span class="review-text-3">수업일 │ 2021.03.04.~2021.03.10.</span>
</div>
 -->

<script>


function popUp(opNo, type){
    modalInputReset();
    
    var url;

    //ajax로 opNo에 맞는 상세 정보 가져오기
    if(type == "g") url = "${contextPath}/review/insertReview/G/" +  opNo;
    else if(type == "c") url = "${contextPath}/review/insertReview/C/" + opNo;

    //g == gift / c == class : g/c에 따라서 success에서 만드는 html이 달라지게 하기(콜백함수 쓰기)
/*     $.ajax({
        url : url,
        dataType : "json"
    }) */

    $(".modal-cover").show();
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



$(function(){
    //창닫기 버튼(x)
    $(".modal-close").children().on("click", function(){
        cancelInsert("x")
    });

    //입력 모달창 취소 버튼
    $(".m-cancel-btns").on("click", function(){
        cancelInsert("cancel");
    });

    //사진 첨부 파일 버튼 클릭
    $(".btn-rv-img").on("click", function(){
        $(this).prev().children().click();//파일 input
        $(this).hide();
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
