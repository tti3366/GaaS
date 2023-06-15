// 성준 ----------------------------------------------------------------------------- //
var changeMainBoard = function(path, paramId){
	// home.jsp의 boardId는 초기값이 없음
	// 동아리를 선택하면 해당 동아리의 clubId 값만 설정되어 있음
	// 게시판 선택 시 boardId으로 갱신되므로, 이후 게시판 선택->갱신을 위해 slice 사용
	if(path == 'club'){
		boardId = document.getElementById('boardId');
		
		boardId.value = paramId;
	}
	else if(path == 'allpost'){
		boardId = document.getElementById('boardId');
		
		// 게시판이 설정되지 않은 상태일 때
		if(boardId.value.indexOf('_') == -1) {
			alert("동아리를 선택해주세요");
			return;
		}
		
		// paramId == null : 게시글 보기 후 닫기 버튼을 눌렀을 때, 이전 선택했던 게시판으로 이동
		// paramId != null : 게시판 변경 시, paramId 값으로 받아온 새로운 게시판으로 이동
		if(paramId != null)
			boardId.value = boardId.value.slice(0, 5) + "_" + paramId;
		
		paramId = boardId.value;
	}
		
	$.ajax({
		url : "/view" + path,
		type : "post",
		data : {id : paramId},
		traditional : true,
		success : function(result) {
			$("#mainBoard").html(result);
		},
		error : function(jqXHR, testStatus, errorThrown) {
			alert("오류가 발생했습니다");
		}
	});
}
// ----------------------------------------------------------------------------- //
// 게시글 관련 기능

// 모달(글쓰기)의 submit을 가로채어, 컨트롤러 처리 후 뷰를 새로 로드하지 않고 해당 게시판을 다시 로딩  
$(document).on('submit', '.modalForms', function(event) {
	event.preventDefault();
	
	var form = event.target;
	var data = new FormData(form);
			
	$.ajax({
		url : "/process",
		type : "post",
		enctype: 'multipart/form-data',
	    data: data,
		contentType: false,
		processData : false,
		success : function(result) {
			if(result == "success") {
				// alert(data.get("boardId") + " / " + data.get("boardId").split('_')[2]);
				changeMainBoard('allpost', data.get("boardId").split('_')[2]);
			}
		},
		error : function(jqXHR, testStatus, errorThrown) {
			alert("오류가 발생했습니다");
		}
	});
})

// 게시글 수정
$(document).on('submit', '.modifyForms', function(event) {
	event.preventDefault();
	
	var form = event.target;
	var data = new FormData(form);
	
	$.ajax({
		url : "/modifypost",
		type : "post",
		enctype: 'multipart/form-data',
	    data: data,
		contentType: false,
		processData : false,
		success : function(result) {
			if(result == "modify success") {
				postModalShow();
				changeModal('viewpost', data.get("postId"));
			}
			else if(result == "modify failure") {
				alert("수정 실패");
			}
			else if(result == "auth failure") {
				alert("수정 권한이 없습니다");
			}
		},
		error : function(jqXHR, testStatus, errorThrown) {
			alert("오류가 발생했습니다");
		}
	});
})

// 게시글 삭제
var deletePost = function(data){
	var obj = JSON.parse(data);		// HTML 코드에서 전달된 문자열을 JSON 형식으로 파싱

	$.ajax({
		url : "/deletepost",
		type : "post",
		data: {postId : obj.postId, writerId : obj.writerId, boardId : obj.boardId},
	    traditional : true,
		success : function(result) {
			if(result == "delete success") {
				alert("삭제 성공");
				postModalHide();
				changeMainBoard('allpost', obj.boardId.split('_')[2]);
			}
			else if(result == "delete failure") {
				alert("삭제 실패");
				postModalHide();
			}
			else if(result == "auth failure") {
				alert("삭제 권한이 없습니다");
				postModalHide();
			}
		},
		error : function(jqXHR, testStatus, errorThrown) {
			alert("오류가 발생했습니다");
		}
	});
}
// ----------------------------------------------------------------------------- //
// 관리자(admin) / 동아리장(manager) 기능

