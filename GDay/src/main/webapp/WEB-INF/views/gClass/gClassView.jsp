<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 상세 페이지</title>
<script src="https://kit.fontawesome.com/955b087c12.js" crossorigin="anonymous"></script>
<style>
body {
	display: flex;
	justify-content: center;
}

.wrapper {
	width: 70%;
}

.wrapper .flex-center {
	display: flex;
	box-sizing: border-box;
	justify-content: center;
}

.wrapper .flex-center .thumbnailBx {
	width: 500px;
	height: 300px;
	border: 1px solid black;
}

.wrapper .flex-center .productInfo {
	margin-left: 50px;
	width: 500px;
}

.wrapper .flex-around {
	display: flex;
	justify-content: space-around;
}

.wrapper .flex-between {
	display: flex;
	justify-content: space-between;
}

.row {
	margin-top: 20px;
	margin-bottom: 20px;	
}

.align-right {
	text-align: right;
	font-size: small;
}

.btn {
	background-color:#FE929F;
	color: white;
	border-radius: 10px;
	border-color: white;
	width: 49%;
	height: 35px;
	margin-bottom: 10px;
}

.btn2 { 
	background-color: white;
	color: #FE929F;
	border-color: #FE929F;
	border-radius: 10px;
	width: 100%;
	height: 35px;
}

i {
	font-size: 35px;
	color: #FE929F;
}

.box-1 {

}
.box-2 {
	margin-bottom: 50px;
}
.box-3 {
	width:100%; 
}

.option {
	
}

</style>

</head>
<body>

	<div class="wrapper">
		<div class="flex-center">
			<div class="box-1">
				<div class="thumbnailBx">
					<img src="" />
				</div>
				<div class="row"><i class="fas fa-star"></i></div>
			</div>
			<div class="box-2">
				<div class="productInfo">
					<div class="info-Row flex-around">
						<h1>상품명</h1>
						<span><i class="far fa-comments"></i></span>
					</div>
					<div class="productOption">
						<div class="row">가격</div>
						<div class="row">옵션</div>
						<div class="row">선택상품</div>
					</div>
					<hr>
					<div class="align-right">총 개수 1개</div>
					<div class="row flex-between">총 상품 금액
						<span style="font-size: 30px">12,000원</span>
					</div>
					<div class="row">
						<button class="btn">장바구니에 넣기</button>
						<button class="btn">위시리스트로 등록하기</button>
						<button class="btn2">주문하기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="box-3">
			<span>상품 설명</span>
			<span>상품후기</span>
			<span>배송/교환/반품</span>
		</div>
		<div class=""></div>
		<div class=""></div>
	</div>


</body>
</html>