<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어</title>
</head>
<body>
<% // 메서드 안에 들어감 (IncludeFile도 메서드 안으로) //<%!는 클래스 내부에 필드변수나 메서드로 들어감
out.println("오늘 날짜 : "+today);
out.println("<br>");
out.println("내일 날짜 : "+tomarrow);
%>
</body>
</html>