// 여러 개의 폼 중 class 값으로 forms가 주어진 폼의 submit 처리  	
$(document).on('submit', '.forms', function(event) {
	event.preventDefault(); // 폼의 기본 동작인 서버로의 전송을 막음
  
  	// submit이 발생된 폼의 정보 (실제 처리는 리다이렉트되어 콘솔이 보이지 않음)
    var form = event.target;
    var formId = form.id;
    var formTarget = formId.split('_')[1];	// ex) user / dept / club / clubUsers
    console.log(form + "\n" + formId + "\n" + formTarget);
    
    // 현재 폼 중에서 checkbox가 선택된 행들
  	var selected_rows = $('input.checkbox_' + formTarget + ':checked');
  	if(formTarget == 'clubUsers') // clubUser의 경우, checkbox 상태로 갱신을 구분하는 것이 아니고 전체 선택 기능이 있기 때문에 예외로 모든 checkbox를 받아옴
  		selected_rows = $('input.checkbox_' + formTarget); 
  	
  	// ajax 요청을 보낼 경로 (admin : user, dept, club | manager : clubUsers)
    var reqPath;
    
    selected_rows.each(function() {
		// console.log($(this).val());	// checkbox가 선택된 행의 번호
		
		// 현재 폼의 정보에 알맞은 객체로 매핑
		if(formTarget == 'user') {
			var obj = {
				userId : $('#' + formTarget + $(this).val() + '_' + 1).val(),
				userPw : $('#' + formTarget + $(this).val() + '_' + 2).val(),
				userName : $('#' + formTarget + $(this).val() + '_' + 3).val(),
				userEmail : $('#' + formTarget + $(this).val() + '_' + 4).val(),
				userPhoneNumber : $('#' + formTarget + $(this).val() + '_' + 5).val(),
				authority : $('#' + formTarget + $(this).val() + '_' + 6).val(),
				about : $('#' + formTarget + $(this).val() + '_' + 7).val(),
			};
			
			reqPath = '/admin';
		}
		else if(formTarget == 'dept') {
			var obj = {
				deptId : $('#' + formTarget + $(this).val() + '_' + 1).val(),
				nameKr : $('#' + formTarget + $(this).val() + '_' + 2).val(),
				nameEn : $('#' + formTarget + $(this).val() + '_' + 3).val(),
			};
			
			reqPath = '/admin';
		}
		else if(formTarget == 'club') {
			var obj = {
				clubId : $('#' + formTarget + $(this).val() + '_' + 1).val(),
				clubName : $('#' + formTarget + $(this).val() + '_' + 2).val(),
				managerId : $('#' + formTarget + $(this).val() + '_' + 3).val(),
				division : $('#' + formTarget + $(this).val() + '_' + 4).val(),
				deptNameKr : $('#' + formTarget + $(this).val() + '_' + 5).val(),
				deptNameEn : $('#' + formTarget + $(this).val() + '_' + 6).val(),
				clubInformation : $('#' + formTarget + $(this).val() + '_' + 7).val(),
				clubState : $('#' + formTarget + $(this).val() + '_' + 8).val(),
			};
			
			reqPath = '/admin';
		}
		else if(formTarget == 'clubUsers') {
			// clubUsers의 경우 모든 행이 갱신 대상이기 때문에, 별도로 행의 값을 받아와야 함
			var val = $(this).prop('id').split(formTarget)[1].split('_')[0];
			
			var obj = {
				userId : $('#' + formTarget + val + '_' + 2).val(),
				allowState : $('#' + formTarget + val + '_' + 7).val(),
				clubId : $('#' + formTarget + val + '_' + 8).val(),
			};
			
			reqPath = '/manager';
		}
		// console.log(obj);
		
		// 현재 폼의 정보에 알맞은 요청 처리	
		$.ajax({
		    type: 'POST',
		    url: reqPath + '/modify/' + formTarget,	// ex) /admin/modify/user | /manager/modify/clubUsers
		    data: JSON.stringify(obj),
		    contentType: 'application/json; charset=utf-8',
		    dataType: "json",
		    success: function(data) {				// 성공 시 처리할 내용 (리다이렉트)
				if (data.success) {
		            if(reqPath == '/admin') 
		            	window.location.replace("/admin/viewTables");
		            else if(reqPath = '/manager')
		            	window.location.replace("/manager/clubUsers");
		        }
		    },
		    error: function(xhr, status, error) {	// 에러 시 처리할 내용
		    }
		});
	});
});


