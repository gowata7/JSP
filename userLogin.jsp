<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<form method="post" action="userLoginAction.jsp">
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
			
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='userjoin.jsp'">
			
			</tr>
		</table>
	</form>
