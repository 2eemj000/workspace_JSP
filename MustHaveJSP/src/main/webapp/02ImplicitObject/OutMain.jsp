<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - out</title>
</head>
<body>
	<%
	out.print("출력되지 않는 텍스트"); // 버퍼에 저장
	out.clearBuffer(); // 버퍼를 비움 (윗줄 출력X)
	
	out.print("<h2>out 내장 객체</h2>");
	
	out.print("출력 버퍼의 크기 : "+out.getBufferSize() +"<br>");
	out.print("남은 버퍼의 크기 : "+out.getRemaining() +"<br>");
	
	out.flush(); // 버퍼에 담긴 내용을 강제로 플러시
	out.print("flush 후 버퍼의 크기 : "+out.getRemaining()+"<br>");
	
	// 다양한 타입 출력가능
	out.print(1+"<br>");
	out.print(false+"<br>");
	out.print('가');
	%>
</body>
</html>