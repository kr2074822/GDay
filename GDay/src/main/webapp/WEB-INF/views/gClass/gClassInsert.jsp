<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 등록 신청</title>
<script src="https://kit.fontawesome.com/955b087c12.js" crossorigin="anonymous"></script>
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=930f7a74b0fd1bdc17d81c3d8fb76bf4&libraries=services"></script>

<!-- datepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">


<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/gClass/gClassReview.css">
<link rel ="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
<!--     Bootstrap core JS
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 -->
<style>

/* number 태그 화살표 제거 */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.wrapper {
   width: 80%;
   margin: 0 auto;
}

.box {
   background: rgba(0, 0, 0, .07);
   width: 100%;
   height: 15%;
   padding: 20px;
   margin-top: 20px;
   margin-bottom: 20px;
}

.box h1 {
   font-size: 1.2em;
   font-weight: bold;
   padding: 7px;
}

.box ul {
	display: flex;
	justify-content: start;
	align-content: center;
}

.box ul li {
	margin-bottom: 10px;
}


.box .item {
	color: gray;
	border: 1px solid gray;
	border-radius: 40px;
	padding-right: 8px;
	padding-left: 8px;
	margin: 5px;
	line-height: 30px;	
	margin-bottom: 20px;
	cursor: pointer;
}

.box input[type="checkbox"] {
	display: none;
}

.box input[type="checkbox"]:checked + label {
	transition: 0.3s ease-out;
  background: #fe929f;
  color:white;
  border: 1px solid lightgray;
}

/* 수강인원/세션수/개강일 등 기입 */
.extraInput {
	margin-top: 30px;
	display: flex;
	justify-content: space-between;

}

.extraInput .optRow input {
	width: 100px;
	vertical-align: middle;
	margin-left: 7px;
}

.extraInput .optRow input[type="date"] {
	width: 150px;
}

/* 신청 제목, 내용 작성 */
.boardRow {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.boardRow img {
	margin-top:30px;
	margin-bottom:20px;
	display: inline-block;
}

#title {
	height: 35px;
	width: 82%;
	border: 1px solid #c9c9c9;
	border-radius: 5px;
}

/* 등록, 취소 버튼 */
.btnArea {
	display: flex;
	justify-content: center;
	margin-bottom: 100px;
}

#submitBtn {
	margin-top: 20px;
	margin-right: 10px;
	background: #fe929f;
	border-radius: 5px;
	border-style: none;
	color: white;
	width: 55px;
	height: 2em;
}

#resetBtn {
	margin-top: 20px;
	background: gray;
	border-radius: 5px;
	border-style: none;
	color: white;
	width: 55px;
	height: 2em;
	
}

/* 주소 입력 */
.address {
	margin-right: 20px;
	height: 25px;
	border-radius: 5px;
	border: 1px solid #c9c9c9;
}

#sample5_address {
	width: 48%;
}

#searchBtn {
	border-style: none;
	background: #fe929f;
	color: white;
}

</style>
</head>

<body>
<jsp:include page="../common/header.jsp"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>

