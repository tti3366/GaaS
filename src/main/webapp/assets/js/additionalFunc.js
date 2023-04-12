var selectClubAndView = function(clubId){
	$.ajax({
		url : "/viewclub",
		type : "post",
		data : {id : clubId},
		traditional : true,
		success : function(result) {
			$("#clubView").html(result);
		},
		error : function(jqXHR, testStatus, errorThrown) {
			alert("오류가 발생했습니다");
		}
	});
}