<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../common/header.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

	<!-- reset.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    
    <!-- giftInsert.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/gift/giftInsert.css">
    
    <!-- summernote.css -->
    <link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

    <title>Document</title>
</head>
<body>
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>

    <section class="mgz_wrapper">
        <h1>선물 등록 신청</h1>
        <form action="insert" method="post" enctype="multipart/form-data" role="form" onsubmit="return validate();">
            <div class="wrapper">
                <div class="check_wrapper">
                    <span class="opt_name">연령대</span>
                    <ul class="tagBx" data-text="0">
                        <li class="tag">
                            <input type="checkbox" name="" id="aa">
                            <label for="aa" class="item">영유아</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" class="item" id="an">
                            <label for="an" class="item">어린이</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ac">
                            <label for="ac" class="item">청소년</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ad">
                            <label for="ad" class="item">청년</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ae">
                            <label for="ae" class="item">중년</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="af">
                            <label for="af" class="item">장년</label>
                        </li>
                    </ul>
                    <span class="opt_name">가격대</span>
                    <ul class="tagBx" data-text="1">
                        <li class="tag">
                            <input type="checkbox" id="ba">
                            <label for="ba" class="item">1만원 미만</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="bb">
                            <label for="bb" class="item">2~3만원대</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="bc">
                            <label for="bc" class="item">3~4만원대</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="bd">
                            <label for="bd" class="item">5~8만원대</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="be">
                            <label for="be" class="item">9~10만원대</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="bf">
                            <label for="bf" class="item">11만원 이상</label>
                        </li>
                    </ul>
                    <span class="opt_name">취향별</span>
                    <ul class="tagBx" data-text="2">
                        <li class="tag">
                            <input type="checkbox" id="ca">
                            <label for="ca" class="item">사랑스러운</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="cb">
                            <label for="cb" class="item">모던한</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="cc">
                            <label for="cc" class="item">독특한</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="cd">
                            <label for="cd" class="item">캐쥬얼</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ce">
                            <label for="ce" class="item">실용적인</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="cf">
                            <label for="cf" class="item">럭셔리</label>
                        </li>
                    </ul>
                    <span class="opt_name">관계별</span>
                    <ul class="tagBx" data-text="3">
                        <li class="tag">
                            <input type="checkbox" id="da">
                            <label for="da" class="item">애인</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="db">
                            <label for="db" class="item">부모님</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="dc">
                            <label for="dc" class="item">형제ㆍ자매</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="dd">
                            <label for="dd" class="item">친구ㆍ동료</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="de">
                            <label for="de" class="item">선생님ㆍ상사</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="df">
                            <label for="df" class="item">기타</label>
                        </li>
                    </ul>
                    <span class="opt_name">기념일</span>
                    <ul class="tagBx" data-text="4">
                        <li class="tag">
                            <input type="checkbox" id="ea">
                            <label for="ea" class="item">생일</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="eb">
                            <label for="eb" class="item">커플기념일</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ec">
                            <label for="ec" class="item">입학ㆍ졸업ㆍ합격</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ed">
                            <label for="ed" class="item">결혼</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ee">
                            <label for="ee" class="item">출산</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ef">
                            <label for="ef" class="item">어버이날</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="eg">
                            <label for="eg" class="item">스승의날</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="eh">
                            <label for="eh" class="item">입사ㆍ승진</label>
                        </li>
                    </ul>
                    <span class="opt_name">계절별</span>
                    <ul class="tagBx" data-text="5">
                        <li class="tag">
                            <input type="checkbox" id="fa">
                            <label for="fa" class="item">봄</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="fb">
                            <label for="fb" class="item">여름</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="fc">
                            <label for="fc" class="item">가을</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="fd">
                            <label for="fd" class="item">겨울</label>
                        </li>
                    </ul>
                    <span class="opt_name">색상별</span>
                    <ul class="tagBx" data-text="6">
                        <li class="tag">
                            <input type="checkbox" id="ga">
                            <label for="ga" class="item">Red</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="gb">
                            <label for="gb" class="item">Orange</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="gc">
                            <label for="gc" class="item">Yellow</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="gd">
                            <label for="gd" class="item">Green</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="ge">
                            <label for="ge" class="item">Blue</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="gf">
                            <label for="gf" class="item">Navy</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="gg">
                            <label for="gg" class="item">Purple</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="gh">
                            <label for="gh" class="item">White</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="gi">
                            <label for="gi" class="item">Black</label>
                        </li>
                    </ul>
                    <span class="opt_name">종류별</span>
                    <ul class="tagBx" data-text="7">
                        <li class="tag">
                            <input type="checkbox" id="ha">
                            <label for="ha" class="item">디자인문구</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hb">
                            <label for="hb" class="item">전자기기</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hc">
                            <label for="hc" class="item">여행ㆍ레포츠</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hd">
                            <label for="hd" class="item">디자인가전</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="he">
                            <label for="he" class="item">인테리어ㆍ수납</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hf">
                            <label for="hf" class="item">패브릭ㆍ생활</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hg">
                            <label for="hg" class="item">키친ㆍ푸드</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hh">
                            <label for="hh" class="item">패션의류</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hi">
                            <label for="hi" class="item">패션잡화ㆍ주얼리</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hj">
                            <label for="hj" class="item">화장품</label>
                        </li>
                        <li class="tag">
                            <input type="checkbox" id="hk">
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
                    </ul>
                </div>
                  
                <div class="gift_title">
                    <input type="text" placeholder="선물명을 입력해주세요">
                    <div class="thumbnail">
                        <input type="file" name="image" class="imgFile" id="img0" onchange="LoadImg(this,0)">
                        <h1>썸네일 </h1>
                        <div class="showImg">
                            <img>
                        </div>
                    </div>
                </div>
                <div class="editor">
                    <textarea class="form-control" id="summernote" name="boardContent" rows="10" style="resize: none;"></textarea>
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
    </script>
</body>
</html>