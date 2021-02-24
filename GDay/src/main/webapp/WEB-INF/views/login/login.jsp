<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <form action="">
                        <h2>일반회원 로그인</h2>
                        <div>
                            <input type="text" name="" required>
                            <label for="">Id</label>
                        </div>
                        <div>
                            <input type="password" name="" required>
                            <label for="">Password</label>
                            <i class="showpw fas fa-eye"></i>
                        </div>

                        <div class="chk_wrap">
                            <input type="checkbox" id="saveGmemId">
                            <label for="saveGmemId"> 아이디 저장</label>

                            <input type="checkbox" id="gmemAutoLogin" disabled>
                            <label for="gmemAutoLogin" > 자동 로그인</label>
                        </div>
                        <input type="submit" class="login" name="" value="Login">
                        <a href="javascript:klogin();" id="kakao-login-btn">
                            <i class="fas fa-comment"></i>
                        </a>
                         
                        <p class="seller">판매자로 로그인 하시겠습니까?&nbsp;<a href="#" onclick="toggleActive();">판매자 전환</a></p>
                        <p class="seller">
                            <a href="">회원가입</a>
                        </p>
                        <div class="link">
                            <a href="">ID/PW 찾기</a>
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="user sell">
                <div class="formBox">
                    <form action="">
                        <h2>판매자회원 로그인</h2>
                        <div>
                            <input type="text" name="" required>
                            <label for="">Id</label>
                        </div>
                        <div>
                            <input type="password" name="" required>
                            <label for="">Password</label>
                        </div>
                        
                        <div class="chk_wrap">
                            <input type="checkbox" id="saveBmemId">
                            <label for="saveBmemId"> 아이디 저장</label>
                            
                            <input type="checkbox" id="bmemAutoLogin" disabled>
                            <label for="bmemAutoLogin"> 자동 로그인</label>
                        </div>
                        <input type="submit" class="login" name="" value="Login">

                        <p class="seller">일반회원으로 로그인 하시겠습니까?&nbsp;<a href="#" onclick="toggleActive();">일반회원 전환</a></p>
                        <p class="seller">
                            <a href="">회원가입</a><br>
                            <div class="link">
                                <a href="">ID/PW 찾기</a>
                                <a href=""><i class="fas fa-home"></i></a>
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
        $("#saveGmemId").click(function() {
            var condition = $("#gmemAutoLogin").prop( 'disabled' );
            $("#gmemAutoLogin").prop("disabled", condition ? false : true); 
            if($("#saveGmemId").prop('checked') == false){
                $("#gmemAutoLogin").prop('checked', false)
            }
        });

        /* 판매 아이디 저장 및 자동로그인  */
        $("#saveBmemId").click(function() {
            var condition = $("#bmemAutoLogin").prop( 'disabled' );
            $("#bmemAutoLogin").prop("disabled", condition ? false : true); 
            if($("#saveBmemId").prop('checked') == false){
                $("#bmemAutoLogin").prop('checked', false)
            }
        });

        /* 비밀번호 표시 */
        $(".showpw").on('click', function(){
            $(this).toggleClass("fa-eye-slash");
            if($(this).hasClass("fa-eye-slash")){
                $(this).parent().children().first().attr('type', 'text');
            }else{
                $(this).parent().children().first().attr('type', 'password');
            }
        });
        
        /* 카카오 로그인 */
        window.Kakao.init('8035352f3860f77b021b6c64824a3b93');
        function klogin() {
            window.Kakao.Auth.login({
                scope:'profile, account_email, birthday, age_range',
                success: function(authObj) {
                    console.log(authObj);
                    window.Kakao.API.request({
                        url: '/v2/user/me',
                            success: res => {
                            const kakao_account = res.kakao_account
                            console.log(kakao_account);
                        }
                    });
                }
            });
        }
    </script>
</body>
</html>