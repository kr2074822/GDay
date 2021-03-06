<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리</title>

<link rel="stylesheet" href="reset.css">
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminPage.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="adminSidebar.jsp" />

	<div class="container">
		<div id="container-tb">
			<div>
				<h3>전체 회원 보기</h3>
				<div id="adminMember-search">
					<form action=# onsubmit="" method="GET" class="text-right" id="searchForm">
						<select id="sk" name="sk" class="form-control sf-margin">
							<option class="updateMem" value="none">-- 등급 --</option>
							<option class="updateMem" value="G">일반</option>
							<option class="updateMem" value="B">비즈니스</option>
							<option class="updateMem" value="U">미인증</option>
							<option class="updateMem" value="X">블랙리스트</option>
						</select> 
						<input type="text" name="sv" class="form-control sf-margin" id="search" placeholder="검색어를 입력하세요.">
						<button type="submit">등급 보기</button>
					</form>
				</div>
			</div>
			<div class="my-4">
				<form id="adminMember">
					<table class="table" id="list-table">
						<thead>
							<tr>
								<th>회원 번호</th>
								<th>회원 아이디</th>
								<th>회원 닉네임</th>
								<th>가입 수단</th>
								<th>등급</th>
								<th><input type="checkbox" id="checkAll"></th>
							</tr>
						</thead>
						<tbody>
							<!-- 회원이 없을 경우 -->
	                    	<c:if test="${empty mList}">
	                    		<tr>
	                    			<td colspan="6">존재하는 회원이 없습니다.</td>
	                    		</tr>
	                    	</c:if>
	                    	<c:if test="${!empty mList}">
		                    	<!-- 회원이 있을 경우 -->
		                    	<c:forEach var="member" items="${mList}">
									<tr>
										<td>${member.memberNo}</td>
										<td>${member.memberEmail}</td>
										<td>${member.memberName}</td>
										<td>${member.memberType}</td>
										<td>${member.memberGrade}</td>
										<td><input type="checkbox" class="check-input" id="checkMember" value="${member.memberNo}"></td>
									</tr>
								</c:forEach> 
							</c:if>
						</tbody>
					</table>

					<div id="adminMember-Application">
						<select name="adminMember-ap" id="adminMember-ap">
							<option class="updateMem" value="none">-- 등급 --</option>						
							<option class="updateMem" value="G">일반</option>
							<option class="updateMem" value="B">비즈니스</option>
							<option class="updateMem" value="U">미인증</option>
							<option class="updateMem" value="X">블랙리스트</option>
						</select>
						<button type="button" id="changeMemBtn" class="form-control btn">등급 변경</button>
					</div>
				</form>
			</div>
			
		<!-- 페이징처리 -->
 		<div class="my-4">
			<ul class="pagination">

				 <%-- 주소 조합 작업 --%>
				<c:url var="pageUrl" value="adminMember?"/>

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
					$("input[id=checkMember]").prop("checked", true);
				}else{ // 클릭이 되어있지 않을 시
					$("input[id=checkMember]").prop("checked", false);
				}
			});
		});
		
		// 전체 체크 중, 한개라도 체크가 풀리면 모든 체크 해제
		$("input[id=checkMember]").on("click", function(){
			$("#checkAll").prop("checked", false);
		});
		
		// 회원 등급변경하기
		$("#changeMemBtn").on("click", function(){
			var array = [];
			var grade = $("select[name=adminMember-ap] option:selected").val();
			
			$('input[type="checkbox"]:checked').each(function(index, item){
				array.push($(item).val());
			})
			
			
			console.log(array);

			if($('input[type="checkbox"]:checked') < 1){
				alert("선택된 회원이 없습니다.");
				return;
			}else{
				
				console.log($('input[type="checkbox"]:checked').val())
				console.log($('#adminMember-ap').val())
				console.log(array)
				if(confirm("회원" +  "님의 상태를 변경하시겠습니까?")){
					$.ajax({
						url: "${contextPath}/admin/memberGrade",
						data: { "memberGrade": $('#adminMember-ap').val(),
								"memberNo": array},
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
					$("#changeMemBtn").blur();
					return;
				}
			}
		});
	</script>
</body>
</html>