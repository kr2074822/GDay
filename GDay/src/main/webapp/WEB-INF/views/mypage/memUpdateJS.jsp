<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
var memberNo = "${loginMember.memberNo}";

//프로필, 등록증에 자동으로 기존 이미지 넣기
var picUrl = "${contextPath}/resources/images/profileImg/${picture.pfName}";/* 프로필 경로 */
var licenseUrl = "${contextPath}/resources/images/licenseImg/${licenseImg.lcsName}";/* 등록증 경로*/
var basicImg = "${contextPath}/resources/images/profileImg/profile.jpg"; /* 기본 이미지 경로 */

if("${picture.pfName}".trim().length == 0){
		picUrl = basicImg //기본 이미지
	}
	
var deleteProfile;

var validateCheck = {
		"memberNick" : false,
		"memberPhone" : false
}




//유효성 검사 일반
function updateInfoVal(){

	var phone = $("input[name='memberPhone']").val();
	var nickName = $("input[name='memberNick']").val();
	
		//name 유효성 검사 : 한글 6글자 + 영어 20글자
		var regExp1 = /^[가-힣ㄱ-ㅎㅏ-ㅣ\d\s_-]{1,10}$/;
		var regExp2 = /^[A-Za-z\d\s_-]{1,30}$/;
	
		
		if(!regExp1.test(nickName) && !regExp2.test(nickName)){
				validateCheck.memberNick = false;
			} else {
				validateCheck.memberNick = true;
			}
	
	
		var	regExp = /^01\d{8,9}$/;
		if(!regExp.test(phone)){
 			validateCheck.memberPhone = false;
 		} else {
 			validateCheck.memberPhone = true;
 		}
		
		console.log(validateCheck.memberNick + "nick");
		console.log(validateCheck.memberPhone + "phone");
		
		
		for(var key in validateCheck) {
			if (!validateCheck[key]) {
				var str;
				switch (key) {
				case "memberNick": str = "<b style='font-size:24px;'>닉네임 형식이 유효하지 않습니다.</b>"; break;
				case "memberPhone": str = "<b style='font-size:24px;'>연락처 형식이 유효하지 않습니다.<br>"
																	+ "'-' 없이 숫자 10 ~ 11개로<br>이루어져야 합니다.</b>";	break;
				}
				swal.fire({
					icon : "warning",	
					html : str,
					confirmButtonColor: "#54b39E"
				});
				
				console.log(validateCheck);
				
				return false;
			}
	}
	
	var address = $("input[name='address0']").val() + ","
		+ $("input[name='address1']").val() + "," + $("input[name='address2']").val();
		
		console.log(address);
		$("input[name='memberAddress']").val(address);
		var inputAddr = $("input[name='memberAddress']").val();
		console.log(inputAddr);
		
		if(deleteProfile == undefined){
			deleteProfile = false;
		}
		
		console.log("deleteProfile:" + deleteProfile);
		$(".delete-profile").val(deleteProfile);

}
    
//비즈니스 인증 유효성 검사   
var bMemValidate = {
		"bmemShop" : false,
		"license" : false
}    
    
//비즈니스 회원 재인증 하기
function recertification(){
	var shop = $("input[name='bmemShop']").val();
	var license = $("input[name='license']").val();
	
	//console.log(shop);
	
	if(shop.trim().length == 0){
		bMemValidate.bmemShop = false;
	} else {
		bMemValidate.bmemShop = true;		
	}

	//console.log(license);
	if(license.length == 0 || license == undefined) {
		bMemValidate.license = false;
	} else {
		bMemValidate.license = true;	
	}
	
	var flag = false;
	
	for(var key in bMemValidate) {
		if (!bMemValidate[key]) {
			
			var str;
			
			switch(key){
			case "bmemShop" : str = "<h2>업체명/강사명은 반드시 작성해주세요</h2>"; break;
			case "license" : str = "<h2>증명서는 반드시 재업로드해야<br>인증 신청이 가능합니다.</h2>"; break;
			}
			
			flag = false;
			swal.fire({icon:"warning", html:str, confirmButtonColor: "#54b39E"});
			
		} else {
			flag = true;
		}
	}
	
	if(flag){
		$("#container-form-2").ajaxForm({
						url : "${contextPath}/bMember/recertifyLcs/" + memberNo,
				    type : "post",
						enctype : "multipart/form-data",
						success : function(result) {
							if(result > 0) {
								$(".status-text").text("비즈니스 인증 대기");
								
				        $("#b-validate-btn").hide();
				        $("#b-cancel-btn").hide();
				        $("#b-update-btn").show();
			
				        $("#company").prop("readonly", true);
				        $("#explain").prop("readonly", true);
				        $("#license-btn").hide();
							
							} else {
								swal.fire({icon:"error", title:"인증 재신청 실패", confirmButtonColor: "#54b39E"});
							}
						},
						error : function(){
							console.log("인증 재신청 과정에서 오류");
							$("#b-cancel-btn").trigger("click");//취소 버튼 클릭 효과
						}
			    });
			    $("#container-form-2").submit();
					
	}
	
}
    
    
    
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
        
        deleteProfile = false;
        
        }
    } 
}
/* 등록증 업로드 시 미리보기 */
function LoadLicense(value, num){
    if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
        var reader = new FileReader();
        
        reader.readAsDataURL(value.files[0]);
        reader.onload = function(e){
        		
        		bMemValidate.license = true;
        	
            $("#license-image").css("background-image", "url("+e.target.result+")");
        }
    }
}


