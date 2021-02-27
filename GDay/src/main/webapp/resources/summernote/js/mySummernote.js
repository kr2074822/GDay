$(document).ready(function() {
    $('#summernote').summernote({
        width:1000, //에디터 넓이
        height:600, //에디터 높이
        lang:'ko-KR', //언어: 한국어

        //이미지 업로드 이벤트가 발생했을 때 콜백함수 수행
        callbacks : {
            onImageUpload : function(files) {
                //editor는 썸머노트 공식 사이트에는 나오지 않음...
                //files : 업로드된 이미지가 배열로 저장되어 있음
                //editor == this: 이미지가 업로드된 섬머노트 에디터
                //==업로드 이벤트가 발생된 곳

                sendFile(files[0], this)
            }
        }
    });
  });

  //섬머노트에 업로드된 이미지를 비동기로 서버 전송하여 저장하는 함수
  function sendFile(file, editor) {
      var formData = new FormData();
      //FormData : form태그 내부 값 전송을 위한 객체로
      //추가된 값을 k=v형태로 쉽게 생성해주는 객체
      formData.append("uploadFile", file);

      $.ajax({
        url : "insertImage",
        type: "post",
        enctype: "multipart/form-data", //파일 전송형식으로 인코딩 지정
        data: formData,
        contentType : false, //서버로 전송되는 데이터 형식
        //기본값: application/x-www-form-urlencoded; charset=utf-8
                    // == 텍스트
        //false: 바이트코드 있는 그대로 
        chche : false,
        processData : false,
        //서버로 전달되는 값을 쿼리스트링으로 전달할 경우(주소에 담을 경우) true
        //아니면 false
        //파일 저장시 (주소에 넣을 수 없으므로) false로 지정
        dataType:"json",
        success: function(at) {
           // console.log(at); //at==attachment : 파일 정보 == 객체(Object타입)
        //자바 스크립트를 이용한 contextPath 얻어오는 방법
        var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
            //앞에서부터 검색: 처음부터 두 번째 "/"까지만 잘라서 저장하자

            //저장된 이미지를 summernote에디터에 반영(삽입)
            $(editor).summernote('editor.insertImage', contextPath+ at.filePath +"/"+ at.fileName);
            //localhost:8080/spring /resources/infoImages / 2020~~~~.jsp
        }
      })
  }