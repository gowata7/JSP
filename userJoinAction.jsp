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
	String uname = null;
	String ubirthdate = null;
	String ugender = null;
	String unname = null;
	String userEmailHash = null;
	if(request.getParameter("uid") != null){
		uid = (String) request.getParameter("uid");
	}
	if(request.getParameter("upwd") != null){
		upwd = (String) request.getParameter("upwd");
	}
	if(request.getParameter("uemail") != null){
		uemail = (String) request.getParameter("uemail");
	}
	if(request.getParameter("ubirthdate") != null){
		ubirthdate = (String) request.getParameter("ubirthdate");
	}
	if(request.getParameter("uname") != null){
		uname = (String) request.getParameter("uname");
	}
	if(request.getParameter("unname") != null){
		unname = (String) request.getParameter("unname");
	}
	if(request.getParameter("ugender") != null){
		ugender = (String) request.getParameter("ugender");
	}
	if(uid == null || upwd == null || uemail == null || uname == null || ubirthdate == null || ugender == null || unname == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	if(userDAO.getUserEmailOverlap(uemail).equals(uemail)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 이메일입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	int result = userDAO.join(new UserDTO(uid, upwd, uname, ubirthdate, uemail, SHA256.getSHA256(uemail), ugender, unname, false));
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else{
		session.setAttribute("uid", uid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='emailSendAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
