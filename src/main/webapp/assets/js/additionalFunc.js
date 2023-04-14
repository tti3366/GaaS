var changeMainBoard = function(path, paramId){
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

var deleteUsers = function(){
	let deleteCheck = prompt("If you want to delete account, Type in 'DELETE'");
	if(deleteCheck == "DELETE"){
		location.href = "/deleteUsers";
	}else{
		alert("Not Matched");
	}
}