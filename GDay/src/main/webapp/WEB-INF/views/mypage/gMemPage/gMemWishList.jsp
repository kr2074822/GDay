<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시 리스트</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/wishList.css">

    <!-- icon : font-awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
    
    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- swal2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
  	
  	<style>
  	
  	#wrapper-list {
  		display : flex;
  	}
  	
  	</style>
  	
</head>
<body>
<jsp:include page="../../common/header.jsp"/>

<!-- js 파일 -->
<jsp:include page="orderListTab.jsp"/>

<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

    <div id="container-list-all">
        <div id="list-title">
            <span>위시 리스트</span>
        </div>
				
				<!-- 탭메뉴 -->
			<div class="tabs">	
				<input type="radio" name="tabMenu1" class="tab-radio" id="tab-left">
		    <label for="tabMenu1" class="tab-label tab-l tab-active" >선물</label>
		    <input type="radio" name="tabMenu2" class="tab-radio" id="tab-right">
		    <label for="tabMenu2" class="tab-label tab-r">클래스</label>
			</div>
				
				<div class="wrapper-tab">
				
        <!-- 위시 리스트 : 선물 -->
        <div class="container-orders wrap-tab-l" id="wish-gift">
	         <div class="row container-check"> 
	             <input type="checkbox" name="checkAll" class="check-input">
	             <button id="del-gift" class="btn-delete">선택 선물 삭제</button>
	         </div>
	         <div class="row container-wish">
			         <div class="wish-check"> 
			             <input type="checkbox" name="check" class="check-input" value=""><!-- 위시 번호 -->
			         </div>
	             <div class="wish-card">
	                 <div class="wish-thumb">
	                     <img src="#">
	                 </div>
	                 <div class="wish-text">
	                     <span class="prdtNo wish-hidden">21020423456</span> <!-- 상품 번호 -->
	                     <span class="wish-name">선물명</span><br>
	                     <span class="wish-text-1">100,000원</span><br>
	                     <span class="wish-text-2">#해시태그</span>
	                 </div>
	             </div>
	         </div><!-- container-wish 끝 -->
        </div> <!-- container-orders 끝 -->
			
			    <!-- 위시리스트 : 클래스 -->
        <div class="container-orders wrap-tab-r" id="wishClass">
        	 <div class="row container-check"> 
	             <input type="checkbox" name="checkAll"	class="check-input">
	             <button id="del-class" class="btn-delete">선택 클래스 삭제</button>
	         </div>
	         <div class="row container-wish">
	         		<div class="wish-check"> 
			             <input type="checkbox" name="check" class="check-input" value=""><!-- 위시 번호 -->
			        </div>
	            <div class="wish-card">
	                <div class="wish-thumb">
	                    <img src="#">
	                </div>
	                <div class="wish-text">
	                    <span class="orderPrdtNo wish-hidden">21020423456</span> <!-- 상품 번호 -->
	                    <span class="wish-name">클래스명</span><br>
	                    <span class="wish-text-1">100,000원</span><br>
	                    <span class="wish-text-2">#해시태그</span>
	                </div>
	            </div>
            </div><!-- container-wish 끝 -->
        </div> <!-- container-orders 끝 -->
      
        <!-- 더보기 버튼 : 목록이 더 있을 때만 표시 -->
      	<a href="#" class="btn-more"><i class="fas fa-plus"></i></a>
      </div>
        
   </div><!-- wish-all -->
</div>

</body>
</html>