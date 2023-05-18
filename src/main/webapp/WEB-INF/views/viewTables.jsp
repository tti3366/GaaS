<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FHAK ADMIN</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="/assets/js/additionalFunc.js"></script>
</head>
<body>
<!-- USERS -->
	<h1 class="card-title">USERS</h1>
	<form id="form_user" class="forms" action="modify/club" method="post">
	<table id="table_user" class="table table-borderless">
		<thead>
			<tr style="text-align: center">
				<th scope="col">ROWNUM</th>
				<th scope="col">user_id</th>
				<th scope="col">user_pw</th>
				<th scope="col">user_name</th>
				<th scope="col">user_email</th>
				<th scope="col">user_phone_number</th>
				<th scope="col">authority</th>
				<th scope="col">about</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${users}" var="user" varStatus="status">
			<tr>
				<th scope="row" style="text-align: center">
					${status.count} <input type="checkbox" class="checkbox_user" value="${status.count}" onclick="changeAvailable(this, 'user${status.count}')"/>
				</th>
				<td style="text-align: center"><input type="text" id="user${status.count}_1" size="8" name="userId" value="${user.userId}" disabled/></td>
				<td style="text-align: center"><input type="text" id="user${status.count}_2" size="20" minlength="4" maxlength="20" name="userPw" value="${user.userPw}" disabled/></td>
				<td style="text-align: center"><input type="text" id="user${status.count}_3" size="10" minlength="2" maxlength="10" name="userName" value="${user.userName}" disabled/></td>
				<td style="text-align: center"><input type="text" id="user${status.count}_4" size="30" minlength="10" maxlength="30" name="userEmail" value="${user.userEmail}" disabled/></td>
				<td style="text-align: center"><input type="text" id="user${status.count}_5" size="11" minlength="10" maxlength="11" name="userPhoneNumber" value="${user.userPhoneNumber}" disabled/></td>
				<td style="text-align: center">
					<select id="user${status.count}_6" name="authority" disabled>
					    <option value="user" <c:if test="${user.authority == 'user'}">selected</c:if>>사용자</option>
					    <option value="manager" <c:if test="${user.authority == 'manager'}">selected</c:if>>동아리장</option>
					    <option value="admin" <c:if test="${user.authority == 'admin'}">selected</c:if>>관리자</option>
					</select>
				</td>
				<td style="text-align: center"><input type="text" id="user${status.count}_7" size="50" minlength="0" maxlength="50" name="about" value="${user.about}" disabled/></td>
			</tr>	
		</c:forEach>
		</tbody>
	</table>
	<input type="submit" value="수정"/>
	</form>
	
<!-- CLUBS -->
	<h1 class="card-title">CLUBS</h1>
	<form id="form_club" class="forms" action="modify/club" method="post">
	<table id="table_club" class="table table-borderless">
		<thead>
			<tr style="text-align: center">
				<th scope="col">ROWNUM</th>
				<th scope="col">club_id</th>
				<th scope="col">club_name</th>
				<th scope="col">manager_id</th>
				<th scope="col">division</th>
				<th scope="col">dept_name_kr</th>
				<th scope="col">dept_name_en</th>
				<th scope="col">club_information</th>
				<th scope="col">club_state</th>
				<th scope="col">DELETE</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${clubs}" var="club" varStatus="status">
			<tr>
				<th scope="row" style="text-align: center">
					${status.count} <input type="checkbox" class="checkbox_club" value="${status.count}" onclick="changeAvailable(this, 'club${status.count}')"/>
				</th>
				<td style="text-align: center"><input type="text" id="club${status.count}_1" size="6" name="clubId" value="${club.clubId}" disabled/></td>
				<td style="text-align: center"><input type="text" id="club${status.count}_2" size="20" minlength="2" maxlength="20" name="clubName" value="${club.clubName}" disabled/></td>
				<td style="text-align: center"><input type="text" id="club${status.count}_3" size="8" name="managerId" value="${club.managerId}" disabled/></td>
				<td style="text-align: center"><input type="text" id="club${status.count}_4" size="2" name="division" value="${club.division}" disabled/></td>
				<td style="text-align: center"><input type="text" id="club${status.count}_5" size="20" name="deptNameKr" value="${club.deptNameKr}" disabled/></td>
				<td style="text-align: center"><input type="text" id="club${status.count}_6" size="30" name="deptNameEn" value="${club.deptNameEn}" disabled/></td>
				<td style="text-align: center"><input type="text" id="club${status.count}_7" size="30" minlength="0" maxlength="30" name="clubInformation" value="${club.clubInformation}" disabled/></td>
				<td style="text-align: center"><input type="checkbox" id="club${status.count}_8" name="clubState" value="${club.clubState}" onclick="changeValue(this, 'checkbox')" disabled <c:if test="${club.clubState == 1}">checked</c:if>/></td>
				<td style="text-align: center"><input type="button" value="삭제" onclick="deleteTarget('${club.clubId}','club')"/></td>
			</tr>	
		</c:forEach>
		</tbody>
	</table>
	<input type="submit" value="수정"/>
	</form>


<!-- DEPTS -->
	<h1 class="card-title">DEPTS</h1>
	<form id="form_dept" class="forms" action="modify/club" method="post">
	<table id="table_dept" class="table table-borderless">
		<thead>
			<tr style="text-align: center">
				<th scope="col">ROWNUM</th>
				<th scope="col">dept_id</th>
				<th scope="col">name_kr</th>
				<th scope="col">name_en</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${depts}" var="dept" varStatus="status">
			<tr>
				<th scope="row" style="text-align: center">
					${status.count} <input type="checkbox" class="checkbox_dept" value="${status.count}" onclick="changeAvailable(this, 'dept${status.count}')"/>
				</th>
				<td style="text-align: center"><input type="text" id="dept${status.count}_1" size="2" name="deptId" value="${dept.deptId}" disabled/></td>
				<td style="text-align: center"><input type="text" id="dept${status.count}_2" size="30" minlength="2" maxlength="30" name="nameKr" value="${dept.nameKr}" disabled/></td>
				<td style="text-align: center"><input type="text" id="dept${status.count}_3" size="50" minlength="2" maxlength="50" name="nameEn" value="${dept.nameEn}" disabled/></td>
			</tr>			
		</c:forEach>
		</tbody>
	</table>	
	<input type="submit" value="수정"/>
	</form>
</body>
</html>