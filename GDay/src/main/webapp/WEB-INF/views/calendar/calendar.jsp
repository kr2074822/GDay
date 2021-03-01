<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<link href='${contextPath}/resources/fullcalendar/css/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/fullcalendar/js/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/js/locales-all.js'></script>

<!-- fullcalendar bundle -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js'></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- rrule lib -->
<script src='https://cdn.jsdelivr.net/npm/rrule@2.6.4/dist/es5/rrule.min.js'></script>
<!-- the rrule-to-fullcalendar connector. must go AFTER the rrule lib -->
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/rrule@5.5.0/main.global.min.js'></script>


<!-- swal2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>

<!-- calendar자체 css / js -->
<link rel="stylesheet" href="${contextPath}/resources/css/calendar/calendar.css?ver=1.3"/>
<link rel="stylesheet" href="${contextPath}/resources/css/common/modalBasic.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    
</head>
<body>

<jsp:include page="../common/header.jsp"/>

<!-- js 코드 모아놓은 jsp 인클루드 -->
<jsp:include page="calendarJS.jsp"></jsp:include>

 <div id="cal-wrapper">
    <div id='calendar'></div>
  </div>


<!-- 모달창1 : 등록 모달창 -->
<div class="modal-cover">
  <div class="cal-modal cal-insert" id="modal-insert">
    <a class="modal-close"><i class="fas fa-times"></i></a>
    <div class="m-title">기념일 등록</div>
    <div class="m-content-box">
      <div class="m-input-box">
        <input type="text" class="m-cal-input gdayTitles" name="gdayTitle" id="put-gdayTitle" placeholder="기념일"/>
      </div>
      <div class="m-input-box">
        <input type="date" class="m-cal-input-1 dtStarts" name="dtStart" id="put-dtStart"/>
        <!-- 마감일용 hidden input -->
        <input type="date" class="m-cal-hidden dtUntils" name="dtUntil" id="put-dtUntil" value="2999-12-31" style="display:none;"/>
        <input type="color" class="m-cal-input-2 gdayColors" name="gdayColor" id="put-gdayColor" value="#FE929F"/>
      </div>
      <div class="m-input-box">
        <label for="freq-interval">반복 주기</label>
        <select name="freq-interval" class="m-cal-input-1 fis" id="select-fi-1">
          <option value="fi1" selected>반복 없음</option> <!--daily 1-->
          <option value="fi2">1년</option> <!--yearly 1-->
          <option value="fi3">100일</option>  <!--daily 100-->
          <option value="fi4">직접 작성</option> <!--daily 기타-->
        </select>
      </div>
      <div class="m-input-box input-etc-box" id="interval-etc">
        <!-- 직접 작성 시 -->
        <label for="etc" class="etc-label">직접 작성<br><span>(일 단위)</span></label>
        <input type="number" name="etc" class="m-cal-input-1 etc-fis" id="input-etc-fi"/> <!-- 직접 작성 -->
      </div>
    </div>
    <div class="m-btn-box">
      <button type="reset" class="modal-btn m-cancel-btns" id="m-cancel-btn">취소</button>    
      <button type="button" class="modal-btn m-submit-btns" id="m-submit-btn" onclick="insertEvent();">등록</button> <!-- ajax -->    
    </div>
  </div>
</div>


<!-- 모달창2 : 상세 조회 -->
<div class="modal-cover">
  <div class="cal-modal cal-view" id="modal-view">
    <a class="modal-close"><i class="fas fa-times"></i></a>
    <div class="m-title">
      <span id="v-gdayColor"></span>
      <span id="v-gdayTitle">기념일명</span> 
    </div>
    <div class="m-content-box">
      <div class="m-cal-text" id="v-dtStart"><span></span></div>
      <div class="m-cal-text"><span>반복 주기 : </span><span id="v-freqInterval"></span></div>
    </div>
    <div class="m-btn-box">
    	<span id="view-gdayNo" style="display:none;"></span>
      <a href="#" class="modal-icon-btn" id="cal-update-icon"> 
        <i class="fas fa-edit"></i>
        <span>수정</span>
      </a>
      <a href="#" class="modal-icon-btn" id="cal-delete-icon">
        <i class="fas fa-trash-alt"></i>
        <span>삭제</span>
      </a>
    </div>
  </div>
</div>


<!-- 모달창3 : 수정 모달창 -->
<div class="modal-cover">
  <div class="cal-modal cal-update" id="modal-update">
    <a class="modal-close"><i class="fas fa-times"></i></a>
    <div class="m-title">기념일 수정</div>
    <div class="m-content-box">
      <div class="m-input-box">
      	<span id="up-gdayNo" style="display:none;"></span>
        <input type="text" class="m-cal-input gdayTitles" name="gdayTitle" id="up-gdayTitle" placeholder="기념일"/>
      </div>
      <div class="m-input-box">
        <input type="date" class="m-cal-input-1 dtStarts" name="dtStart" id="up-dtStart"/>
        <!-- 마감일용 hidden input -->
        <input type="date" class="m-cal-hidden dtUntils" name="dtUntil" id="up-dtUntil" value="2999-12-31" style="display:none;"/>
        <input type="color" class="m-cal-input-2 gdayColors" name="gdayColor" id="up-gdayColor"/>
      </div>
      <div class="m-input-box">
        <label for="freq-interval">반복 주기</label>
        <select name="freq-interval" class="m-cal-input-1 fis" id="select-fi-2">
          <option value="fi1">반복 없음</option> <!--daily 1-->
          <option value="fi2">1년</option> <!--yearly 1-->
          <option value="fi3">100일</option>  <!--daily 100-->
          <option value="fi4">직접 작성</option> <!--daily 기타-->
        </select>
      </div>
      <div class="m-input-box input-etc-box" id="interval-etc">
        <!-- 직접 작성 시 -->
        <label for="etc" class="etc-label">직접 작성<br><span>(일 단위)</span></label>
        <input type="number" name="etc" class="m-cal-input-1 etc-fis" id="update-etc-fi"/> <!-- 직접 작성 -->
      </div>
    </div>
    <div class="m-btn-box">
      <button type="reset" class="modal-btn m-cancel-btns" id="u-cancel-btn">취소</button>    
      <button type="button" class="modal-btn m-submit-btns" id="u-submit-btn" onclick="updateEvent();">수정</button> <!-- ajax -->    
    </div>
  </div>
</div>



<!-- 모달창4 : 날짜 검색 -->
<div class="modal-cover">
  <div class="cal-modal cal-search" id="modal-search">
    <a class="modal-close"><i class="fas fa-times"></i></a>
    <div class="m-title">날짜 검색</div>
     <div class="m-content-box">
     	<div class="m-input-box" id="search-input">
        <input type="date" class="m-cal-input" name="searchDt" id="searchDt"/>
     </div>
    </div>
    <div class="m-btn-box">
      <button type="button" class="modal-btn m-submit-btns" id="m-search-btn">날짜 이동</button>    
    </div>
  </div>
</div>




</body>
</html>