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
    
    <link rel="stylesheet" href="${contextPath}/resources/css/magazine/magazineInsert.css">
    <link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
    <title>Document</title>
</head>
<body>

    <!-- summernote 사용 시 필요한 js 파일 추가 -->
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>

    <header></header>

    <section>
        <div class="magazine_wrapper">
            <h1>매거진 등록</h1>
            <div class="magazine_form">
                <form action="${contextPath}/magazine/magazineInsert" method="POST" enctype="multipart/form-data" role="form">
                    <div class="magazine_title">
                        <input type="text" placeholder="제목을 입력해주세요" name="mgzTitle">
                        <div class="thumbnail">
                            <div class="boardRow">
                                <div id="fileArea">
                                    <input type="file" id="img0" name="images" onchange="LoadImg(this,0)"> 
                                </div>
                            </div>
                            <h1>썸네일을 등록해주세요</h1>
                            <div class="boardImg">
                                <img src="" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="editor">
                        <textarea class="form-control" id="summernote" name="mgzContent" rows="10" style="resize: none;"></textarea>
                    </div>
                    <div class="buttons">
                        <button type="submit" class="submit">등록</button>
                        <button type="button" class="cancel">취소</button>
                    </div>
                </form>
            </div>


        </div>
    </section>
    <script>
             
         // 썸네일을 보여주는 함수
		function LoadImg(value, num) {
			if(value.files && value.files[0]){
                var reader = new FileReader();
                reader.readAsDataURL(value.files[0]);
                reader.onload = function(e){
                    $(".boardImg").eq(num).children("img").attr("src", e.target.result);
                }
			}
		}
       
        
	    // 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function(){
			$("#fileArea").hide(); 
			$(".boardImg").on("click", function(){ 
				var index = $(".boardImg").index(this);
				$("#img" + index).click();
			});
		});
	    
    </script>
</body>
</html>