/// checkbox 선택한 행만 수정 가능하도록 활성화하는 기능
var changeAvailable = function(element, target) {
	var disabledArr = [];
	var tNum, tElement, cnt;
	
	// ex) target => clubUser_6
	var targetName = target.split('_')[0];	// ex) clubUsers
	var targetIdx = target.split('_')[1];	// ex) 6
	
	// cnt : 항목별 input 태그 개수
	// disabledArr : 수정 가능한 input 태그 항목 여부 배열 (1 : disabled)
	if(targetName == 'user') {
		cnt = 7;
		disabledArr = [1, 0, 0, 0, 0, 0, 0];
	} 
	else if(targetName == 'club') {
		cnt = 8;
		disabledArr = [1, 0, 1, 1, 1, 1, 0, 0];
	} 
	else if(targetName == 'dept') {
		cnt = 3;
		disabledArr = [1, 0, 0];
	}
	/*	
	else if(targetName == 'clubUsers') {
		cnt = 7;
		disabledArr = [1, 1, 1, 1, 1, 1, 0];
	}
	*/
	
	// checkbox 선택 시, 수정 가능하도록 활성화
	if(element.checked) {
		for(var i=0; i<cnt; i++){
			tNum = targetName + targetIdx + '_' + (i+1);
			tElement = document.getElementById(tNum);
			
			if(disabledArr[i] == 1)	tElement.disabled = true;
			else tElement.disabled = false;
		}
	}
	else {
		for(var i=0; i<cnt; i++){
			tNum = targetName + targetIdx + '_' + (i+1);
			tElement = document.getElementById(tNum);
			
			tElement.disabled = true;
		}
	}
}

// CLUB 테이블 club_state 변경에 사용되는 checkbox의 상태 변경 시 value 값 반영
var changeValue = function(element, target) {	
	if(target.includes('checkbox')) {
		if(element.checked) element.value = 1;
		else element.value = 0;
		
		console.log(element.value);
	}
}

var changeAllAllow = function(formName) {
	var cnt = 0;
	var selected_rows = $('input.checkbox_' + formName);
	
	selected_rows.each(function() {
		if($(this).is(":checked") == true) cnt++;	// 체크된 행의 개수
	});
	
	selected_rows.each(function() {
		if(cnt != selected_rows.length) {			// 하나라도 덜 체크된 행이 있으면 모두 선택
			$(this).prop("checked", true);
			$(this).attr("value", 1);
		} else {									// 모든 행이 선택되어 있으면 선택 해제 
			$(this).prop("checked", false);
			$(this).attr("value", 0);
		}	
	});
}

var deleteTarget = function(targetId, target) {
	$.ajax({
		    type: 'POST',
		    url: '/admin/delete/' + target,		// ex) /admin/delete/club
		    data: {targetId : targetId},			// ex) clubId
		    dataType: "text",
		    success: function(data) {				// 성공 시 처리할 내용 (리다이렉트)
				if (data == "success") {
					alert("삭제 성공");
		            window.location.replace("/admin/viewTables");
		        }
		        else if (data == "failure") {
		        	alert("삭제 실패");
		        }
		    },
		    error: function(xhr, status, error) {	// 에러 시 처리할 내용
		    }
		});
}

