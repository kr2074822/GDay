<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<style>
/*댓글*/
.replyWrite>table {
	width: 90%;
}

#replyContentArea {
	width: 90%;
}

#replyContentArea>textarea {
	resize: none;
	width: 100%;
}

#replyContentArea, #replyBtnArea{
	padding: 5px;
	margin: 0 auto;
}

#addReply {
	width: 50px;
	text-align: center;
	background-color: #FE929F;
	color: white;
	height: 50px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	float: right;
}

.rWriter {
	display : inline-block;
	margin-right: 30px;
	vertical-align: top;
	font-weight: bold;
	font-size: 1.2em;
}

.rDate {
	display : inline-block;
	font-size: 0.5em;
	color: gray;
}

#replyListArea {
	list-style-type: none;
}

.rContent, .btnArea{
	display: inline-block;
	box-sizing: border-box;
}

.rContent {
	height: 100%;
	width : 100%;
	word-break:normal;
}

.replyUpdateContent {
	resize: none;
	width: 100%;
}


</style>
<div id="reply-area ">
	<!-- 댓글 작성 부분 -->
	<div class="replyWrite">
		<table align="center">
				<tr>
					<td id="replyContentArea"><textArea rows="3" id="replyContent"></textArea>
					</td>
					<td id="replyBtnArea">
						<button class="btn btn-success" id="addReply">답변 등록</button>
					</td>
				</tr>
		</table>
	</div>


	<!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		<ul id="replyListArea">
		</ul>
	</div>

	
</div>

<script>
var loginmemberEmail = "${loginMember.memberEmail}"; // 로그인한 회원 아이디(있으면 아이디, 없으면 빈문자열)
var replyWriter = "${loginMember.memberNo}"; // 로그인한 회원 번호
var parentCustomerNo = "${customer.cusNo}"; // 게시글 번호

// 댓글
// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectReplyList();
});

// 댓글 목록 불러오기(AJAX)
function selectReplyList(){
	$.ajax({
		url: "${contextPath}/admin/selectReplyList/" + parentCustomerNo,
		type: "post",
		dataType: "json",
		success: function(customer){
			if(customer != null) {
				// 조회된 댓글을 화면에 추가(새로운 요소(태그) 생성)
				var replyListArea = $("#replyListArea");
				
				replyListArea.html(""); // 기존 정보 초기화
				
				// 댓글 출력할 li요소 생성
				var li = "<li>관리자<p> "+customer.curContent+"</p> 작성일자: "+customer.replyCreateDate+" </li>"
					
					
			    // 댓글 영역 화면에 배치
			    replyListArea.append(li);
			 	//console.log(df);
			} else {
				console.log(123);
			}
			
		
		},
		error: function(){
			console.log("댓글 목록 조회 실패");
		}
	})
	
}

//-----------------------------------------------------------------------------------------

// 댓글 등록
$("#addReply").on("click", function(){
	var replyContent = $("#replyContent").val();
	var memberGrade = "${loginMember.memberGrade}";
	
	console.log(replyContent.length);
	
	if(replyContent.trim().length == 0){
		swal.fire({icon: "info",
			  title: "댓글을 작성해주세요."});
	} else if(memberGrade != "A" && replyContent.trim().length > 0) {
		swal.fire({icon: "info",
			  title: "관리자만 작성 가능합니다."});
	}
	else{		
		$.ajax({
			url:"${contextPath}/admin/insertReply/" + parentCustomerNo,
			type: "post",
			data: {"replyContent": replyContent},
			success: function(result){
				if(result > 0){
					$("#replyContent").val("");
					
					swal.fire({icon: "success",
						  title: "댓글 삽입 성공"});
					
					selectReplyList();
				}
			},
			error: function(){
				console.log("댓글 삽입 실패");
			}
		})
	}
});

</script>