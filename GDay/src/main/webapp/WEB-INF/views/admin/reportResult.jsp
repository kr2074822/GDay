<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<c:if test = "${result==1}">
				/* opener.parent.location.reload(); */
				opener.parent.history.back();
				window.close();
				
			</c:if>
			
			/* <c:if test="${product.prdtType == C}">
				window.location.href="${contextPath}/gClass/"+prdtNo;
			</c:if> */
			
			window.open("about:blank", "_self").close();
			
		});
	</script> 
</body>
</html>