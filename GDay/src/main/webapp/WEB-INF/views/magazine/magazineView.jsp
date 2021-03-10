<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<jsp:include page="../common/header.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


	<!-- reset.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    
    <!-- magazine.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/magazine/magazineView.css?ver=1.0">
    <title>Document</title>
</head>
<body>
   <section>
        <div class="magazine_wrapper">
            <div class="title">
                <h1>매거진</h1>
                <a href="list">
                    <span>목록으로</span>
                </a>
            </div>
            <div class="magaine_title">
                <h1>${magazine.mgzTitle }</h1>
                <p>
                    <i class="fas fa-eye"></i>&nbsp;<span class="read_cnt">${magazine.mgzReadCnt }</span>
                    <i class="fas fa-clock"></i>&nbsp;<span class="date">${magazine.mgzCreateDt }</span>
                </p>
            </div>
            <div class="magazine_content">
            	<img alt="" src="${contextPath}${thumbnail.imgPath}/${thumbnail.imgName}">
				${magazine.mgzContent }
            </div>
        </div>
    </section>
    <jsp:include page="../common/footer.jsp"/>
    <script src="${contextPath}/resources/js/fontawesome.js"></script>
</body>
</html>