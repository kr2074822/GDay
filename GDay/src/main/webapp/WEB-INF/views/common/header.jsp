<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common/header.css?ver=1.0" >
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	
	 <!-- swal2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
    
    <!-- Kakao -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
		<c:if test="${!empty swalTitle}">
      <script>
         swal.fire({icon : "${swalIcon}",
             title : "${swalTitle}",
             text : "${swalText}", 
             confirmButtonColor: "#54b39E"
         		});
      </script>
   </c:if>
	
	<header>
		<div id="headerWrapper">		
					
<!-- 			<div id="midea-mypage">
				<div id="mypage-hamberger">
				
					<i id="mypage-icon" class="fas fa-bars"></i>	
					
 					<div id="header-mypage">
		 				<ul id="mypage-menu">	
							<li class="mypage-li"><a href="#">내 정보</a></li>			
							<li class="mypage-li"><a href="#">아이디 찾기</a></li>
							<li class="mypage-li"><a href="#">비밀번호 찾기</a></li>
							<li class="mypage-li"><a href="#">마이캘린더</a></li>
							<li class="mypage-li"><a href="#">매거진</a></li>
						</ul>	
					</div> 
					
				</div>		  
			</div> -->
		
			<div id="header-logo">
				<a href="${contextPath}/">
				<img id="logo" src="${contextPath}/resources/images/123.png">
				</a>
			</div>		

			
			<ul id="header-menu">	
				<li class="header-li header-login"><a href="${contextPath}/login/loginView">로그인</a></li>			
				<li class="header-li"><a href="${contextPath}/gift/list">선물찾기</a></li>
				<li class="header-li"><a href="${contextPath}/gClass/list">클래스찾기</a></li>
				<li class="header-li"><a href="${contextPath}/calendar/calendarMain">마이캘린더</a></li>
				<li class="header-li"><a href="${contextPath}/magazine/list">매거진</a></li>
			</ul>
			
				
			
			
			
			<c:choose>
            		<%-- 로그인이 되어있지 않은 경우 --%>
            	<c:when test="${empty sessionScope.loginMember }">
					<div id="header-member-area">
						<a id="login" href="${contextPath}/login/loginView">로그인</a>
						<div id="hamberger">
							<i id="member-icon" class="fas fa-bars"></i>	
							<div id="header-media-menu">
								<ul id="media-menu">
									<li class="media-li"><a href="#">로그인</a></li>
									<li class="media-li"><a href="${contextPath}/gift/list">선물찾기</a></li>
									<li class="media-li"><a href="${contextPath}/gClass/list">클래스찾기</a></li>
									<li class="media-li"><a href="${contextPath}/calendar/calendarMain">마이캘린더</a></li>
									<li class="media-li"><a href="${contextPath}/magazine/list">매거진</a></li>		
								</ul>		
							</div>
						</div>		  
					</div>
				</c:when>
				
				<c:otherwise>
					<div id="header-member-area">
					
						<div>
							<div class="action">
						        <div class="profile" onclick="menuToggle();">
						        	<c:if test="${!empty picture}">
						            	<img src="${contextPath}/resources/images/profileImg/${picture.pfName}" alt="">
						            </c:if>
						            <c:if test="${empty picture}">
						            	<img src="${contextPath}/resources/images/profileImg/profile.jpg" alt="">
						            </c:if>
						            
						        </div>
						        
						        <c:if test="${loginMember.memberGrade == 'G'}">
						        	<c:url var="mypageUrl" value="/gMember/orderList/G"/>
						        </c:if>
						        <c:if test="${loginMember.memberGrade == 'B' || loginMember.memberGrade == 'U'}">
						        	<c:url var="mypageUrl" value="/bMember/bSellList"/>
						        </c:if>
						        
						        <div class="menu">
						            <h3>${loginMember.memberNick}<br><span>반갑습니다</span></h3>
						            <ul>
								        <li>
								            <a href="${mypageUrl}">
								                <div class="name"><span data-text="Home">마이페이지</span></div>
								            </a>
								        </li>
								        <c:if test="${loginMember.memberGrade == 'G'}">
       								        <li>
									            <a href="${contextPath}/cart/memberCart">
									                <div class="name"><span data-text="Home">장바구니</span></div>
									            </a>
								       		</li>
								        </c:if>
								        <li>
								            <a href="${contextPath}/message/message">
								                <div class="name">
								                	<span data-text="message">쪽지</span>
								                </div>
								            </a>
								        </li>
								        <li>
								            <a href="${contextPath}/admin/memberCustomer">
								                <div class="name">
								                	<span data-text="help">고객센터</span>
								                </div>
								            </a>
								        </li>
								        <li>
								            <a href="${contextPath}/login/logout" id="logout">
								            <!-- <a id="logout"> --> 
								                <div class="name">
								                	<span data-text="Contact">로그아웃</span>
								                </div>
								            </a>
								        </li>
								    </ul>
						        </div>
						    </div>
						</div>
						
					
						<div id="hamberger">
							<i id="member-icon" class="fas fa-bars"></i>	
							<div id="header-media-menu">
								<ul id="media-menu">	
									<li class="media-li"><a href="${contextPath}/gift/list">선물찾기</a></li>
									<li class="media-li"><a href="${contextPath}/gClass/list">클래스찾기</a></li>
									<li class="media-li"><a href="${contextPath}/calendar/calendarMain">마이캘린더</a></li>
									<li class="media-li"><a href="${contextPath}/magazine/list">매거진</a></li>
									<li class="media-li"><a href="${mypageUrl}">마이페이지</a></li>
									<li class="media-li"><a href="${contextPath}/message/message">쪽지</a></li>
									<li class="media-li"><a href="#">고객센터</a></li>
									<li class="media-li"><a href="${contextPath}/login/logout">로그아웃</a></li>
								</ul>		
							</div>
						</div>		  
					</div>
				</c:otherwise>
            </c:choose>
			
			<i id="cancle-icon" class="fas fa-times"></i>
			
		</div>
	</header>
	

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
		  var hamberger = document.getElementById("member-icon");
