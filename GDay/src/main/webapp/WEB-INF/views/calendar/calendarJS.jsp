<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- calendar.jsp에 사용되는 js 모음 -->
<!-- el 사용을 위해 jsp로 생성 -->
<script>
//ready함수
$(function(){
	//목록 조회 + 풀캘린더 로드
	selectCalendarList(loadFullCalendar);//콜백함수로 loadFullCalender를 씀
	
  /* -----------모달창------------- */
  //모달창 x 클릭
  $(".modal-close").children().on("click", function(){
      if($(this).parent().parent().hasClass("cal-insert")) {
          cancelInput("x", "insert");
      } else if($(this).parent().parent().hasClass("cal-update")){ //등록/수정창
    	  	cancelInput("x", "update");
      } else { //상세창
          $(".modal-cover").hide();
      		$(this).parent().parent().$("input").val("");
  		}
  });
  
  /* 등록 모달창 */
  //입력 모달창 취소 버튼
  $(".m-cancel-btns").on("click", function(){
      if($(this).parent().parent().hasClass("cal-insert")) {
	      cancelInput("cancel", "insert");
      } else if($(this).parent().parent().hasClass("cal-update")){ //등록/수정창
    	  cancelInput("cancel", "update");
      }
  });
  
  /* 입력 모달창 : 직접 주기 입력 div show() */
  $(".fis").on("change", function(){
      if($(this).val() == 'fi4'){
          $(this).parent().next().show().css("display","flex");
      } else {
    	  $(this).parent().next().hide();
      }
  });
  
  /* 상세 조회 모달창 */
  /* 삭제, 편집 버튼 hover 효과 */
  $("#modal-view .modal-icon-btn i").on("mouseover", function(){
      $(this).next().fadeIn(500);
  });
  $("#modal-view .modal-icon-btn i").on("mouseout", function(){
      $(this).next().fadeOut(500);
  });
  
  /* 삭제 버튼 클릭시 삭제 함수 진행 */
  $("#modal-view #cal-delete-icon *").on("click", function(){
	  
	  //confirm 확인 후 진행
	  swal.fire({icon:"question", 
		  					title: "기념일을 삭제하시겠습니까?",
		  					html: "마이캘린더에 있는 연관 기념일(반복 기념일)이<br>함께 삭제됩니다.",
		  					showCancelButton: true,
		  					confirmButtonText: "삭제 진행",
		  					confirmButtonColor: "#54b39E",
		  					cancelButtonText: "취소",
		  					cancelButtonColor: "#a9a9a9",
		  					reverseButtons: true//버튼 위치 바꾸기
		  					}).then((result) => {
		  						if(result.isConfirmed){
		  							var no = $(this).parent().prev().prev().text();
		  							deleteEvent(no);
		  						} 
		  					});
  });
  
  /* 수정 버튼 클릭시 수정 함수 진행 */
  $("#modal-view #cal-update-icon *").on("click", function(){
	  var no = $(this).parent().prev().text();
	  console.log(no);
	  updateEventForm(no);
  });
  

});//레디 함수 끝---------------------------------------------------------------------

var memberNo = "${loginMember.memberNo}";
var memberNick = "${loginMember.memberNick}";
var memberPhone = "${loginMember.memberPhone}";

