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
<title>사용자 musthave가 작성한 board 목록 출력</title>
</head>
<body>
	<h2>사용자 musthave가 작성한 board 목록 출력</h2>
	 <table border="1">
        <tr>
            <th>num</th>
            <th>title</th>
            <th>content</th>
            <th>id</th>
            <th>postdate</th>
            <th>visitcount</th>
        </tr>
	<% 
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "SELECT * FROM board WHERE id='musthave'";
	Statement stmt = jdbc.getCon().createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while (rs.next()){
		int num = rs.getInt(1);
		String title = rs.getString(2);
		String content = rs.getString(3);
		String id = rs.getString(4);
		java.sql.Date postdate = rs.getDate(5);
		int visitcount = rs.getInt(6);
		%>
		<tr>
                <td><%= num %></td>
                <td><%= title %></td>
                <td><%= content %></td>
                <td><%= id %></td>
                <td><%= postdate %></td>
                <td><%= visitcount %></td>
        </tr>
        <%
        }
        jdbc.close();
        %>
</body>
</html>