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
    <link rel="stylesheet" href="${contextPath}/resources/css/magazine/magazine.css">
    <title>Document</title>
</head>
<body>
    <section class="magazine_wrapper">
    	<h1>Magazine</h1>
		<c:if test="${empty mList }">
			<h1>존재하는 게시글이 없습니다.</h1>
		</c:if>
		
		<c:if test="${!empty mList }">
			<c:forEach var="magazine" items="${mList}" varStatus="vs">

		        <div class="card">
		            <div class="imgBx" data-text="제목">
			            <c:forEach items="${mThumbList }" var="imgList">
							<c:if test="${imgList.mgzNo == magazine.mgzNo}">
			                	<img src="${contextPath}${imgList.imgPath}/${imgList.imgName}" alt="">
			                </c:if>
						</c:forEach>
		            </div>
		            <div class="content">
		            
						
		                <div>
		                    <h3>제목 ${magazine.mgzTitle}${magazine.mgzNo}</h3>
		                    <p>
		                    	${magazine.mgzContent }
		                        Lorem ipsum dolor sit amet, 
		                    </p>
		                    <a href="">Read More</a>
		                </div>
		            </div>
		        </div>
			</c:forEach>
		</c:if>
        
    </section>
    
    
    <jsp:include page="../common/footer.jsp"/>
    <script>
    
    	var currentPage = 0;
    	currentPage = '${pInfo.currentPage}';
    	currentPage = Number(currentPage);
    	
    	var maxPage = 0;
    	maxPage = '${pInfo.maxPage}';
    	maxPage = Number(maxPage);
    	
    	console.log(currentPage)
	  	//Javascript
	    var count = 0;
	    //스크롤 바닥 감지
	    window.onscroll = function(e) {
	        //추가되는 임시 콘텐츠
	        //window height + window scrollY 값이 document height보다 클 경우,
	        if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	        	currentPage +=1 ;
	        	
	        	if (currentPage <= maxPage) {
		        	
			    	console.log(currentPage)
		        	$.ajax({
		        		url: "${contextPath}/magazine/paging",
		        		data:{
		        			"cp": currentPage
		        		},
		        		success: function(result){
		        			console.log('성공')
		        			/* 
		        			console.log('${mThumbList}');
		        			
		        			console.log(result);
		        			console.log('${pInfo.maxPage}')
		        			console.log(result.mList[0].mgzNo) */
		        			for(let i = 0; i < result.mList.length; i++ ){
		        			console.log(result.mThumbList[i])
		        				
			        			var addContent = 
			        	            '<div class="card">'+
			        	                    '<div class="imgBx" data-text="제목">'+
			        	                        '<img src='+ result.mThumbList[i].imgPath + '/' + result.mThumbList[i].imgName +' alt="">'+
			        	                    '</div>'+
			        	                    '<div class="content">'+
			        	                     '   <div>'+
			        	                      '      <h3>제목' + result.mList[i].mgzTitle + '</h3>'+
			        	                       '     <p>'+ result.mList[i].mgzNo+' </p>'+
			        	                   '         <a href="">Read More</a>'+
			        	                    '    </div>'+
			        	                   ' </div>'+
			        	                '</div>';
			        	            //article에 추가되는 콘텐츠를 append
			        	            $('.magazine_wrapper').append(addContent);
			        			
		        			}

		        		},
		        		error: function(){
		        			console.log('실패')
		        		}
		        		
		        	})
		        	
	        	}
	        	
	            //실행할 로직 (콘텐츠 추가)
	            count++;
		    	
	        }
	    };
    </script>
</body>
</html>