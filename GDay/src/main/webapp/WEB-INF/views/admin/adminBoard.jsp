<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 게시글 관리</title>
<link rel="stylesheet" href="reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminPage.css">

<style>
td{
	cursor:pointer;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="adminSidebar.jsp" />

	<div class="container">
		<div id="container-tb">
			<div>
				<h3>게시글 관리</h3>
				<div id="adminBoard-search">
<!-- 					<select name="board-se" id="board-se">
						<option class="boardOp" value="none">-- 게시글 --</option>					
						<option class="boardOp" value="C">선물</option>
						<option class="boardOp" value="G">클래스</option>
					</select>
					<select name="board-sea" id="board-sea">
						<option class="boardAp" value="none">-- 상태 --</option>					
						<option class="boardAp" value="Y">일반</option>
						<option class="boardAp" value="B">블라인드</option>
					</select>					
					<input type="text" id="search">
					<button type="submit">게시글 보기</button> -->
				</div>
			</div>
			<div class="my-4">
				<form action="#" method="POST" id="adminBoard">
					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>게시글 번호</th>
								<th>게시글 유형</th>
								<th>게시글 제목</th>
								<th>작성일자</th>
								<th>수정일자</th>
								<th>게시글 상태</th>
								<th><input type="checkbox" class="check-input" id="checkAll"></th>
							</tr>
						</thead>

						<tbody>
							<tr>
							<!-- 회원이 없을 경우 -->
	                    	<c:if test="${empty pList}">
	                    		<tr>
	                    			<td colspan="6">존재하는 게시글이 없습니다.</td>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty pList}">
		                    	<!-- 회원이 있을 경우 -->
		                    	<c:forEach var="product" items="${pList}">
									<tr>
										<td>${product.prdtNo}</td>
										<td class="prType">${product.prdtType}</td>
										<td class="titleView">${product.prdtName}</td>
										<td>${product.createDate}</td>
										<td>${product.modifyDate}</td>
										<td>${product.prdtStatus}</td>
										<td><input type="checkbox" class="check-input" id="checkBoard" value="${product.prdtNo}"></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>

					<div id="adminBoard-Application">
						<select name="board-ap" id="board-ap">
							<option class="boardAp" value="none">-- 상태 --</option>
							<option class="boardAp" value="B">블라인드</option>
							<option class="boardAp" value="Y">블라인드 해제</option>
						</select>
						<button type="button" id="changePdtBtn" class="form-control btn">상태 변경</button>
					</div>
				</form>
			</div>
			
		<!-- 페이징처리 -->
 		<div class="my-4">
			<ul class="pagination">

				 <%-- 주소 조합 작업 --%>
				<c:url var="pageUrl" value="adminBoard?"/>

				<!-- 화살표에 들어갈 주소를 변수로 생성 -->
				<c:set var="firstPage" value="${pageUrl}cp=1"/>
				<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}"/>
				
				<%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다
				
					<fmt:parseNumber>   : 숫자 형태를 지정하여 변수 선언 
					integerOnly="true"  : 정수로만 숫자 표현 (소수점 버림) --%>
				
				
				<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"  integerOnly="true" />
				<fmt:parseNumber var="prev" value="${ c1 * 10 }"  integerOnly="true" />
				<c:set var="prevPage" value="${pageUrl}cp=${prev}" />
											<%-- 1?cp=nn의 형태 --%>
				
				<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
				<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
				<c:set var="nextPage" value="${pageUrl}cp=${next}" />
				

				<c:if test="${pInfo.currentPage > pInfo.pageSize}">
					<li> <!-- 첫 페이지로 이동(<<) -->
						<a class="page-link noteSelected" href="${firstPage}">&lt;&lt;</a>
					</li>
					
					<li> <!-- 이전 페이지로 이동 (<) -->
						<a class="page-link noteSelected" href="${prevPage}">&lt;</a>
					</li>
				</c:if>



				<!-- 페이지 목록 -->
				<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}" >
					<c:choose>
						<c:when test="${pInfo.currentPage == page }">
							<li>
								<a class="page-link">${page}</a>
								<%-- 현재 보고있는 페이지는 클릭할수 없으므로 href가 없다. --%>
							</li>
						</c:when>
					
						<c:otherwise>
							<li>	
								<a class="page-link noteSelected" href="${pageUrl}cp=${page}">${page}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
					
		
				<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
				<c:if test="${next <= pInfo.maxPage}">
					<li> <!-- 다음 페이지로 이동 (>) -->
						<a class="page-link noteSelected" href="${nextPage}">&gt;</a>
					</li>
					
					<li> <!-- 마지막 페이지로 이동(>>) -->
						<a class="page-link noteSelected" href="${lastPage}">&gt;&gt;</a>
					</li>
				</c:if>
			</ul>
		</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		/* 체크박스 전체 선택 */
		$(document).ready(function(){
			
			// 전체 선택 박스 클릭
			$("#checkAll").click(function(){
				if($("#checkAll").prop("checked")){ // 클릭 되었을 시
					$("input[id=checkBoard]").prop("checked", true);
				}else{ // 클릭이 되어있지 않을 시
					$("input[id=checkBoard]").prop("checked", false);
				}
			});
		});
		
		// 전체 체크 중, 한개라도 체크가 풀리면 모든 체크 해제
		$("input[id=checkMember]").on("click", function(){
			$("#checkAll").prop("checked", false);
		});
		
		
		
		/* 게시글 상세보기 */
		$(".titleView").on("click", function(){
			var prdtNo = $(this).parent().children().eq(0).text();
			console.log("123aAD")
			var type = "../${product.prdtType}/" + prdtNo;
			var url = "";
			
			if($(this).prev().text() == '클래스'){
				url = 'gClass';
			}else if($(this).prev().text() == '선물'){
				url = 'gift';
			}
			/* <c:if test="${product.prdtType == C}">
				window.location.href="${contextPath}/gClass/"+prdtNo;
			</c:if>
			<c:if test="${product.prdtType == G}">
				window.location.href="${contextPath}/gift/"+prdtNo;
			</c:if> */
			
			window.location.href="${contextPath}/"+ url + "/" +prdtNo;
		});
		 
		
		// 게시글 등급변경하기
		$("#changePdtBtn").on("click", function(){
			var array = [];
			var grade = $("select[name=board-ap] option:selected").val();
			
			$('input[type="checkbox"]:checked').each(function(index, item){
				array.push($(item).val());
			})
			
			
			console.log(array);

			if($('input[type="checkbox"]:checked') < 1){
				alert("선택된 게시글이 없습니다.");
				return;
			}else{
				
				console.log($('input[type="checkbox"]:checked').val())
				console.log($('#board-ap').val())
				console.log(array)
				if(confirm("게시글의 상태를 변경하시겠습니까?")){
					$.ajax({
						url: "${contextPath}/admin/boardApUpdate",
						data: { "prdtStatus": $('#board-ap').val(),
								"prdtNo": array},
						type: "post",
						traditional: true,
						success: function(result){
							console.log("성공");
							if(result > 0){
								location.reload();
								alert("등급이 변경되었습니다.");
							};
						},
						error: function(){
							console.log("등급 변경 실패");
						}
					});
				}else{
					$("#changePdtBtn").blur();
					return;
				}
			}
		});	
		
		// 가입 수단 명 변경
		(function(){
			$(".prType").each(function(index, item){
				var type = $(item).text();
				
				switch(type){
				case "G" : $(item).text("선물"); break;
				case "C" : $(item).text("클래스"); break;
				}
			});
		})();		
	</script>	
</body>
</html>