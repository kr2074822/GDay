<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 사이드바</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/adminSidebar.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">    
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
		    <div class="pageTitle">관리자 페이지</div>
        <div id="sidebar-adminPage"></div>
        <div id="sidebar-ul">
            <ul class="sidebar-menu">
                <li class="active-sidebar">
                		<a href="${contextPath}/admin/adminMember" class="up-menu">
                    <span class="menu-icon"><i class="fas fa-users-cog"></i></span>
                    <span class="menu-text">회원 관리</span>
                    </a>

                    <ul class="sub-menu">
                        <li class="active-sidebar"><a href="${contextPath}/admin/adminMember">
                            <span class="submenu-icon"><i class="fas fa-users"></i></span>
                            <span class="submenu-text">전체회원 보기</span>
                            </a>
                        </li>
                        <li><a href="${contextPath}/admin/adminBMemSub">
                            <span class="submenu-icon"><i class="far fa-id-card"></i></span>
                            <span class="submenu-text">비즈니스 회원 신청</span>
                            </a>
                        </li>
                        <li><a href="${contextPath}/admin/adminBlackMem">
                            <span class="submenu-icon"><i class="fas fa-user-times"></i></span>
                            <span class="submenu-text">블랙 리스트 회원</span>
                            </a>
                        </li>
                    </ul>
								</li>
								
					<li class="active-sidebar">
                		<a href="${contextPath}/admin/adminReportEnd" class="up-menu">
                    	<span class="menu-icon"><i class="fas fa-exclamation-triangle"></i></span>
                    	<span class="menu-text">신고 관리</span>
                    </a>

	                    <ul class="sub-menu">
	                        <li class="active-sidebar"><a href="${contextPath}/admin/adminReportEnd">
	                            <span class="submenu-icon"><i class="fas fa-exclamation-circle"></i></span>
	                            <span class="submenu-text">신고처리 완료</span>
	                            </a>
	                        </li>
	                        <li><a href="${contextPath}/admin/adminReportStand">
	                            <span class="submenu-icon"><i class="fas fa-bomb"></i></span>
	                            <span class="submenu-text">신고처리 대기</span>
	                            </a>
	                        </li>
	                    </ul>
					</li>

					<li class="active-sidebar">
                		<a href="${contextPath}/admin/adminBoard" class="up-menu">
	                    <span class="menu-icon"><i class="fas fa-clipboard-list"></i></span>
	                    <span class="menu-text">게시글 관리</span>
                    </a>

	                    <ul class="sub-menu">
			                <li><a href="${contextPath}/admin/adminBoard">
			                    <span class="submenu-icon"><i class="fas fa-book-open"></i></span>
			                    <span class="submenu-text">전체 게시글 관리</span>
			                    </a>
			                </li>
			                <li><a href="${contextPath}/admin/adminMagazine">
			                    <span class="submenu-icon"><i class="fas fa-book-open"></i></span>
			                    <span class="submenu-text">매거진 관리</span>
			                    </a>
			                </li>
	                    </ul>
					</li>
								
                <li><a href="${contextPath}/admin/adminCustomerService">
                    <span class="menu-icon"><i class="fas fa-question-circle" style="font-size : 20px"></i></span>
                    <span class="menu-text">고객 센터</span>
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