//풀캘린더 로드 메소드
function loadFullCalendar(events){
	//풀캘린더 설정
	//document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	      //themeSystem: 'bootstrap',
	      //aspectRatio: 1.5, 비율
	      height : '95%',//달력형 스크롤바 X

	      dayHeaderClassNames: 'dayBox',//캘린더 요일 요소에 클래스 추가(css) 
	      eventClassNames: 'eventBox',//이벤트 요소에 클래스 추가(css)

	      customButtons: {
	          todayBtn: {
	              text: '오늘',
	              click: function(){
	                  calendar.today();
	              }
	          },
	          searchBtn: {
	              text: '검색',
	              click: function(){
	            	  $("#modal-search").parent().show();
	            	  $("#m-search-btn").on("click", function(){
	            			var date = $("#searchDt").val();//날짜 입력 값 가져오기
	            			calendar.gotoDate(date);//해당 날짜로 이동
	            			
	            			$("#modal-search").parent().hide();
	            			$("#modal-search input").val("");//이동 시 모달창 숨기고 입력값 삭제
	            	  });
	              }
	          },
	          insertBtn: {
	              text: '기념일 등록',
	              click: function(){
	                  gdayInsertForm("");
	              }
	          }
	      },

	      headerToolbar: {
	      left: 'searchBtn todayBtn',
	      center: 'prevYear,prev,title,next,nextYear',
	      right: 'dayGridMonth,listYear',
	      },
	      footerToolbar: {
	      right: 'insertBtn'
	      },

	      views: {
	      today: {buttonText: '오늘'}, 
	      dayGridMonth: {buttonText: '캘린더'},
	      list: {buttonText: '목록'},
	      },

	      locale : 'ko', //한국어
	      //navLinks: true, // can click day/week names to navigate views
	      dayMaxEvents: true, // allow "more" link when too many events
	      //editable: true, //drag로 기념일 움직이게 하기

	      events: events,
	      eventTextColor: 'black',

	      //날짜 클릭 이벤트(등록)
	      dateClick: function(info){
	          //console.log(info.dateStr);//날짜 가지고 등록
	          gdayInsertForm(info.dateStr);
	      },

	      //이벤트 클릭(이벤트 상세 조회)
	      eventClick: function(info){
	          console.log("기념일번호:" + info.event.id);
	          console.log("기념일날짜:" + info.event.start);
	          //id로 상세 조회
	          viewEvent(info.event.id, info.event.start);
	      }

	  });
	  
	  calendar.render();
	//});
	//캘린더 설정 끝
	
	  //캘린더 툴바 버튼 디자인
	  $(".fc-button-primary").css("border-style", "none");
	  $(".fc-icon").css("color", "lightgray");
	  
	  $(".fc-button-primary").each(function(index, item){
		  if($(item).text() == "오늘"){
			  $(item).css("background-color", "#54b39E");
			} else {
				$(item).css("background-color", "#596566");
				/* 갈색 : #806f71 */
			}
	  });
	  
 }
  
//캘린더 기념일 목록 조회
function selectCalendarList(loadFullCalender){
	console.log("memberNo : " + memberNo);
	  
	   $.ajax({
	       url : "${contextPath}/calendar/selectCalendarList",
	       type : "get",
	       dataType : "json",
	       data : { "memberNo" : memberNo }, /* memberId */
	       success : function(eList){ 
	    	   console.log("success");
	    	   var events = [];
	    	   $.each(eList, function(index, item){
	               var event = {
	                           id: item.gdayNo, /*기념일 번호*/
	                           title: item.gdayTitle, //제목,
	                           start : item.dtStart,
	                           rrule: {
	                               freq: item.gdayFreq, /* 반복 단위 daily, (monthly, weekly,) yearly */
	                               interval : item.gdayInter, /* 반복 주기 + freq와 연결되어 사용됨 */
	                               dtstart: item.dtStart,//시작날짜 startStr과 같은 거 넣기
	                               until: item.dtUntil /* 마감날짜(기본은 2999-12-31): 주기 없음 = dtstart와 같은 날짜 + freq/interval(daily/1) */
	                               },
	                           backgroundColor: item.gdayColor //배경색(16진법 가능)
	                           }
	               events.push(event);
	           });
	    	   loadFullCalendar(events);//콜백함수로 loadFullCalendar -> 캘린더 로드
	       },
	       error : function(){
	           console.log("기념일 목록 조회 실패");
							//메인페이지 이동?	           
	       }
	   });
	
  }