<form action="insertClass" method="post" enctype="multipart/form-data" role="form" onsubmit="return validate();">
<div class="wrapper">
   <div class="box">
   		<h1>연령대</h1>
      <ul data-text="0">
				<li class="tag">
            <input type="checkbox" name="hashNo" value="1" id="aa">
            <label for="aa" class="item">영유아</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="2" class="item" id="an">
            <label for="an" class="item">어린이</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="3" id="ac">
            <label for="ac" class="item">청소년</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="4" id="ad">
            <label for="ad" class="item">청년</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="5" id="ae">
            <label for="ae" class="item">중년</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="6" id="af">
            <label for="af" class="item">장년</label>
        </li>
    </ul>
 		<h1>가격대</h1>
    <ul class="tagBx" data-text="1">
        <li class="tag">
            <input type="checkbox" name="hashNo" value="7" id="ba">
            <label for="ba" class="item">1만원 미만</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="8" id="bb">
            <label for="bb" class="item">2~3만원대</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="9" id="bc">
            <label for="bc" class="item">3~4만원대</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="10" id="bd">
            <label for="bd" class="item">5~8만원대</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="11" id="be">
            <label for="be" class="item">9~10만원대</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="12" id="bf">
            <label for="bf" class="item">11만원 이상</label>
        </li>
    </ul>
    <h1>취향별</h1>
    <ul class="tagBx" data-text="2">
        <li class="tag">
            <input type="checkbox" name="hashNo" value="13" id="ca">
            <label for="ca" class="item">사랑스러운</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="14" id="cb">
            <label for="cb" class="item">모던한</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="15" id="cc">
            <label for="cc" class="item">독특한</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="16" id="cd">
            <label for="cd" class="item">캐쥬얼</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="17" id="ce">
            <label for="ce" class="item">실용적인</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="18" id="cf">
            <label for="cf" class="item">럭셔리</label>
        </li>
    </ul>
    <h1>관계별</h1>
    <ul class="tagBx" data-text="3">
        <li class="tag">
            <input type="checkbox" name="hashNo" value="19" id="da">
            <label for="da" class="item">애인</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="20" id="db">
            <label for="db" class="item">부모님</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="21" id="dc">
            <label for="dc" class="item">형제ㆍ자매</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="22" id="dd">
            <label for="dd" class="item">친구ㆍ동료</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="23" id="de">
            <label for="de" class="item">선생님ㆍ상사</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="24" id="df">
            <label for="df" class="item">기타</label>
        </li>
    </ul>
    <h1>기념일</h1>
    <ul class="tagBx" data-text="4">
        <li class="tag">
            <input type="checkbox" name="hashNo" value="25" id="ea">
            <label for="ea" class="item">생일</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="26" id="eb">
            <label for="eb" class="item">커플기념일</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="27" id="ec">
            <label for="ec" class="item">입학ㆍ졸업ㆍ합격</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="28" id="ed">
            <label for="ed" class="item">결혼</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="29" id="ee">
            <label for="ee" class="item">출산</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="30" id="ef">
            <label for="ef" class="item">어버이날</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="31" id="eg">
            <label for="eg" class="item">스승의날</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="32" id="eh">
            <label for="eh" class="item">입사ㆍ승진</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="33" id="eh">
            <label for="eh" class="item">퇴사</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="34" id="eh">
            <label for="eh" class="item">명절</label>
        </li>
    </ul>
    <h1>계절별</h1>
    <ul class="tagBx" data-text="5">
        <li class="tag">
            <input type="checkbox" name="hashNo" value="35" id="fa">
            <label for="fa" class="item">봄</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="36" id="fb">
            <label for="fb" class="item">여름</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="37" id="fc">
            <label for="fc" class="item">가을</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="38" id="fd">
            <label for="fd" class="item">겨울</label>
        </li>
    </ul>
    <h1>색상별</h1>
    <ul class="tagBx" data-text="6">
        <li class="tag">
            <input type="checkbox" name="hashNo" value="39" id="ga">
            <label for="ga" class="item">Red</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="40" id="gb">
            <label for="gb" class="item">Orange</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="41" id="gc">
            <label for="gc" class="item">Yellow</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="42" id="gd">
            <label for="gd" class="item">Green</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="43" id="ge">
            <label for="ge" class="item">Blue</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="44" id="gf">
            <label for="gf" class="item">Navy</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="45" id="gg">
            <label for="gg" class="item">Purple</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="46" id="gg">
            <label for="gg" class="item">Pink</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="47" id="gh">
            <label for="gh" class="item">White</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="48" id="gi">
            <label for="gi" class="item">Black</label>
        </li>
    </ul>
    <h1>종류별</h1>
    <ul class="tagBx" data-text="7">
        <li class="tag">
            <input type="checkbox" name="hashNo" value="49" id="ha">
            <label for="ha" class="item">디자인문구</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="50" id="hb">
            <label for="hb" class="item">전자기기</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="51" id="hc">
            <label for="hc" class="item">여행ㆍ레포츠</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="52" id="hd">
            <label for="hd" class="item">디자인가전</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="53" id="he">
            <label for="he" class="item">인테리어ㆍ수납</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="54" id="hf">
            <label for="hf" class="item">패브릭ㆍ생활</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="55" id="hg">
            <label for="hg" class="item">키친ㆍ푸드</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="56" id="hh">
            <label for="hh" class="item">패션의류</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="57" id="hi">
            <label for="hi" class="item">패션잡화ㆍ주얼리</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="58" id="hj">
            <label for="hj" class="item">화장품</label>
        </li>
        <li class="tag">
            <input type="checkbox" name="hashNo" value="59" id="hk">
            <label for="hk" class="item">기타</label>
        </li>
    </ul>
      
      
      <div class="extraInput">
      	<span class="optRow">수강료
      		<input type="number" id="prdtPrice" name="prdtPrice" placeholder="50000" autocomplete=off>
      	</span>
      	<span class="optRow">정원 수
      		<input type="number" id="cCount" name="cCount" placeholder="15" autocomplete=off>
      	</span>
      	<span class="optRow">세션 수
      		<input type="number" id="cSession" name="cSession" placeholder="8" autocomplete=off>
      	</span>
      	<span class="optRow">개강일
      		<input type="text" id="cStartDate" name="cStartDate" autocomplete=off>
      	</span>
      	<span class="optRow">종강일
      		<input type="text" id="cEndDate" name="cEndDate" autocomplete=off>
      	</span>
      	<span class="optRow">수업일/시간
      		<input type="text" id="cDate" name="cDate" style="width:150px;" placeholder="금/토요일 18:00" autocomplete=off>
      	</span>
      </div>
     </div>
   
			<div class="boardRow">
			<!-- 썸네일 -->
				<div class="boardImg" id="titleImgArea">
						<img id="titleImg" src="${contextPath}/resources/images/thumb.png" width="250" height="105">
				</div>
				<img id="thumbInfo" style="margin-left:20px;" src="${contextPath}/resources/images/inputThumb.png">
			</div>
			<div class="boardRow">
				<input type="text" id="title" name="prdtName" placeholder="클래스명" autocomplete=off>
			</div> 
			<div class="boardRow">
				<div id="fileArea">
					<input type="file" id="img0" name="images" onchange="LoadImg(this,0)"> 
				</div>
			</div>
			<div class="boardRow">
				<textarea class="form-control" id="summernote" name="prdtContent"
					rows="10" style="resize: none;"></textarea>
			</div>
			
			<!-- 카카오 맵 API -->
			<div class="boardRow" style="margin-bottom: 0px;">
				<input type="text" class="address" id="sample5_address" name="cLocal" placeholder="클래스가 진행될 장소를 필수로 입력해주세요." autocomplete=off readonly>
				<input type="button" class="address" id="searchBtn" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map" style="width:300px;height:200px;visibility:hidden"></div>
			</div>
		
		<div class="btnArea">
			<button type="submit" id="submitBtn">등록</button>
			<button type="reset" id="resetBtn">취소</button>
		</div>	
	</div>	
	</form>
	
	<jsp:include page="../common/footer.jsp"/>
	
	
	<script>

	function validate() {
		if($("input:checkbox[name='hashNo']:checked").length == 0) {
			alert("더 정확한 검색을 위해 해시태그를 하나 이상 골라 주세요!");
			return false;
		}
		
		if ($("#title").val().trim().length == 0) {
			alert("강사님, 클래스명을 적어 주세요!");
			$("#title").focus();
			return false;
		}
	
		if ($("#summernote").val().trim().length == 0) {
			alert("강사님, 클래스 설명을 적어주세요!");
			$("#summernote").focus();
			return false;
		}
		
		if ($("#sample5_address").val().trim().length == 0) {
			alert("강사님, 강의 장소를 알려주세요!");
			return false;
		}
		
		if ($("#prdtPrice").val().trim().length == 0) {
			alert("강사님, 클래스 수강료를 알려주세요!");
			$(".prdtPrice").focus();
			return false;
		}
		
		if ($("#cCount").val().trim().length == 0) {
			alert("강사님, 클래스 정원을 알려주세요!");
			$(".cCount").focus();
			return false;
		}
		
		if ($("#cSession").val().trim().length == 0) {
			alert("강사님, 클래스 횟수를 알려주세요!");
			$(".cSession").focus();
			return false;
		}
		
		if ($("#cStartDate").val().trim().length == 0) {
			alert("강사님, 클래스 시작일을 알려주세요!");
			$(".cStartDate").focus();
			return false;
		}
		
		if ($("#cEndDate").val().trim().length == 0) {
			alert("강사님, 클래스 종료일 알려주세요!");
			$(".cEndDate").focus();
			return false;
		}
		
		if ($("#cDate").val().trim().length == 0) {
			alert("강사님, 클래스 수업일과 시간을 알려주세요!");
			$(".cDate").focus();
			return false;
		}
	}
	
	//오늘 날짜 이전은 선택하지 못하게 / 종료일이 시작일보다 앞서지 못하게 하는 함수
	$(function() {
		$("#cStartDate").datepicker({ 
			format: "yyyy-mm-dd",
			language: "kr",
			startDate: new Date(),
			todayHighlight: true,
			
			autoclose: true }).on('changeDate', function(selected) {
				var startDate = new Date(selected.date.valueOf());
				$('#cEndDate').datepicker('setStartDate', startDate);
			}).on('clearDate', function(selected) {
				$('#cEndDate').datepicker('setStartDate', null);
			});
		});

	
	$(function() {
		$("#cEndDate").datepicker({ 
			format: "yyyy-mm-dd",
			language: "kr",
			todayHighlight: true,
			autoclose: true }).on('changeDate', function(selected) {
				var endDate = new Date(selected.date.valueOf());
				$('#cStartDate').datepicker('setEndDate', endDate);
			}).on('clearDate', function(selected) {
				$('#cStartDate').datepicker('setEndDate', null);
			});
		});

	
	
	  // 썸네일을 보여주는 함수
	  function LoadImg(value, num) {
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
					
					$(".boardImg").eq(num).children("img").attr("src", e.target.result);
					// e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
					
    	}
		}
	}

	// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	$(function(){
		$("#fileArea").hide(); // #fileArea 요소를 숨김.		
		
		$(".boardImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
			
			// 클릭한 이미지 영역 인덱스 얻어오기
			var index = $(".boardImg").index(this);
					// -> 클릭된 요소가 .boardImg 중 몇번째 인덱스인지 반환
					
			//console.log(index);
			
			// 클릭된 영역 인덱스에 맞는 input file 태그 클릭
			$("#img" + index).click();
		});
		
	});
	
	/* 카카오 주소 API */
 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
	
					geocoder.addressSearch(data.address, function(results, status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.visibility = "visible";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>
</body>
</html>