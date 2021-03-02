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

    

    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/gift/gift.css">
    <title>Document</title>
</head>
<body>

    <section class="search">
        <div class="search_wrapper">
            <h1>선물 찾기</h1>
            <div class="">
                <input type="text" name="" id="" placeholder="">
                <button type="submit" id=""><i class="fas fa-search"></i></button>
            </div>
        </div>
    </section>

    <section class="option">
        <div class="option_wrapper">
            <ul class="item_wrapper">
                <li class="item" data-text="0">연령대</li>
                <li class="item" data-text="1">가격</li>
                <li class="item" data-text="2">분위기</li>
                <li class="item" data-text="3">관계</li>
                <li class="item" data-text="4">기념일/명절</li>
                <li class="item" data-text="5">계절</li>
                <li class="item" data-text="6">색상</li>
                <li class="item" data-text="7">종류</li>
            </ul>

            <div class="tag_wrapper">
                <ul class="tagBx" data-text="0">
                    <li class="tag">
                        <input type="checkbox" id="aa">
                        <label for="aa">영유아</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="an">
                        <label for="an">어린이</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ac">
                        <label for="ac">청소년</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ad">
                        <label for="ad">청년</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ae">
                        <label for="ae">중년</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="af">
                        <label for="af">장년</label>
                    </li>
                </ul>
                <ul class="tagBx" data-text="1">
                    <li class="tag">
                        <input type="checkbox" id="ba">
                        <label for="ba">1만원 미만</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="bb">
                        <label for="bb">2~3만원대</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="bc">
                        <label for="bc">3~4만원대</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="bd">
                        <label for="bd">5~8만원대</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="be">
                        <label for="be">9~10만원대</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="bf">
                        <label for="bf">11만원 이상</label>
                    </li>
                </ul>
                <ul class="tagBx" data-text="2">
                    <li class="tag">
                        <input type="checkbox" id="ca">
                        <label for="ca">사랑스러운</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="cb">
                        <label for="cb">모던한</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="cc">
                        <label for="cc">독특한</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="cd">
                        <label for="cd">캐쥬얼</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ce">
                        <label for="ce">실용적인</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="cf">
                        <label for="cf">럭셔리</label>
                    </li>
                </ul>
                <ul class="tagBx" data-text="3">
                    <li class="tag">
                        <input type="checkbox" id="da">
                        <label for="da">애인</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="db">
                        <label for="db">부모님</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="dc">
                        <label for="dc">형제ㆍ자매</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="dd">
                        <label for="dd">친구ㆍ동료</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="de">
                        <label for="de">선생님ㆍ상사</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="df">
                        <label for="df">기타</label>
                    </li>
                </ul>
                <ul class="tagBx" data-text="4">
                    <li class="tag">
                        <input type="checkbox" id="ea">
                        <label for="ea">생일</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="eb">
                        <label for="eb">커플기념일</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ec">
                        <label for="ec">입학ㆍ졸업ㆍ합격</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ed">
                        <label for="ed">결혼</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ee">
                        <label for="ee">출산</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ef">
                        <label for="ef">어버이날</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="eg">
                        <label for="eg">스승의날</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="eh">
                        <label for="eh">입사ㆍ승진</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ei">
                        <label for="ei">퇴사</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ej">
                        <label for="ej">명절</label>
                    </li>
                </ul>
                <ul class="tagBx" data-text="5">
                    <li class="tag">
                        <input type="checkbox" id="fa">
                        <label for="fa">봄</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="fb">
                        <label for="fb">여름</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="fc">
                        <label for="fc">가을</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="fd">
                        <label for="fd">겨울</label>
                    </li>
                </ul>
                <ul class="tagBx" data-text="6">
                    <li class="tag">
                        <input type="checkbox" id="ga">
                        <label for="ga">Red</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="gb">
                        <label for="gb">Orange</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="gc">
                        <label for="gc">Yellow</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="gd">
                        <label for="gd">Green</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="ge">
                        <label for="ge">Blue</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="gf">
                        <label for="gf">Navy</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="gg">
                        <label for="gg">Purple</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="gh">
                        <label for="gh">Pink</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="gi">
                        <label for="gi">White</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="gj">
                        <label for="gj">Black</label>
                    </li>
                </ul>
                <ul class="tagBx" data-text="7">
                    <li class="tag">
                        <input type="checkbox" id="ha">
                        <label for="ha">디자인문구</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hb">
                        <label for="hb">전자기기</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hc">
                        <label for="hc">여행ㆍ레포츠</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hd">
                        <label for="hd">디자인가전</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="he">
                        <label for="he">인테리어ㆍ수납</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hf">
                        <label for="hf">패브릭ㆍ생활</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hg">
                        <label for="hg">키친ㆍ푸드</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hh">
                        <label for="hh">패션의류</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hi">
                        <label for="hi">패션잡화ㆍ주얼리</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hj">
                        <label for="hj">화장품</label>
                    </li>
                    <li class="tag">
                        <input type="checkbox" id="hk">
                        <label for="hk">기타</label>
                    </li>
                </ul>
            </div>

    </section>

    <section class="gift">
        <div class="search_result">
            <h2>검색결과 <span>여러</span>개</h2>
            <p>
                <span>인기순</span> | <span>최신순</span>
            </p>
        </div>
        <div class="gift_wrapper">
            <div class="item">
                <a href="">
                    <div>
                        <img src="images/gift1.jpg" alt="">
                        <div class="sold_out">
                            <h1>품절</h1>
                        </div>
                    </div>
                    <h1>제목입니다</h1>
                    <p>
                        내용입니다.
                    </p>
                    <span>가격</span>
                </a>
            </div>
            <div class="item">
                <a href="">
                    <div>
                        <img src="images/gift1.jpg" alt="">
                        <div class="sold_out">
                            <h1>품절</h1>
                        </div>
                    </div>
                    <h1>제목입니다</h1>
                    <p>
                        내용입니다.
                    </p>
                    <span>가격</span>
                </a>
            </div>
            <div class="item">
                <a href="">
                    <div>
                        <img src="images/gift1.jpg" alt="">
                    </div>
                    <h1>제목입니다</h1>
                    <p>
                        내용입니다.
                    </p>
                    <span>가격</span>
                </a>
            </div>
            <div class="item">
                <a href="">
                    <div>
                        <img src="images/gift1.jpg" alt="">
                    </div>
                    <h1>제목입니다</h1>
                    <p>
                        내용입니다.
                    </p>
                    <span>가격</span>
                </a>
            </div>
            <div class="item">
                <a href="">
                    <div>
                        <img src="images/gift1.jpg" alt="">
                        <div class="sold_out">
                            <h1>품절</h1>
                        </div>
                    </div>
                    <h1>제목입니다</h1>
                    <p>
                        내용입니다.
                    </p>
                    <span>가격</span>
                </a>
            </div>
            <div class="item">
                <a href="">
                    <div>
                        <img src="images/gift1.jpg" alt="">
                    </div>
                    <h1>제목입니다</h1>
                    <p>
                        내용입니다.
                    </p>
                    <span>가격</span>
                </a>
            </div>
            <div class="item">
                <a href="">
                    <div>
                        <img src="images/gift1.jpg" alt="">
                        <div class="sold_out">
                            <h1>품절</h1>
                        </div>
                    </div>
                    <h1>제목입니다</h1>
                    <p>
                        내용입니다.
                    </p>
                    <span>가격</span>
                </a>
            </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>

    <script src="${contextPath}/resources/js/fontawesome.js"></script>
    <script>
        const img = document.getElementById("img");
        const item = document.getElementsByClassName("item");
        const tagBx = document.getElementsByClassName("tagBx");

        const search = document.getElementById("search");
        var text = '';
        var change = '';

        const listBx = document.getElementsByClassName('listBx');
        const input = document.querySelectorAll('input[type="checkbox"]');
        const aaa = document.getElementById('baby');
        
        // 팝업 
        for (const button of item) {
            button.addEventListener('click', function(){
                let index = this.getAttribute('data-text');
                
                for(const pop of tagBx){                    
                    if(pop.getAttribute('data-text') == index) {
                        tagBx[index].classList.toggle("action1");

                    }else{
                        pop.classList.remove("action1");
                    }
                }
            });
        }

        // 버튼 클릭 리플 효과
        const li = document.querySelectorAll('li.item');
        console.log(li)
        li.forEach(btn => {
                btn.addEventListener('click', function(e) {
                    let x = e.clientX - e.target.offsetLeft;
                    let y = e.clientY - 366;

                    let ripples = document.createElement('b');
                    ripples.style.left = x + 'px';
                    ripples.style.top = y + 'px';
                    this.appendChild(ripples);

                    setTimeout(() => {
                        ripples.remove()
                    }, 1000)
                })
            })
    </script>
</body>
</html>