<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int dan;
try{
	dan = Integer.parseInt(request.getParameter("dan"));
}catch (Exception e){
	dan = 2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 <%= dan %>단</title>
</head>
<body>
<h1>구구단1. <%= dan %>단</h1>
<%
for(int i=1;i<=9;i++){
	out.println(dan+"*"+i+"="+(dan*i)+"<br/>"); //"<br/>"은 출력상 한줄넘어감, println은 페이지소스보기에서 한줄넘어감
}
%>
</body>
</html>