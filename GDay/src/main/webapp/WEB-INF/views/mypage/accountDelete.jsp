<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

 
	<!-- reset.css -->	
	<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
	
	<!--  -->
	<link rel="stylesheet" href="${contextPath}/resources/css/mypage/accountDelete.css"> <!-- 같은 클래스 공유 -->

<title>Insert title here</title>

	<style>
  	#wrapper {
  		display : flex;
  	}
	</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
			
		<div id="wrapper">
		
			<c:if test="${loginMember.memberGrade == 'B' }">
				<jsp:include page="bMemPage/bMemSidebar.jsp"/>	
			</c:if>
			<c:if test="${loginMember.memberGrade == 'G' }">
				<jsp:include page="gMemPage/gMemSidebar.jsp"/>
			</c:if>
			
			<div class="account_del">
				<div class="title">
					<h1>회원 탈퇴${loginMember.memberGrade }</h1>
				</div>
				<div class="insert_info">
					<div>
						<input type="Email" name="memberEmail" id="email" required>
	                    <label for="">Email</label>
					</div>
					<div>
						<input type="password" name="memberPwd" id="pw" required>
	                    <label for="">Password</label>
					</div>
				</div>
				<div class="btn">
					<button type="button" id="delete">탈퇴</button>
				</div>
			</div>
		</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script>
		$("#delete").on('click', function(){
			
			Swal.fire({
				  title: '탈퇴 하시겠습니까?',
				  text: "You won't be able to revert this!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
				  if (result.isConfirmed) {
					  
					  // ajax 탈퇴
					  $.ajax({
						  url: "${contextPath}/bMember/accountDel",
						  data: ({
							  memberEmail: $("#email").val(),
							  memberPwd: $("#pw").val()
						  }), 
						  type: "post", 
						  success: function(result){
							      console.log("성공");
							  if (result > 0) {
								  Swal.fire({
									  title: '탈퇴 되었습니다',
									  text: '안녕히 가십시오',
									  icon: 'success',
									  confirmButtonText: 'Cool'
									}).then((result) => {
									  if (result.isConfirmed) {
								      	window.location.href = "${contextPath}/"; 
									  }
									})
						      }else{
						    	  Swal.fire(
								    '비밀번호가 틀렸습니다',
								    '올바른 비밀번호를 입력하세요',
								    'error'
								  )
						      }
						  }, 
						  error: function(){
							 console.log("실패");
						  }
					  })
				    
				  }
				})
			
		});
	
	</script>
</body>
</html>