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
                <ul>
                	<c:forEach var="message" items="${msgList}">
	                    <li>
	                        <div class="msg_item">
	                            <div class="top">
	                            	<c:if test="${message.msgStatus == 1}">
	                                	<span class="status">도착</span>
	                            	</c:if>
	                            	<c:if test="${message.msgStatus == 0}">
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
                    <textarea name="" id="" cols="10" rows="5"></textarea>
                    <button>전송</button>
                </div>
            </div>
        </div>
    </section>

    <script src="${contextPath}/resources/js/fontawesome.js"></script>
    <script>
        // 팝업
        const popup = document.getElementById('popup');
        console.log($(".msg_item"));
        $(".msg_item").on('click', function(){
            console.log($(this));
            $("#popup").addClass('active')
            

        });
        function popupToggle(){
            const popup = document.getElementById('popup');
            popup.classList.toggle('active')
        }
    </script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>