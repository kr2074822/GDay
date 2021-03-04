/* 마이페이지 목록 검색 기간 js */

//라디오 버튼 체크 시
    $("input[name='periodRadio']").on("click", function(){

				periodRadio = $(this).val();//검색 확인을 위한 변수 대입
				
        //체크한 radio에 radio-active 추가
        if(!$(this).next().hasClass("radio-active")){
            $(this).siblings().removeClass("radio-active");
            $(this).next().addClass("radio-active");
        }

        //형제 요소가 checked이면 checked 해제
        //if($(this).siblings("input[name=periodRadio]").prop("checked")){
        // $(this).siblings("input[name=periodRadio]").prop("checked", false);
        //} 

        //val()로 시작날짜 구해서 periodStart에 넣기
        var start = new Date();

        switch($(this).val()){
        case "7days" : start = new Date(start.setDate(start.getDate() - 7)); break;
        case "1Month" : start = new Date(start.setMonth(start.getMonth() - 1)); break;
        case "3Months" : start = new Date(start.setMonth(start.getMonth() - 3)); break;
        case "6Months" : start = new Date(start.setMonth(start.getMonth() - 6)); break;
        } 

        //시작 날짜
        var month1 = start.getMonth() + 1;
        var date1 = start.getDate();

        if(month1 < 10) month1 = "0" + month1;
        if(date1 < 10) date1 = "0" + date1;

        var startDate = start.getFullYear() + "-" + month1 + "-" + date1;
        $("#periodStart").val(startDate);

        //오늘 날짜
        var now = new Date();
        var month2 = now.getMonth() + 1;
        var date2 = now.getDate();

        if(month2 < 10) month2 = "0" + month2;
        if(date2 < 10) date2 = "0" + date2;
        
        var today = now.getFullYear() + "-" + month2 + "-" + date2;
        $("#periodEnd").val(today);

    });

    //날짜 직접 입력 시
    $("input[type=date]").on("click", function(){
    		
    		periodRadio = "selfInput";//검색 확인을 위한 변수 대입
    
        $("#selfInput").prop("checked", true);
        $("#selfInput").siblings().prop("checked", false);  
        $("#selfInput").siblings().removeClass("radio-active");
        $("#selfInput").next().addClass("radio-active");
    });