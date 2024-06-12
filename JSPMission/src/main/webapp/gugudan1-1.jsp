<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String dir;
try{
	dir = request.getParameter("dir");
}catch (Exception e){
	dir="hor";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 <%= dir %></title>
</head>
<body>
<h1>구구단1-1. <%= dir %></h1>

<%
if (dir.equals("ver")){
	for (int i = 2; i <= 9; i++) {
		for (int j = 1; j <= 9; j++) {
      	out.println( i + "*" + j + " = " + (i*j) +"<br/>");
    	}
	}
}
else {
	for (int i = 1; i <= 9; i++) {
		for (int j = 2; j <= 9; j++) {
      	out.println( j + "*" + i + " = " + (i*j));
    	}
		out.println("<br/>");
	}
}
%>
</body>
</html>