<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:include page="../common/header.jsp"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/gift/giftInsert.css">
    <!-- summernote 사용 시 필요한 css 파일 추가 -->
    <link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

    <title>Document</title>
</head>
<body>
    <header></header>
    
    <!-- summernote 사용 시 필요한 js 파일 추가 -->
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>

    <section class="mgz_wrapper">
        <h1>선물 등록 신청</h1>
        <form action="${contextPath}/gift/insert" method="post" enctype="multipart/form-data" role="form" onsubmit="return validate();">
            <div class="wrapper">
                <div class="check_wrapper">
                    <span class="opt_name">연령대</span>
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
					<span class="opt_name">가격대</span>
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
					<span class="opt_name">취향별</span>
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
					<span class="opt_name">관계별</span>
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
				    <span class="opt_name">기념일</span>
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
				    <span class="opt_name">계절별</span>
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
				    <span class="opt_name">색상별</span>
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
				    <span class="opt_name">종류별</span>
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
                    <span class="opt_name">옵션</span>
                    <ul class="tagBx" data-text="7">
                        <li class="tag">
                            <label for="ha" class="item">옵션1</label>
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                        </li>
                        <li class="tag">
                            <label for="he" class="item">옵션2</label>
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                        </li>
                        <li class="tag">
                            <label for="he" class="item" >가격</label>
                            <input type="text" name="prdtPrice">
                        </li>
                    </ul>
                </div>
                  
                <div class="gift_title">
                    <input type="text" placeholder="선물명을 입력해주세요" name="prdtName">
                    <div class="thumbnail">
                    <div class="boardRow">
						<div id="fileArea">
							<input type="file" id="img0" name="images" onchange="LoadImg(this,0)"> 
						</div>
					</div>
                        <h1>썸네일 </h1>
                        <div class="showImg boardImg">
                            <img>
                        </div>
                    </div>
                </div>
                <div class="editor">
                    <textarea class="form-control" id="summernote" name="prdtContent" rows="10" style="resize: none;"></textarea>
                </div>
                <div class="buttons">
                    <button type="submit" class="submit">등록</button>	
                    <button class="cancel">취소</button>	
                </div>
            </div>
        </form>
    </section>

    <script>
        const opt_name = document.getElementsByClassName("opt_name");
        console.log(opt_name);
        $(".opt_name").on('click', function(){
            console.log($(this).next());

            if($(this).next().css('display') == 'none'){

                $(this).siblings('ul').slideUp();
                // .siblings('p.contents')
                // : 클릭된 div 태그의 형제 요소 중
                // p태그 이면서 class가 contents인 요소를 선택

                $(this).next().slideDown().css("display", "flex");
                // $(this) : 클릭된 div 태그
                // .next() : 클릭된 div 다음에 존재하는 요소 (p)
                // .css('display') : p태그의 style 중 display 속성 값을 얻어옴
                }else{
                $(this).next().slideUp().css("display", "flex");
            }
        })
        
        
        
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
        
        $(document).ready(function(){
            $("#content").summernote({
               width : 1000,
               height : 600,
               lang : 'ko-KR',

              //이미지 업로드 이벤트가 발생 시 콜백 함수 수행
              callbacks : {
                 onImageUpload : function(files){
                    //files : 업로드된 이미지가 배열로 저장됨
                    //editor == this : 이미지가 업로드된 섬머노트 에디터
                    sendFile(files[0], this); //업로드 진행 함수
                 }
              }
            });
        });
    </script>
</body>
</html>