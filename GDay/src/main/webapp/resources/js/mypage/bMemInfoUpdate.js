
$(function(){
    //프로필, 등록증에 자동으로 기존 이미지 넣기
    // var profileUrl = "";/* 프로필 경로 */
    // var licenseUrl = "";/* 등록증 경로*/
    // var basicImg = ""; /* 기본 이미지 경로 */

    //if(profileUrl == null){ null..?
    //  profileUrl = basicImg //기본 이미지
    //}

    // $("#profile-image").css("background-image", "url(" + profileUrl + ")");
    // $("#license-image").css("background-image", "url(" + licenseUrl + ")");

    // 프로필 영역을 클릭할 때 모달 메뉴창 창이 뜨도록 설정하는 함수
    $("#profile").hide(); //요소를 숨김.		
    $("#profile-div").on("click", function(){ // 이미지 영역이 클릭 되었을 때
        $(".modal-cover").show();
    });

    /* 모달 메뉴 창 클릭 */
    //등록
    $("#upload-pf").on("click", function(){
        $("#profile").click();
        $(".modal-cover").hide();
    });
    //프로필 사진 삭제
    $("#delete-pf").on("click", function(){
        $("#profile").val("");
        $("#profile-image").css("background-image", "url()");//기본 이미지 url 첨부
        //$("#profile-image").css("background-image", "url("+basicImg+")");//기본 이미지 url 첨부
        
        //프로필 삭제 ajax 진행 or 삭제 표시 변수 사용?
        $(".modal-cover").hide();
    });
    //x 클릭
    $(".modal-close").on("click", function(){
        $(".modal-cover").hide();
    });


    //라이센스 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정
    $("#license").hide();//요소를 숨김.	
    $("#license-btn").on("click", function(){
        $("#license").click();
    });

        
    /* 비즈니스 정보 수정 버튼 관련 */
    /* 수정 버튼 누르면 -> 수정 가능해짐(수정 버튼은 hide()) + 인증, 취소, 등록증 버튼 show() */
    $("#b-validate-btn").hide();
    $("#b-cancel-btn").hide();
    $("#license-btn").hide();
    
    $("#b-update-btn").on("click", function(){
        /* 버튼 쇼/하이드 */
        $("#b-validate-btn").show();
        $("#b-cancel-btn").show();
        $("#b-update-btn").hide();

        /* input, textarea, 사진 등록 버튼 활성화 */
        $("#company").prop("readonly", false);
        $("#explain").prop("readonly", false);
        $("#license-btn").show();
    });
    $("#b-cancel-btn").on("click", function(){
        $("#b-validate-btn").hide();
        $("#b-cancel-btn").hide();
        $("#b-update-btn").show();

        //수정한 내용 기존 내용(el 사용 업체명, 비즈니스 소개)으로 바꾸기
        //$("#company").text()
        //$("#explain").text()

        $("#company").prop("readonly", true);
        $("#explain").prop("readonly", true);
        $("#license-btn").hide();
    });
    
});
    
// 프로필 에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
function LoadProfile(value, num) {
    // value.files : 파일이 업로드되어 있으면 true
    // value.files[0] : 여러 파일 중 첫번째 파일이 업로드 되어 있으면 true
    
    if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
        
        var reader = new FileReader();
        // 자바스크립트 FileReader
        // 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
        // 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
        // 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체

        reader.readAsDataURL(value.files[0]);
        // FileReader.readAsDataURL()
        // 지정된의 내용을 읽기 시작합니다. 
        // Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.	

        reader.onload = function(e){
        // FileReader.onload
        // load 이벤트의 핸들러. 
        // 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.	

        // 읽어들인 내용(이미지 파일)을 화면에 출력
        
        $("#profile-image").css("background-image", "url("+e.target.result+")");
        // e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
        }
    }
}
/* 등록증 업로드 시 미리보기 */
function LoadLicense(value, num){
    if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
        var reader = new FileReader();
        
        reader.readAsDataURL(value.files[0]);
        reader.onload = function(e){
            $("#license-image").css("background-image", "url("+e.target.result+")");
        }
    }
}
