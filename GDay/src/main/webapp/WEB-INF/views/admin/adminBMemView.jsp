<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리</title>

<link rel="stylesheet" href="reset.css">

<style>
div {
	padding: 10px;
}

.bMemStandView{
	padding: 30px;
}

#businessView {
	margin: auto;
	padding: 0 auto;
}

.header-business {
	width: 100%;
	padding-top: 8px;
	margin-bottom: 2rem;
}

.form-business {
	font-weight: bold;
}

hr {
	border: 2px solid #FE929F;
	width: 100%;
}

.container {
	width: 65%;
	margin: 0 auto;
	float: left;
	height: 100%;
	padding-left: 7%;
	
	margin: 100px 0;
}

.content-body{
	width: 65%;
	margin: 0 auto;
	float: left;
	height: 100%;
	padding-left: 7%;
}

button{
	margin: 10px;
}

img{
	width: 200px; 
	height: 200px; 
	cursor: pointer;
	display: block;
	margin: 0 auto;
}

#approval, .btn-primary{
	background-color: #FE929F;
	color: white;
	height: 25px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

#none, .btn-secondary {
	background-color: darkgray;
	color: white;
	height: 25px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

/* 모달 스타일 */
.modal-header, .modal-body{
	border-bottom: none;
	text-align: center;
	margin: 0 auto;
	padding: 30px;
}

#modal{
	display:none;
	z-index: 1;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
}

#modal-container{
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	width: 40%;
}

.modal-footer{
	border-top: none;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="adminSidebar.jsp" />

	<div class="container">
		<div id="container-tb">
			<div>
				<h3 style="font-weight: bold;">비즈니스 회원 신청</h3>
			</div>
			<div class="bMemStandView">
				<form action="#" method="POST" id="businessView">
					<div class="header-business">
						<h1><span class="form-business">비즈니스 회원 신청자</span></h1>
						<hr>
					</div>
					<div class="content-body">
						<div class="body-business">
							<p>성명: ${member.memberName }</p>
							<p>업체명: ${bmemShop}</p>
							<p>주소: ${member.memberAddress }</p>
							<p>연락처: ${member.memberPhone}</p>
						</div>
						<br><br><br>
						<div class="registration">
							<img class="img" src="${contextPath}/resources/images/licenseImg/${member.mImgName}">
						</div>
						<div id="business-Application" style="text-align: center; margin: 0 auto; padding: 20px;">
							<button type="button" id="approval">비즈니스 회원 승인</button>
							<button type="button" id="none" data-toggle="modal">비즈니스 회원 부적합</button>
						</div>
					</div>

					<!-- 부적합 판정 모달창 -->
					<div class="modal" id="modal">
						<div class="modal fade" id="modal-container" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									
									<div class="modal-header">
										<h3>비즈니스 회원 부적합 사유</h3>
									</div>
									
									<div class="modal-body">
										<select name="business-modal" id="business-modal">
											<option>사진이 잘 보이지 않음.</option>
											<option>사유 부적합</option>
										</select>
										<div class="btn-area">
											<button type="button" class="btn btn-primary" id="deny">부적합</button>
											<button type="button" class="btn btn-secondary close"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
									
									<div class="modal-footer"></div>
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script>
	/* 이미지 클릭 시 새 창으로 열기 */
	var img = document.getElementsByClassName('img'); 
	for (var x = 0; x < img.length; x++) { 
		img.item(x).onclick = function() {window.open(this.src)}; 
	}
	
	/* 모달 영역 */
	$("#none").on("click", function(){
		$("#modal").show();
	})
	
	$(".close").on('click', function(){
		$("#modal").hide();
	})
	
	
	//-------------------------------------------------------\
	
	
	var memberNo = "${member.memberNo }";
	$("#approval").on('click', function(){
		$.ajax({
			url: "${contextPath}/admin/approval",
			data:{
				memberNo: memberNo
			},
			type: "post",
			success: function(result){
				console.log("성공");
				if (result > 0) {
					Swal.fire({
						  icon: 'success',
						  title: '승인되었습니다.',
					}).then((result)=> {
						window.location.href = "${contextPath}/admin/adminBMemSub"
						
					});
					
				}
			},
			error: function(){
				console.log("실패");
			}
		})
	})
	
	
	$("#deny").on('click', function(){
		$.ajax({
			url: "${contextPath}/admin/deny",
			data:{
				memberNo: memberNo
			},
			type: "post",
			success: function(result){
				console.log("성공");
				if (result > 0) {
					Swal.fire({
						  icon: 'success',
						  title: '부적합으로 처리했습니다..',
					}).then((result)=> {
						window.location.href = "${contextPath}/admin/adminBMemSub"
						
					});
					
				}
			},
			error: function(){
				console.log("실패");
			}
		})
	})
	
	
	</script>
</body>
</html>