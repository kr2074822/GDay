<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- JQUERY -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">

    <link rel="stylesheet" href="${contextPath}/resources/css/login/signUp.css">
    
    <title>Document</title>
</head>
<body>
    <section>
        <div class="container">
            <div class="user norm">
                <div class="imgBox">
                    <img src="${contextPath}/resources/images/signin1.jpg" alt="">
                </div>
                <div class="formBox">
                    <form action="${contextPath}/login/signUp" enctype="multipart/form-data" method="POST" onsubmit="return validate();">
                        <h2>일반회원 회원가입</h2>
                        <div>
                            <input type="email" name="memberEmail" class="email" required>
                            <label for="">Email</label>
                            <button type="button" class="emailCheck">중복 검사</button>
                            <button type="button" class="sendMail">인증</button>
                            <span id="sucMail"></span>
                        </div>
                        <div>
                            <input type="text" name="" required class="code">
                            <label for="">인증번호</label>
                           	<button type="button" class="checkCode">입력</button>
                            <span></span>
                        </div>
                        <div>
                            <input type="password" name="memberPwd" required class="pw1">
                            <label for="">비밀번호</label>
                            <i class="showpw fas fa-eye"></i>
                        </div>
                        <div>
                            <input type="password" name="" required class="pw2">
                            <label for="">비밀번호 확인</label>
                            <span id=""></span>
                            <i class="showpw fas fa-eye"></i>
                        </div>
                        <div>
                            <input type="text" name="memberName" class="memberName" required>
                            <label for="">이름</label>
                            <span id=""></span>
                        </div>
                        <div>
                            <input type="text" name="memberNick" required>
                            <label for="">닉네임</label>
                        </div>
                        <div>
                            <input type="text" name="memberPhone" class="memberPhone" required>
                            <label for="">전화번호</label>
                        </div>

                        <div>
                            <input type="file" name="image" class="imgFile" id="img0" onchange="LoadImg(this,0)">
                            <h1>프로필 사진 </h1>
                            <div class="showImg">
                                <img>
                            </div>
                        </div>

                        <input type="submit" class="login" name="" value="SignUp">
                        <p class="seller">판매자로 가입 하시겠습니까?&nbsp;<a href="#" onclick="toggleActive();">판매자 가입</a></p>
                        <p class="seller">
                            <a href="${contextPath}/login/loginView">로그인</a>
                        </p>
                        <input type="hidden" name="memberGrade" value="G">
                    </form>
                </div>
            </div>
            <div class="user sell">
                <div class="formBox">
                    <form action="${contextPath}/login/signUp" enctype="multipart/form-data" method="POST" onsubmit="return validate();">
                        <h2>판매자회원 로그인</h2>
                        <div>
                            <input type="email" name="memberEmail" class="email"required>
                            <label for="">Email</label>
                            <button type="button" class="emailCheck">중복검사</button>
                            <button type="button" class="sendMail">인증</button>
                            <span></span>
                        </div>
                        <div>
                            <input type="text" name="" required class="code">
                            <label for="">인증번호</label>
                            <button type="button" class="checkCode">입력</button>
                            <span></span>
                        </div>
                        <div>
                            <input type="password" name="memberPwd" required class="pw3">
                            <label for="">비밀번호</label>
                            <i class="showpw fas fa-eye"></i>
                        </div>
                        <div>
                            <input type="password" name="" required class="pw4">
                            <label for="">비밀번호 확인</label>
                            <span id=""></span>
                            <i class="showpw fas fa-eye"></i>
                        </div>
                        <div>
                            <input type="text" name="memberName" class="memName" required>
                            <label for="">이름</label>
                        </div>
                        <div>
                            <input type="text" name="memberNick" required>
                            <label for="">닉네임</label>
                        </div>
                        <div>
                            <input type="text" name="memberPhone" class="memberPhone" required>
                            <label for="">전화번호</label>
                        </div>
                        
                        <div>
                            <input type="text" name="bmemShop" required>
                            <label for="">업체명</label>
                        </div>
                        <div>
                            <input type="file" class="postcodify_details license" name="image" id="limg">
                            <label for="">사업자등록증</label>
                        </div>
                        <div>
                            <input type="file" name="image" class="imgFile" id="img1" onchange="LoadImg(this,1)">
                            <h1>프로필 사진 </h1>
                            <div class="showImg">
                                <img>
                            </div>
                        </div>

                        <input type="submit" class="login" name="" value="SignUp">

                        <p class="seller">일반회원으로 가입 하시겠습니까?&nbsp;<a href="#" onclick="toggleActive();">일반회원 가입</a></p>
                        <p class="seller">
                            <a href="${contextPath}/login/loginView">로그인</a>
                        </p>
                        <input type="hidden" name="memberGrade" value="B">
                    </form>
                </div>
                <div class="imgBox"><img src="${contextPath}/resources/images/signin2.jpg" alt=""></div>
            </div>
        </div>
    </section>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="${contextPath}/resources/js/fontawesome.js"></script>
    <script type="text/javascript">
    
	 	// 각 유효성 검사 결과를 저장할 객체
		var signUpCheck = {
			"email" : false,
			"code" : false,
			"pwd1" : false,
			"pwd2" : false,
			"pwd3" : false,
			"pwd4" : false,
		};
    
    	/* 이메일 코드 */
    	var code = 0;

        /* 배경색 변경 */
        function toggleActive(){
            const container = document.querySelector(".container");
            const section = document.querySelector('section');
            container.classList.toggle('active');
            if(container.classList.contains('active')){
                section.style.backgroundColor = "#ffd37b"
            }else{
                section.style.backgroundColor = "#fafafa";
            }
        }
        
        /* 이미지 클릭 */
		$(function(){
			$(".showImg").on("click", function(){
				var index = $(".showImg").index(this);
				$("#img" + index).click();
			});
		});

        /* 이미지 표시 */
	    function LoadImg(value, num) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
      	
                reader.readAsDataURL(value.files[0]);
                reader.onload = function(e){
                    $(".showImg").eq(num).children("img").attr("src", e.target.result);
                    console.log($(".showImg").eq(num).children("img"));
                }
			}
		}

        /* 비밀번호 표시 */
        $(".showpw").on('click', function(){
            $(this).toggleClass("fa-eye-slash");
            if($(this).hasClass("fa-eye-slash")){
                $(this).parent().children().first().attr('type', 'text');
            }else{
                $(this).parent().children().first().attr('type', 'password');
            }
        });
        
        /* 이메일 중복 검사 */
        $(".emailCheck").on('click', function() {
        	var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3
        	var ebtn = $(this);
        	if (!regExp.test($(this).prev().prev().val())) { // 이메일이 정규식을 만족하지 않을경우
        		console.log($(this).prev().prev().val())
        		Swal.fire({
					icon: 'error',
					title: '이메일형식이 맞지 않습니다',
        		})

        		signUpCheck.email = false
			} else {
				$.ajax({
					url: "${contextPath}/login/checkEmail",
					data: ({
						memberEmail: $(this).prev().prev().val()
					}),
					type: "post",
					success: function(result){
						if(result > 0){ // 중복이 있을때
							Swal.fire({
								icon: 'error',
								title: '사용 불가능한 이메일입니다.',
			        		})
						}else{
							Swal.fire({
								icon: 'success',
								title: '사용 가능한 이메일입니다.',
			        		})
			        		console.log(ebtn.next());
							ebtn.css("display", "none")
							ebtn.next().css("display", "inline-block")
							signUpCheck.email = true;
						}
					},
					error: function(){
						console.log("실패")
					}
					
					
				})
        		
				signUpCheck.email = true
				console.log(signUpCheck.email)
				
			}
        });
        
        /* 이메일 유효성 검사 */
         $(".email").on("input", function() {
        	var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3
        	
			$(this).next().next().css("display", "inline-block")
			$(this).next().next().next().css("display", "none")
        	
        })
        
        /* 이메일 */
        $(".sendMail").on('click', function(){
        	console.log($(this).prev().prev().prev().val())
        	var email = $(this).prev().prev().prev().val()
        	$.ajax({
        		url: "${contextPath}/login/sendEmail",
        		data: ({
        			memberEmail: email
        		}),
        		type: "post",
        		success: function(result){
        			console.log("성공");
        			code = result;
        			console.log(code);
        			Swal.fire({
						icon: 'success',
						title: '인증번호를 전송했습니다.',
	        		})
        			
        		},
        		error: function(){
        			console.log("실패");
        		}
        	});
        	
        });
        
        /* 인증 코드 */
        $(".checkCode").on("click", function(){
        	console.log($(this).prev().prev().val())
        	if($(this).prev().prev().val().trim().length == 0 || $(this).prev().prev().val() != code ){
        		$(this).next().text("불일치").css({"color":"red"})
        		signUpCheck.code = false;
        	}else{
        		$(this).next().text("일치").css({"color":"green"})
        		signUpCheck.code = true;
        		console.log(signUpCheck.code)
        	}
        });
        
		
     // 일반 회원 비밀번호 유효성 및 일치 검사
		$(".pw1, .pw2").on("input",function() {
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;
	
			console.log($(".pw1").val())
			console.log($(".pw2").val())
			// 비밀번호1 유효성 검사
			if (!regExp.test($(".pw1").val())) {
				signUpCheck.pwd1 = false;
				signUpCheck.pwd3 = false;
			} else {
				console.log("유효 ㅇㅇ");
				signUpCheck.pwd1 = true;
				signUpCheck.pwd3 = true;
			}
			
			// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
			if (!signUpCheck.pwd1 && $(".pw2").val().length > 0) {
				alert("유효한 비밀번호를 작성해 주세요.");
				$(".pw2").val("");
				$(".pw1").focus();
			} else if (signUpCheck.pwd1 && $(".pw2").val().length > 0) {
				if ($(".pw1").val() != $(".pw2").val()) {
					
					$(".pw2").next().next().text("불일치").css("color", "red")
					signUpCheck.pwd2 = false;
					signUpCheck.pwd4 = false;
				} else {
					$(".pw2").next().next().text("일치").css("color", "green")
					signUpCheck.pwd2 = true;
					signUpCheck.pwd4 = true;
	        		console.log(signUpCheck.pwd1)
	        		console.log(signUpCheck.pwd2)
				}
			}
		});
		
     //--------------------------------------------------------------
     // 일반 회원 비밀번호 유효성 및 일치 검사
		$(".pw3, .pw4").on("input",function() {
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;
	
			console.log($(".pw3").val())
			console.log($(".pw4").val())
			// 비밀번호1 유효성 검사
			if (!regExp.test($(".pw3").val())) {
				signUpCheck.pwd1 = false;
				signUpCheck.pwd3 = false;
			} else {
				console.log("유효 ㅇㅇ");
				signUpCheck.pwd1 = true;
				signUpCheck.pwd3 = true;
			}
			
			// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
			if (!signUpCheck.pwd1 && $(".pw4").val().length > 0) {
				alert("유효한 비밀번호를 작성해 주세요.");
				$(".pw4").val("");
				$(".pw3").focus();
			} else if (signUpCheck.pwd1 && $(".pw4").val().length > 0) {
				if ($(".pw3").val() != $(".pw4").val()) {
					
					$(".pw4").next().next().text("불일치").css("color", "red")
					signUpCheck.pwd2 = false;
					signUpCheck.pwd4 = false;
				} else {
					$(".pw4").next().next().text("일치").css("color", "green")
					signUpCheck.pwd2 = true;
					signUpCheck.pwd4 = true;
	        		console.log(signUpCheck.pwd1)
	        		console.log(signUpCheck.pwd2)
				}
			}
		});
		
     

		

		
		// 유효성 검사
		function validate() {
			for ( var key in signUpCheck) {
				
				console.log(signUpCheck)
			}
			
			for ( var key in signUpCheck) {
				if (!signUpCheck[key]) {
					var str;
					switch (key) {
						case "email" : str = "이메일"; break;
						case "pwd1": str = "비밀번호";	break;
						case "pwd2": str = "비밀번호 확인";break;
						case "pwd3": str = "비밀번호";	break;
						case "pwd4": str = "비밀번호 확인";break;
						case "code":str = "이메일 인증 코드";break;
					}
					
					Swal.fire({
						icon: 'warning',
						title: str+" 형식이 유효하지 않습니다.",
	        		}).then(function(){
						
					});
					console.log(signUpCheck[key])
					
					return false;
				}
			}
			
			Swal.fire({
				icon: 'success',
				title: " 회원가입이 되었습니다.",
    		})
			
			console.log(123)
		}
		
    </script>
</body>
</html>