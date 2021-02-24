<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- calendar.jsp에 사용되는 js 모음 -->
<!-- el 사용을 위해 jsp로 생성 -->
<script>

var events = []; //이벤트 목록을 담을 곳
//events = [{}, {}, {}....] <-이런 모양

//캘린더 목록 조회
selectCalendarList();

//풀캘린더 설정
document.addEventListener('DOMContentLoaded', function() {
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
          goToEvent: {
              text: '검색',
              click: function(){
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
      left: 'goToEvent todayBtn',
      center: 'prevYear,prev,title,next,nextYear',
      right: 'dayGridMonth,listYear',
      },
      footerToolbar: {
      right: 'insertBtn'
      },

      views: {
      today: {buttonText: '오늘'}, //이거 왜 안될까?
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
          gdayView(info.event.id, info.event.start);
      }

  });
  calendar.render();
});
//캘린더 설정 끝

//ready함수
$(function(){


  //캘린더 툴바 버튼 디자인
  $(".fc-button-primary").css("background-color", "darkgray").css("border-style", "none");
  $(".fc-icon").css("color", "lightgray");

  
  /* -----------모달창------------- */
  //모달창 x 클릭
  $(".modal-close").children().on("click", function(){
      if($(this).parent().parent().hasClass("cal-insert")){ //등록/수정창
          cancelInput("x");
      } else if($(this).parent().parent().hasClass("cal-view")){ //상세창
          $(".modal-cover").hide();
      }
  });
  
  /* 등록 모달창 */
  //입력 모달창 취소 버튼
  $("#m-cancel-btn").on("click", function(){
      cancelInput("cancel");
  });
  
  /* 입력 모달창 : 직접 주기 입력 div show() */
  $("#select-fi").on("change", function(){
      if($(this).val() == 'fi4'){
          $("#interval-etc").show().css("display","flex");
      } else {
          $("#interval-etc").hide();
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
  
  
  });
  //레디 함수


//이벤트 조회 임시
var eventList;
function selectCalendarList(){
  // $.ajax({
  //     url : "${contextPath}/calendar/selectCalendarList",
  //     dataType : "json",
  //     success : function(cList){
  //         $.each(cList, function(index, item){
  //             var event = {
  //                         id: item.id, /*기념일 번호*/
  //                         title: item.title, //제목,
  //                         start : item.dtStart,
  //                         rrule: {
  //                             freq: item.freq, /* 반복 단위 daily, (monthly, weekly,) yearly */
  //                             interval : item.interval, /* 반복 주기 + freq와 연결되어 사용됨 */
  //                             dtstart: item.dtstart,//시작날짜 startStr과 같은 거 넣기
  //                             until: item.until /* 마감날짜(기본은 2999-12-31): 주기 없음 = dtstart와 같은 날짜 + freq/interval(daily/1) */
  //                             },
  //                         backgroundColor: item.backgroundColor //배경색(16진법 가능)
  //                         }
  //             events.push(event);
  //         })();
  //     },
  //     error : function(){
  //         console.log("기념일 목록 조회 실패");
  //     }
  // });
  
  eventList = [ //json으로 넘어온다고 생각하면 다음과 같음
      {
      id: 1, /*기념일 번호*/
      title: '기타', //기념일명
      dtstart: new Date('2021-02-19'),//클릭 및 수정 시 확인 위해 필요(시작날짜)
      freq: 'daily', /* 반복 단위 daily, (monthly, weekly,) yearly */
      interval : 10, /* 반복 주기 + freq와 연결되어 사용됨 */
      until: '2999-12-31', /* 마감날짜(기본은 2999-12-31): 주기 없음 = dtstart와 같은 날짜 + freq/interval(daily/1) */
      backgroundColor: 'red' //배경색(16진법 가능)
      },
      {
      id: 2, /*기념일 번호*/
      title: '100일', //제목
      dtstart: new Date('2021-01-10'),//클릭 및 수정 시 확인 위해 필요(시작날짜)
      freq: 'daily', /* 반복 단위 daily, (monthly, weekly,) yearly */
      interval : 100, /* 반복 주기 + freq와 연결되어 사용됨 */
      until: '2999-12-31', /* 마감날짜(기본은 2999-12-31): 주기 없음 = dtstart와 같은 날짜 + freq/interval(daily/1) */
      backgroundColor: 'lightgreen' //배경색(16진법 가능)
      },
      {
      id: 3, /*기념일 번호*/
      title: '반복없음', //제목
      dtstart: new Date('2021-03-10'),//클릭 및 수정 시 확인 위해 필요(시작날짜)
      freq: 'daily', /* 반복 단위 daily, (monthly, weekly,) yearly */
      interval : 1, /* 반복 주기 + freq와 연결되어 사용됨 */
      until: '2021-03-10', /* 마감날짜(기본은 2999-12-31): 주기 없음 = dtstart와 같은 날짜 + freq/interval(daily/1) */
      backgroundColor: 'yellow' //배경색(16진법 가능)
      },
      {
      id: 4, /*기념일 번호*/
      title: '1년', //제목
      dtstart: new Date('2020-02-27'),//클릭 및 수정 시 확인 위해 필요(시작날짜)
      freq: 'yearly', /* 반복 단위 daily, (monthly, weekly,) yearly */
      interval : 1, /* 반복 주기 + freq와 연결되어 사용됨 */
      until: '2999-12-31', /* 마감날짜(기본은 2999-12-31): 주기 없음 = dtstart와 같은 날짜 + freq/interval(daily/1) */
      backgroundColor: 'blue' //배경색(16진법 가능)
      }
  ]

  $.each(eventList, function(index, item){
      var event = {
                  id: item.id, /*기념일 번호*/
                  title: item.title, //제목,
                  start : item.dtStart,
                  rrule: {
                      freq: item.freq, /* 반복 단위 daily, (monthly, weekly,) yearly */
                      interval : item.interval, /* 반복 주기 + freq와 연결되어 사용됨 */
                      dtstart: item.dtstart,//시작날짜 startStr과 같은 거 넣기
                      until: item.until /* 마감날짜(기본은 2999-12-31): 주기 없음 = dtstart와 같은 날짜 + freq/interval(daily/1) */
                      },
                  backgroundColor: item.backgroundColor //배경색(16진법 가능)
                  }
      events.push(event);
  });
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
function cancelInput(str){
  var beforeCode = $("#modal-insert").html();

  var message;
  if(str == "cancel") message = "취소하면 작성한 내용이 삭제됩니다. 취소하시겠습니까?";
  else if(str == "x") message = "창을 닫으면 작성한 내용이 삭제됩니다. 창을 닫으시겠습니까?";

  if(confirm(message)){
      $("#modal-insert #put-gdayTitle").val("");
      $("#modal-insert #put-dtStart").val("");
      $("#modal-insert #put-gdayColor").val("#FE929F");
      $("#modal-insert #select-fi").val("fi1");
      $("#modal-insert #input-etc-fi").val("");

      $(".modal-cover").hide();
  }
}

/* 기념일 등록 메소드 */
function gdayInsert(){
  var memNo = 1; //멤버번호 세션에 있는 것 가져오기
  var gdayTitle = $("#put-gdayTitle").val(); //기념일명
  var dtStart = $("#put-dtStart").val();//시작 날짜
  var gdayColor = $("#put-gdayColor").val();//기념일색

  var dtUntil = new Date("2999-12-31");//마감날짜 기본 
  var gdayFreq;//반복 단위
  var interval;//반복 주기

  var fi = $("#select-fi").val();//셀렉트 값
  switch (fi) {
      case 'fi1' : gdayFreq = "daily"; interval = 1; dtUntil = dtStart; break;
          /* 반복주기 없음 == dtUntil==dtStart */ 
      case 'fi2' : gdayFreq = "yearly"; interval = 1; break;
      case 'fi3' : gdayFreq = "daily"; interval = 100; break;
      case 'fi4' : gdayFreq = "daily"; interval = $("#input-etc-fi").val(); break;
  }

  console.log("fi: " + fi);
  console.log("gdayFreq: " + gdayFreq);
  console.log("interval: " + interval);
  console.log("dtUntil: " + dtUntil);

  //ajax로 등록 처리
  //ajax로 보낼 값
  var gdayData = { 'gdayTitle':gdayTitle, /* 기념일명 */
               'dtStart':dtStart, /* 시작날짜 */
               'gdayColor':gdayColor, /* 기념일색 */
               'gdayFreq':gdayFreq, /* 반복 단위 */
               'interval':interval, /* 반복 주기 */
               'dtUntil':dtUntil, /* 마감일짜 */
               'memNo':memNo /* 회원 번호 */
              }
}

/* 이벤트 클릭 시 상세 조회 모달창 팝업 메소드 */
function gdayView(gdayNo, startStr){
  $("#modal-view").parent().css("display", "block");
  
  //ajax로 상세조회 해오기 (gdayNo == id == 기념일번호)
  //eventList[i]의 값으로 넣는 것은 상세 조회해서 가져온 것
  //단, 현재 기념일 날짜는 풀캘린더에서 계산된 날짜를 출력 == startStr
  
  //임시
  console.log(gdayNo);
  var i = gdayNo - 1; /* eventList 인덱스 */

  $("#modal-view #v-gdayColor").css("background-color", eventList[i].backgroundColor);
  $("#modal-view #v-gdayTitle").text(eventList[i].title);
  
  /* 클릭한 기념일 */
  var dtstart
   = startStr.getFullYear() + "년 " + (startStr.getMonth()+1) + "월 " + startStr.getDate() + "일";
  $("#modal-view #v-dtStart").children().text(dtstart);
  
  /* 반복 주기 */
  var gdayFreq = eventList[i].freq;
  var interval = eventList[i].interval;
  var fi; /* select에 들어갈 값 */

  if(gdayFreq == "daily" && interval == "1"){
      fi = "반복 없음";
  } else if(gdayFreq == "yearly" && interval == "1"){
      fi = "1년";
  } else if(gdayFreq == "daily" && interval == "100"){
      fi = "100일";
  } else {
      fi = interval + "일";
  }
  $("#modal-view #v-freqInterval").text(fi)
}




</script>