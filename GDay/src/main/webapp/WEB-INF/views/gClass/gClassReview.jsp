<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 리뷰</title>
<script src="https://kit.fontawesome.com/955b087c12.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/gClass/gClassReview.css">
</head>
<body>

		<table class="table table-hover table-striped" id="list-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>별점</th>
						<th colspan="5">제목</th>
						<th>아이디</th>
						<th>날짜</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty bList}">
						<tr>
							<td colspan="10">첫 후기를 남겨주세요!</td>
						</tr>
					</c:if>

					<c:if test="${!empty bList}">
						<c:forEach var="board" items="${bList}" varStatus="vs">

							<tr>
								<td>${board.boardNo}</td>
								<td>${board.categoryName}</td>
								<td class="boardTitle">
									<%---------------- 썸네일 부분 -----------------%> 
									<c:forEach items="${thList}" var="th">
									
										<c:if test="${th.parentBoardNo == board.boardNo}">
										
											<img src="${contextPath}${th.filePath}/${th.fileName}">
																<%-- /spring /resources/uploadImages/20123~.jpg --%>										
										</c:if>
									</c:forEach>
									${board.boardTitle}
								</td>

								<td>${board.memberId}</td>
								<td>${board.readCount}</td>
								<td>
									<%-- 날짜 출력 모양 지정 --%>
									<fmt:formatDate var="createDate" value="${board.boardCreateDate }" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/> 
									<c:choose>
										<c:when test="${createDate != now}">
											${createDate }
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${board.boardCreateDate }" pattern="HH:mm"/>
										</c:otherwise>
									</c:choose>
								</td>

							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
<script>

</script>
</body>
</html>