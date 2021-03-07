<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
</head>
<body>
	
	<div class="headerTitle">
		<h2> 신고 하기 </h2>
	</div>
	<div>
		<h3>신고 내용</h3>
		<div>
			<form method="post" action="#">
				<label><input type="radio" name="reportName" value="C">욕설</label>
				<label><input type="radio" name="reportName" value="F">허위 게시물</label>
				<label><input type="radio" name="reportName" value="D">사기</label>
				
				<button type="submit" id="reportAction">신고하기</button>
				<button type="button" class="cancel" onclick="window.close();">취소</button>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		/* $(".cancel").on("click", function(){
			self.close();
			window.close();
		}) */
		
		/* function close(){
			e.preventDefault();
			self.close();
			window.close();
		} */
	</script>

</body>
</html>