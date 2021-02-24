<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/common/reset.css">

    <link rel="stylesheet" href="${contextPath}/resources/login/signUp.css">
    
    <!-- JQUERY -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Document</title>
</head>
<body>
    <section>
        <div class="container">
            <div class="user norm">
                <div class="imgBox">
                    <img src="images/signin1.jpg" alt="">
                </div>
                <div class="formBox">
                    <form action="">
                        <h2>일반회원 회원가입</h2>
                        <div>
                            <input type="email" name="" class="email" required>
                            <label for="">Email</label>
                            <button type="button">인증</button>
                            <span>메일 발송</span>
                        </div>
                        <div>
                            <input type="text" name="" required class="code">
                            <label for="">인증번호</label>
                            <span>인증 성공</span>
                        </div>
                        <div>
                            <input type="password" name="" required>
                            <label for="">비밀번호</label>
                            <i class="showpw fas fa-eye"></i>
                        </div>
                        <div>
                            <input type="password" name="" required>
                            <label for="">비밀번호 확인</label>
                            <i class="showpw fas fa-eye"></i>
                        </div>
                        <div>
                            <input type="text" name="" required>
                            <label for="">이름</label>
                        </div>
                        <div>
                            <input type="text" name="" required>
                            <label for="">닉네임</label>
                        </div>
                        <div>
                            <input type="text" name="" required>
                            <label for="">전화번호</label>
                        </div>

                        <!--

                        <div>
                            <input type="text" name="" required class="postcodify_postcode5 post">
                            <div class="search">
                                <button type="button" class="search_addr">검색</button>
                            </div>
                            <label for="">우편번호</label>
                        </div>
                        <div>
                            <input type="text" name="" required class="postcodify_address address1">
                            <label for="">도로명 주소</label>
                        </div>
                        <div>
                            <input type="text" name="" required class="postcodify_details address2">
                            <label for="">상세주소</label>
                        </div>

                        -->

                        <div>
                            <input type="file" name="" class="imgFile" id="img0" onchange="LoadImg(this,0)">
                            <h1>프로필 사진 </h1>
                            <div class="showImg">
                                <img>
                            </div>
                        </div>

                        <input type="submit" class="login" name="" value="SignUp">
                        <p class="seller">판매자로 가입 하시겠습니까?&nbsp;<a href="#" onclick="toggleActive();">판매자 가입</a></p>
                        <p class="seller">
                            <a href="">로그인</a>
                        </p>
                    </form>
                </div>
            </div>
            <div class="user sell">
                <div class="formBox">
                    <form action="">
                        <h2>판매자회원 로그인</h2>
                        <div>
                            <input type="email" name="" class="email" required>
                            <label for="">Email</label>
                            <button type="button">인증</button>
                            <span>메일 발송</span>
                        </div>
                        <div>
                            <input type="text" name="" required class="code">
                            <label for="">인증번호</label>
                            <span>인증 성공</span>
                        </div>
                        <div>
                            <input type="password" name="" required>
                            <label for="">비밀번호</label>
                            <i class="showpw fas fa-eye"></i>
                        </div>
                        <div>
                            <input type="password" name="" required>
                            <label for="">비밀번호 확인</label>
                            <i class="showpw fas fa-eye"></i>
                        </div>
                        <div>
                            <input type="text" name="" required>
                            <label for="">이름</label>
                        </div>
                        <div>
                            <input type="text" name="" required>
                            <label for="">닉네임</label>
                        </div>
                        <div>
                            <input type="text" name="" required>
                            <label for="">전화번호</label>
                        </div>
                        
                        <!--

                        <div>
                            <input type="text" name="" required class="postcodify_postcode5 post">
                            <div class="search">
                                <button type="button" class="search_addr">검색</button>
                            </div>
                            <label for="">우편번호</label>
                        </div>
                        <div>
                            <input type="text" name="" required class="postcodify_address address1">
                            <label for="">도로명 주소</label>
                        </div>
                        <div>
                            <input type="text" name="" required class="postcodify_details address2">
                            <label for="">상세주소</label>
                        </div>

                        -->
                        
                        <div>
                            <input type="text" name="" required>
                            <label for="">업체명</label>
                        </div>
                        <div>
                            <input type="file" class="postcodify_details license">
                            <label for="">사업자등록증</label>
                        </div>
                        <div>
                            <input type="file" name="" class="imgFile" id="img1" onchange="LoadImg(this,1)">
                            <h1>프로필 사진 </h1>
                            <div class="showImg">
                                <img>
                            </div>
                        </div>

                        <input type="submit" class="login" name="" value="SignUp">

                        <p class="seller">일반회원으로 가입 하시겠습니까?&nbsp;<a href="#" onclick="toggleActive();">일반회원 가입</a></p>
                        <p class="seller">
                            <a href="">로그인</a>
                        </p>
                    </form>
                </div>
                <div class="imgBox"><img src="images/signin2.jpg" alt=""></div>
            </div>
        </div>
    </section>


    <script src="${contextPath}/resources/login/fontawesome.js"></script>
    <!-- jQuery와 postcodify 를 로딩한다. -->
	<script src="https://d1p7wdleee1q2z.cloudfront.net/post/search.min.js">
    </script>
	<script>

		$(function() {
			$(".search_addr").postcodifyPopUp();
		});
	</script>
    <script type="text/javascript">

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
    </script>
</body>
</html>