/* 기념일 등록 메소드 */
function insertEvent(){
	
  if(ValidateCheck("insert")) { //유효성 검사 값이 true 이면 진행 
	  
	  var gdayTitle = $("#put-gdayTitle").val(); //기념일명
	  var dtStart = $("#put-dtStart").val();//시작 날짜
	  var gdayColor = $("#put-gdayColor").val();//기념일색

	  var dtUntil = $("#put-dtUntil").val()//마감날짜 기본 
	  
	  var gdayFreq;//반복 단위
	  var gdayInter;//반복 주기

	  var fi = $("#select-fi-1").val();//셀렉트 값
	  
	  switch (fi) {
	      case 'fi1' : gdayFreq = "daily"; gdayInter = 1; dtUntil = dtStart; break;
	          /* 반복주기 없음 == dtUntil==dtStart */ 
	      case 'fi2' : gdayFreq = "yearly"; gdayInter = 1; break;
	      case 'fi3' : gdayFreq = "daily"; gdayInter = 100; break;
	      case 'fi4' : gdayFreq = "daily"; gdayInter = $("#input-etc-fi").val(); break;
	  }
	
	  console.log("fi: " + fi);
	  console.log("gdayFreq: " + gdayFreq);
	  console.log("gdayInter: " + gdayInter);
	  console.log("dtUntil: " + dtUntil);
	  console.log("dtStart: " + dtStart);
	  console.log("gdayColor: " + gdayColor);
	
	  //ajax로 등록 처리
	  //ajax로 보낼 값
	  var gdayData = { 'gdayTitle':gdayTitle, /* 기념일명 */
	               'gdayFreq':gdayFreq, /* 반복 단위 */
	               'dtStart':dtStart, /* 시작날짜 */
	               'dtUntil':dtUntil, /* 마감일짜 */
	               'gdayInter':gdayInter, /* 반복 주기 */
	               'gdayColor':gdayColor, /* 기념일색 */
	               'memberNo':memberNo, /* 회원 번호  : 위에서 세션에서 가져온 memberNo*/
	               'memberNick' : memberNick,
	               'memberPhone' : memberPhone
	              }
	  
	  $.ajax({
		  url : "${contextPath}/calendar/insertEvent",
	    data : gdayData, 
	    type : "post",
	    success : function(result){
	    	
	    	if(result > 0){
	    		swal.fire({icon: "success", title: "기념일을 등록했습니다.", confirmButtonColor: "#54b39E" });
	    		modalReset();
		    	$("#modal-insert").parent().hide();
	    		selectCalendarList(loadFullCalendar);
	    	} else {
		    	swal.fire({icon: "error", title: "기념일 등록에 실패했습니다.",  confirmButtonColor: "#54b39E"});
	    	}
	    },
	    error : function(){
	    	console.log("기념일 등록 중 오류");
	    	modalReset();
	    	$("#modal-insert").parent().hide();
	    	selectCalendarList(loadFullCalendar);
	    }
	  });
  
  }//유효성 검사 실패시 현 상태 유지

  
}

/* 이벤트 클릭 시 상세 조회 모달창 팝업 메소드 */
function viewEvent(gdayNo, startStr){
  
  //ajax로 상세조회 해오기 (gdayNo == id == 기념일번호)
  //eventList[i]의 값으로 넣는 것은 상세 조회해서 가져온 것
  //단, 현재 기념일 날짜는 풀캘린더에서 계산된 날짜를 출력 == startStr
  
  //임시
  console.log(gdayNo);
  
  $.ajax({
	  url : "${contextPath}/calendar/viewEvent",
	  data : { "gdayNo" : gdayNo },
	  dataType : "json",
	  type : "post",
	  success : function(event){
		  
		  if(event != null && event != undefined){
			
				$("#modal-view #view-gdayNo").text(gdayNo);
				
			  $("#modal-view #v-gdayColor").css("background-color", event.gdayColor);
			  $("#modal-view #v-gdayTitle").text(event.gdayTitle);
			  
			  /* 클릭한 기념일 */
			  var dtstart
			   = startStr.getFullYear() + "년 " + (startStr.getMonth()+1) + "월 " + startStr.getDate() + "일";
			  $("#modal-view #v-dtStart").children().text(dtstart);
			  
			  /* 반복 주기 */
			  var gdayFreq = event.gdayFreq;
			  var gdayInter = event.gdayInter;
			  var fi;
			  if(gdayFreq == "daily" && gdayInter == "1"){
			      fi = "반복 없음";
			  } else if(gdayFreq == "yearly" && gdayInter == "1"){
			      fi = "1년";
			  } else if(gdayFreq == "daily" && gdayInter == "100"){
			      fi = "100일";
			  } else {
			      fi = gdayInter + "일";
			  }
			  $("#modal-view #v-freqInterval").text(fi);
			  
			  $("#modal-view").parent().css("display", "block");
			  
		  } else {
			  swal.fire({icon: "error", title: "기념일 상세 조회에 실패했습니다.", confirmButtonColor: "#54b39E"});
		  }
	  },
	  error : function(){
		  console.log("기념일 상세 조회 중 오류");
	  }
  });
}

