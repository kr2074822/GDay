<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>내 정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/bMemInfoUpdate.css?ver=1.1"/>
    
    <!-- icon : font-awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <!-- js -->
    <%-- <script src="${contextPath}/resources/js/mypage/bMemInfoUpdate.js"></script> --%>

  	<style>
  	
  	#wrapper {
  		display : flex;
  	}
  	
  	</style>
   
</head>
<body>

<!-- js용 jsp -->
<jsp:include page="../memUpdateJS.jsp"/>

<jsp:include page="../../common/header.jsp"/>

<div id="wrapper">
		<jsp:include page="bMemSidebar.jsp"/>
		
    <div class="container-info-all">
        <div id="information-title">
            <span>내 정보</span>
        </div>

        <!-- 일반 정보 수정 -->
        <div class="row" id="container-info-form-1">
            <form action="${contextPath}/bMember/updateMember" enctype="multipart/form-data"
            	method="post" id="container-form-1" onsubmit="return updateInfoVal(this);">
            <div class="info-form" id="info-profile">
                <label class="info-title">프로필 사진</label>
                <div id="profile-div">
                    <div id="profile-image"></div> <!-- 프사 배경으로 첨부 -->
                    <i class="fas fa-camera" id="profile-icon"></i>
                </div>
            </div>
            <!-- 프로필 파일 업로드-->
            <div id="profile-area">
                <input type="file" id="profile" name="profile" onchange="LoadProfile(this,0)"> 
            </div>
            <input type="hidden" name="deleteProfile" class="delete-profile">

						<input type=number class="info-hidden" value="${loginMember.memberNo}" name="memberNo"/>
            <div class="info-form" id="info-emain">
                <label class="info-title">이메일</label>
                <span class="info-content">${loginMember.memberEmail}</span><!-- 회원 이메일 -->
            </div>
            <div class="info-form" id="info-name">
                <label class="info-title">이름</label>
                <span class="info-content">${loginMember.memberName}</span><!-- 회원 이름 -->
            </div>

            <div class="info-form" id="info-nickname">
                <label class="info-title"><span class="star">*</span>닉네임</label>
                <input type="text" name="memberNick" value="${loginMember.memberNick}" class="info-content-1" required/>
                <span class="info-content-2 info-hidden " id="check-nickname"></span>
                <!-- 닉네임 중복확인 ajax : 문구 출력(check-nickname)-->
            </div>
            
            <div class="info-form" id="info-phone">
                <label for="phone" class="info-title">연락처</label>
                <input type="text" name="memberPhone" value="${loginMember.memberPhone}" class="info-content" 
                	maxlength='11' placeholder="'-' 없이 숫자만 입력" required/><!-- 회원 전화번호 -->
            </div>


						<c:set var="address" value="${fn:split(loginMember.memberAddress, ',')}" />
            <input type="text" class="info-hidden info-addr" name="memberAddress" value="${loginMember.memberAddress}">
            
            <div class="info-form" id="info-address-1">
                <label class="info-title">우편번호</label>
                <div class="input-btn">
                    <input type="text" name="address0" value="${address[0]}" class="postcodify_postcode5 info-content-1" readonly/>
                    <button type="button" class="info-btn" id="post-search-btn">검색</button>
                <!-- 회원 주소1 : 우편번호-->
                </div>
            </div>
            <div class="info-form" id="info-address-2">
                <label class="info-title">도로명 주소</label>
                <input type="text" name="address1" value="${address[1]}" class="postcodify_address info-content" readonly/>
                <!-- 회원 주소2 : 도로명 주소-->
            </div>

            <div class="info-form" id="info-address-3">
                <label for="address3" class="info-title">상세 주소</label>
                <input type="text" name="address2" value="${address[2]}" class="postcodify_details info-content"/>
                <!-- 회원 주소1 : 우편번호-->
            </div>
            <div class="wrap-btn">
				        <button type="reset" class="reset-btn info-btn">초기화</button>
				        <button type="submit" class="submit-btn info-btn">정보 변경</button>
		        </div>
            </form> <!-- 일반 정보 기입 끝 -->
        </div>
            
        <c:if test="${loginMember.memberGrade == 'B'}">    
        	<c:set var="status" value="비즈니스 인증 완료"/>
        </c:if>
        <c:if test="${loginMember.memberGrade == 'U'}">
        	<c:set var="status" value="비즈니스 인증 대기"/>
        </c:if>  
        <!-- 비즈니스 회원 정보 인증? -->
        <div class="row" id="container-info-form-2">
            <form method="post" id="container-form-2">
            <div class="info-form" id="info-b-update">
                <label class="info-title">비즈니스 인증 정보</label>
                <div class="info-btns">
                    <button type="button" class="info-btn" id="b-update-btn">수정</button>
                    <button type="button" class="info-btn" id="b-validate-btn">인증</button>
                    <button type="button" class="info-btn" id="b-cancel-btn">취소</button>
                </div>
                <div class="status-text">${status}</div>
            </div>
            <div class="info-form" id="info-b-company">
                <label class="info-title"><span class="star">*</span>업체명/강사명</label>
                <input type="text" id="company" name="bmemShop" value="${bmemInfo.bmemShop}" class="info-content" readonly/>
                <div class="info-content" id="check-company">※ 등록증(자격증)과 동일한 이름을 기입해야 승인됩니다.</div>
            </div>
            <div class="info-form" id="info-b-explain">
                <label for="explain" class="info-title">비즈니스 소개</label>
                <textarea name="bmemIntro" id="explain" class="info-b-textarea" readonly>${bmemInfo.bmemIntro}</textarea>
                <!-- 회원 주소1 : 우편번호-->
            </div>
            <div class="info-form" id="info-b-license">
                <label class="info-title">사업자 등록증</label>
                <div id="license-div">
                	<div id="license-image"> <!-- 사업자 등록증 배경으로 첨부 -->
                	</div>
                	<button type="button" id="license-btn" class="info-btn">재등록</button>
                </div>
            </div>
            <!-- 등록증 업로드 -->
            <div id="license-area">
                <input type="file" id="license" name="license" onchange="LoadLicense(this,0)"> 
            </div>
            </form>
        </div>
    </div>

</div>
    
    <!-- 프로필 모달창 -->
    
  <div class="modal-cover">
    <div id="profile-menu-modal">
        <a class="modal-close"><i class="fas fa-times"></i></a>
        <div class="modal-title">프로필 사진 설정</div>
        <div class="modal-menu">
            <div id="upload-pf">사진 등록</div>
            <div id="delete-pf">사진 삭제</div> <!-- 사진 삭제 -->
        </div>
    </div>
  </div> 
  
<jsp:include page="../../common/footer.jsp"/>
   
    <!-- 도로명 주소 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>  
    <script>
	/* 도로명 주소 API */
	//도로명 주소 API
	 // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
	 $(function(){
	     $("#post-search-btn").postcodifyPopUp();
 	     $(".postcodify_details").on("focus", function(){
	    	 $(this).val("");
	     });
	 });
 
    
    </script>
    
</body>
</html>