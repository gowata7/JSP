<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<h1>메인 페이지~~~~</h1>
<% 
	UserDAO userDAO = new UserDAO();
if(userDAO.getUserEmailChecked((String)session.getAttribute("uid")) == false){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이메일 인증을 해주세요')");
	script.println("location.href = 'emailSendConfirm.jsp';");
	script.println("</script>");
	script.close();
	return;
}

%> 
