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
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/gClass/gClassReview.css">
<link rel ="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
<!--     Bootstrap core JS
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 -->
<style>

.wrapper {
   width: 80%;
   margin: 0 auto;
}

.box {
   background-color: lightgray;
   width: 100%;
   height: 15%;
   margin-top: 20px;
   margin-bottom: 20px;
}

.box .optRow {
   font-size: 1.2em;
   font-weight: bold;
   padding: 7px;
}

.box .optRow .checkBx {
	font-size: 0.9em;
	font-weight: lighter;
}

.box .optRow .checkBx .item {
	color: gray;
	border: 1px solid gray;
	border-radius: 40px;
	padding-right: 5px;
	padding-left: 3px;
	margin: 1px;
	margin-bottom: 20px;
	cursor: pointer;
}

.box .optRow .checkBx input[type="checkbox"] {
	display: none;
}

.box .optRow .checkBx input[type="checkbox"]:checked + label {
	transition: 0.3s ease-out;
  background: #fe929f;
  color:white;
}

/* 수강인원/세션수/개강일 등 기입 */
.extraInput .optRow input {
	margin-top: 5px;
	margin-bottom: 10px;
	width: 100px;
	vertical-align: middle;
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

</style>
</head>

<body>
<jsp:include page="../common/header.jsp"/>

<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>

<form action="requestAction" method="post" enctype="multipart/form-data" role="form" onsubmit="return validate();">
<div class="wrapper">
   <div class="box">
      <div class="optRow">연령대
      	<span class="checkBx">
      		<input type="checkbox" id="baby">
          <label class="item" for="baby">영유아</label>
          <input type="checkbox" id="child">
          <label class="item" for="child">어린이</label>
          <input type="checkbox" id="teenager">
          <label class="item" for="teenager">청소년</label>
          <input type="checkbox" id="adult">
          <label class="item" for="adult">청년</label>
          <input type="checkbox" id="midage">
          <label class="item" for="midage">중년</label>
          <input type="checkbox" id="oldage">
          <label class="item" for="oldage">장년</label>
         </span>
      </div>
      <div class="optRow">가격대
      	<span class="checkBx">
					<input type="checkbox" id="under_one">
          <label class="item" for="under_one">1만원 미만</label>
          <input type="checkbox" id="one_two">
          <label class="item" for="one_two">2~3만원대</label>
          <input type="checkbox" id="three_for">
          <label class="item" for="three_for">3~4만원대</label>
          <input type="checkbox" id="five_eight">
          <label class="item" for="five_eight">5~8만원대</label>
          <input type="checkbox" id="nine_ten">
          <label class="item" for="nine_ten">9~10만원대</label>
          <input type="checkbox" id="over_ten">
          <label class="item" for="over_ten">10만원 이상</label>
         </span>
      </div>
      <div class="optRow">취향별
      	<span class="checkBx">
					<input type="checkbox" id="lovely">
          <label class="item" for="lovely">사랑스러운</label>
          <input type="checkbox" id="modern">
          <label class="item" for="modern">모던한</label>
          <input type="checkbox" id="special">
          <label class="item" for="special">독특한</label>
          <input type="checkbox" id="casual">
          <label class="item" for="casual">캐쥬얼</label>
          <input type="checkbox" id="useful">
         	<label class="item" for="useful">실용적인</label>
          <input type="checkbox" id="luxury">
          <label class="item" for="luxury">럭셔리</label>      	
      	</span>
      </div>
      <div class="optRow">관계별
      	<span class="checkBx">
      		<input type="checkbox" id="honey">
           <label class="item" for="honey">애인</label>
           <input type="checkbox" id="parents">
           <label class="item" for="parents">부모님</label>
           <input type="checkbox" id="sibling">
           <label class="item" for="sibling">형제ㆍ자매</label>
           <input type="checkbox" id="friend">
           <label class="item" for="friend">친구ㆍ동료</label>
           <input type="checkbox" id="teacher">
           <label class="item" for="teacher">선생님ㆍ상사</label>
           <input type="checkbox" id="relEtc">
           <label class="item" for="relEtc">기타</label>
      	</span>
      </div>
      <div class="optRow">기념일
      	<span class="checkBx">
         <input type="checkbox" id="bday">
         <label class="item" for="bday">생일</label>
         <input type="checkbox" id="couple_day">
         <label class="item" for="couple_day">커플기념일</label>
         <input type="checkbox" id="school_day">
         <label class="item" for="school_day">입학ㆍ졸업ㆍ합격</label>
         <input type="checkbox" id="marriage">
         <label class="item" for="marriage">결혼</label>
         <input type="checkbox" id="childbirth">
         <label class="item" for="childbirth">출산</label>
         <input type="checkbox" id="parent">
         <label class="item" for="parent">어버이날</label>
         <input type="checkbox" id="teacherDay">
         <label class="item" for="teacherDay">스승의날</label>
         <input type="checkbox" id="hire">
         <label class="item" for="hire">입사ㆍ승진</label>
      	</span>
      </div>
      <div class="optRow">계절별
      	<span class="checkBx">
      	 <input type="checkbox" id="spring">
         <label class="item" for="spring">봄</label>
         <input type="checkbox" id="summer">
         <label class="item" for="summer">여름</label>
         <input type="checkbox" id="fall">
         <label class="item" for="fall">가을</label>
         <input type="checkbox" id="winter">
         <label class="item" for="winter">겨울</label>
      	</span>
      </div>
      <div class="optRow">색상별
      	<span class="checkBx">
      		<input type="checkbox" id="red">
          <label class="item" for="red">Red</label>
          <input type="checkbox" id="orange">
          <label class="item" for="orange">Orange</label>
          <input type="checkbox" id="yellow">
          <label class="item" for="yellow">Yellow</label>
          <input type="checkbox" id="green">
          <label class="item" for="green">Green</label>
          <input type="checkbox" id="blue">
          <label class="item" for="blue">Blue</label>
					<input type="checkbox" id="navy">
          <label class="item" for="navy">Navy</label>
          <input type="checkbox" id="purple">
          <label class="item" for="purple">Purple</label>
          <input type="checkbox" id="white">
          <label class="item" for="white">White</label>
          <input type="checkbox" id="black">
          <label class="item" for="black">Black</label>
      	</span>
      </div>
      <div class="optRow">종류별
      	<span class="checkBx">
      		<input type="checkbox" id="stationery">
           <label class="item" for="stationery">디자인문구</label>
           <input type="checkbox" id="elec_equip">
           <label class="item" for="elec_equip">전자기기</label>
           <input type="checkbox" id="leports">
           <label class="item" for="leports">여행ㆍ레포츠</label>
           <input type="checkbox" id="house_design">
           <label class="item" for="house_design">디자인가전</label>
           <input type="checkbox" id="interior">
           <label class="item" for="interior">인테리어ㆍ수납</label>
           <input type="checkbox" id="life">
           <label class="item" for="life">패브릭ㆍ생활</label>
           <input type="checkbox" id="food">
           <label class="item" for="food">키친ㆍ푸드</label>
           <input type="checkbox" id="fashion">
           <label class="item" for="fashion">의류</label>
           <input type="checkbox" id="fash_goods">
           <label class="item" for="fash_goods">패션잡화ㆍ주얼리</label>
           <input type="checkbox" id="makeup">
           <label class="item" for="makeup">화장품</label>
					 <input type="checkbox" id="etc">
           <label class="item" for="etc">기타</label>
         </span>
      </div>
      <div class="extraInput">
      	<span class="optRow">최대 수강 인원
      		<input type="number" placeholder="15">
      	</span>
      	<span class="optRow">세션 수
      		<input type="number" placeholder="8">
      	</span>
      	<span class="optRow">개강일
      		<input type="date">
      	</span>
      	<span class="optRow">종강일
      		<input type="date">
      	</span>
      	<span class="optRow">수업일/시간
      		<input type="text" placeholder="금/토요일 18:00">
      	</span>
      </div>
   </div>
			<div class="boardRow">
				<div class="boardImg" id="titleImgArea">
						<img id="titleImg" src="${contextPath}/resources/images/thumb.png" width="200" height="100">
						<img src="${contextPath}/resources/images/inputThumb.png">
					</div>
			</div>
			<div class="boardRow">
				<input type="text" id="title" name="classTitle" placeholder="클래스명">
			</div> 
			<div class="boardRow">
				<div id="fileArea">
					<input type="file" id="img0" name="images" onchange="LoadImg(this,0)"> 
				</div>
			</div>
			<div class="boardRow">
				<textarea class="form-control" id="summernote" name="boardContent"
					rows="10" style="resize: none;"></textarea>
			</div>
		<div class="btnArea">
			<button type="submit" id="submitBtn">등록</button>
			<button type="reset" id="resetBtn">취소</button>
		</div>
	</div>
		

		
	</form>
	
	<script>

	function validate() {
		if ($("#title").val().trim().length == 0) {
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return false;
		}
	
		if ($("#content").val().trim().length == 0) {
			alert("내용을 입력해 주세요.");
			$("#content").focus();
			return false;
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
	 

</script>
</body>
</html>