/* 		  var mypageHamberger = document.getElementById("mypage-icon"); */
		  var cancleIcon = document.getElementById("cancle-icon");

		  var mql = window.matchMedia("screen and (max-width: 768px)");
		  
		 /* 실시간 화면 조정 시 햄버거 메뉴 컨트롤 */
		  mql.addListener(function(e) {
				if(!e.matches) {
					document.getElementById("header-media-menu").style.visibility = "hidden"; 
					document.getElementById("header-media-menu").style.minHeight = "0"; 
					document.getElementById("header-media-menu").style.top = "0"; 
/* 					document.getElementById("header-mypage").style.visibility = "hidden"; 
					document.getElementById("header-mypage").style.minHeight = "0"; 
					document.getElementById("header-mypage").style.top = "0";  */
					document.getElementById("cancle-icon").style.display = "none";
/* 					document.getElementById("mypage-icon").style.display = "block"; */
					document.getElementById("member-icon").style.display = "block";
					hambergerSwitch = false;	
					hambergerSwitch2 = false;
				}	
			});
		 
		  /* 햄버거 버튼 눌렀을 시 메뉴 컨트롤 */
		  /* header-right */
		  hamberger.addEventListener('click', function(){
			  	document.getElementById("header-media-menu").style.top = "0"; 
					document.getElementById("header-media-menu").style.visibility = "visible"; 
					document.getElementById("header-media-menu").style.minHeight = "100vh"; 
/* 					document.getElementById("mypage-icon").style.display = "none"; */
					document.getElementById("member-icon").style.display = "none";
					document.getElementById("cancle-icon").style.display = "block"; 	     	    	    
		  });
		  
 		  /* header-left */
/* 		  mypageHamberger.addEventListener('click', function(){
			 		document.getElementById("header-mypage").style.top = "0"; 
					document.getElementById("header-mypage").style.visibility = "visible"; 
					document.getElementById("header-mypage").style.minHeight = "100vh"; 
					document.getElementById("mypage-icon").style.display = "none";
					document.getElementById("member-icon").style.display = "none";
					document.getElementById("cancle-icon").style.display = "block"; 	     	    	    
		  });  */
		  
		  
		  /* 취소 아이콘 누르기 */
		  cancleIcon.addEventListener('click', function(){		
					document.getElementById("header-media-menu").style.visibility = "hidden"; 
					document.getElementById("header-media-menu").style.minHeight = "0"; 
					document.getElementById("header-media-menu").style.top = "-350px"; 
/* 					document.getElementById("header-mypage").style.visibility = "hidden"; 
					document.getElementById("header-mypage").style.minHeight = "0"; 
					document.getElementById("header-mypage").style.top = "-250px";  */
/* 					document.getElementById("mypage-icon").style.display = "block"; */
					document.getElementById("member-icon").style.display = "block";
					document.getElementById("cancle-icon").style.display = "none";
		  });
		 
		  
		  
		  
		 
			/* 데스크탑 모드 hover */
      const buttons = document.querySelectorAll(".header-li");
      buttons.forEach(btn => {
          btn.addEventListener('mouseenter', function(e){
              var x = e.clientX - e.target.offsetLeft;
              var y = e.clientY - e.target.offsetTop;
              
              var ripples = document.createElement('span');
              
              ripples.classList.add('span1')
              
              ripples.style.left = x + 'px';
              ripples.style.top = y + 'px';
              this.appendChild(ripples);

              setTimeout(()=>{
                  ripples.remove()
              }, 1200);
          });
      });  
      
      /* 모바일 버전 hover */
      /* header-right */
      const buttons2 = document.querySelectorAll(".media-li");
      buttons2.forEach(btn => {
          btn.addEventListener('mouseenter', function(e){
              
              var ripples = document.createElement('span');
              
              ripples.classList.add('media-hover')
              
              this.appendChild(ripples);

              setTimeout(()=>{
                  ripples.remove()
              }, 300);
          });
      });  
      
      // li가 a보다 위에있어서 li클릭 시 링크 이동
      $(".header-li").on("click", function() {
    	  var link = $(this).children().attr("href");
    	  console.log(link);
    	  location.href = link;
    	});
      
      
      /* header-left */
/*      const buttons3 = document.querySelectorAll(".mypage-li");
      buttons3.forEach(btn => {
          btn.addEventListener('mouseenter', function(e){
              
              var ripples = document.createElement('span');
              
              ripples.classList.add('media-hover')
              
              this.appendChild(ripples);

              setTimeout(()=>{
                  ripples.remove()
              }, 300);
          });
      });  */ 
      
      
      function menuToggle(){
          const toggleMenu = document.querySelector('.menu');
          toggleMenu.classList.toggle('active')

      }
      

  </script>


</body>
</html>