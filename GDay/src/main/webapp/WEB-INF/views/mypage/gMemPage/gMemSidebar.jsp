<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 사이드바</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemSidebar.css"/>
    <!-- icon : font-awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
		 <!-- 햄버거 토글 버튼 -->
    <a class="sidebar-toggle">
        <i class="fas fa-bars"></i>	
    </a>

    <div id="sidebar-area">
        <div id="sidebar-mypage">
            <img src="#" id="myProfile">
            <span id="nickName">닉네임</span>
        </div>
        <div id="sidebar-ul">
            <ul class="sidebar-menu">
                <li><a href="#" class="active-back">
                    <span class="menu-icon active-color"><i class="far fa-credit-card"></i></span>
                    <span class="menu-text active-color">주문 내역</span>
                    </a></li>

                    <ul class="sub-menu">
                        <li><a href="#" class="active-back">
                            <span class="submenu-icon active-color"><i class="fas fa-gift"></i></span>
                            <span class="submenu-text active-color">선물 리스트</span>
                            </a></li>
                        <li><a href="#">
                            <span class="submenu-icon"><i class="fab fa-slideshare"></i></span>
                            <span class="submenu-text">클래스 리스트</span>
                            </a></li>
                    </ul>
                <li><a href="#">
                    <span class="menu-icon"><i class="fas fa-heart"></i></span>
                    <span class="menu-text">위시 리스트</span>
                    </a></li>
                <li><a href="#">
                    <span class="menu-icon"><i class="fas fa-feather"></i></span>
                    <span class="menu-text">나의 후기</span>
                    </a></li>
                <li><a href="#">
                    <span class="menu-icon"><i class="fas fa-user-edit" style="font-size : 22px"></i></span>
                    <span class="menu-text">내 정보</span>
                    </a></li>
                <li><a href="#">
                    <span class="menu-icon"><i class="fas fa-user-shield" style="font-size : 22px"></i></span>
                    <span class="menu-text">비밀번호 변경</span>
                    </a></li>
                <li><a href="#">
                    <span class="menu-icon"><i class="fas fa-sad-tear"></i></span>
                    <span class="menu-text">회원 탈퇴</span>
                    </a></li>
            </ul>   
        </div>    
    </div>
    <script>
        $(".sidebar-toggle").on("click", function(){
            $("#sidebar-area").toggle(200);
            
        });

        $(window).resize(function(){
            if($(window).width() > 768){
                $("#sidebar-area").removeAttr("style");
            }
        });
    </script>
</body>
</html>