$(function(){
    
    (function(){
    	    
			//이미지 적용    	
  			$("#profile-image").css("background-image", "url(" + picUrl + ")");
  	    $("#license-image").css("background-image", "url(" + licenseUrl + ")");

  	    // 프로필 영역을 클릭할 때 모달 메뉴창 창이 뜨도록 설정하는 함수
  	    $("#profile").hide(); //요소를 숨김.		
  	    $("#profile-div").on("click", function(){ // 이미지 영역이 클릭 되었을 때
  	        $(".modal-cover").show();
  	    });
    	    
    	//리셋 대비 기존 텍스트 저장 : 시간되면 하자
    	    
    })();//즉시 함수

    /* 초기화 버튼 리셋 */
   // $(".reset-btn").on("click", function(){
   //}); 시간되면 하자
   
    
    /* 모달 메뉴 창 클릭 */
    //등록
    $("#upload-pf").on("click", function(){
        $("#profile").click();
        $(".modal-cover").hide();
    });
   
   
    //프로필 사진 삭제
    $("#delete-pf").on("click", function(){
        $("#profile").val("");
        $("#profile-image").css("background-image", "url("+ basicImg +")");//기본 이미지 url 첨부
        //$("#profile-image").css("background-image", "url("+basicImg+")");//기본 이미지 url 첨부
        
        deleteProfile = true;//기존 프로필 삭제 시 문제 발생할 수 있어서 담아놓음
        
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
   /*  $("#b-validate-btn").hide();
    $("#b-cancel-btn").hide();
    $("#license-btn").hide(); */
    var status = $(".status-text").text();//수정 -> 취소 대비 : 현재 인증 상태
    
    $("#b-update-btn").on("click", function(){
        /* 버튼 쇼/하이드 */
        $("#b-validate-btn").show();
        $("#b-cancel-btn").show();
        $("#b-update-btn").hide();
        $(".status-text").text("인증 재신청");

        /* input, textarea, 사진 등록 버튼 활성화 */
        $("#company").prop("readonly", false);
        $("#explain").prop("readonly", false);
        $("#license-btn").show();
    });
    $("#b-cancel-btn").on("click", function(){
        $("#b-validate-btn").hide();
        $("#b-cancel-btn").hide();
        $("#b-update-btn").show();

        //수정한 내용 기존 내용(el 사용 업체명, 비즈니스 소개)으로 리셋
        $("#company").val("${bmemInfo.bmemShop}");
        $("#explain").val("${bmemInfo.bmemIntro}");
        $("#license").val("");
        $("#license-image").css("background-image", "url("+licenseUrl+")");
        $(".status-text").text(status);
				bMemValidate.license = false;

        $("#company").prop("readonly", true);
        $("#explain").prop("readonly", true);
        $("#license-btn").hide();
    });
    
    
    $("input[name='memberNick']").on("input paste", function(){
    	
			//name 유효성 검사 : 한글 6글자 + 영어 20글자
			var regExp1 = /^[가-힣ㄱ-ㅎㅏ-ㅣ\d\s_-]{1,10}$/;
			var regExp2 = /^[A-Za-z\d\s_-]{1,30}$/;
			
			var nickName = $(this).val();
			
			if(!regExp1.test(nickName) && !regExp2.test(nickName)){
					$("#check-nickname").text("한글 최대 10글자").css("color", "red");
					$("#check-nickname").show();
					validateCheck.memberNick = false;
				} else {
					$("#check-nickname").text("가능한 닉네임👌👌").css("color", "green");
					$("#check-nickname").show();
					validateCheck.memberNick = true;
				}
			
			console.log(validateCheck.memberNick + "nick");
		});
    
    
    
    
});//ready 끝
    

</script>