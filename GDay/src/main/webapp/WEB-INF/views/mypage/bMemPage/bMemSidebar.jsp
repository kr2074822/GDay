<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비즈니스 회원 사이드바</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemSidebar.css"/>
    <!-- icon : font-awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

<!-- 일반회원 사이드바 복붙함.... -->

    <!-- 토글 버튼 -->
    <a class="sidebar-toggle">
        <i class="fas fa-bars"></i>	
        <i class="fas fa-times"></i>
    </a>

    <div class="sidebar-area">
		    <div class="pageTitle">마이 페이지</div>
        <div id="sidebar-mypage">
            <img src="1" id="myProfile">
            <span id="nickName">닉네임</span>
        </div>
        <div id="sidebar-ul">
            <ul class="sidebar-menu">
                <li class="active-sidebar">
                		<a href="${contextPath}/bMember/bSellList" class="up-menu">
                    <span class="menu-icon"><i class="far fa-credit-card"></i></span>
                    <span class="menu-text">판매 목록 조회</span>
                    </a>

                    <ul class="sub-menu">
                        <li class="active-sidebar"><a href="${contextPath}/bMember/bSellList">
                            <span class="submenu-icon"><i class="fas fa-gift"></i></span>
                            <span class="submenu-text">판매글</span>
                            </a>
                        </li>
                        <li><a href="${contextPath}/bMember/bOrderList">
                            <span class="submenu-icon"><i class="fab fa-slideshare"></i></span>
                            <span class="submenu-text">주문조회</span>
                            </a>
                        </li>
                        <li><a href="${contextPath}/bMember/bRefundList">
                            <span class="submenu-icon"><i class="fab fa-slideshare"></i></span>
                            <span class="submenu-text">반품 신청 조회</span>
                            </a>
                        </li>
                        <li><a href="${contextPath}/bMember/bCancelList">
                            <span class="submenu-icon"><i class="fab fa-slideshare"></i></span>
                            <span class="submenu-text">주문 취소 조회</span>
                            </a>
                        </li>
                    </ul>
								</li>
								
								<li class="active-sidebar">
                		<a href="#" class="up-menu">
                    <span class="menu-icon"><i class="far fa-credit-card"></i></span>
                    <span class="menu-text">클래스 관리</span>
                    </a>

                    <ul class="sub-menu">
                        <li class="active-sidebar"><a href="${contextPath}/bMember/bClassList">
                            <span class="submenu-icon"><i class="fas fa-gift"></i></span>
                            <span class="submenu-text">내 클래스</span>
                            </a>
                        </li>
                        <li><a href="${contextPath}/bMember/bEnrolmentList">
                            <span class="submenu-icon"><i class="fab fa-slideshare"></i></span>
                            <span class="submenu-text">수강 신청 조회</span>
                            </a>
                        </li>
                        <li><a href="${contextPath}/bMember/bClassCancelList">
                            <span class="submenu-icon"><i class="fab fa-slideshare"></i></span>
                            <span class="submenu-text">수강 취소 조회</span>
                            </a>
                        </li>
                    </ul>
								</li>
								
                <li><a href="${contextPath}/bMember/bMemUpdate">
                    <span class="menu-icon"><i class="fas fa-user-edit" style="font-size : 20px"></i></span>
                    <span class="menu-text">내 정보</span>
                    </a></li>
                <li><a href="2">
                    <span class="menu-icon"><i class="fas fa-user-shield" style="font-size : 20px"></i></span>
                    <span class="menu-text">비밀번호 변경</span>
                    </a></li>
                <li><a href="1">
                    <span class="menu-icon"><i class="fas fa-sad-tear"></i></span>
                    <span class="menu-text">회원 탈퇴</span>
                    </a></li>
            </ul>   
        </div>    
    </div>
    <script>
        $(".sidebar-toggle").on("click", function(){
            $(".sidebar-area").toggleClass("sidebar-open");
            $(this).toggleClass("active-toggle");
        });
/*         $(".sidebar-toggle").children().first().next().on("click", function(){
            $("#sidebar-area").hide(100);
            $(this).removeClass("active-toggle");
        }); */

        $(window).resize(function(){
            if($(window).width() > 768){
                $(".sidebar-area").removeAttr("style");
            }
        });
        
        /* 임시 - db 연결 후에는? c:if로 함 session에 넣기? flashAttribute?
        		어쨋든 해당 메뉴가 활성화되고 있다는 걸 알려주는 장치 필요*/
        $(".sidebar-menu > li > a").on("click", function(){
	        	$(this).parent().addClass("active-sidebar");
	        	if($(".sidebar-menu > li").eq(0).hasClass("active-sidebar")){
		        	$(".sub-menu > li").removeClass("active-sidebar");
		        }
	        	if($(this).hasClass("up-menu")){
	        		$(".sub-menu > li > a").first().trigger('click');
	        	}
	        	$(this).parent().siblings("li").removeClass("active-sidebar");
        });
        
        $(".sub-menu > li > a").on("click", function(){
        	$(this).parent().addClass("active-sidebar");
					$(".sidebar-menu > li").eq(0).addClass("active-sidebar");
					$(this).parent().siblings().removeClass("active-sidebar");
					$(".sidebar-menu > li").eq(0).siblings().removeClass("active-sidebar");
        });
        		
        		
    </script>
</body>
</html>