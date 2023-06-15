<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="commentList">
	<c:forEach var="reply" items="${replies}">
		${reply.replyId } | <input type="text" id="${reply.replyId }" value="${reply.contents }" disabled/> | ${reply.writerId } | ${fn:substring(reply.replyDate.toString(), 0, 19)} |  
				
			<c:set var="userId" value="${userInfo.userId }" />
			<c:set var="writerId" value="${reply.writerId }"/>
				
			<c:if test="${userId eq writerId }">
				<input id="modifybtn${reply.replyId }" type="button" value="수정" onclick="commentmodify(${reply.replyId})"/>
				<input id="deletebtn${reply.replyId }" type="button" value="삭제" onclick="commentdelete(${reply.replyId})"/>
			</c:if>
			<br>
	</c:forEach>
</div>

<!-- 댓글 수정/삭제 -->
<script>
	var originalComment;
		
	function commentmodify(replyId){
				
		var modifybtnVal=$("#modifybtn"+replyId).val();
		var deletebtnVal=$("#deletebtn"+replyId).val();
				
		originalComment=$("#"+replyId).val();//댓글 수정을 취소할 때 원래 댓글로 되돌리기 위해
				
		if(modifybtnVal=='수정'){
			$("#modifybtn"+replyId).val('수정완료');
			$("#deletebtn"+replyId).val('취소');
			$("#"+replyId).attr("disabled",false);
		}else if(modifybtnVal=='수정완료'){
			$("#modifybtn"+replyId).val('수정');
			$("#deletebtn"+replyId).val('삭제');
			$("#"+replyId).attr("disabled",true);
					
			//댓글 수정하기
			$.ajax({
				url : "/updatereply",
				type : "post",
				data : {id : replyId, content:$("#"+replyId).val()},
				traditional : true
				
			});
		}

	}
			
	function commentdelete(replyId){
				
		var modifybtnVal=$("#modifybtn"+replyId).val();
		var deletebtnVal=$("#deletebtn"+replyId).val();
		
		if(deletebtnVal=='취소'){
			$("#"+replyId).val(originalComment);//원래 댓글로 되돌리기
					
			$("#modifybtn"+replyId).val('수정');
			$("#deletebtn"+replyId).val('삭제');
			$("#"+replyId).attr("disabled",true);
		}else{
			//댓글 삭제
			
			$.ajax({
				url : "/deletereply",
				type : "post",
				data : {id : replyId, content:$("#"+replyId).val()},
				traditional : true
				
			});
		}
	}
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>