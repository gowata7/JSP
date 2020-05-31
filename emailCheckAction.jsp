<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String code = null;

	if(request.getParameter("code") != null){
		code = (String)request.getParameter("code");
		session.setAttribute("code", code);
	}
	UserDAO userDAO = new UserDAO();
	String uid = null;
	if(session.getAttribute("uid") != null){
		uid = (String)session.getAttribute("uid");
	}
	out.println(uid);
	out.println(code);
	if(uid == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	String uemail = userDAO.getUserEmail(uid); 
	boolean isRight = (new SHA256().getSHA256(uemail).equals(code)) ? true : false;
	if(isRight == true){
		userDAO.setUserEmailChecked(uid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.')");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
%>
