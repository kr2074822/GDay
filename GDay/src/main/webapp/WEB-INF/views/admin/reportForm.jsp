<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
	<link rel="stylesheet" href="reset.css" type="text/css">
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
		div{
			margin: 0 auto;
			padding: 4px;
		}
	
		h3{
			font-weight: bold;
		}
		
		#report{
			margin: 0 auto;
			width: 30%;
			text-align: center;
			padding-left: 5px;
		}
		
		.reportAction{
			height: 25px;
			border: none;
			cursor: pointer;
			border-radius: 5px;
			background-color: #FE929F;
			color: white;
		}
		
		.cancel{
			height: 25px;
			border: none;
			cursor: pointer;
			border-radius: 5px;
		}
		
	</style>
</head>
<body>
	
	<div class="headerTitle">
		<h2> 신고 하기</h2>
	</div>
	<hr>
	<div class="bodyContent">
		<h3>신고 내용</h3>
		<div>
			<form method="post" action="report" class="form-report">
				<label><input type="radio" name="reportType" value="C">욕설</label><br>
				<label><input type="radio" name="reportType" value="F">허위 게시물</label><br>
				<label><input type="radio" name="reportType" value="D">사기</label><br><br>
				
				<input type="hidden" value="${prdtNo}" name="prdtNo">
				<button type="submit" class="reportAction" id="report" >신고하기</button>
				<button type="button" class="cancel"  id="report" onclick="window.close();">취소</button>
			</form>
		</div>
	</div>
</body>
</html>