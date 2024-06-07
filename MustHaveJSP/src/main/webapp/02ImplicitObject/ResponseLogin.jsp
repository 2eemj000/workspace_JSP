<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - Response</title>
</head>
<body>
<%
String id = request.getParameter("user_id"); // textbox입력값을 id에 저장
String pwd = request.getParameter("user_pwd");
if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")){ // 대소문자 관계없이
	response.sendRedirect("ResponseWelcome.jsp");
}
else {
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
	.forward(request, response); 
	// sendRedirect와 forward 차이
	// sendRedirect는 서버가 브라우저에게 이동하라고 알려줌, 브라우저가 서버에게 다시 페이지요청, 서버가 브라우저에게 건네줌 (요청/응답이 한번더)
	// forward는 서버 내부에서 이동 (ResponseMain.jsp에 loginErr=1을 넣어서)
}
%>
</body>
</html>