//기념일 수정폼 세팅
function updateEventForm(gdayNo){
	$.ajax({
		  url : "${contextPath}/calendar/viewEvent",
		  data : { "gdayNo" : gdayNo },
		  dataType : "json",
		  type : "post",
		  success : function(event){
			  $("#modal-update #up-gdayNo").text(event.gdayNo);
			  $("#modal-update #up-gdayTitle").val(event.gdayTitle);
			  $("#modal-update #up-gdayColor").val(event.gdayColor);
			  $("#modal-update #up-dtStart").val(event.dtStart);
			  
			  var gdayFreq = event.gdayFreq;
			  var gdayInter = event.gdayInter;
			  var fi;
			  if(gdayFreq == "daily" && gdayInter == "1"){
			      fi = "fi1";
			  } else if(gdayFreq == "yearly" && gdayInter == "1"){
			      fi = "fi2";
			  } else if(gdayFreq == "daily" && gdayInter == "100"){
			      fi = "fi3";
			  } else {
			      fi = "fi4"; $("#update-etc-fi").val(gdayInter); 
			      $("#modal-update #interval-etc").show();
			  }
			  $("#select-fi-2 option").each(function(index, item){
				  if($(item).val() == fi){
					  $(item).prop("selected", true);
				  }
			  });
			  
			  $("#modal-update").parent().show();
			  
		  },
		  error : function(){
			  console.log("기념일 수정 모달창 업로드 중 오류");
		  }
	});
}


function updateEvent(){
	
	  if(ValidateCheck("update")) { //유효성 검사 값이 true 이면 진행 
		  
		  var gdayNo = $("#up-gdayNo").text();
	 
		  var gdayTitle = $("#up-gdayTitle").val(); //기념일명
		  var dtStart = $("#up-dtStart").val();//시작 날짜
		  var gdayColor = $("#up-gdayColor").val();//기념일색

		  var dtUntil = $("#up-dtUntil").val()//마감날짜 기본 
		  
		  var gdayFreq;//반복 단위
		  var gdayInter;//반복 주기

		  var fi = $("#select-fi-2").val();//셀렉트 값
		  
		  switch (fi) {
		      case 'fi1' : gdayFreq = "daily"; gdayInter = 1; dtUntil = dtStart; break;
		          /* 반복주기 없음 == dtUntil==dtStart */ 
		      case 'fi2' : gdayFreq = "yearly"; gdayInter = 1; break;
		      case 'fi3' : gdayFreq = "daily"; gdayInter = 100; break;
		      case 'fi4' : gdayFreq = "daily"; gdayInter = $("#update-etc-fi").val(); break;
		  }
			console.log("gdayNo: " + gdayNo);
		  console.log("fi: " + fi);
		  console.log("gdayFreq: " + gdayFreq);
		  console.log("gdayInter: " + gdayInter);
		  console.log("dtUntil: " + dtUntil);
		  console.log("dtStart: " + dtStart);
		  console.log("gdayColor: " + gdayColor);
		
		  //ajax로 등록 처리
		  //ajax로 보낼 값
		  var gdayData = { 'gdayNo' : gdayNo,
				  					'gdayTitle':gdayTitle, /* 기념일명 */
		               'gdayFreq':gdayFreq, /* 반복 단위 */
		               'dtStart':dtStart, /* 시작날짜 */
		               'dtUntil':dtUntil, /* 마감일짜 */
		               'gdayInter':gdayInter, /* 반복 주기 */
		               'gdayColor':gdayColor, /* 기념일색 */
		               'memberNo':memberNo, /* 회원 번호  : 위에서 세션에서 가져온 memberNo*/
		               'memberNick' : memberNick,
		               'memberPhone' : memberPhone
		              }
		  
		  $.ajax({
			  url : "${contextPath}/calendar/updateEvent",
		    data : gdayData, 
		    type : "post",
		    success : function(result){
		    	
		    	if(result > 0){
		    		swal.fire({icon: "success", title: "기념일을 수정했습니다.",  confirmButtonColor: "#54b39E"});
		    		modalReset();
			    	$("#modal-update").parent().hide();
		    		selectCalendarList(loadFullCalendar);
		    		viewEvent(gdayNo, new Date(dtStart));
		    	} else {
			    	swal.fire({icon: "error", title: "기념일 수정에 실패했습니다.",  confirmButtonColor: "#54b39E"});
		    	}
		    },
		    error : function(){
		    	console.log("기념일 수정 중 오류");
		    	modalReset();
		    	$(".modal-cover").parent().hide();
		    	selectCalendarList(loadFullCalendar);
		    }
		  });
	}
}


//기념일 삭제
function deleteEvent(gdayNo){
	$.ajax({
		url : "${contextPath}/calendar/deleteEvent",
		data : { "gdayNo" : gdayNo },
		success : function(result){
			if(result>0){
				swal.fire({icon: "success", title: "기념일 삭제 완료"});
				$("#modal-view").parent().hide();
		   	selectCalendarList(loadFullCalendar);
			} else {
				swal.fire({icon: "error", title: "기념일 삭제에 실패했습니다."});
			}
		},
		error : function(){
			console.log("기념일 삭제 과정 중 오류 발생");
		}
	});
}



