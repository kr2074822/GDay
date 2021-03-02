<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리</title>

<link rel="stylesheet" href="reset.css">
<script src="https://kit.fontawesome.com/46543a951e.js" crossorigin="anonymous"></script>

<style>
div {
	padding: 15%;
}

#container-tb{
	padding: 20px;
}

.container {
	width: 80%;
	margin: 0 auto;
	float: left;
	height: 100%;
	
	margin: 200px 0;
}

button {
	height: 25px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	background-color: #FE929F;
	color: white;
}

ul {
	overflow: hidden;
}

#adminBusinessMember li {
	float: left;
	margin: 10px;
	width: calc(25% - 20px);
	background: #fff;
	text-align: center;
}

.album-cover {
	width: 200px;
	height: 200px;
	cursor: pointer;
}

.album-info {
	padding: 20px;
}

.album-title {
	font-size: 13px;
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
			<div>
				<form action="#" method="POST" id="adminBusinessMember">
					<ul>
						<li>
							<div class="album-item">
								<div class="album-info">
									<p class="album-text">비즈니스 회원 신청자</p>
									<p class="album-title">
										승인을 기다리는 회원입니다.<i class="fas fa-caret-down"></i>
									</p>
									<div class="album-cover">
										<img src="http://www.wellnesstea.co.kr/shopimages/yurim00/0220000000393.jpg">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="album-item">
								<div class="album-info">
									<p class="album-text">비즈니스 회원 신청자</p>
									<p class="album-title">
										승인을 기다리는 회원입니다.<i class="fas fa-caret-down"></i>
									</p>
									<div class="album-cover">
										<img src="http://www.wellnesstea.co.kr/shopimages/yurim00/0220000000393.jpg">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="album-item">
								<div class="album-info">
									<p class="album-text">비즈니스 회원 신청자</p>
									<p class="album-title">
										승인을 기다리는 회원입니다.<i class="fas fa-caret-down"></i>
									</p>
									<div class="album-cover">
										<img src="http://www.wellnesstea.co.kr/shopimages/yurim00/0220000000393.jpg">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="album-item">
								<div class="album-info">
									<p class="album-text">비즈니스 회원 신청자</p>
									<p class="album-title">
										승인을 기다리는 회원입니다.<i class="fas fa-caret-down"></i>
									</p>
									<div class="album-cover">
										<img src="http://www.wellnesstea.co.kr/shopimages/yurim00/0220000000393.jpg">
									</div>
								</div>
							</div>
						</li>
					</ul>
				</form>

			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$("img").on("click", function(){
			location.href = "${contextPath}/admin/adminBMemView"
		})
	</script>
</body>

</html>