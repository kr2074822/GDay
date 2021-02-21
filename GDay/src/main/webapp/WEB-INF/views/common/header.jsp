<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	</style>

	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common/header.css" >
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	
	<header>
		<div id="headerWrapper">		
					
			<div id="midea-mypage">
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
			</div>
		
			<div id="header-logo">
				<img id="logo"></img>
			</div>		

			
			<ul id="header-menu">	
				<li class="header-li header-login"><a href="#">로그인</a></li>			
				<li class="header-li"><a href="#">선물찾기</a></li>
				<li class="header-li"><a href="#">클래스찾기</a></li>
				<li class="header-li"><a href="#">마이캘린더</a></li>
				<li class="header-li"><a href="#">매거진</a></li>
			</ul>
			
			<div id="header-member-area">
				<a id="login" href="#">로그인</a>
				
				<div id="hamberger">
				
					<i id="member-icon" class="fas fa-bars"></i>	
					
					<div id="header-media-menu">
						<ul id="media-menu">	
							<li class="media-li"><a href="#">로그인</a></li>			
							<li class="media-li"><a href="#">선물찾기</a></li>
							<li class="media-li"><a href="#">클래스찾기</a></li>
							<li class="media-li"><a href="#">마이캘린더</a></li>
							<li class="media-li"><a href="#">매거진</a></li>
						</ul>		
					</div>
				</div>		  
			</div>
			
			<i id="cancle-icon" class="fas fa-times"></i>
			
		</div>
	</header>
	

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
		  var hamberger = document.getElementById("member-icon");
		  var mypageHamberger = document.getElementById("mypage-icon");
		  var cancleIcon = document.getElementById("cancle-icon");

		  var mql = window.matchMedia("screen and (max-width: 768px)");
		  
		 /* 실시간 화면 조정 시 햄버거 메뉴 컨트롤 */
		  mql.addListener(function(e) {
				if(!e.matches) {
					document.getElementById("header-media-menu").style.visibility = "hidden"; 
					document.getElementById("header-media-menu").style.minHeight = "0"; 
					document.getElementById("header-mypage").style.display = "none";
					document.getElementById("cancle-icon").style.display = "none";
					document.getElementById("mypage-icon").style.display = "block";
					document.getElementById("member-icon").style.display = "block";
					hambergerSwitch = false;	
					hambergerSwitch2 = false;
				}	
			});
		 
		  /* 햄버거 버튼 눌렀을 시 메뉴 컨트롤 */
		  /* header-right */
		  hamberger.addEventListener('click', function(){
					document.getElementById("header-media-menu").style.visibility = "visible"; 
					document.getElementById("header-media-menu").style.minHeight = "100vh"; 
					document.getElementById("mypage-icon").style.display = "none";
					document.getElementById("member-icon").style.display = "none";
					document.getElementById("cancle-icon").style.display = "block"; 	     	    	    
		  });
		  
		  /* header-left */
		  mypageHamberger.addEventListener('click', function(){
					document.getElementById("header-mypage").style.display = "flex";
					document.getElementById("mypage-icon").style.display = "none";
					document.getElementById("member-icon").style.display = "none";
					document.getElementById("cancle-icon").style.display = "block"; 	     	    	    
		  });
		  
		  
		  /* 취소 아이콘 누르기 */
		  cancleIcon.addEventListener('click', function(){
			  	document.getElementById("header-mypage").style.display = "none";
					document.getElementById("header-media-menu").style.visibility = "hidden"; 
					document.getElementById("header-media-menu").style.minHeight = "0"; 
					document.getElementById("mypage-icon").style.display = "block";
					document.getElementById("member-icon").style.display = "block";
					document.getElementById("cancle-icon").style.display = "none";
		  });
		 
		  
		  
		  
		 
			/* 데스크탑 모드 hover */
      const buttons = document.querySelectorAll(".header-li");
      buttons.forEach(btn => {
          btn.addEventListener('mouseenter', function(e){
              var x = e.clientX - e.target.offsetLeft;
              var y = e.clientY - e.target.offsetTop;

              console.log(x);
              console.log(y);
              
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
              }, 600);
          });
      });  
      
      /* header-left */
     const buttons3 = document.querySelectorAll(".mypage-li");
      buttons3.forEach(btn => {
          btn.addEventListener('mouseenter', function(e){
              
              var ripples = document.createElement('span');
              
              ripples.classList.add('media-hover')
              
              this.appendChild(ripples);

              setTimeout(()=>{
                  ripples.remove()
              }, 600);
          });
      });  

  </script>


</body>
</html>