//등록/수정 유효성 검사-----------------------------------------------------------------
function ValidateCheck(modalType){

	var $gdayTitle;
  var $dtStart;//시작 날짜
  var fi;
  var $inputEtc;//반복 주기 직접 쓰기
	
	if(modalType == "insert") {
		$gdayTitle = $("#put-gdayTitle");
	  $dtStart = $("#put-dtStart");//시작 날짜
	  fi = $("#select-fi-1").val();
	  $inputEtc = $("#input-etc-fi");//반복 주기 직접 쓰기

	} else if(modalType== "update"){
		$gdayTitle = $("#up-gdayTitle");
		$dtStart = $("#up-dtStart");
		fi = $("#select-fi-2").val();
		$inputEtc = $("#update-etc-fi");//반복 주기 직접 쓰기
	}
	
	var signUpCheck = {
			"title" : false,
			"start" : false,
			"fiValue" : false
	}
	
  if($gdayTitle.val().trim().length == 0){ //기념일명
	  signUpCheck.title = false;
  } else {
	  signUpCheck.title = true;
  }
  if($dtStart.val().trim().length == 0){ //시작날
	  signUpCheck.start = false;
  } else {
	  signUpCheck.start = true;
  }
  
  //주기
  if(fi == 'fi4' && $inputEtc.val().length == 0){
	  signUpCheck.fiValue = false;
  } else {
	  signUpCheck.fiValue = true;
  }
	  
  var result;
  
  for(var key in signUpCheck){
	  if(!signUpCheck[key]){
		  var msg;
		  var id;
		  switch(key)
		  {
			  case "title" : msg = "기념일명을 "; id = "put-gdayTitle"; break;
			  case "start" : msg = "기념일 날짜를 "; id = "put-dtStart"; break;
			  case "fiValue" : msg = "반복 주기(일 단위)를 "; 
			  								id = "input-etc-fi"; break;
		  }
		  
		  swal.fire({icon: "warning", title: msg + "입력하세요.", confirmButtonColor: "#54b39E"});
		  $("#" + id).focus();
		  
		  return false;
	  } 
  } 
  
  return true;
}

//------------------버튼 클릭 수행 관련 메소드-----------------------
//등록, 수정, 취소 등 후 모달 reset
function modalReset(){
		$(".gdayTitles").val("");
    $(".dtStarts").val("");
    $(".gdayColors").val("#FE929F");
    $(".fis").val("fi1");
    $(".etc-fis").val("");
    $(".input-etc-box").hide();
}


/* 날짜 / 등록 버튼 클릭 시 등록 모달창 팝업 메소드 */
function gdayInsertForm(dateStr){
  $("#modal-insert").parent().css("display", "block");

  /* 이전에 작성한 내용 삭제 */
  if(dateStr.trim().length != 0){
      $("#modal-insert #put-dtStart").val(dateStr);
  } else {
      $("#modal-insert #put-dtStart").val("");
  }
}


/* 인풋 창 닫기/취소 */
function cancelInput(str, modalType){
  var message;
  if(str == "cancel") {
	  if(modalType == "insert") message = "취소하면 작성한 내용이 삭제됩니다.<h3>취소하시겠습니까?</h3>";
	  else if(modalType == "update") message = "취소하면 새로 작성한 내용이 삭제되고<br>이전 상태로 돌아갑니다.<h3>취소하시겠습니까?</h3>";
  } else if(str == "x") {
	  if(modalType == "insert") message = "창을 닫으면 작성한 내용이 삭제됩니다.<h3>창을 닫으시겠습니까?</h3>";
	  else if(modalType == "update") message = "창을 닫으면 새로 작성한 내용이 삭제되고<br>이전 상태로 돌아갑니다.<h3>창을 닫으시겠습니까?</h3>";
  }

  //confirm 확인 후 진행
  swal.fire({icon:"warning", 
	  					html: message,
	  					showCancelButton: true,
	  					confirmButtonText: "창 닫기",
	  					confirmButtonColor: "#54b39E",
	  					cancelButtonText: "취소",
	  					cancelButtonColor: "#a9a9a9",
	  					reverseButtons: true//버튼 위치 바꾸기
	  					}).then((result) => {
	  						if(result.isConfirmed){
	  							 modalReset();
	  							if(modalType == "insert") $("#modal-insert").parent().hide();
	  						  else if(modalType == "update") $("#modal-update").parent().hide();
	  						} 
	  					});
}


</script>