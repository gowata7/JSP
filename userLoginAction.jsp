<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter"%>
 
<% 

	request.setCharacterEncoding("UTF-8");
	String uid = null;
	String upwd = null;
	String uemail = null;
	String uemailHash = null;
	if(request.getParameter("uid") != null){
		uid = (String) request.getParameter("uid");
	}
	if(request.getParameter("upwd") != null){
		upwd = (String) request.getParameter("upwd");
	}
	if(uid == null || upwd == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(uid,upwd);
	if(result == 1){
		if(session.getAttribute("code") != null){
			String code = (String)session.getAttribute("code");
			boolean isRight = (new SHA256().getSHA256(userDAO.getUserEmail(uid)).equals(code)) ? true : false;
			userDAO.setUserEmailChecked(uid);
		} 
		session.setAttribute("uid", uid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
%>
