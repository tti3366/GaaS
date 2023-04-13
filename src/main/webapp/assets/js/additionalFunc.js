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