<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
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
    
    <!-- magazine.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/search/mainSearch.css">
    <title>선물/클래스 찾기</title>
<style>
input[name='category'] {
	display: none;
}
</style>
</head>
<body> 
	<c:choose>
		<%-- 검색이 된 경우 --%>
		<c:when test="${!empty search}">
			<%-- 선택된 카테고리를 하나의 쿼리스트링으로 조합 --%>
			<c:forEach items="${search.category}" var="c">
				<c:set var="category" value="${category}category=${c}&" />
			</c:forEach>
				<c:forEach items="${search.hashNo}" var="t">
					<c:set var="hashNo" value="${hashNo}hashNo=${t}&" />
				</c:forEach>

			<c:set var="searchStr" value="${category}${hashNo}" />

			<%-- 검색된 내용이 있다면 --%>
			<c:if test="${!empty search.sv}">
				<c:set var="searchStr" value="${category}${hashNo}&sv=${search.sv}" />
			</c:if>
		</c:when>
	</c:choose>


	<form action="search" method="get" role="form" onsubmit="return validate();">
		<section class="search">
			<div class="search_wrapper">
				<h1>클래스/선물 찾기</h1>

				<div class="">
					<input type="text" name="sv" id="" placeholder="">
					<button type="submit" id="">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</section>

		<section class="option">
			<div class="option_wrapper">
				<ul class="item_wrapper">
					<li class="item" data-text="0">연령대 <input type="checkbox" name="category" value="100"></li>
					<li class="item" data-text="1">가격 <input type="checkbox" name="category" value="200"></li>
					<li class="item" data-text="2">분위기 <input type="checkbox" name="category" value="300"></li>
					<li class="item" data-text="3">관계 <input type="checkbox" name="category" value="400"></li>
					<li class="item" data-text="4">기념일/명절 <input type="checkbox" name="category" value="500"></li>
					<li class="item" data-text="5">계절 <input type="checkbox" name="category" value="600"></li>
					<li class="item" data-text="6">색상 <input type="checkbox" name="category" value="700"></li>
					<li class="item" data-text="7">종류 <input type="checkbox" name="category" value="800"></li>
				</ul>

				<div class="tag_wrapper">
					<ul class="tagBx" data-text="0">
						<li class="tag"><input type="checkbox" name="hashNo" value="1" id="aa"> <label for="aa" class="item">영유아</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="2" id="an"> <label for="an" class="item">어린이</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="3" id="ac"> <label for="ac" class="item">청소년</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="4" id="ad"> <label for="ad" class="item">청년</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="5" id="ae"> <label for="ae" class="item">중년</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="6" id="af"> <label for="af" class="item">장년</label></li>
					</ul>
					<ul class="tagBx" data-text="1">
						<li class="tag"><input type="checkbox" name="hashNo" value="7" id="ba"> <label for="ba" class="item">1만원 미만</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="8" id="bb"> <label for="bb" class="item">2~3만원대</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="9" id="bc"> <label for="bc" class="item">3~4만원대</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="10" id="bd"> <label for="bd" class="item">5~8만원대</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="11" id="be"> <label for="be" class="item">9~10만원대</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="12" id="bf"> <label for="bf" class="item">11만원 이상</label></li>
					</ul>
					<ul class="tagBx" data-text="2">
						<li class="tag"><input type="checkbox" name="hashNo" value="13" id="ca"> <label for="ca" class="item">사랑스러운</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="14" id="cb"> <label for="cb" class="item">모던한</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="15" id="cc"> <label for="cc" class="item">독특한</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="16" id="cd"> <label for="cd" class="item">캐쥬얼</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="17" id="ce"> <label for="ce" class="item">실용적인</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="18" id="cf"> <label for="cf" class="item">럭셔리</label></li>
					</ul>
					<ul class="tagBx" data-text="3">
						<li class="tag"><input type="checkbox" name="hashNo" value="19" id="da"> <label for="da" class="item">애인</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="20" id="db"> <label for="db" class="item">부모님</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="21" id="dc"> <label for="dc" class="item">형제ㆍ자매</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="22" id="dd"> <label for="dd" class="item">친구ㆍ동료</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="23" id="de"> <label for="de" class="item">선생님ㆍ상사</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="24" id="df"> <label for="df" class="item">기타</label></li>
					</ul>
					<ul class="tagBx" data-text="4">
						<li class="tag"><input type="checkbox" name="hashNo" value="25" id="ea"> <label for="ea" class="item">생일</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="26" id="eb"> <label for="eb" class="item">커플기념일</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="27" id="ec"> <label for="ec" class="item">입학ㆍ졸업ㆍ합격</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="28" id="ed"> <label for="ed" class="item">결혼</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="29" id="ee"> <label for="ee" class="item">출산</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="30" id="ef"> <label for="ef" class="item">어버이날</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="31" id="eg"> <label for="eg" class="item">스승의날</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="32" id="eh"> <label for="eh" class="item">입사ㆍ승진</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="33" id="ei"> <label for="ei" class="item">퇴사</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="34" id="ej"> <label for="ej" class="item">명절</label></li>
					</ul>
					<ul class="tagBx" data-text="5">
						<li class="tag"><input type="checkbox" name="hashNo" value="35" id="fa"> <label for="fa" class="item">봄</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="36" id="fb"> <label for="fb" class="item">여름</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="37" id="fc"> <label for="fc" class="item">가을</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="38" id="fd"> <label for="fd" class="item">겨울</label></li>
					</ul>
					<ul class="tagBx" data-text="6">
						<li class="tag"><input type="checkbox" name="hashNo" value="39" id="ga"> <label for="ga" class="item">Red</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="40" id="gb"> <label for="gb" class="item">Orange</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="41" id="gc"> <label for="gc" class="item">Yellow</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="42" id="gd"> <label for="gd" class="item">Green</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="43" id="ge"> <label for="ge" class="item">Blue</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="44" id="gf"> <label for="gf" class="item">Navy</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="45" id="gg"> <label for="gg" class="item">Purple</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="46" id="gh"> <label for="gh" class="item">Pink</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="47" id="gi"> <label for="gi" class="item">White</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="48" id="gj"> <label for="gj" class="item">Black</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="59" id="gk"> <label for="gk" class="item">기타</label></li>
					</ul>
					<ul class="tagBx" data-text="7">
						<li class="tag"><input type="checkbox" name="hashNo" value="49" id="ha"> <label for="ha" class="item">디자인문구</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="50" id="hb"> <label for="hb" class="item">전자기기</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="51" id="hc"> <label for="hc" class="item">여행ㆍ레포츠</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="52" id="hd"> <label for="hd" class="item">디자인가전</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="53" id="he"> <label for="he" class="item">인테리어ㆍ수납</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="54" id="hf"> <label for="hf" class="item">패브릭ㆍ생활</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="55" id="hg"> <label for="hg" class="item">키친ㆍ푸드</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="56" id="hh"> <label for="hh" class="item">패션의류</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="57" id="hi"> <label for="hi" class="item">패션잡화ㆍ주얼리</label></li>
						<li class="tag"><input type="checkbox" name="hashNo" value="58" id="hj"> <label for="hj" class="item">화장품</label></li>
					</ul>
				</div>
			</div>
		</section>
	</form>

	<section class="gift">
	 <div class="title">
     <span>Class</span>
   </div>
		<div class="search_result">
			<h2>
			</h2>
			<p>
				<span class="order" id="Popularity">인기순</span> | <span class="order" id="Newest">최신순</span>
			</p>
		</div>
		<!-- 검색결과 상품이 없을 때 / 상품이 없을 때 -->
		<c:if test="${empty gCList}">
			<div class="gift_wrapper">조건에 맞는 상품이 없습니다.</div>
		</c:if>
		<c:if test="${!empty gCList}">
			<div class="gift_wrapper">
				<c:forEach var="gClass" items="${gCList}" varStatus="vs">
					<div class="item">
						<a href="gClass/${gClass.prdtNo}">
					
						<c:forEach items="${thList}" var="th">
							<c:if test="${th.prdtNo == gClass.prdtNo}">
								<img src="${contextPath}${th.filePath}/${th.fileName}" alt="">
							</c:if>
						</c:forEach>
						
							<c:if test="${gclass.cStatus == 'N'}">
								<div class="sold_out">
									<h1>마감</h1>
								</div>
							</c:if>
						
							<h1>${gClass.prdtName}</h1> 
							<c:forEach var="star" items="${selectStarList}" varStatus="vs">
								<c:if test="${star.prdtNo == gClass.prdtNo}">
									<p><i class="fas fa-star"></i>${star.rvStarAvg}</p>
									<span>${gClass.prdtPrice}</span>
								</c:if>
							</c:forEach>
						</a>
					</div>

				</c:forEach>
			</div>
		</c:if>
			<c:if test="${!empty gCList}">
				<div class="more">
            <a href="gClass/search?${searchStr}"><span>More</span></a>
        </div>			
      </c:if>
	</section>

    <section class="gift ver2">
        <div class="title">
            <span>Gift</span>
        </div>
        <div class="gift_wrapper">
			    <c:if test="${empty gCList}">
			      		<div class="gift_wrapper">조건에 맞는 상품이 없습니다.</div>
					</c:if>
					<c:if test="${!empty gCList}">
            <div class="item">
                <a href="">
                    <div>
                        <img src="images/gift1.jpg" alt="">
                        <div class="sold_out">
                            <h1>품절</h1>
                        </div>
                    </div>
                    <h1>제목입니다</h1>
                    <span>가격</span>
                </a>
            </div>
        </c:if>
        </div>
        <div class="more">
            <a href=""><span>More</span></a>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>


    <script src="${contextPath}/resources/js/fontawesome.js"></script>
    <script>
	//검색 파라미터 유지
	$(function() {
		//카테고리
		<c:forEach items="${search.category}" var="category">
		$("input[name=category]").each(function(index, item) {
			if($(item).val == "${category}") {
				$(item).prop("checked", true);
			}
		});
			</c:forEach>
		
		//해시태그
		<c:forEach items="${search.hashNo}" var="hashNo">
			$("input[name=hashNo]").each(function(index, item){
				if($(item).val() == "${hashNo}"){
					$(item).prop("checked", true);
				}
			});
			</c:forEach>
			
			//검색값(sv)
			$("input[name=sv]").val("${search.sv}");
	});
    
    const img = document.getElementById("img");
    const item = document.getElementsByClassName("item");
    const tagBx = document.getElementsByClassName("tagBx");

    const search = document.getElementById("search");
    var text = '';
    var change = '';

    const listBx = document.getElementsByClassName('listBx');
    const input = document.querySelectorAll('input[type="checkbox"]');
    const aaa = document.getElementById('baby');
    
    const li = document.querySelectorAll('li.item');
    
	  	//Javascript
	    var count = 0;
    
    // 팝업 
    for (const button of li) {
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
            });
        });

 		// hashtag 체크되면 category와 hashtag 모두 parameter로 넘겨줌
    for (const input_list of input) {
        let div_index = input_list.parentNode.parentNode.getAttribute('data-text');
        input_list.addEventListener('click', ()=> {
            if(input_list.checked == true){
               	console.log(input_list.checked)
               	
               	
               	console.log(item[div_index].firstChild.nextSibling.checked = true)
            }else{
            	let cnt = 0;
                let aa = input_list.parentElement.parentElement.querySelectorAll('input')
                console.log(input_list.parentElement.parentElement.querySelectorAll('input'))
                for (const bb of aa) {
                	console.log(123)
                    if(bb.checked){
                        cnt=cnt+1;
                    }else{
                        cnt=cnt-1
                    }
                	console.log(cnt)
                }
                if(cnt*(-1) == aa.length){
                	item[div_index].firstChild.nextSibling.checked = false
                }
            }
            
        });
    } 
    
    $("input[name='hashNo']").on("change", function(){
    	
    	let index = $(this).parent().parent().attr("data-text");
    	$category = $("li[data-text='"+index+"'] > input[name='category']");
    	
    	if($category.prop("checked")){
    		$category.prop("checked", false);
    	}else{
    		$category.prop("checked", true);
    	}
    });

    </script>
</body>
</html>