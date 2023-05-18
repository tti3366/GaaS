<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FHAK MANAGER</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="/assets/js/additionalFunc.js"></script>
</head>
<body>
<!-- USERS -->
	<h1 class="card-title">CLUB_USERS</h1>
	<form id="form_clubUsers" class="forms" action="modify/clubUsers" method="post">
	<table id="table_clubUsers" class="table table-borderless">
		<thead>
			<tr style="text-align: center">
				<th scope="col">ROWNUM</th>
				<th scope="col">dept_name_kr</th>
				<th scope="col">user_id</th>
				<th scope="col">user_name</th>
				<th scope="col">user_phone_number</th>
				<th scope="col">introduce</th>
				<th scope="col">join_date</th>
				<th scope="col">allow_state</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${clubUsers}" var="clubUser" varStatus="status">
			<tr>
				<th scope="row" style="text-align: center">
					${status.count} <input type="checkbox" class="checkbox_clubUsers" value="${status.count}" onclick="changeAvailable(this, 'clubUsers_${status.count}')"/>
				</th>
				<td style="text-align: center"><input type="text" id="clubUsers${status.count}_1" size="20" name="deptNameKr" value="${clubUser.deptNameKr}" disabled/></td>
				<td style="text-align: center"><input type="text" id="clubUsers${status.count}_2" size="8" name="userId" value="${clubUser.userId}" disabled/></td>
				<td style="text-align: center"><input type="text" id="clubUsers${status.count}_3" size="10" minlength="2" maxlength="10" name="userName" value="${clubUser.userName}" disabled/></td>
				<td style="text-align: center"><input type="text" id="clubUsers${status.count}_4" size="11" minlength="10" maxlength="11" name="userPhoneNumber" value="${clubUser.userPhoneNumber}" disabled/></td>
				<td style="text-align: center"><input type="text" id="clubUsers${status.count}_5" size="50" minlength="0" maxlength="50" name="introduce" value="${clubUser.introduce}" disabled/></td>
				<td style="text-align: center"><input type="text" id="clubUsers${status.count}_6" size="20" name="joinDateStr" value="${clubUser.joinDateStr}" disabled/></td>
				<td style="text-align: center"><input type="checkbox" id="clubUsers${status.count}_7" name="allowState" value="${clubUser.allowState}" onclick="changeValue(this, 'checkbox')" disabled <c:if test="${clubUser.allowState == 1}">checked</c:if>/></td>

				<input type="hidden" id="clubUsers${status.count}_8" name="clubId" value="${clubUser.clubId}"/>
			</tr>	
		</c:forEach>
		</tbody>
	</table>
	<input type="submit" value="수정"/>
	</form>
</body>
</html>