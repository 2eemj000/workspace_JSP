<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터로 사용자 id를 입력해서 목록 출력</title>
</head>
<body>
	<h2>파라미터로 사용자 id를 입력해서 목록 출력</h2>
	<% 
	JDBConnect jdbc = new JDBConnect();
	
	
	Statement stmt = jdbc.getCon().createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	jdbc.close();
	%>
</body>
</html>