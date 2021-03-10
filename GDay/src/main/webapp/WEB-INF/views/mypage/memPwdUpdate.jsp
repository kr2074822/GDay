<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>마이페이지 비밀번호 변경</title>

	<!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

 
	<!-- reset.css -->	
	<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
	
	<!--  -->
	<link rel="stylesheet" href="${contextPath}/resources/css/mypage/memPwdUpdate.css?ver=1.2"> <!-- 같은 클래스 공유 -->


	<style>
  	#wrapper {
  		display : flex;
  	}
	</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
			
		<div id="wrapper">
		
			<c:if test="${loginMember.memberGrade == 'B' || loginMember.memberGrade == 'U'}">
				<jsp:include page="bMemPage/bMemSidebar.jsp"/>	
			</c:if>
			<c:if test="${loginMember.memberGrade == 'G' }">
				<jsp:include page="gMemPage/gMemSidebar.jsp"/>
			</c:if>
			
			<div class="update-cover">
			
				<div class="title">
					<h1>비밀번호 변경</h1>
				</div>
				<form action="${contextPath}/gMember/updateMemPwd" method="POST" onsubmit="return pwdValidate()">
					<div class="insert_info">
						<div>
							<input type="Password" name="presentPwd" id="presentPwd" required>
		          <label for="">Password</label>
		          <i class="showpw show fas fa-eye see"></i>
	            <i class="showpw none fas fa-eye-slash none"></i>          
						</div>
						<div>
							<input type="password" name="newPw" id="newPw1" required>
		          <label for="">New Password</label>
		          <i class="showpw show fas fa-eye see"></i>
	            <i class="showpw none fas fa-eye-slash none"></i>
						</div>
						<div>
							<input type="password" name="newPw2" id="newPw2" required>
		      		<label for="">New Password Check</label>
		          <i class="showpw show fas fa-eye see"></i>
	            <i class="showpw none fas fa-eye-slash none"></i>
						</div>
						<div class="input-hidden"><span id="checkPwd"></span></div>
					</div>
					<div class="btn">
						<button type="submit" id="update-btn">변경</button>
				</div>
				</form>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>

	// 각 유효성 검사 결과를 저장할 객체
	var chgPwdCheck = {
		"presentPwd" : false,
		"newPw1" : false,
		"newPw2" : false,
	}; 
$(function(){
	
    /* 비밀번호 표시 */
    $(".show").on('click', function(){
        console.log($(this).next())
        $(this).css("display",'none');
        $(this).parent().children().first().attr('type', 'password');
        $(this).next().css("display",'inline-block');
    });
    $(".none").on('click', function(){
        console.log($(".show"))
        $(this).css("display",'none');
        $(this).parent().children().first().attr('type', 'text');
        $(this).prev().css("display",'inline-block');
    });
    

    // 회원 비밀번호 유효성 및 일치 검사
	$("#newPw1, #newPw2").on("input paste",function() {
		//영어 대,소문자 + 숫자, 총 6~12글자
		var regExp = /^[A-Za-z0-9]{6,12}$/;

		console.log($("#newPw1").val())
		console.log($("#newPw2").val())
		// 비밀번호1 유효성 검사
		if (!regExp.test($("#newPw1").val())) {
			chgPwdCheck.newPw1 = false;
			$("#checkPwd").text("비밀번호는 영어 대,소문자 + 숫자, 총 6~12글자").css("color", "red");
			$("#checkPwd").parent().show();
		} else {
			chgPwdCheck.newPw1 = true;
			$("#checkPwd").text("유효한 비밀번호입니다.").css("color", "green");
		}
		
		// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
		if (!chgPwdCheck.newPw1 && $("#newPw2").val().length > 0) {
			swal.fire({icon:"warning", html:"<h1>유효한 새 비밀번호를<br>먼저 입력해 주세요.</h1>", confirmButtonColor: "#54b39E"});
			$("#newPw2").val("");
			$("#newPw1").focus();
		} else if (chgPwdCheck.newPw1 && $("#newPw2").val().length > 0) {
				if ($("#newPw1").val() != $("#newPw2").val()) {
					$("#checkPwd").text("새 비밀번호가  일치하지 않습니다.").css("color", "red")
					chgPwdCheck.newPw2 = false;
					} else {
					$("#checkPwd").text("새 비밀번호 일치 확인 완료😉 ").css("color", "green")
					chgPwdCheck.newPw2 = true;
	        console.log(chgPwdCheck.newPw1);
	        console.log(chgPwdCheck.newPw2);
			}
		}
	});
    
});
    
  function pwdValidate(){
	  if($("#presentPwd").val().trim().length == 0){
		  chgPwdCheck.presentPwd = false;
		  $("#presentPwd").focus();
	  } else {
		  chgPwdCheck.presentPwd = true;
	  }
	  
	  for(var key in chgPwdCheck){
		  if(!chgPwdCheck[key]){
			  var str;
			  switch(key){
			  case "presentPwd" : str="<h1>현재 비밀번호를 "; break;
			  case "newPw1" : str="<h1>새 비밀번호를 "; break;
			  case "newPw2" : str="<h1>새 비밀번호 확인 일치 여부를 "; break;
			  }
				console.log(key);
				
			  swal.fire({
				  icon: "warning",
				  html: str+" 확인하세요.</h1>",
					confirmButtonColor: "#54b39E"
			  });
			  
			  return false;
		  }
	  }
	  console.log("유효성 검사 완료");
  }
    
</script>
</body>
