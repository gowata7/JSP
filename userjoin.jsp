<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<form method="post" action="userJoinAction.jsp">
		<table border=1>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" maxlength="12"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="upwd" maxlength="20"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="uemail" maxlength="40"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uname" maxlength="10"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="ubirthdate" maxlength="6"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="ugender" value="여성"/>여
				<input type="radio" name="ugender" value="남성"/>남</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="unname" maxlength="15"></td>
			</tr>
			
		</table>
		<input type="submit" value="회원가입">
	</form>
