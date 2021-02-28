<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>내 정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/bMemInfoUpdate.css"/>
    
    <!-- icon : font-awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <!-- js -->
    <script src="${contextPath}/resources/js/mypage/bMemInfoUpdate.js"></script>

  	<style>
  	
  	#wrapper {
  		display : flex;
  	}
  	
  	</style>
   
</head>
<body>

<jsp:include page="../../common/header.jsp"/>

<div id="wrapper">
		<jsp:include page="bMemSidebar.jsp"/>
		
    <div class="container-info-all">
        <div id="information-title">
            <span>내 정보</span>
        </div>

        <!-- 일반 정보 수정 -->
        <div class="row" id="container-info-form-1">
            <form action="#" method="post" id="container-form-1">
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

            <div class="info-form" id="info-emain">
                <label class="info-title">이메일</label>
                <span class="info-content">user01@gmail.com</span><!-- 회원 이메일 -->
            </div>
            <div class="info-form" id="info-name">
                <label class="info-title">이름</label>
                <span class="info-content">김이름</span><!-- 회원 이름 -->
            </div>

            <div class="info-form" id="info-nickname">
                <label class="info-title"><span class="star">*</span>닉네임</label>
                <input type="text" name="nickname" value="지데이샵" class="info-content-1" required/>
                <span class="info-content-2" id="check-nickname">최대 6글자</span>
                <!-- 닉네임 중복확인 ajax : 문구 출력(check-nickname)-->
            </div>
            
            <div class="info-form" id="info-phone">
                <label for="phone" class="info-title">연락처</label>
                <input type="text" name="phone" value="01011111111" class="info-content" required/><!-- 회원 전화번호 -->
            </div>

            <div class="info-form" id="info-address-1">
                <label class="info-title">우편번호</label>
                <div class="input-btn">
                    <input type="text" name="address1" value="01234" class="info-content-1"/>
                    <button type="button" class="info-btn" id="post-search-btn">검색</button>
                <!-- 회원 주소1 : 우편번호-->
                </div>
            </div>
            <div class="info-form" id="info-address-2">
                <label class="info-title">도로명 주소</label>
                <input type="text" name="address2" value="서울특별시 중구 남대문로 120" class="info-content"/>
                <!-- 회원 주소2 : 도로명 주소-->
            </div>

            <div class="info-form" id="info-address-3">
                <label for="address3" class="info-title">상세 주소</label>
                <input type="text" name="address3" value="대일빌딩 2층" class="info-content"/>
                <!-- 회원 주소1 : 우편번호-->
            </div>
            
            </form> <!-- 일반 정보 기입 끝 -->
        </div>
            
        <!-- 비즈니스 회원 정보 인증? -->
        <div class="row" id="container-info-form-2">
            <!-- 등록증 변경시 인증 과정 필요하지 않나...? -->
            <form action="#" method="post" id="container-form-2">
            <div class="info-form" id="info-b-update">
                <label class="info-title">비즈니스 정보 수정</label>
                <div class="info-btns">
                    <button type="button" class="info-btn" id="b-update-btn">수정</button>
                    <button type="submit" class="info-btn" id="b-validate-btn">인증</button>
                    <button type="button" class="info-btn" id="b-cancel-btn">취소</button>
                </div>
            </div>
            <div class="info-form" id="info-b-company">
                <label class="info-title">업체명/강사명</label>
                <input type="text" id="company" name="company" value="GDAY SHOP" class="info-content" readonly/>
                <div class="info-content" id="check-company">※ 등록증(자격증)과 동일한 이름을 기입해야 승인됩니다.</div>
            </div>
            <div class="info-form" id="info-b-explain">
                <label for="explain" class="info-title">비즈니스 소개</label>
                <textarea name="explain" id="explain" class="info-b-textarea" readonly>소개합니다.
                </textarea>
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
  
    
    <!-- 도로명 주소 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>  
    <script>
    /* 도로명 주소 API */
 		// 도로명 주소 API
     // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
     $(function() {
         $("#post-search-btn").postcodifyPopUp();
     });
    
    </script>
    
</body>
</html>