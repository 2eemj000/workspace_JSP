<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
int column;
try{
	column = Integer.parseInt(request.getParameter("column"));
}catch (Exception e){
	column = 2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단2 <%= column %>column</title>
</head>
<body>
<h1>구구단2. <%= column %>column</h1>
<%
for (int k = 2; k <= 9; k += column) {
	for (int i = k; i<k+column && i<=9; i++) {
		for (int j = 1; j <= 9; j++) {
		out.println( i + "*" + j + " = " +
		(i*j) +"<br/>");
		}
		
	}
	 out.println("<br/>");
	}
%>
</body>
</html>