<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/message/message.css"/>
<title>Insert title here</title>
</head>
	<jsp:include page="../common/header.jsp"/>
<body>
	<section>
        <div class="message_wrapper">
            <div class="msg_title">
                <h1>쪽지</h1>
            </div>
            <div class="msg_list">
	            <c:if test="${empty msgList }">
					<h1>받은 쪽지가 없습니다.</h1>
				</c:if>
	            <ul>
                	<c:forEach var="message" items="${msgList}">
		                    <li>
		                        <div class="msg_item">
		                            <div class="top">
		                            	<c:if test="${message.msgStatus == 0}">
		                                	<span class="status">도착</span>
		                            	</c:if> 
		                            	<c:if test="${message.msgStatus == 1}">
		                                	<span class="read"></span>
		                            	</c:if>
		                                <span class="time">
		                                	<fmt:formatDate value="${message.msgDate}" pattern="hh:mm"/>
		                                </span>
		                            </div>
		                            <div class="bottom">
		                                <h1><span>${message.memNick }</span>의 메시지가 도착했어요!</h1>
		                                <p>내용을 확인하시려면 클릭하세요</p>
		                            </div>
		                        </div>
		                        <input type="hidden" value=" ${message.you}">
	                    	</li>
                	</c:forEach>
	            </ul>
            </div>
        </div>

        <div class="popup" id="popup">
            <div class="chat_wrapper">
                <i class="fas fa-times" onclick="popupToggle();"></i>
                <h1><span>영주</span>님과의 대화</h1>
                <ul class="msg_chat">
                    <li class="you">
                        <span>시간</span>
                        <p>
                            안녕하세요ddddddddd
                            dddddddddddddddddddddddddd
                            ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
                        </p>
                    </li>
                    <li class="i">
                        <span>시간</span>
                        <p>
                            반갑습니다
                        </p>
                    </li>
                    <li class="i">
                        <span>12:12</span>
                        <p>
                            반갑습니다
                        </p>
                    </li>
                    <li class="i">
                        <span>시간</span>
                        <p>
                            반갑습니다
                        </p>
                    </li>
                </ul>
                <div class="input_form">
                    <textarea name="" id="myMsg" cols="10" rows="5"></textarea>
                    <button id="send">전송</button>
                </div>
            </div>
        </div>
    </section>

    <script src="${contextPath}/resources/js/fontawesome.js"></script>
    <script>
    	function selectMessage(getter){
    		 $.ajax({
             	url: "${contextPath}/message/msgChat", 
             	data: {
             		getter: getter
             	},
             	success: function(result){
             		console.log("성공");
             		$(".msg_chat").html("");
             		console.log(result[0].MSG_CONTENT);
             		
             		for(let j = 0; j <result.length; j++){
 						
 						if (result[j].GETTER == "${loginMember.memberNo}") {
 	    					var li = $("<li>").addClass("i");
 	    					var span = $("<span>").text(result[j].MSG_DATE)
 	    					var p = $("<p>").text(result[j].MSG_CONTENT)
 	    					
 	    					li.append(span).append(p)
     						
 						}else{
 							
 							var li = $("<li>").addClass("you");
 	    					var span = $("<span>").text(result[j].MSG_DATE)
 	    					var p = $("<p>").text(result[j].MSG_CONTENT)
 	    					
 	    					li.append(span).append(p)
 						}

     					$(".msg_chat").append(li);
     					console.log(li)
 					}    
             		 
             	},
             	error: function(){
             		console.log("실패");
             	}
             	
             });
    	}
    
    
        // 팝업
        const popup = document.getElementById('popup');
        var getterNo =0;
        console.log($(".msg_item"));
        $(".msg_item").on('click', function(){
            console.log($(this).next().val());
            getterNo = $(this).next().val()
            console.log("${loginMember.memberNo}")
            
            
           selectMessage(getterNo) ;	
           console.log($(this).children().eq(0).children().eq(0))
           $(this).children().eq(0).children().eq(0).removeClass("status");
           $(this).children().eq(0).children().eq(0).text(" ");
           $(this).children().eq(0).children().eq(0).addClass("read");

            $("#popup").addClass('active')
        });
        
        function popupToggle(){
            const popup = document.getElementById('popup');
            
            popup.classList.toggle('active')
        }
        
        $("#send").on('click', function(){
       		console.log($("#myMsg").val())
       		console.log(getterNo)
        	
        	$.ajax({
            	url: "${contextPath}/message/sendMsg", 
            	data: {
            		myMsg: $("#myMsg").val(),
            		getter: getterNo
            	},
            	success: function(result){
            		console.log("성공");
            		$("#myMsg").val("")
            		
            		selectMessage(getterNo);
            		
            	},
            	error: function(){
            		console.log("실패");
            	}
            	
            });
        	
        	
        });
        
        

    </script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>