// --------------------------------------------------------------------------------- //
// 모달 관련 기능

var changeModal = function(path, paramId){		
	var targetModal = "#postModalBody";
	var reqType;
	
	// 글쓰기 모달
	if(path == 'post') {
		paramId = document.getElementById("boardId").value;
		
		if(paramId == "") {
			alert("게시판을 선택해주세요");
			return;
		}
		reqType = "post";
		
		postModalShow();		// 게시판 선택안함 예외처리를 위해 JSP data-bs-toggle="modal" 속성이 비활성화 되어있음
	}
	// 글보기 모달
	else if(path == 'viewpost') {
		reqType = "post";
	}
	// 글수정 모달
	else if(path == 'modifypost') {
		reqType = "get";	
	}
	
	$.ajax({
		url : "/" + path,
		type : reqType,
		data : {id : paramId},
		traditional : true,
		success : function(result) {				
			$(targetModal).html(result);
		},
		error : function(jqXHR, testStatus, errorThrown) {
			alert("오류가 발생했습니다");
		}
	});
}

var postModalShow = function() {
	var postModal = new bootstrap.Modal(document.getElementById('postModal'));
	postModal.show();
}
var postModalHide = function() {
	var modal = document.getElementById('postModal');
	modal.classList.remove('show');
	modal.style.display = 'none';
	
	var backdrop = document.querySelector('.modal-backdrop');	// backdrop : 모달 배경
	if (backdrop) {
		backdrop.parentNode.removeChild(backdrop);
	}
}

var signInClubModalShow = function() {
	var postModal = new bootstrap.Modal(document.getElementById('signInClubModal'));
	postModal.show();
}
// --------------------------------------------------------------------------------- //


// 가령 ----------------------------------------------------------------------------- //
// 댓글 관련 기능

$(document).on('submit','#commentSubmit',function(event){
	event.preventDefault();
	
	var form=event.target;
	var data=new FormData(form);
	
	console.log(data);
	$.ajax({
      url : "/comments",
      type : "post",
      data: data,
      contentType: false,
      processData : false,
      success : function(result) {
			changeModal('viewpost', data.get("postId"));
	  },
	  error : function(jqXHR, testStatus, errorThrown) {
			alert("오류가 발생했습니다");
	  }
   });
   
   return false;
	
})

function changeComment(type, postId, replyId) {
	var originalComment;
	var reply = $("#" + replyId);
	var modifybtn = $("#modifybtn" + replyId);
	var deletebtn = $("#deletebtn" + replyId);
	
	// 원본 댓글 내용 (댓글 수정을 취소할 때)
	originalComment = $("#"+replyId).val();
	
	if(type == 'modify') {
		if(modifybtn.val() == '수정'){
			modifybtn.val('수정완료');
			deletebtn.val('취소');
			reply.attr("disabled", false);
		} 
		else if(modifybtn.val() == '수정완료'){
			modifybtn.val('수정');
			deletebtn.val('삭제');
			reply.attr("disabled", true);
			
			// 댓글 수정
			$.ajax({
				url : "/updatereply",
				type : "post",
				data : {id : replyId, content : reply.val()},
				traditional : true
				
			});
			// 게시글 화면 갱신
			changeModal('viewpost', postId);
		}
	}
	else if(type == 'delete') {
		if(deletebtn.val() == '취소'){
			// 원래 댓글로 복원
			reply.val(originalComment);
			
			modifybtn.val('수정');
			deletebtn.val('삭제');
			reply.attr("disabled", true);

		}
		else {
			// 댓글 삭제
			$.ajax({
				url : "/deletereply",
				type : "post",
				data : {id : replyId, content : reply.val()},
				traditional : true
				
			});
			// 게시글 화면 갱신
			changeModal('viewpost', postId);
		}
	}
}