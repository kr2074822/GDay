<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!-- reset.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">

    <!-- main.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/main.css">

<style>
input[type="checkbox"] {
display: none;
}
</style>

</head>
<body>
				<c:choose>
						<%-- 검색이 된 경우 --%>
					<c:when test="${!empty search}">
						<c:set var="searchStr" value=""/>	
						<%--카테고리가 있는 경우--%>
					<c:when test="${!empty search.category}">
						<%-- 선택된 카테고리를 하나의 쿼리스트링으로 조합 --%>
						<c:forEach items="${search.category}" var="c">
							<c:set var="category" value="${category}ct=${c}&"/>
								<c:forEach items="${search.hashNo}" var="t">
									<c:set var="hashNo" value="${hashNo}tag=${t}&"/>
								</c:forEach>
						</c:forEach>
						
						<c:set var="searchStr" value="${category}${hashNo}"/>
						
						<%-- 검색하려는 값이 있다면 --%>
						<c:if test="${!empty search.sv}">
							<c:set var="searchStr" value="${category}${hashNo}&sv=${search.sv}"/>
						</c:if>
						</c:when>
					</c:when>
				</c:choose>
	<form action="search" method="GET">
		<section class="">
	        <div class="selectWrapper">
	            <div class="select_container">
	                <div class="select">
	                    <div class="input_wrapper">
	                    	<div class="form">
	                        
	                        	<div id="hash_tag"><span id="hash_span"></span></div>
	                            <input type="text" name="sv" id="search" placeholder="">
	                            <input type="hidden" name="" id="hsearch" placeholder="">
	                            <button type="submit" id=""><i class="fas fa-search"></i></button>
	                    	</div>
	                    <span>검색어 없어도 찾을수 있어요!</span>
	                </div>
	                <ul>
	                    <li class="selectBtn" id="" data-text="0">연령대
	                   	 <input type="checkbox" name="category" value="100"></li>
	                    <li class="selectBtn" id="" data-text="1">가격
	                    	<input type="checkbox" name="category" name="category" value="200"></li>
	                    <li class="selectBtn" id="" data-text="2">분위기
	                    	<input type="checkbox" name="category" value="300"></li>
	                    <li class="selectBtn" id="" data-text="3">관계
	                    	<input type="checkbox" name="category" value="400"></li>
	                    <li class="selectBtn" id="" data-text="4">기념일/명절
	                    	<input type="checkbox" name="category" value="500"></li>
	                    <li class="selectBtn" id="" data-text="5">계절
	                    	<input type="checkbox" name="category" value="600"></li>
	                    <li class="selectBtn" id="" data-text="6">색상
	                    <input type="checkbox" name="category" value="700"></li>
	                    <li class="selectBtn" id="" data-text="7">종류
	                    <input type="checkbox" name="category" value="800"></li>
	                </ul>
	            </div>
	        </div>
	        <div class="modal_section">
	            <img src="${contextPath}/resources/images/gift3.jpeg" alt="" id="img">
	            <div class="popup" data-text="0">
	                <h1>연령대</h1>
	                <div class="listBx">
	                    <input type="checkbox" name="hashNo" value="1" id="baby">
	                    <label class="item" for="baby">영유아</label>
	                    <input type="checkbox" name="hashNo" value="2" id="child">
	                    <label class="item" for="child">어린이</label>
	                    <input type="checkbox" name="hashNo" value="3" id="teenager">
	                    <label class="item" for="teenager">청소년</label>
	                    <input type="checkbox" name="hashNo" value="4" id="adult">
	                    <label class="item" for="adult">청년</label>
	                    <input type="checkbox" name="hashNo" value="5" id="midage">
	                    <label class="item" for="midage">중년</label>
	                    <input type="checkbox" name="hashNo" value="6" id="oldage">
	                    <label class="item" for="oldage">장년</label>
	                </div>
	            </div>
	            <div class="popup" data-text="1">
	                <h1>가격</h1>
	                <div class="listBx">
	                    <input type="checkbox" name="hashNo" value="7" id="under_one">
	                    <label class="item" for="under_one">1만원 미만</label>
	                    <input type="checkbox" name="hashNo" value="8" id="one_two">
	                    <label class="item" for="one_two">2~3만원대</label>
	                    <input type="checkbox" name="hashNo" value="9" id="three_for">
	                    <label class="item" for="three_for">3~4만원대</label>
	                    <input type="checkbox" name="hashNo" value="10" id="five_eight">
	                    <label class="item" for="five_eight">5~8만원대</label>
	                    <input type="checkbox" name="hashNo" value="11" id="nine_ten">
	                    <label class="item" for="nine_ten">9~10만원대</label>
	                    <input type="checkbox" name="hashNo" value="12" id="over_ten">
	                    <label class="item" for="over_ten">11만원 이상</label>
	                </div>
	            </div>
	            <div class="popup" data-text="2">
	                <h1>분위기</h1>
	                <div class="listBx">
	                    <input type="checkbox" name="hashNo" value="13" id="lovely">
	                    <label class="item" for="lovely">사랑스러운</label>
	                    <input type="checkbox" name="hashNo" value="14" id="modern">
	                    <label class="item" for="modern">모던한</label>
	                    <input type="checkbox" name="hashNo" value="15" id="special">
	                    <label class="item" for="special">독특한</label>
	                    <input type="checkbox" name="hashNo" value="16" id="casual">
	                    <label class="item" for="casual">캐쥬얼</label>
	                    <input type="checkbox" name="hashNo" value="17" id="useful">
	                    <label class="item" for="useful">실용적인</label>
	                    <input type="checkbox" name="hashNo" value="18" id="luxury">
	                    <label class="item" for="luxury">럭셔리</label>
	                </div>
	            </div>
	            <div class="popup" data-text="3">
	                <h1>관계</h1>
	                <div class="listBx">
	                    <input type="checkbox" name="hashNo" value="19" id="honey">
	                    <label class="item" for="honey">애인</label>
	                    <input type="checkbox" name="hashNo" value="20" id="parents">
	                    <label class="item" for="parents">부모님</label>
	                    <input type="checkbox" name="hashNo" value="21" id="sibling">
	                    <label class="item" for="sibling">형제ㆍ자매</label>
	                    <input type="checkbox" name="hashNo" value="22" id="friend">
	                    <label class="item" for="friend">친구ㆍ동료</label>
	                    <input type="checkbox" name="hashNo" value="23" id="teacher">
	                    <label class="item" for="teacher">선생님ㆍ상사</label>
	                    <input type="checkbox" name="hashNo" value="24" id="relEtc">
	                    <label class="item" for="relEtc">기타</label>
	                </div>
	            </div>
	            <div class="popup" data-text="4">
	                <h1>기념일/명절</h1>
	                <div class="listBx">
	                    <input type="checkbox" name="hashNo" value="25" id="bday">
	                    <label class="item" for="bday">생일</label>
	                    <input type="checkbox" name="hashNo" value="26" id="couple_day">
	                    <label class="item" for="couple_day">커플기념일</label>
	                    <input type="checkbox" name="hashNo" value="27" id="school_day">
	                    <label class="item" for="school_day">입학ㆍ졸업ㆍ합격</label>
	                    <input type="checkbox" name="hashNo" value="28" id="marriage">
	                    <label class="item" for="marriage">결혼</label>
	                    <input type="checkbox" name="hashNo" value="29" id="childbirth">
	                    <label class="item" for="childbirth">출산</label>
	                    <input type="checkbox" name="hashNo" value="30" id="parent">
	                    <label class="item" for="parent">어버이날</label>
	                    <input type="checkbox" name="hashNo" value="31" id="teacherDay">
	                    <label class="item" for="teacherDay">스승의날</label>
	                    <input type="checkbox" name="hashNo" value="32" id="hire">
	                    <label class="item" for="hire">입사ㆍ승진</label>
	                    <input type="checkbox" name="hashNo" value="33" id="hire">
	                    <label class="item" for="resign">퇴사</label>
	                    <input type="checkbox" name="hashNo" value="34" id="hire">
	                    <label class="item" for="holiday">명절</label>
	                </div>
	            </div>
	            <div class="popup" data-text="5">
	                <h1>계절</h1>
	                <div class="listBx">
	                    <input type="checkbox" name="hashNo" value="35" id="spring">
	                    <label class="item" for="spring">봄</label>
	                    <input type="checkbox" name="hashNo" value="36" id="summer">
	                    <label class="item" for="summer">여름</label>
	                    <input type="checkbox" name="hashNo" value="37" id="fall">
	                    <label class="item" for="fall">가을</label>
	                    <input type="checkbox" name="hashNo" value="38" id="winter">
	                    <label class="item" for="winter">겨울</label>
	                </div>
	            </div>
	            <div class="popup" data-text="6">
	                <h1>색상</h1>
	                <div class="listBx">
	                    <input type="checkbox" name="hashNo" value="39" id="red">
	                    <label class="item" for="red">Red</label>
	                    <input type="checkbox" name="hashNo" value="40" id="orange">
	                    <label class="item" for="orange">Orange</label>
	                    <input type="checkbox" name="hashNo" value="41" id="yellow">
	                    <label class="item" for="yellow">Yellow</label>
	                    <input type="checkbox" name="hashNo" value="42" id="green">
	                    <label class="item" for="green">Green</label>
	                    <input type="checkbox" name="hashNo" value="43" id="blue">
	                    <label class="item" for="blue">Blue</label>
						<input type="checkbox" name="hashNo" value="44" id="navy">
	                    <label class="item" for="navy">Navy</label>
	                    <input type="checkbox" name="hashNo" value="45" id="purple">
	                    <label class="item" for="purple">Purple</label>
	                    <input type="checkbox" name="hashNo" value="46" id="white">
	                    <label class="item" for="white">Pink</label>
	                    <input type="checkbox" name="hashNo" value="47" id="white">
	                    <label class="item" for="white">White</label>
	                    <input type="checkbox" name="hashNo" value="48" id="black">
	                    <label class="item" for="black">Black</label>
	                    <input type="checkbox" name="hashNo" value="59" id="etc">
	                    <label class="item" for="etc">기타</label>
	                </div>
	            </div>
	            <div class="popup" data-text="7">
	                <h1>종류</h1>
	                <div class="listBx">
	                    <input type="checkbox" name="hashNo" value="49" id="stationery">
	                    <label class="item" for="stationery">디자인문구</label>
	                    <input type="checkbox" name="hashNo" value="50" id="elec_equip">
	                    <label class="item" for="elec_equip">전자기기</label>
	                    <input type="checkbox" name="hashNo" value="51" id="leports">
	                    <label class="item" for="leports">여행ㆍ레포츠</label>
	                    <input type="checkbox" name="hashNo" value="52" id="house_design">
	                    <label class="item" for="house_design">디자인가전</label>
	                    <input type="checkbox" name="hashNo" value="53" id="interior">
	                    <label class="item" for="interior">인테리어ㆍ수납</label>
	                    <input type="checkbox" name="hashNo" value="54" id="life">
	                    <label class="item" for="life">패브릭ㆍ생활</label>
	                    <input type="checkbox" name="hashNo" value="55" id="food">
	                    <label class="item" for="food">키친ㆍ푸드</label>
	                    <input type="checkbox" name="hashNo" value="56" id="fashion">
	                    <label class="item" for="fashion">패션의류</label>
	                    <input type="checkbox" name="hashNo" value="57" id="fash_goods">
	                    <label class="item" for="fash_goods">패션잡화ㆍ주얼리</label>
	                    <input type="checkbox" name="hashNo" value="58" id="makeup">
	                    <label class="item" for="makeup">화장품</label>
	                </div>
	            </div>
	        </div>
	    </div>
	    </section>
   	</form>
    
    
    
    <section class="about">
        <img src="${contextPath}/resources/images/mainBanner.jpg" alt="">
        <div class="inner">
            <h2>선물이 필요하다면, G-Day와 함께 하세요.</h2>
            <div class="line">
                <span></span>
                <ul>
                    <li class="a"></li>
                    <li class="b"></li>
                    <li class="c"></li>
                </ul>
            </div>
            <ul>
                <li>
                    <h3>Our Class</h3>
                    <p>Lorem Ipsum is simply dummy text of the  <br>
                        printing and typesetting industry. <br>
                        Lorem Ipsum has been the industry's </p>
                </li>
                <li>
                    <h3>Our Gift</h3>
                    <p>Lorem Ipsum is simply dummy text of the  <br>
                        printing and typesetting industry. <br>
                        Lorem Ipsum has been the industry's</p>
                </li>
                <li>
                    <h3>Our Magazine</h3>
                    <p>Lorem Ipsum is simply dummy text of the  <br>
                        printing and typesetting industry. <br>
                        Lorem Ipsum has been the industry's </p>
                    </li>
            </ul>
        </div>
    </section>
    
    
    
    
    <section class="">
        <div class="section_wrapper">
            <h1>방금 새로 올라온 선물은?</h1>

            <div class="card_wrapper">
                <h2>Class</h2>
                <div class="card_container">
                  <c:forEach items="${cList}" var="c">
                    <div class="card">
                        <a href="gClass/${c.prdtNo}">
                         <c:forEach items="${thList}" var="th">
														<c:if test="${th.prdtNo == c.prdtNo}">
															<img src="${contextPath}${th.filePath}/${th.fileName}" alt="">
														</c:if>
												</c:forEach>
                            <div class="title">${c.prdtName}</div>
                            <div class="content">
                            	<c:forEach items="${selectStarList}" var="star">
                            		<c:if test="${star.prdtNo == c.prdtNo}">
                                <h3><i class="fas fa-star"></i>${star.rvStarAvg}</h3>
                                </c:if>
                              </c:forEach>
                                <p>
                                    <i class="fas fa-won-sign"></i>${c.prdtPrice}
                                    
                                </p>
                            </div>
                        </a>
                    </div>
                           </c:forEach>
                </div>
            </div>

            <div class="card_wrapper">
                <h2>Gifts</h2>
                <div class="card_container">
                    <div class="card">
                        <a href="">
                            <img src="images/pattern.jpg" alt="">
                            <div class="gradient"></div>
                            <h2>목걸이 제목</h2>
                            <div class="info">
                                <span>목걸이</span>
                                <span>10,000</span>
                            </div>
                        </a>
                    </div>
                    <div class="card">
                        <a href="">
                            <img src="images/pattern.jpg" alt="">
                            <div class="gradient"></div>
                            <h2>목걸이 제목</h2>
                            <div class="info">
                                <span>목걸이</span>
                                <span>10,000</span>
                            </div>
                        </a>
                    </div>
                    <div class="card">
                        <a href="">
                            <img src="images/pattern.jpg" alt="">
                            <div class="gradient"></div>
                            <h2>목걸이 제목</h2>
                            <div class="info">
                                <span>목걸이</span>
                                <span>10,000</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="magazine">
        <h1>Magazine</h1>
        <div class="magazine_wrapper">
            <div class="box">
                <a href="">
                    <div class="imgBx">
                        <img src="images/profile.jpg" alt="">
                    </div>
                    <div class="content">
                        <h2>제목<br><span>날짜</span></h2>
                    </div>
                </a>
            </div>
            <div class="box">
                <a href="">
                    <div class="imgBx">
                        <img src="images/profile.jpg" alt="">
                    </div>
                    <div class="content">
                        <h2>제목<br><span>날짜</span></h2>
                    </div>
                </a>
            </div>
            <div class="box">
                <a href="">
                    <div class="imgBx">
                        <img src="images/profile.jpg" alt="">
                    </div>
                    <div class="content">
                        <h2>제목<br><span>날짜</span></h2>
                    </div>
                </a>
            </div>
        </div>
    </section>
    
	<jsp:include page="footer.jsp"/>

    <script src="${contextPath}/resources/js/fontawesome.js"></script>
    <script>
        const img = document.getElementById("img");
        const selectBtn = document.getElementsByClassName("selectBtn");
        const popup = document.getElementsByClassName("popup");

        const hash_tag = document.getElementById("hash_span");
        
        const item = document.getElementsByClassName("item");
        const search = document.getElementById("search");
        const hsearch = document.getElementById("hsearch");
        "hsearch"
        var text = '';
        var change = '';

        const listBx = document.getElementsByClassName('listBx');
        const input = document.querySelectorAll('input[type="checkbox"]');
        const aaa = document.getElementById('baby');
        
        for (const button of selectBtn) {
            button.addEventListener('click', function(){
                let index = this.getAttribute('data-text');
                
                for(const pop of popup){                    
                    if(pop.getAttribute('data-text') == index) {
                        popup[index].classList.toggle("action");
                    }else{
                        pop.classList.remove("action");
                    }
                }
            });
        }

        for (const list of item) {
            list.addEventListener('click', ()=>{
    
                if(hsearch.value.indexOf('#'+list.innerText+' ') != -1){
                    change = text.replace('#'+list.innerText+' ', '');
                    hsearch.value = change;
                    text = change;
                    hash_tag.innerText = text;
	                    

                }else{
                    text += '#'+list.innerText+' '
                    hsearch.value = text;
                    console.log(text)
                    hash_tag.innerText = text; 

                }
            });
        }

        for (const input_list of input) {
            let div_index = input_list.parentNode.parentNode.getAttribute('data-text');
            input_list.addEventListener('click', ()=> {
                if(input_list.checked == true){
                    selectBtn[div_index].style.background="#FE929F";
                   	console.log(selectBtn[div_index].lastChild.checked = true)
                   	selectBtn[div_index].lastChild.checked = true
                }else{
                    let cnt = 0;
                    let aa = input_list.parentElement.querySelectorAll('input')
                    for (const bb of aa) {
                        if(bb.checked){
                            cnt=cnt+1;
                        }else{
                            cnt=cnt-1
                        }
                    }
                    if(cnt*(-1) == aa.length){
                        selectBtn[div_index].style.background="rgba(0, 0, 0, .05)";
                        selectBtn[div_index].lastChild.checked = false
                    }
                }
                
            });
        } 
        
		console.log(document.cookie)
     
    </script>
</body>
</html>