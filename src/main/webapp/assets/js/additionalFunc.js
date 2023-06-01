var changeMainBoard = function(path, paramId){
	// home.jsp의 boardId는 초기값이 없음
	// 동아리를 선택하면 해당 동아리의 clubId 값만 설정되어 있음
	// 게시판 선택 시 boardId으로 갱신되므로, 이후 게시판 선택->갱신을 위해 slice 사용
	if(path == 'club'){
		document.getElementById('boardId').value = paramId;
	}
	else if(path == 'allpost'){
		document.getElementById('boardId').value = 
			document.getElementById('boardId').value.slice(0, 5) + "_" + paramId;
		paramId = document.getElementById('boardId').value;
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
// <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

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

var writePost = function() {
	var boardId = document.getElementById("boardId").value;
	
	location.href = "/post?boardId=" + boardId;
}