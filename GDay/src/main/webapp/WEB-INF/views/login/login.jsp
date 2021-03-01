<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">

    <link rel="stylesheet" href="${contextPath}/resources/css/login/login.css">
    
    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!-- Kakao -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

    <title>Document</title>
</head>
<body>
    <section>
        <div class="container">
            <div class="user norm">
                <div class="imgBox">
                    <img src="${contextPath}/resources/images/gift1.jpg" alt="">
                </div>
                <div class="formBox">
                    <form action="loginAction" method="post">
                        <h2>일반회원 로그인</h2>
                        <div>
                            <input type="text" name="memberEmail" id="" value="${cookie.saveId.value }" required>
                            <label for="">Email</label>
                        </div>
                        <div>
                            <input type="password" name="memberPwd" id="" required>
                            <label for="">Password</label>
                            <i class="showpw show fas fa-eye see"></i>
                            <i class="showpw none fas fa-eye-slash"></i>
                        </div>

                        <div class="chk_wrap">
                            <input type="checkbox" id="saveId" name="saveId" <c:if test="${!empty cookie.saveId.value}">checked</c:if>>
                            <label for="saveId">아이디 저장</label>

                            <input type="checkbox" id="autoId" name="autoId" disabled>
                            <label for="autoId">자동 로그인</label>
                            <input type="hidden" value="G" name="memberGrade">
                        </div>
                        <input type="submit" class="login" name="" value="Login">
                        <a href="javascript:klogin();" id="kakao-login-btn">
                            <i class="fas fa-comment"></i>
                        </a>
                         
                        <p class="seller">판매자로 로그인 하시겠습니까?&nbsp;<a href="#" onclick="toggleActive();">판매자 전환</a></p>
                        <p class="seller">
                            <a href="${contextPath}/login/signUpView">회원가입</a>
                        </p>
                        <div class="link">
                            <a href="${contextPath}/login/emailView">ID/PW 찾기</a>
                            <a href="${contextPath}/"><i class="fas fa-home"></i></a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="user sell">
                <div class="formBox">
                    <form action="loginAction" method="post">
                        <h2>판매자회원 로그인</h2>
                        <div>
                            <input type="text" name="memberEmail" id="" required>
                            <label for="">Email</label>
                        </div>
                        <div>
                            <input type="password" name="memberPwd" id="" required>
                            <label for="">Password</label>
                            <i class="showpw show fas fa-eye see"></i>
                            <i class="showpw none fas fa-eye-slash none"></i>
                        </div>
                        
                        <div class="chk_wrap">
                            <input type="checkbox" id="saveBmemId" name="saveBmemId">
                            <label for="saveBmemId"> 아이디 저장</label>
                            
                            <input type="checkbox" id="bmemAutoLogin" name="bmemAutoLogin" disabled>
                            <label for="bmemAutoLogin"> 자동 로그인</label>
                            <input type="hidden" value="B" name="memberGrade">
                        </div>
                        <input type="submit" class="login" name="" value="Login">

                        <p class="seller">일반회원으로 로그인 하시겠습니까?&nbsp;<a href="#" onclick="toggleActive();">일반회원 전환</a></p>
                        <p class="seller">
                            <a href="${contextPath}/login/signUpView">회원가입</a><br>
                            <div class="link">
                                <a href="${contextPath}/login/emailView">ID/PW 찾기</a>
                                <a href="${contextPath}/"><i class="fas fa-home"></i></a>
                            </div>
						</p>
                    </form>
                </div>
                <div class="imgBox"><img src="${contextPath}/resources/images/gift2.jpg" alt=""></div>
            </div>
        </div>
    </section>
    
    <script src="${contextPath}/resources/js/fontawesome.js"></script>
    <script type="text/javascript">

    
        /* 배경색 변경 */
        function toggleActive(){
            const container = document.querySelector(".container");
            const section = document.querySelector('section');
            container.classList.toggle('active');
            if(container.classList.contains('active')){
                section.style.backgroundColor = "#141414";
            }else{
                section.style.backgroundColor = "#fafafa";
            }
        }
        
        /* 일반 아이디 저장 및 자동로그인 */
        if($("#saveId").prop('checked')) {
        	 $("#autoId").prop('disabled', false)
        	 console.log(123)
	    }else{
	    	 $("#autoId").prop('checked')
	    }
        $("#saveId").on('click', function(){
        	var condition = $("#autoId").prop( 'disabled' );
            $("#autoId").prop("disabled", condition ? false : true); 
            if($("#saveId").prop('checked') == false){
                $("#autoId").prop('checked', false)
            }
        })
        
        /* 판매 아이디 저장 및 자동로그인  */
        if($("#saveBmemId").prop('checked')) {
        	 $("#bmemAutoLogin").prop('disabled', false)
        	 console.log(123)
	    }else{
	    	 $("#bmemAutoLogin").prop('checked')
	    }
        $("#saveBmemId").on('click', function(){
        	var condition = $("#bmemAutoLogin").prop( 'disabled' );
            $("#bmemAutoLogin").prop("disabled", condition ? false : true); 
            if($("#saveBmemId").prop('checked') == false){
                $("#bmemAutoLogin").prop('checked', false)
            }
        })

        /* 비밀번호 표시 */
        $(".show").on('click', function(){
            console.log($(this).next())
            $(this).css("display",'none');
            $(this).parent().children().first().attr('type', 'password');
            $(this).next().css("display",'inline-block');
        })
        $(".none").on('click', function(){
            console.log($(".show"))
            $(this).css("display",'none');
            $(this).parent().children().first().attr('type', 'text');
            $(this).prev().css("display",'inline-block');
        })
        
        /* 카카오 로그인 */
        window.Kakao.init('8035352f3860f77b021b6c64824a3b93');
        function klogin() {
            window.Kakao.Auth.login({
                scope:'profile, account_email',
                success: function(authObj) {
                    console.log(authObj);
                    window.Kakao.API.request({
                        url: '/v2/user/me',
                            success: res => {
                            const kakao_account = res.kakao_account
                            console.log(kakao_account);
                            console.log(kakao_account.profile.nickname);
                            console.log(kakao_account.email);
                            
                            
                            
                            $.ajax({
                            	url: "${contextPath}/login/kakaoLogin",
                            	data: ({
                            		memberEmail: kakao_account.email,
                            		memberNick: kakao_account.profile.nickname,
                            		/* memberPwd: Kakao.Auth.getAccessToken() */
                            	}),
                            	type: "post",
                            	success: function(result){
                            		if(result == 'already'){ // 이미 아이디가 있을 때
                            			window.location.href = "${contextPath}/"; 
                            		}else{
                            			window.location.href = "${contextPath}/login/addModeInfoView";
                            		}
                            		console.log("성공")
		                            console.log(Kakao.Auth.getAccessToken());
                            	},
                            	error: function(){
                            		console.log("tgt")
                            	}
                            });
                            
                        }
                    });
                },
                fail: function() {
                    alert('11');
                }
            });
            
            
        }
          
/* 		                            		console.log(Kakao.Auth.getAccessToken());
            
		                            		Kakao.Auth.logout(
		                            		function(obj) {
		                            		if(obj==true){
		                            			alert(12)
		                            		}else{
		                            			
		                            		}
		                            		 }
		                            		);
		                            		console.log(Kakao.Auth.getAccessToken());  */
		                            		
		                            		
		                            		
		                            		
		                            		// 로그아웃 및 연결끊기
		                            		/*
		                            		
		                            		Kakao.Auth.logout(function() {
		                            			  console.log(Kakao.Auth.getAccessToken());
		                            			});        		
		                            		
		                            		
		                            		
		                            		
		                            		
		                            		
		                            		
		                            		Kakao.API.request({
		                            			  url: '/v1/user/unlink',
		                            			  success: function(response) {
		                            			    console.log(response);
		                            			  },
		                            			  fail: function(error) {
		                            			    console.log(error);
		                            			  },
		                            			});
		                            		*/

        
    </script>
</body>
</html>