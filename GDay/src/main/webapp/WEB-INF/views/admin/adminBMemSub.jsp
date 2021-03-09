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
	padding: 50px;
}

.container {
	width: 80%;
	margin: 0 auto;
	float: left;
	height: 100%;
	
	margin: 200px 0;
}

#adminBusinessMember li {
	display: inline-block;
	margin: 0 auto;
	background: #fff;
	text-align: center;
	padding-right: 100px;
}

.album-cover {
	width: 200px;
	height: 200px;
	cursor: pointer;
	overflow: hidden; /* 사진이 넘치면 hidden */
	position: relative;
}

.album-info {
	padding: 10px;
}

.album-title {
	font-size: 13px;
}
img{
	width: 100%;
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
						<c:forEach items="${bmList}" var="mb">
							<li>
								<div class="album-item">
									<div class="album-info">
										<p class="album-text">${mb.memberName }</p>
										<p class="album-title">
											승인을 기다리는 회원입니다.<i class="fas fa-caret-down"></i>
										</p><br>
										<div class="album-cover">
											<img class="img" id="${mb.memberNo }" src="${contextPath}/resources/images/licenseImg/${mb.mImgName}">
										</div>
									</div>
								</div>
							</li>
						
						</c:forEach>
					</ul>
				</form>

			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(".img").on("click", function(){
			console.log($(this).attr('id'));
			 location.href = "${contextPath}/admin/adminBMemView/"+$(this).attr('id');
		})
	</script>
</body>

</html>