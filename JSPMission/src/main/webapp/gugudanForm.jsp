<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력하기</title>
</head>
<body>
	<h1>구구단 출력하기</h1>
    <form action="gugudanSelect.jsp" method="get">
        <input type="radio" name="sel" value="1" checked> Type1
        <input type="text" name="dan" value="2"/>단<br/>
        <input type="radio" name="sel" value="2"> Type2
        <input type="radio" name="dir" value="Horizontal" checked>Horizontal
        <input type="radio" name="dir" value="Vertical">Vertical<br/>
        <input type="radio" name="sel" value="3"> Type3
        <input type="text" name="column" value="3"/>열<br/>
        </br>
        <input type="submit" value="선택">
     </form>
</body>
</html>