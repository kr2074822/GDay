<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비즈니스 회원 메인 페이지</title>

<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}
.container{
    position: relative;
    display: flex;
    justify-content: space-around;
    align-items: center;
    width: 80%;
}
.container .box{
    position: relative;
    width: 600px;
    height: 800px;
    background: #000;
}
.container .box .imgBx{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.container .box .imgBx img{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.container .box .contentBx{
    position: absolute;
    top: 40px;
    bottom: 40px;
    right: 40px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(0, 0, 0, .55);
    transition: transform .5s;
    transform-origin: right;
    transform: scaleX(0);
}
.container .box:hover  .contentBx{
    transition: transform .5s;
    transform-origin: left;
    transform: scaleX(1);
}
.container .box .contentBx .content{
    position: relative;
    padding: 20px 60px;
    opacity: 0;
}
.container .box:hover .contentBx .content{
    opacity: 1;
    transition: .5s;
    transition-delay: .5s;
}
.container .box .contentBx .content h2{
    color: #fff;
    font-weight: 300;
    margin-bottom: 10px;
}
.container .box .contentBx .content p{
    color: #fff;
    font-weight: 300;
    margin-bottom: 10px;
}
</style>
</head>
<body>
    <div class="container">
        <div class="box">
            <div class="imgBx">
                <img src="${contextPath}/resources/images/main_gift.jpg"></img>
            </div>
            <div class="contentBx">
                <div class="content">
                    <h1>선물 판매 신청</h1>
                    <p>
                        
                    </p>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="imgBx">
                <img src="${contextPath}/resources/images/main_class.jpg"></img>
            </div>
            <div class="contentBx">
                <div class="content">
                    <h1>클래스 모집 신청</h1>
                    <p>
                        
                    </p>
                </div>
            </div>
        </div>
    </div>






</body>
</html>