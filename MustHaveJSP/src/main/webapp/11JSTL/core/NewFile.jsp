<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model1.board.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
//DAO를 생성해 DB에 연결
BoardDAO dao = new BoardDAO(application);
//사용자가 입력한 검색 조건을 MAP에 저장
Map<String, Object> param = new HashMap<String, Object>();
%>
<title>게시판 목록 출력하기</title>
</head>
<body>

	<c:forEach items="<%= rgba %>" var="c">
		<span style="color:${c};">${c }</span>
	</c:forEach>
	<table border="1">
	<c:forEach items="<%=rgba %>" var="c" varStatus="loop">
		<tr>
			<td>${loop.count }</td>
			<td>${loop.index }</td>
			<td>${loop.current }</td>
			<td>${loop.first }</td>
			<td>${loop.last }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>