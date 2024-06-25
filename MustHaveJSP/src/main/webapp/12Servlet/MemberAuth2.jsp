<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberAuth.jsp</title>
</head>
<body>
	<h2>MVC 패턴으로 회원인증하기 (로그인)</h2>
	<p>
		<strong>${authMessage }</strong>
		<br/>
		<a href="./MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=musthave&pass=1234">회원인증(회원)</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a>
	</p>
	<span style = "color: red; font-size: 1.2em;">
	<%= request.getAttribute("LoginErrMsg")==null?
			"" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	if (session.getAttribute("UserId")==null){ // 로그인 상태 확인
	// 로그아웃 상태
	%>
	<script>
	function validateForm)(form){
		if (!form.user_id.value){
			alert("아이디를 입력하세요.");
			return false;
			}
		if (form.user_pw.value ==""){
			alert("패스워드를 입력하세요.");
		}
	}
	</script>
	<form action = "LoginProcess.jsp" method="post" name="loginFrm"
	onsubmit="return validateForm(this);">
	id : <input type="text" name="user_id"/><br/>
	pw : <input type="password" name="user_pw"/><br/>
	<input type="submit" value="제출"/>
	</form>
	<%
	} else { // 로그인된 상태
	%>
	<%=session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br/>
	<%
	}
	%>
</body>
</html>