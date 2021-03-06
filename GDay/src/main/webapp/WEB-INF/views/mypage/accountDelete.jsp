<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css"> <!-- 같은 클래스 공유 -->

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
			
		<div id="wrapper">
			<jsp:include page="bMemPage/bMemSidebar.jsp"/>	
			
			
		</div>
</body>
</html>