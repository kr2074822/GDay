<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		swal({
			icon: "success",
			title: "신고 성공",
			text: "신고되었습니다."
		}).then(function(){
			window.open("about:blank", "_self").close();
		});
	</script> 
</body>
</html>