<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비즈니스 회원 메인페이지</title>

<link rel="stylesheet" href="${contextPath}/resources/css/common/bMain.css">
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">

</head>
<body>

<jsp:include page="header.jsp"/>
    <div class="container x">
        <div class="box">
            <div class="imgBx">
                <a href="${contextPath}/gift/insertView">
                	<img src="${contextPath}/resources/images/main_gift.jpg" alt="선물 판매 신청"></img>
                	
                </a>
            </div>
            <div class="contentBx" id="giftInsertView">
                <div class="content">
                    <h1>선물 판매 신청</h1>
                    <p>
                        	[판매자 전용]<br>
                        	선물 등록 신청하러 가기
                    </p>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="imgBx">
                <a href="${contextPath}/bMember2/gClassInsert"><img src="${contextPath}/resources/images/main_class.jpg"></img></a>
            </div>
            <div class="contentBx" id="gClassInsertView">
                <div class="content">
                    <h1>클래스 모집 신청</h1>
                    <p>
                        [강사 전용]<br>
                                             기프트 클래스 등록 신청하러 가기
                    </p>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>


<script>
$("#gClassInsertView").on("click", function(){
	location.href = "${contextPath}/bMember2/gClassInsert";
})

$("#giftInsertView").on("click", function(){
	location.href = "#";
})
</script>


</body>
</html>