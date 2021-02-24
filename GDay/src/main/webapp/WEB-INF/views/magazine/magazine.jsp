<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- reset.css -->
    <link rel="stylesheet" href="${contextPath}/resources/common/reset.css">
    
    <!-- magazine.css -->
    <link rel="stylesheet" href="${contextPath}/resources/magazine/magazine.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="imgBx" data-text="제목">
                <img src="images/gift1.jpg" alt="">
            </div>
            <div class="content">
                <div>
                    <h3>제목</h3>
                    <p>
                        Lorem ipsum dolor sit amet, 
                        consectetur adipiscing elit, 
                        sed do eiusmod tempor incididunt
                        ut labore et dolore magna aliqua.
                        Ut enim ad minim veniam
                    </p>
                    <a href="">Read More</a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="imgBx" data-text="제목">
                <img src="images/gift2.jpg" alt="">
            </div>
            <div class="content">
                <div>
                    <h3>제목</h3>
                    <p>
                        Lorem ipsum dolor sit amet, 
                        consectetur adipiscing elit, 
                        sed do eiusmod tempor incididunt
                    </p>
                    <a href="">Read More</a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="imgBx" data-text="제목">
                <img src="images/gift3.jpeg" alt="">
            </div>
            <div class="content">
                <div>
                    <h3>제목</h3>
                    <p>
                        Lorem ipsum dolor sit amet, 
                        consectetur adipiscing elit, 
                        sed do eiusmod tempor incididunt
                    </p>
                    <a href="">Read More</a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="imgBx" data-text="제목">
                <img src="images/profile.jpg" alt="">
            </div>
            <div class="content">
                <div>
                    <h3>제목</h3>
                    <p>
                        Lorem ipsum dolor sit amet, 
                        consectetur adipiscing elit, 
                        sed do eiusmod tempor incididunt
                    </p>
                    <a href="">Read More</a>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>